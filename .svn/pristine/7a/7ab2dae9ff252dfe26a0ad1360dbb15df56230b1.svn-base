package com.unionpay.upop.sdk;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Map;
import java.util.TreeMap;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * 名称：支付应答类
 * 功能：servlet方式，建议前台通知和后台通知用两个类实现，后台通知进行商户的数据库等处理,前台通知实现客户浏览器跳转
 * 类属性：
 * 版本：1.0
 * 日期：2011-03-11
 * 作者：中国银联UPOP团队
 * 版权：中国银联
 * 说明：以下代码只是为了方便商户测试而提供的样例代码，商户可以根据自己网站的需要，按照技术文档编写,并非一定要使用该代码。该代码仅供参考。
 * */

public class QuickPayCUPBackEndServLet extends HttpServlet {
	/**
	 * 
	 */
	private static final long serialVersionUID = -6247574514957274823L;

	public void init() {

	}

	public void service(HttpServletRequest request, HttpServletResponse response) {
		try {
			request.setCharacterEncoding(QuickPayConf.charset);
		} catch (UnsupportedEncodingException e) {
		}

                Map<String, String> map = new TreeMap<String, String>();

		String[] resArr = new String[QuickPayConf.queryVo.length];
		for(int i=0;i<QuickPayConf.queryVo.length;i++){
			resArr[i] = request.getParameter(QuickPayConf.queryVo[i]);
                        map.put(QuickPayConf.queryVo[i], resArr[i]);
		}
		String signature = request.getParameter(QuickPayConf.signature);
		String signMethod = request.getParameter(QuickPayConf.signMethod);

		response.setContentType("text/html;charset="+QuickPayConf.charset);
		response.setCharacterEncoding(QuickPayConf.charset);

		try {
			Boolean signatureCheck = new QuickPayUtils().checkSign(QuickPayConf.queryVo, resArr, signMethod, signature);

                        System.out.println("[" + this.getClass().getName() + "] 签名是否正确："+ signatureCheck);
                        if(signatureCheck){
                            Map<String, String> returnMap = new TreeMap<String, String>();
                            for (int i = 0; i < QuickPayConf.queryRes.length; i++) {
                                    returnMap.put(QuickPayConf.queryRes[i], map.get(QuickPayConf.queryRes[i]) == null ? "" : map.get(QuickPayConf.queryRes[i]));
                            }
                            /*
                            returnMap.put("respCode", "00");
                            returnMap.put("queryResult", "0");
                            returnMap.put("respMsg", "successfully");
                            SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmss");
                            returnMap.put("respTime", sdf.format(new Date()));
                            returnMap.put("traceNumber", "000001");
                            returnMap.put("traceTime", returnMap.get("respTime").substring(4, 14));
                            returnMap.put("settleDate",returnMap.get("respTime").substring(4, 8));
                            returnMap.put("settleCurrency", "840");
                            returnMap.put("settleAmount", "3000");
                            returnMap.put("exchangeRate", "30001300");
                            returnMap.put("exchangeDate", returnMap.get("respTime").substring(4, 8));
                            returnMap.put("qid", "QID" + sdf.format(new Date()));
                            */
                            returnMap.remove("signature");
                            returnMap.remove("signMethod");
                            returnMap.put("signature", QuickPayUtils.signMap(returnMap,  signMethod));
                            returnMap.put("signMethod", signMethod);

//                            String returnForm = QuickPayUtils.generateAutoSubmitForm(map.get("frontEndUrl"), returnMap);
                            String returnForm = QuickPayUtils.joinMapValueBySpecial(returnMap, '&');
                            System.out.println("[" + this.getClass().getName() + "] returnForm："+ returnForm);
                            response.getWriter().write(returnForm);
                        }
		} catch (IOException e) {

		}

		response.setStatus(HttpServletResponse.SC_OK);
	}
	
	
	

}
