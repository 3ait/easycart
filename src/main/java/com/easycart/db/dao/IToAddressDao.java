package com.easycart.db.dao;

import java.util.List;

import com.easycart.db.dao.support.ISupport;
import com.easycart.db.entity.ToAddress;

public interface IToAddressDao extends ISupport<ToAddress>{

	public List<ToAddress> getToAddressByCustomerId(int customerId);

	public ToAddress getByToPhone(String toPhone);
	
	public ToAddress get(ToAddress toAddress);
}
