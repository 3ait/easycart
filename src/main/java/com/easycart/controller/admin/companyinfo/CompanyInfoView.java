package com.easycart.controller.admin.companyinfo;

import java.util.List;

import org.hibernate.validator.constraints.Length;

import com.easycart.db.entity.User;

public class CompanyInfoView {

	private Integer companyId;
	
	@Length(min=1,max=200)
	private String companyName;
	@Length(min=1,max=100)
	private String companyPhone;
	@Length(min=1,max=200)
	private String companyAddress;
	@Length(min=1,max=200)
	private String accountName;
	@Length(min=1,max=200)
	private String accountNumber;

	
	public List<User> userList; 
	
	
	public String getCompanyName() {
		return companyName;
	}

	public void setCompanyName(String companyName) {
		this.companyName = companyName;
	}

	public String getAccountName() {
		return accountName;
	}

	public void setAccountName(String accountName) {
		this.accountName = accountName;
	}

	public String getAccountNumber() {
		return accountNumber;
	}

	public void setAccountNumber(String accountNumber) {
		this.accountNumber = accountNumber;
	}

	public List<User> getUserList() {
		return userList;
	}

	public void setUserList(List<User> userList) {
		this.userList = userList;
	}


	public Integer getCompanyId() {
		return companyId;
	}

	public void setCompanyId(Integer companyId) {
		this.companyId = companyId;
	}

	public String getCompanyPhone() {
		return companyPhone;
	}

	public void setCompanyPhone(String companyPhone) {
		this.companyPhone = companyPhone;
	}

	public String getCompanyAddress() {
		return companyAddress;
	}

	public void setCompanyAddress(String companyAddress) {
		this.companyAddress = companyAddress;
	}
	
	
	
}
