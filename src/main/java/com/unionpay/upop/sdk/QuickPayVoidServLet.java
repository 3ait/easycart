/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package com.unionpay.upop.sdk;

import java.io.IOException;
import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;
import java.text.SimpleDateFormat;
import java.util.Date;
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
public class QuickPayVoidServLet extends HttpServlet {
	static int i= 0;
        private String respCode = "";
        private String respMsg = "";
	public void init() {

	}

	public void service(HttpServletRequest request, HttpServletResponse response) {
		//商户需要组装如下对象的数据

            String transType = request.getParameter("transType");
            String origQid = request.getParameter("origQid");
            String merId = request.getParameter("merId");
            String merCode = request.getParameter("merCode");
            String merName = request.getParameter("merName");
            String commodityUrl = request.getParameter("commodityUrl");
            String commodityName = request.getParameter("commodityName");
            String merReserved = request.getParameter("merReserved");
            String transTimeout = request.getParameter("transTimeout");

        try {
            merName = new String(request.getParameter("merName").getBytes("ISO-8859-1"), "UTF-8");
            commodityUrl = new String(request.getParameter("commodityUrl").getBytes("ISO-8859-1"),"UTF-8");
            commodityName = new String(request.getParameter("commodityName").getBytes("ISO-8859-1"),"UTF-8");
        } catch (UnsupportedEncodingException ex) {
            Logger.getLogger(QuickPaySampleServLet.class.getName()).log(Level.SEVERE, null, ex);
            return;
        }
            String commodityUnitPrice = request.getParameter("commodityUnitPrice");
            String commodityQuantity = request.getParameter("commodityQuantity");
            String commodityDiscount = request.getParameter("commodityDiscount");
            String transferFee = request.getParameter("transferFee");
            String orderCurrency = request.getParameter("orderCurrency");
            String orderAmount = request.getParameter("orderAmount");

            if(!commodityUnitPrice.equals("")){
                commodityUnitPrice = String.format("%12.0f", Double.parseDouble(commodityUnitPrice) * 100).trim();
            }
            if(!commodityDiscount.equals("")){
                commodityDiscount = String.format("%12.0f", Double.parseDouble(commodityDiscount) * 100).trim();
            }
            if(!transferFee.equals("")){
                transferFee = String.format("%12.0f", Double.parseDouble(transferFee) * 100).trim();
            }

            orderAmount = String.format("%12.0f", Double.parseDouble(orderAmount) * 100).trim();
            merReserved = request.getParameter("merReserved");
            transTimeout = request.getParameter("transTimeout");

            String[] valueVo = new String[]{
				QuickPayConf.version,//协议版本
				QuickPayConf.charset,//字符编码
	            transType,//交易类型
	            origQid,//原始交易流水号
	            merId,//商户代码
	            merName,//商户简称
	            "",//收单机构代码（仅收单机构接入需要填写）
	            merCode,//商户类别（收单机构接入需要填写）
	            
                    commodityUrl,//商品URL
	            commodityName,//商品名称
	            commodityUnitPrice,//商品单价 单位：分
	            commodityQuantity,//商品数量
	            commodityDiscount,//折扣 单位：分
	            transferFee,//运费 单位：分
                    
	            new SimpleDateFormat("yyyyMMddHHmmss").format(new Date())+(++i),//订单号（需要商户自己生成）
	            orderAmount,//交易金额 单位：分
	            orderCurrency,//交易币种
	            new SimpleDateFormat("yyyyMMddHHmmss").format(new Date()),//交易时间
	            "127.0.0.1",//用户IP
	            "",//用户真实姓名
	            "",//默认支付方式
	            "",//默认银行编号
	            transTimeout,//交易超时时间
	            QuickPayConf.merFrontEndUrl,// 前台回调商户URL
				QuickPayConf.merBackEndUrl,// 后台回调商户URL
	            merReserved//商户保留域
		};

		String signType = request.getParameter("sign");
		if (!QuickPayConf.signType_SHA1withRSA.equalsIgnoreCase(signType)) {
			signType = QuickPayConf.signType;
		}

		QuickPayUtils quickPayUtils = new QuickPayUtils();
		String res = quickPayUtils.doPostQueryCmd(QuickPayConf.backStagegateWay,new QuickPayUtils().createBackStrForBackTrans(valueVo, QuickPayConf.reqVo));
                String returnMsg = "";
                Boolean signatureCheck = false;
		if (res != null && !"".equals(res)) {

			String[] arr = QuickPayUtils.getResArr(res);

                        try {
                            for(int j = 0; j < arr.length; j++){
                                arr[j] = java.net.URLDecoder.decode(arr[j], QuickPayConf.charset);
                            }
                        } catch (UnsupportedEncodingException ex) {
                            Logger.getLogger(QuickPayQueryServLet.class.getName()).log(Level.SEVERE, null, ex);
                        }

                        signatureCheck = checkSecurity(arr);
			merBusiness(arr);//商户业务逻辑
		} else{
			respMsg = "Empty Response Message";
		}

		response.setContentType("text/html;charset="+QuickPayConf.charset);
		response.setCharacterEncoding(QuickPayConf.charset);
		try {
			response.getWriter()
			.append("Result:<br>")
			.append("Signature Correct ?："+ signatureCheck)
			.append("<br>Cancellation/Refund Successful?："+"00".equals(respCode));
			if(!"00".equals(respCode)){
                            response.getWriter().append("<br>Response Code:" + respCode);
                            response.getWriter().append("<br>Response Message:" + respMsg);
			}

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
			System.out.println("Failure in verifying signature");
			return false;
		}else if(checkedRes == 2){
			System.out.println("Incorrect Format");
			return false;
		}
		return false;
	}

	//商户的业务逻辑
	public void merBusiness(String[] arr){
		//以下是商户业务处理
		for (int i = 0; i < arr.length; i++) {
			String[] queryResultArr = arr[i].split("=");
			// 处理商户业务逻辑
			if (queryResultArr.length >= 2 && "respCode".equals(queryResultArr[0])) {
				respCode = arr[i].substring(queryResultArr[0].length()+1);
//				break;
			}
			if (queryResultArr.length >= 2 && "respMsg".equals(queryResultArr[0])) {
				respMsg = arr[i].substring(queryResultArr[0].length()+1);
//				break;
			}

                }

	}
}
