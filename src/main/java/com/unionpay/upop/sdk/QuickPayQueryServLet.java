/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package com.unionpay.upop.sdk;

import java.io.IOException;
import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author cxq
 */
public class QuickPayQueryServLet extends HttpServlet {
	static int i= 0;
	public void init() {

	}

	public void service(HttpServletRequest request, HttpServletResponse response) {
		//商户需要组装如下对象的数据

            String merCode = request.getParameter("merCode");
            String orderNumber = request.getParameter("orderNumber");
            String orderTime = request.getParameter("orderTime");
            String transType = request.getParameter("transType");

		String[] valueVo = new String[]{
				QuickPayConf.version,//协议版本
				QuickPayConf.charset,//字符编码
				transType,//交易类型
                                "",//收单机构代码（仅收单机构接入需要填写）
				merCode,//商户代码
				orderNumber,//订单号
				orderTime,//交易时间
				""//保留域  说明：如果是收单机构保留域需传收单代码如：{acqCode=00215800}，商户直接接入upop不传收单代码
		};

		String signType = request.getParameter("sign");
		if (!QuickPayConf.signType_SHA1withRSA.equalsIgnoreCase(signType)) {
			signType = QuickPayConf.signType;
		}

		QuickPayUtils quickPayUtils = new QuickPayUtils();
		String res = quickPayUtils.doPostQueryCmd(QuickPayConf.queryUrl,new QuickPayUtils().createBackStr(valueVo, QuickPayConf.queryVo));

                String returnMsg = "";
		if (res != null && !"".equals(res)) {

			String[] arr = QuickPayUtils.getResArr(res);

                        try {
                            for(int j = 0; j < arr.length; j++){
                                arr[j] = java.net.URLDecoder.decode(arr[j], QuickPayConf.charset);
                            }
                        } catch (UnsupportedEncodingException ex) {
                            Logger.getLogger(QuickPayQueryServLet.class.getName()).log(Level.SEVERE, null, ex);
                        }

			if(checkSecurity(arr)){//验证签名
				returnMsg = merBusiness(arr);//商户业务逻辑
			} else {
                            returnMsg = "Fail to  check signature";
                        }
		}else{
			returnMsg = "Empty Response Message";
		}

		response.setContentType("text/html;charset="+QuickPayConf.charset);
		response.setCharacterEncoding(QuickPayConf.charset);
		try {
			response.getWriter().write(returnMsg);
		} catch (IOException e) {

		}
		response.setStatus(HttpServletResponse.SC_OK);
	}

	//验证签名
	public boolean checkSecurity(String[] arr){
		//验证签名
		int checkedRes = new QuickPayUtils().checkSecurity(arr);
		if(checkedRes==1){
			return true;
		}else if(checkedRes == 0){
			System.out.println("Fail to check signature");
			return false;
		}else if(checkedRes == 2){
			System.out.println("Format Error");
			return false;
		}
		return false;
	}

	//商户的业务逻辑
	public String merBusiness(String[] arr){
		/**
		 * queryResult=0或者2时 respCode为00，其余情况下respCode为非全零的两位错误码
		 * queryResult为空时报文格式错误
		 * queryResult：
		 * 0：成功（响应码respCode为00）
		 * 1：失败（响应码respCode非00）
		 * 2：处理中（响应码respCode为00）
		 * 3：无此交易（响应码respCode非00）
		*/

		//以下是商户业务处理
		String queryResult = "";
		for (int i = 0; i < arr.length; i++) {
			String[] queryResultArr = arr[i].split("=");
			// 处理商户业务逻辑
			if (queryResultArr.length >= 2 && "queryResult".equals(queryResultArr[0])) {
				queryResult = arr[i].substring(queryResultArr[0].length()+1);

				break;
			}
		}
		if(!queryResult.equals("")){
			if ("0".equals(queryResult)) {
				return "Transaction Successful";
			}
			if ("1".equals(queryResult)) {
				return "Transaction Failed";
			}
			if ("2".equals(queryResult)) {
				return "Processing";
			}
			if ("3".equals(queryResult)) {
				return "No such transactions";
			}
		}else{
			return "报文格式错误";
		}
                return "未知";

	}
}
