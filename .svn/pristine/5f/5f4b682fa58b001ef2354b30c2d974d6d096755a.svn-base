package com.latipay.config;

import java.text.SimpleDateFormat;

import org.hibernate.validator.constraints.Length;

import com.easycart.db.entity.Customer;
import com.easycart.db.entity.Order;
import com.latipay.utils.LatipayUtils;

/* *
 *类名：LatipayConfig
 *功能：基础配置类
 *详细：设置帐户有关信息及前后台通知地址
 *版本：2.0
 *日期：2016-05-16
 *说明：
 *以下代码只是为了方便商户测试而提供的样例代码，商户可以根据自己网站的需要，按照技术文档编写,并非一定要使用该代码。
 *该代码仅供学习和研究LATIPAY接口使用，只是提供一个参考。
 */
public class LatipayConfig {
	/**
     * MyRapidPay提供给商户的网关地址
     */
	private String key = "3awebsite";
    /*
     * 必填
     * 前台回调地址
     */
	private String frontUrl = "http://www.3a.co.nz";
    
    /**
     * 设置密钥：为确保商户交易信息的真实性和完整性，
     * 入驻LATIPAY电子支付平台的商户需要设置密钥，以用于数字签名，
     * 该密钥初始值为空，商户登录系统，打开“开发者-更新秘钥”后可修改自己的密钥，
     * 为确保商户交易数据安全，请商户正式上线前务必另行设定密钥
     */
    /*
     * 必填
     */
    private String version = "1.0";
    /*
     * 必填
     * CNY：人民币
		NZD：纽币
     */
    private String currency;
    /*
     * 必填
     */
    private String amount;
    /*
     * 必填
     */
    private String itemName;
    /*
     * 必填
     */
    private String quantity;
    
    /*
     * 必填
     * 订单生成日期yyyyMMdd-商户编号-商户流水号
     */
    private String orderId;
    
    /*
     * 必填
     * 
     */
    @Length(max=9,min=9)
    private String merchantCode = "M00000898";
    
    
    /*
     * 必填
     * md5(orderId+currency+amount+merchantCode+frontUrl +key)
     */
    
    private String md5info;
    
    //
	private String backUrl;
	//身份证上的真实名称
	private String idName;
	//身份证真实编号
	private String idNumber;
	private String email;
	//
	private String phone;
	
	
	public String getMerchantCode() {
		return merchantCode;
	}
	public void setMerchantCode(String merchantCode) {
		this.merchantCode = merchantCode;
	}
	public String getOrderId() {
		return orderId;
	}
	public void setOrderId(String orderId) {
		this.orderId = orderId;
	}
	public String getBackUrl() {
		return backUrl;
	}
	public void setBackUrl(String backUrl) {
		this.backUrl = backUrl;
	}
	public String getItemName() {
		return itemName;
	}
	public void setItemName(String itemName) {
		this.itemName = itemName;
	}
	public String getQuantity() {
		return quantity;
	}
	public void setQuantity(String quantity) {
		this.quantity = quantity;
	}
	public String getCurrency() {
		return currency;
	}
	public void setCurrency(String currency) {
		this.currency = currency;
	}
	public String getAmount() {
		return amount;
	}
	public void setAmount(String amount) {
		this.amount = amount;
	}
	public String getIdName() {
		return idName;
	}
	public void setIdName(String idName) {
		this.idName = idName;
	}
	public String getIdNumber() {
		return idNumber;
	}
	public void setIdNumber(String idNumber) {
		this.idNumber = idNumber;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getVersion() {
		return version;
	}
	public void setVersion(String version) {
		this.version = version;
	}
	
	public String getMd5info() {
		return md5info;
	}
	
	public void setMd5info(String md5info) {
		this.md5info = md5info;
	}
	public String getKey() {
		return key;
	}
	public void setKey(String key) {
		this.key = key;
	}
	public String getFrontUrl() {
		return frontUrl;
	}
	public void setFrontUrl(String frontUrl) {
		this.frontUrl = frontUrl;
	}
	
	/**
	 * 获取latipay的支付参数
	 *  LatipayConfig
	 * @return String
	 */
	public static LatipayConfig getInstance(Customer customer,String currency,Order order){
		
		LatipayConfig latipayConfig = null;
		if(order!=null){
			latipayConfig = new LatipayConfig();
			
			latipayConfig.setAmount(""+(order.getTotalFreight()+order.getTotalProductPrice()));
			//20160401-6666-12345
			SimpleDateFormat sdfDate = new SimpleDateFormat("yyyyMMdd");
			latipayConfig.setOrderId(sdfDate.format(System.currentTimeMillis()) + "-" + latipayConfig.getMerchantCode() + "-" + order.getId());
			latipayConfig.setItemName(sdfDate.format(System.currentTimeMillis()) + "-" + order.getId());
			latipayConfig.setQuantity("1");
			latipayConfig.setCurrency(currency);
			
			// 组织加密明文
			//(orderId+currency+amount+merchantCode+frontUrl +key)
			StringBuilder sb=new StringBuilder();
			sb.append(latipayConfig.getOrderId());
			sb.append(latipayConfig.getCurrency());
			sb.append(latipayConfig.getAmount());
			sb.append(latipayConfig.getMerchantCode());
			sb.append(latipayConfig.getFrontUrl());
			sb.append(latipayConfig.getKey());
			String md5info = LatipayUtils.md5(sb.toString());
			latipayConfig.setMd5info(md5info);
			
		}
		
		return latipayConfig;
	}
	
	
	
}
