package com.easycart.controller.web.about;

public class ContactInfo {

	private String name = "";
	private String firstName = "";
	private String lastName = "";
	private String address = "";
	private String suburb = "";
	private String town = "";
	private String phone = "";
	private String email = "";
	private String subject = "";
	private String comment = "";
	private String vCode;
	
	
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getFirstName() {
		return firstName;
	}
	public void setFirstName(String firstName) {
		this.firstName = firstName;
	}
	public String getLastName() {
		return lastName;
	}
	public void setLastName(String lastName) {
		this.lastName = lastName;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getSuburb() {
		return suburb;
	}
	public void setSuburb(String suburb) {
		this.suburb = suburb;
	}
	public String getTown() {
		return town;
	}
	public void setTown(String town) {
		this.town = town;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getComment() {
		return comment;
	}
	public void setComment(String comment) {
		this.comment = comment;
	}
	public String getvCode() {
		return vCode;
	}
	public void setvCode(String vCode) {
		this.vCode = vCode;
	}
	
	public String getSubject() {
		return subject;
	}
	public void setSubject(String subject) {
		this.subject = subject;
	}
	public String toString(){
		StringBuffer sb = new StringBuffer();

		sb.append(name).append("<br/>");
		sb.append(firstName).append("<br/>");
		sb.append(lastName).append("<br/>");
		sb.append(address).append("<br/>");
		sb.append(suburb).append("<br/>");
		sb.append(town).append("<br/>");
		sb.append(phone).append("<br/>");
		sb.append(email).append("<br/>");
		sb.append(subject).append("<br/>");
		sb.append(comment).append("<br/>");
		
		return sb.toString();
		
	}
	
}
