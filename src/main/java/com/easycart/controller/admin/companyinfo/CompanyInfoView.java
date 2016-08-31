package com.easycart.controller.admin.companyinfo;

import java.util.List;

import org.hibernate.validator.constraints.Email;
import org.hibernate.validator.constraints.Length;

import com.easycart.db.entity.User;

public class CompanyInfoView {

	private Integer companyId;
	
	@Length(min=1,max=200)
	private String companyName;
	@Length(min=0,max=100)
	private String companyPhone;
	@Length(min=0,max=200)
	private String companyAddress;
	@Length(min=0,max=200)
	private String accountName;
	@Length(min=0,max=200)
	private String accountNumber;
	@Email
	private String email;
	@Length(min=0,max=200)
	private String emailPassword;
	@Length(min=0,max=200)
	private String emailSmtp;
	@Length(min=0,max=200)
	private String mobile;
	@Length(min=0,max=500)
	private String keywords;
	@Length(min=0,max=5000)
	private String description;

	private Double exchangeRate;
	
	
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

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getEmailPassword() {
		return emailPassword;
	}

	public void setEmailPassword(String emailPassword) {
		this.emailPassword = emailPassword;
	}

	public String getEmailSmtp() {
		return emailSmtp;
	}

	public void setEmailSmtp(String emailSmtp) {
		this.emailSmtp = emailSmtp;
	}

	public String getMobile() {
		return mobile;
	}

	public void setMobile(String mobile) {
		this.mobile = mobile;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public String getKeywords() {
		return keywords;
	}

	public void setKeywords(String keywords) {
		this.keywords = keywords;
	}

	public Double getExchangeRate() {
		return exchangeRate;
	}

	public void setExchangeRate(Double exchangeRate) {
		this.exchangeRate = exchangeRate;
	}

	
	
}
