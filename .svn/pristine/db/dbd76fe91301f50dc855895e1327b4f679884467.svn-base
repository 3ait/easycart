package com.easycart.controller.admin.login.interceptor;

import com.easycart.utils.DateHelper;

public class RemoteInfo {

	//主机IP
	private String host;
	//尝试登陆次数
	private int tryTimes = 1;
	//创建时间
	private int createTime = DateHelper.getTime();

	//当前时间+15分钟
	private int expireTime = DateHelper.getTime() + 15*60;
	
	//短信验证码
	public String code;
	
	public String getHost() {
		return host;
	}

	public void setHost(String host) {
		this.host = host;
	}


	public int getCreateTime() {
		return createTime;
	}

	public void setCreateTime(int createTime) {
		this.createTime = createTime;
	}

	public int getTryTimes() {
		return tryTimes;
	}

	public void setTryTimes(int tryTimes) {
		this.tryTimes = tryTimes;
	}

	public int getExpireTime() {
		return expireTime;
	}

	public void setExpireTime(int expireTime) {
		this.expireTime = expireTime;
	}
	
	
}
