package com.easycart.controller.admin.customer;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.hibernate.validator.constraints.Length;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.easycart.controller.BaseController;
import com.easycart.controller.admin.customer.logic.CustomerLogic;
import com.easycart.db.entity.Customer;
import com.easycart.utils.Page;

/**
 * customer
 * @author yaoliang
 * 24-12-2015
 */
@Controller
@RequestMapping(value={"/admin/customer"})
public class CustomerController extends BaseController{
	private static Logger logger = LogManager.getLogger(CustomerController.class);
	private static int light = 3;
	@Autowired
	CustomerLogic customerLogic;

	
	/**
	 * customer 列表页
	 * @return ModelAndView
	 */
	@RequestMapping("/")
	public ModelAndView index(
			@RequestParam(value="q",defaultValue="",required=false) @Length(min=0,max=30) String q,
			@RequestParam(value="pageNum",required=false,defaultValue="1") int pageNum
			){
		logger.debug("index");
		
		ModelAndView mv = new ModelAndView("admin/customer/admin_customer");
		mv.addObject(ADMIN_CATEGORY_LIGHT, light);
		
		Page page = new Page(pageNum,customerLogic.getCustomerCount(q, new Page()));
		page.setPageNum(pageNum);

		mv.addObject("page", page);
		mv.addObject("customerList", customerLogic.getCustomerList(q, page));
	
		return mv;
	}
	
	
	/**
	 * 用户列表---编辑保存
	 * @return
	 */
	@RequestMapping("/list/edit/confirm")
	@ResponseBody
	public String listEditConfirm(
			@RequestParam(value="id",required=true,defaultValue="-1") int id,
			@RequestParam(value="status",required=false,defaultValue="0") byte status,
			@RequestParam(value="password",required=false,defaultValue="") String password,
			@RequestParam(value="discount",required=false,defaultValue="") Double discount
			){
		logger.debug("listEditConfirm");
		String ret = "success";
		/*
		 * 
		 */
		if(id!=-1){
			Customer customer = new Customer();
			customer.setId(id);
			customer.setStatus(status);
			customer.setPassword(password);
			customer.setDiscount(discount);
			customerLogic.updateCustomer(customer);
			
		}else{
			ret = "fail";
		}
		return ret;
	}
	
}
