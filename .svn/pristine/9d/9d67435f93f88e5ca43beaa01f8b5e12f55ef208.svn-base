package com.easycart.controller.admin.customer.logic;

import java.util.List;

import javax.transaction.Transactional;

import org.hibernate.internal.util.StringHelper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.easycart.db.dao.ICustomerDao;
import com.easycart.db.entity.Customer;
import com.easycart.utils.Md5;
import com.easycart.utils.Page;

@Component("customerLogic")
public class CustomerLogic {

	@Autowired
	ICustomerDao customerDao;
	/**
	 * 获取顾客数量
	 * @param q
	 * @param page
	 * @return
	 */
	public int getCustomerCount(String q, Page page) {
		// TODO Auto-generated method stub
		return customerDao.listCount(q,page);
	}
	/**
	 * 获取顾客列表
	 * @param q
	 * @param page
	 * @return
	 */
	public List<Customer> getCustomerList(String q, Page page) {
		return customerDao.list(q,page);
	}
	
	/**
	 * 更新用户信息
	 * @param customer
	 */
	@Transactional(rollbackOn=Exception.class)
	public void updateCustomer(Customer customer) {
		Customer c = customerDao.getById(customer.getId());
		c.setId(customer.getId());
		c.setStatus(customer.getStatus());
		if(StringHelper.isNotEmpty(customer.getPassword()))
			c.setPassword(Md5.getMd5String(customer.getPassword()));
		c.setDiscount(customer.getDiscount());
		
		customerDao.update(c);
	}

}
