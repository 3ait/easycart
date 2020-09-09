package com.unionpay.upop.sdk;

/**
 * 名称：支付配置类 功能：配置类 类属性：公共类 版本：1.0 日期：2011-03-11 作者：中国银联UPOP团队 版权：中国银联
 * 说明：以下代码只是为了方便商户测试而提供的样例代码，商户可以根据自己网站的需要，按照技术文档编写,并非一定要使用该代码。该代码仅供参考。
 */

public class QuickPayConf {

	// 版本号
	public final static String version = "1.0.0";

	// 编码方式
	public final static String charset = "UTF-8";

	// 基础网址（请按相应环境切换）
	// develpment
	/*
	 * private final static String REMOTE_FRONT_END_IP =
	 * "http://127.0.0.1:8084"; private final static String REMOTE_BACK_END_IP =
	 * "http://127.0.0.1:8084"; private final static String LOCAL_FRONT_END_IP =
	 * "http://127.0.0.1:8084"; private final static String LOCAL_BACK_END_IP =
	 * "http://127.0.0.1:8084";
	 */
	// Testing from local to 10.81(testing)

	private final static String REMOTE_FRONT_END_IP = "http://202.82.58.122:5555";
	private final static String REMOTE_BACK_END_IP = "http://202.82.58.122:5555";
	private final static String LOCAL_FRONT_END_IP = "http://royaldeer.co.nz";
	private final static String LOCAL_BACK_END_IP = "http://royaldeer.co.nz";

	/* 前台交易测试环境 */
	// private final static String UPOP_BASE_URL = REMOTE_FRONT_END_IP + "/DPGW/MerchantSrv/";

	/* 前台交易PM环境（准生产环境） */
	// private final static String UPOP_BASE_URL =
	// "https://www.epay.lxdns.com/UpopWeb/api/";

	/* 前台交易生产环境 */
//	private final static String UPOP_BASE_URL = "https://unionpaysecure.com/api/";
	private final static String UPOP_BASE_URL = "https://dopp.dynamicg.com" + "/DPGW/MerchantSrv/";
	/* 后台交易测试环境 */
	private final static String UPOP_BSPAY_BASE_URL = REMOTE_BACK_END_IP + "/DPGW/MerchantSrv/";

	/* 后台交易PM环境（准生产环境） */
	// private final static String UPOP_BSPAY_BASE_URL =
	// "https://www.epay.lxdns.com/UpopWeb/api/";

	/* 后台交易生产环境 */
	// private final static String UPOP_BSPAY_BASE_URL =
	// "https://besvr.unionpaysecure.com/api/";

	/* 查询交易测试环境 */
	private final static String UPOP_QUERY_BASE_URL = REMOTE_BACK_END_IP + "/DPGW/MerchantSrv/";

	/* 查询交易PM环境（准生产环境） */
	// private final static String UPOP_QUERY_BASE_URL =
	// "https://www.epay.lxdns.com/UpopWeb/api/";

	/* 查询交易生产环境 */
	// private final static String UPOP_QUERY_BASE_URL =
	// "https://query.unionpaysecure.com/api/";

	// 支付网址
	public final static String gateWay = UPOP_BASE_URL + "Payment.action";

	// 后续交易网址
	public final static String backStagegateWay = UPOP_BSPAY_BASE_URL + "AutoPayment.action";

	// 查询网址
	public final static String queryUrl = UPOP_QUERY_BASE_URL + "Query.action";

	// 认证支付2.0网址
	public final static String authPayUrl = UPOP_BASE_URL + "AuthPay.action";

	// 发短信网址
	public final static String smsUrl = UPOP_BASE_URL + "Sms.action";
	// information below to verify the signature
	// 商户代码
	public final static String merCode = "620055459475012"; // "105550149170027";

	// 商户名称
	public final static String merName = "Ahura Consulting Ltd";

//	public final static String merFrontEndUrl = LOCAL_FRONT_END_IP + "/web/cart/unionpay/ret";
	public final static String merFrontEndUrl = LOCAL_FRONT_END_IP + "/cart/unionpay/ret";

