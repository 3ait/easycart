package com.mail.logic;

/**
 * host UserName(from) password to
 * 
 * @author yaoliang
 *
 */
public enum Mail {

	royaldeer("smtp.gmail.com","leo@3a.co.nz","521yaoliang","info@royaldeer.co.nz");
//	royaldeer("smtp.gmail.com","leo@3a.co.nz","521yaoliang","yaolyaol@sina.com");
	
	
	private String host;
	private String UserName;
	private String password;
	private String to;
	

	/**
	 * 
	 * @param host
	 * @param auth
	 * @param starttls
	 * @param debug
	 * @param UserName
	 * @param password
	 * @param to
	 */
	private Mail(String host,String UserName,String password,String to){
		this.host = host;
		this.UserName = UserName;
		this.password = password;
		this.to = to;
	}
	
	public String getHost() {
		return host;
	}
	public void setHost(String host) {
		this.host = host;
	}
	public String getUserName() {
		return UserName;
	}
	public void setUserName(String userName) {
		UserName = userName;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getTo() {
		return to;
	}
	public void setTo(String to) {
		this.to = to;
	}
	
}
