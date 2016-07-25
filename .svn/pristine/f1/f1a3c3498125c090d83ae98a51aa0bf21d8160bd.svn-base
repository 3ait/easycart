package com.easycart.controller.customer.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import com.easycart.controller.BaseController;
import com.easycart.db.entity.Customer;

public class CustomerInterceptor implements HandlerInterceptor{

	private final Logger logger = LogManager.getLogger(CustomerInterceptor.class);
	
	@Override
	public void afterCompletion(HttpServletRequest arg0,
			HttpServletResponse arg1, Object arg2, Exception arg3)
			throws Exception {
		
	}

	@Override
	public void postHandle(HttpServletRequest arg0, HttpServletResponse arg1,
			Object arg2, ModelAndView arg3) throws Exception {
		
	}
	
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response,Object object) throws Exception {
		boolean ret = false;
		
		HttpSession session = request.getSession(true);
		Customer customer = (Customer) session.getAttribute(BaseController.SESSION_CUSTOMER);
		
		if(customer!=null){
			logger.debug("customer login successed! "+customer.getPhone() + request.getRemoteHost() + request.getRequestURI());
			ret = true;
		}else{
			logger.debug("visit was blocked by customerInterceptor! ");
			response.sendRedirect(request.getContextPath()+"/customer/");
		}
		
		return ret;
	}


}
