package com.easycart.controller.admin.login;

import javax.validation.constraints.Size;

import org.hibernate.validator.constraints.Email;

public class LoginForm {

	@Email
	@Size(min=2,max=50,message="长度大于2小于15")
	private String email;
	
	private String phone;
	
	@Size(min=2,max=50,message="长度大于2小于15")
	private String password;
	
	
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
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	
	
}
