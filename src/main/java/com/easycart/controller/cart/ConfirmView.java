package com.easycart.controller.cart;

import javax.validation.constraints.Max;
import javax.validation.constraints.Min;
import javax.validation.constraints.Pattern;

import org.hibernate.validator.constraints.Length;

/**
 * 提交订单View
 * @author yaoliang
 *
 */
public class ConfirmView {

	@Length(min=0,max=100)
	private String customerMessage;
	
	private int fromAddressId;
	@Length(min=1,max=100)
	private String fromName;
	
	@Length(min=1,max=100)
	@Pattern(regexp="[0-9]+")
	private String fromPhone;
	@Length(min=1,max=300)
	private String fromAddress;
	
	private int toAddressId;
	@Length(min=1,max=100)
	private String toName;
	
	@Length(min=1,max=100)
	@Pattern(regexp="[0-9]+")
	private String toPhone;
	@Length(min=1,max=300)
	private String toAddress;
	@Min(0)
	@Max(10000)
	private Double totalFreight;
	@Min(0)
	@Max(10000)
	private Double totalProductPrice;
	
	
	public String getCustomerMessage() {
		return customerMessage;
	}
	public void setCustomerMessage(String customerMessage) {
		this.customerMessage = customerMessage;
	}
	public int getFromAddressId() {
		return fromAddressId;
	}
	public void setFromAddressId(int fromAddressId) {
		this.fromAddressId = fromAddressId;
	}
	public String getFromName() {
		return fromName;
	}
	public void setFromName(String fromName) {
		this.fromName = fromName;
	}
	public String getFromPhone() {
		return fromPhone;
	}
	public void setFromPhone(String fromPhone) {
		this.fromPhone = fromPhone;
	}
	public String getFromAddress() {
		return fromAddress;
	}
	public void setFromAddress(String fromAddress) {
		this.fromAddress = fromAddress;
	}
	public int getToAddressId() {
		return toAddressId;
	}
	public void setToAddressId(int toAddressId) {
		this.toAddressId = toAddressId;
	}
	public String getToName() {
		return toName;
	}
	public void setToName(String toName) {
		this.toName = toName;
	}
	public String getToPhone() {
		return toPhone;
	}
	public void setToPhone(String toPhone) {
		this.toPhone = toPhone;
	}
	public String getToAddress() {
		return toAddress;
	}
	public void setToAddress(String toAddress) {
		this.toAddress = toAddress;
	}
	public Double getTotalFreight() {
		return totalFreight;
	}
	public void setTotalFreight(Double totalFreight) {
		this.totalFreight = totalFreight;
	}
	public Double getTotalProductPrice() {
		return totalProductPrice;
	}
	public void setTotalProductPrice(Double totalProductPrice) {
		this.totalProductPrice = totalProductPrice;
	}
	
	
}
