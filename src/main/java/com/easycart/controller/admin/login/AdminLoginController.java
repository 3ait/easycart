package com.easycart.controller.admin.login;

import java.io.IOException;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.View;
import org.springframework.web.servlet.view.RedirectView;

import com.easycart.controller.BaseController;
import com.easycart.controller.admin.login.interceptor.RemoteInfo;
import com.easycart.controller.admin.login.logic.AdminLoginLogic;
import com.easycart.db.entity.User;
import com.easycart.utils.DateHelper;
import com.easycart.utils.Md5;

/**
 * web index
 * @author yaoliang
 * 24-12-2015
 */
@Controller
@RequestMapping(value={"/administratro"})
public class AdminLoginController extends BaseController{
	private static Logger logger = LogManager.getLogger(AdminLoginController.class);
	
	@Resource(name="adminLoginLogic") 
	private AdminLoginLogic adminLoginLogic;
	
	public void setAdminLoginLogic(AdminLoginLogic adminLoginLogic) {
		this.adminLoginLogic = adminLoginLogic;
	}

	@RequestMapping(value={"/"})
	public ModelAndView index(){
		
		ModelAndView modelAndView = new ModelAndView("admin/admin_login");
		modelAndView.addObject("loginForm",new LoginForm());
		return modelAndView;
	}
	
	
	@RequestMapping(value={"login"},method=RequestMethod.POST)
	public ModelAndView login(@Valid @ModelAttribute(value="loginForm")  LoginForm loginForm,BindingResult bindingResult,HttpServletRequest request){
		logger.debug("login");
		ModelAndView modelAndView = null;
		if(bindingResult.hasErrors()){
			modelAndView = new ModelAndView("admin/admin_login");
			modelAndView.addObject("msg", "输入错误");
			return modelAndView;
		}
		
		HttpSession session = request.getSession();
		
		if(session.getAttribute(request.getRemoteAddr())!=null){
			RemoteInfo remoteInfo = (RemoteInfo) session.getAttribute(request.getRemoteAddr());
			remoteInfo.setTryTimes(remoteInfo.getTryTimes()+1);
			if(remoteInfo.getTryTimes()>3 && DateHelper.getTime()<remoteInfo.getExpireTime()){
				modelAndView = new ModelAndView("admin/admin_login");
				modelAndView.addObject("msg", "密码错误次数过多，15分钟后尝试。");
				return modelAndView;
			}
			if(DateHelper.getTime()>remoteInfo.getExpireTime())
				session.setAttribute(request.getRemoteAddr(), new RemoteInfo());
		}else{
			RemoteInfo ri = new RemoteInfo();
			ri.setHost(request.getRemoteAddr());
			session.setAttribute(request.getRemoteAddr(), ri);
		}
		
		User user = adminLoginLogic.adminLogin(loginForm.getEmail(), Md5.getMd5String(loginForm.getPassword()));
		if(user==null){
			modelAndView = new ModelAndView("admin/admin_login");
			modelAndView.addObject("msg", "用户或密码错误");
			return modelAndView;
		}else{
			View view = new RedirectView("/administratro/statistics/",true);
			modelAndView = new ModelAndView(view);
			request.getSession().setAttribute(BaseController.SESSION_USER, user);
		}
		
		return modelAndView;
	}
	
	@RequestMapping(value={"logout"})
	public void logout(HttpServletRequest request,HttpServletResponse response) throws IOException{
		logger.debug("logout" );
		request.getSession().removeAttribute(BaseController.SESSION_USER);
		request.getSession().removeAttribute(request.getRemoteHost());
		response.sendRedirect(request.getContextPath()+"/administratro/");
	}


}
