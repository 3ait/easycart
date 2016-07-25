package com.easycart.controller.admin.login.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import com.easycart.controller.BaseController;
import com.easycart.db.entity.User;

public class AdminInterceptor implements HandlerInterceptor{

	private final Logger logger = LogManager.getLogger(AdminInterceptor.class);
	
	@Override
	public void afterCompletion(HttpServletRequest request,
			HttpServletResponse response, Object object, Exception exception)
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
		User user = (User) session.getAttribute(BaseController.SESSION_USER);
		
		if(user!=null){
			logger.debug("login successed! "+user.getEmail() + request.getRemoteHost() + request.getRequestURI());
			ret = true;
		}else{
			response.sendRedirect(request.getContextPath()+"/admin/");
		}
		
		return ret;
	}


}
