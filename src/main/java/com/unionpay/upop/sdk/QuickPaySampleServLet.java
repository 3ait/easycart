package com.unionpay.upop.sdk;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.logging.Level;
import java.util.logging.Logger;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * 名称：支付请求类
 * 功能：servlet方式支付类请求
 * 类属性：
 * 版本：1.0
 * 日期：2011-03-11
 * 作者：中国银联UPOP团队
 * 版权：中国银联
 * 说明：以下代码只是为了方便商户测试而提供的样例代码，商户可以根据自己网站的需要，按照技术文档编写,并非一定要使用该代码。该代码仅供参考。
 * */

public class QuickPaySampleServLet extends HttpServlet {
	/**
	 * 
	 */
	private static final long serialVersionUID = -6247574514957274823L;
	static int i= 0;
	public void init() {

	}
	
	public void service(HttpServletRequest request, HttpServletResponse response) {
		//商户需要组装如下对象的数据
			
			String merId = "620055459475012";
			//01 消费 02 预授权
			String transType = "01";
			//原始系统交易跟踪号
			String origQid = "";
			//商户类型
			String merCode = "";
            String ipAddr = new QuickPayUtils().getAddr(request);
//			String origQid = request.getParameter("origQid");
//            String transType = request.getParameter("transType");
//            String merId = request.getParameter("merId");
//            String merCode = request.getParameter("merCode");
            //商户名称
            String merName = "ROYALDEER.CO.NZ";
            //商品URL
            String commodityUrl = "";
            //商品名称
            String commodityName = "";
            //商户保留字段 size="50"
            String merReserved = "";
            //交易超时时间
            String transTimeout = "300000";
            String acqCode = "";

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

            String signType = request.getParameter("sign");
            if (!QuickPayConf.signType_SHA1withRSA.equalsIgnoreCase(signType)) {
                    signType = QuickPayConf.signType;
            }

            String html;
            String[] valueVo;

            if(QuickPayConf.isMerInterface){
                valueVo = new String[]{
                                    QuickPayConf.version,//协议版本
                                    QuickPayConf.charset,//字符编码
                        transType,//交易类型
                        origQid,//原始交易流水号
                        merId,//商户代码
                        merName,//商户简称
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
                        ipAddr, //用户IP
                        "",//用户真实姓名
                        "",//默认支付方式
                        "",//默认银行编号
                        transTimeout,//交易超时时间
                        QuickPayConf.merFrontEndUrl,// 前台回调商户URL
                        QuickPayConf.merBackEndUrl,// 后台回调商户URL
                        merReserved //商户保留域
                    };
                html = new QuickPayUtils().createPayHtml(QuickPayConf.merReqVo, valueVo, signType, QuickPayConf.gateWay);//跳转到银联页面支付

            } else {
                valueVo = new String[]{
                                    QuickPayConf.version,//协议版本
                                    QuickPayConf.charset,//字符编码
                        transType,//交易类型
                        origQid,//原始交易流水号
                        merId,//商户代码
                        merName,//商户简称
                        acqCode,//收单机构代码（仅收单机构接入需要填写）
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
                        ipAddr, //"127.0.0.1",//用户IP
                        "",//用户真实姓名
                        "",//默认支付方式
                        "",//默认银行编号
                        transTimeout,//交易超时时间
                        QuickPayConf.merFrontEndUrl,// 前台回调商户URL
                                    QuickPayConf.merBackEndUrl,// 后台回调商户URL
                        merReserved //商户保留域
                    };

                html = new QuickPayUtils().createPayHtml(QuickPayConf.reqVo, valueVo, signType, QuickPayConf.gateWay);//跳转到银联页面支付

            }
		

		
		response.setContentType("text/html;charset="+QuickPayConf.charset);   
		response.setCharacterEncoding(QuickPayConf.charset);
		try {
			response.getWriter().write(html);
		} catch (IOException e) {
			
		}
		response.setStatus(HttpServletResponse.SC_OK);
	}
	
	
	

}
