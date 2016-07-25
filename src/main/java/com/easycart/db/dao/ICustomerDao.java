package com.easycart.db.dao;

import java.util.List;

import com.easycart.db.dao.support.ISupport;
import com.easycart.db.entity.Customer;
import com.easycart.utils.Page;

/**
 * 
 * @author yaoliang
 *
 */
public interface ICustomerDao extends ISupport<Customer>{
	
	public Customer login(String phone, String password);
	
	public Customer getByPhone(String phone);

	public int listCount(String q, Page page);

	public List<Customer> list(String q, Page page);
	
}
