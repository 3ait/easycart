package com.easycart.utils;

import com.easycart.utils.DateHelper;

public class IdentifyCode {

	//创建时间
	private int createTime = DateHelper.getTime();
	//每次验证码发送时间间隔
	private int stepTime = DateHelper.getTime() + 60;
	//当前时间+15分钟
	private int  expireTime = DateHelper.getTime() + 24*60*60;
	//每天只能发送3次
	private int tryTimes  = 0;
	//短信验证码
	private String identifyCode;
	//是否验证
	private boolean verify = false;
	
	public IdentifyCode(){
	}
	
	public IdentifyCode(String identifyCode){
		this.identifyCode = identifyCode;
	}
	
	public int getCreateTime() {
		return createTime;
	}
	public void setCreateTime(int createTime) {
		this.createTime = createTime;
	}
	public int getExpireTime() {
		return expireTime;
	}
	public void setExpireTime(int expireTime) {
		this.expireTime = expireTime;
	}
	public String getIdentifyCode() {
		return identifyCode;
	}
	public void setIdentifyCode(String identifyCode) {
		this.identifyCode = identifyCode;
	}
	public boolean isVerify() {
		return verify;
	}
	public void setVerify(boolean verify) {
		this.verify = verify;
	}

	public int getStepTime() {
		return stepTime;
	}

	public void setStepTime(int stepTime) {
		this.stepTime = stepTime;
	}

	public int getTryTimes() {
		return tryTimes;
	}

	public void setTryTimes(int tryTimes) {
		this.tryTimes = tryTimes;
	}
	
	
	
}