	public final static String merBackEndUrl = LOCAL_BACK_END_IP + "/cart/unionpay/ret";

	// 加密方式
	public final static String signType = "MD5";
	public final static String signType_SHA1withRSA = "SHA1withRSA";

	// 商城密匙，需要和银联商户网站上配置的一样
	public final static String securityKey = "88888888";
	// public final static String securityKey =
	// "2UPxPIkgRzGPuS3gTLZiw9Rx9AkYK3Rg";

	// 签名
	public final static String signature = "signature";
	public final static String signMethod = "signMethod";

	public final static boolean isMerInterface = true;

	// 机构接口
	// 组装消费请求包

	public final static String[] backReqVo = new String[] { "version", "charset", "transType", "origQid", "merId",
			"merAbbr", "acqCode", "merCode", "orderNumber", "orderAmount", "orderCurrency", "orderTime", "customerIp",
			"transTimeout", "frontEndUrl", "backEndUrl", "merReserved" };

	public final static String[] reqVo = new String[] { "version", "charset", "transType", "origQid", "merId",
			"merAbbr", "acqCode", "merCode", "commodityUrl", "commodityName", "commodityUnitPrice", "commodityQuantity",
			"commodityDiscount", "transferFee", "orderNumber", "orderAmount", "orderCurrency", "orderTime",
			"customerIp", "customerName", "defaultPayType", "defaultBankNumber", "transTimeout", "frontEndUrl",
			"backEndUrl", "merReserved" };

	public final static String[] reqVo2 = new String[] { "version", "charset", "transType", "origQid", "merId",
			"merAbbr", "acqCode", "merCode", "orderNumber", "orderAmount", "orderCurrency", "orderTime", "customerIp",
			"customerName", "transTimeout", "frontEndUrl", "backEndUrl", "merReserved" };

	public final static String[] notifyVo = new String[] { "charset", "cupReserved", "exchangeDate", "exchangeRate",
			"merAbbr", "acqCode", "merId", "orderAmount", "orderCurrency", "orderNumber", "qid", "respCode", "respMsg",
			"respTime", "settleAmount", "settleCurrency", "settleDate", "traceNumber", "traceTime", "transType",
			"version" };

	public final static String[] queryVo = new String[] { "version", "charset", "transType", "acqCode", "merId",
			"orderNumber", "orderTime", "merReserved" };

	public final static String[] queryRes = new String[] { "version", "charset", "signMethod", "signature", "transType",
			"respCode", "respTime", "queryResult", "qid", "traceNumber", "traceTime", "settleAmount", "settleCurrency",
			"settleDate", "exchangeRate", "exchangeDate", "cupReserved" };

	// 商户接口
	// 组装消费请求包
	public final static String[] merReqVo = new String[] { "version", "charset", "transType", "origQid", "merId",
			"merAbbr", "commodityUrl", "commodityName", "commodityUnitPrice", "commodityQuantity", "commodityDiscount",
			"transferFee", "orderNumber", "orderAmount", "orderCurrency", "orderTime", "customerIp", "customerName",
			"defaultPayType", "defaultBankNumber", "transTimeout", "frontEndUrl", "backEndUrl", "merReserved" };

	public final static String[] merNotifyVo = new String[] { "charset", "cupReserved", "exchangeDate", "exchangeRate",
			"merAbbr", "merId", "orderAmount", "orderCurrency", "orderNumber", "qid", "respCode", "respMsg", "respTime",
			"settleAmount", "settleCurrency", "settleDate", "traceNumber", "traceTime", "transType", "version" };

	public final static String[] merQueryVo = new String[] { "version", "charset", "transType", "merId", "orderNumber",
			"orderTime", "merReserved" };

	public final static String[] merQueryRes = new String[] { "version", "charset", "signMethod", "signature",
			"transType", "respCode", "respTime", "queryResult", "qid", "traceNumber", "traceTime", "settleAmount",
			"settleCurrency", "settleDate", "exchangeRate", "exchangeDate", "cupReserved" };

	public final static String[] smsVo = new String[] { "version", "charset", "acqCode", "merId", "merAbbr",
			"orderNumber", "orderAmount", "orderCurrency", "merReserved" };

}
