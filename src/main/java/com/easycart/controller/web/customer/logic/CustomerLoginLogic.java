package com.easycart.controller.web.customer.logic;

import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.easycart.controller.BaseLogic;
import com.easycart.controller.admin.order.OrderSearchForm;
import com.easycart.controller.admin.order.OrderView;
import com.easycart.controller.web.customer.CustomerForm;
import com.easycart.controller.web.index.ProductView;
import com.easycart.db.dao.ICustomerDao;
import com.easycart.db.dao.IOrderDao;
import com.easycart.db.dao.IOrderRecordDao;
import com.easycart.db.entity.Customer;
import com.easycart.db.entity.Order;
import com.easycart.utils.DateHelper;
import com.easycart.utils.Md5;
import com.easycart.utils.Page;

@Component(value="customerLoginLogic")
public class CustomerLoginLogic  extends BaseLogic{

	@Autowired
	ICustomerDao customerDao;
	@Autowired
	IOrderDao orderDao;
	@Autowired
	IOrderRecordDao orderRecordDao;
	
	private String customerMsg = "客户主动取消订单";
	
	/**
	 * 用户登录
	 * @return
	 */
	@Transactional(rollbackOn=Exception.class)
	public Customer login(String phone,String password){
		Customer customer = customerDao.login(phone, password);
		if(customer!=null){
			customer.setModifyTime(Calendar.getInstance().getTime());
			customerDao.update(customer);
		}
		return customer;
	}
	
	/**
	 * 获取订单列表
	 * @return
	 */
	@Transactional(rollbackOn=Exception.class)
	public List<OrderView> getOrderViewList(OrderSearchForm orderSearchForm,Page page){
		
		List<OrderView> list = new ArrayList<>();
		orderDao.list(orderSearchForm,page).forEach(o ->{
			OrderView ov = new OrderView();
			ov.setOrder(o);
			ov.setOrderRecordList(orderRecordDao.getByOrderId(o.getId()));
			ov.setModifyTime(DateHelper.getMMDDYYYYHHMMSS(o.getModifyTime()));
			
			List<ProductView> productViewList = new ArrayList<>();
			ov.getOrderRecordList().forEach(or ->{
				ProductView pv = super.getProductView(or.getProduct(),null);
				productViewList.add(pv);
			});
			ov.setProductViewList(productViewList);
			list.add(ov);
		});
		
		
		return list;
	}
	
	/**
	 * 获取订单数量
	 * @param orderSearchForm
	 * @param page
	 * @return
	 */
	@Transactional(rollbackOn=Exception.class)
	public int getOrderCount(OrderSearchForm orderSearchForm,Page page){
		
		return orderDao.listCount(orderSearchForm,page);
	}

	/**
	 * 取消订单
	 * @param o
	 */
	@Transactional(rollbackOn=Exception.class)
	public void cancelOrder(int orderId) {
		Order order = orderDao.getById(orderId);
		order.setStatus(5);
		order.setCustomerMsg(customerMsg);
		orderDao.update(order);
	}


	/**
	 * 用户注册保存
	 * @param customerForm
	 */
	@Transactional(rollbackOn=Exception.class)
	public Customer saveCustomer(CustomerForm customerForm) {
		Customer customer = new Customer();
		customer.setPhone(customerForm.getPhone());
		customer.setPassword(Md5.getMd5String(customerForm.getPassword()));
		customer.setStatus((byte)1);
		customer.setCreateTime(Calendar.getInstance().getTime());
		customer.setModifyTime(Calendar.getInstance().getTime());
		customer.setEmail(customerForm.getEmail());
		double discount = 0.99;
		customer.setDiscount(discount);
		customerDao.save(customer);
		
		return customer;
	}

	/**
	 * 根据电话获取用户信息
	 * @param phone
	 * @return
	 */
	public Customer getCustiomerByPhone(String phone) {
		return customerDao.getByPhone(phone);
	}

	/**
	 * 找回密码
	 * @param customerForm
	 * @return
	 */
	@Transactional(rollbackOn=Exception.class)
	public Customer retrieve(CustomerForm customerForm) {
		
		Customer customer = customerDao.getByPhone(customerForm.getPhone());
		if(customer!=null){
			customer.setPassword(Md5.getMd5String(customerForm.getPassword()));
			customer.setModifyTime(Calendar.getInstance().getTime());
			customerDao.update(customer);
		}
		return customer;
	}

	/**
	 * 用户支付订单连接
	 * @param orderId
	 * @param id
	 */
	public Order getOrderbyId(int orderId, int customerId) {
		Order order = orderDao.getById(orderId);
		if(order!=null){
			if(!order.getCustomer().getId().equals(customerId)){
				order=null;
			}
		}
		return order;
		
	}
	/**
	 * 用户更新账户密码
	 * @param customer
	 * @param customerForm
	 */
	@Transactional(rollbackOn=Exception.class)
	public boolean updateCustomer(int customerId, CustomerForm customerForm) {
		boolean ret = false;
		Customer customer = customerDao.getById(customerId);
		
		if(customer.getPassword().equals(Md5.getMd5String(customerForm.getPassword()))){
			customer.setEmail(customerForm.getEmail());
			customer.setPassword(Md5.getMd5String(customerForm.getNewpassword()));
			customerDao.update(customer);
			ret = true;
		}
		return ret;
	}
	
}
