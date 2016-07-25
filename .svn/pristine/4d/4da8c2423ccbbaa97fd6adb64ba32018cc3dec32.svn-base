package com.easycart.controller.admin.login.logic;

import javax.annotation.Resource;

import org.springframework.stereotype.Component;

import com.easycart.db.dao.IUserDao;
import com.easycart.db.entity.User;

/**
 * 用户登录
 * @author yaoliang
 *
 */
@Component("adminLoginLogic")
public class AdminLoginLogic {
	
	@Resource(name="userDao")
	private IUserDao userDao;
	
	public void setUserDao(IUserDao userDao) {
		this.userDao = userDao;
	}


	/**
	 * 
	 * @param email
	 * @param password
	 * @return boolean
	 */
	public User adminLogin(String email,String password){
		
		return userDao.login(email, password);
	}
	
}
