package com.easycart.controller.admin.order;

import javax.validation.constraints.Max;
import javax.validation.constraints.Min;

import org.hibernate.validator.constraints.Length;

public class OrderSearchForm {

	@Length(min=0,max=30)
	private String q;
	private int CustomerId = -1;
	@Min(-1)
	@Max(5)
	private int status = -1;
	public String getQ() {
		return q;
	}
	public void setQ(String q) {
		this.q = q;
	}
	public int getStatus() {
		return status;
	}
	public void setStatus(int status) {
		this.status = status;
	}
	public int getCustomerId() {
		return CustomerId;
	}
	public void setCustomerId(int customerId) {
		CustomerId = customerId;
	}
	
	
}
