package com.easycart.db.dao;

import java.util.List;

import com.easycart.controller.admin.order.OrderSearchForm;
import com.easycart.db.dao.support.ISupport;
import com.easycart.db.entity.Order;
import com.easycart.utils.Page;

/**
 * 
 * @author yaoliang
 *
 */
public interface IOrderDao extends ISupport<Order>{

	/**
	 * 订单列表
	 * @param orderSearchForm
	 * @param page
	 * @return
	 */
	List<Order> list(OrderSearchForm orderSearchForm, Page page);

	/**
	 * 订单数量
	 * @param orderSearchForm
	 * @param page
	 * @return
	 */
	int listCount(OrderSearchForm orderSearchForm, Page page);
	
	
	public Order getOrder(int id,int customerId);

}
