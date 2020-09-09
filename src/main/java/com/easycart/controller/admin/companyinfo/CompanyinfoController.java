package com.easycart.controller.admin.companyinfo;

import javax.servlet.http.HttpServletRequest;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.easycart.controller.BaseController;
import com.easycart.controller.admin.companyinfo.logic.CompanyInfoLogic;
import com.easycart.db.entity.User;

/**
 * companyinfo
 * @author yaoliang
 * 24-12-2015
 */
@Controller
@RequestMapping(value={"/administratro/companyinfo"})
public class CompanyinfoController extends BaseController{
	private static Logger logger = LogManager.getLogger(CompanyinfoController.class);
	private static int light = 6;
	@Autowired
	CompanyInfoLogic companyInfoLogic;

	
	/**
	 * 公司信息
	 * @return ModelAndView
	 */
	@RequestMapping("/")
	public ModelAndView index(){
		logger.debug("index");
		
		ModelAndView mv = new ModelAndView("admin/companyinfo/admin_companyinfo");
		mv.addObject(ADMIN_CATEGORY_LIGHT, light);
		
		mv.addObject("companyInfoView", companyInfoLogic.getCompanyInfo());
	
		return mv;
	}
	
	
	/**
	 * 公司信息---编辑保存
	 * @return
	 */
	@RequestMapping("/company/save")
	public ModelAndView companySave(@ModelAttribute(value="companyInfoView") CompanyInfoView companyInfoView,BindingResult br){
		logger.debug("companySave");
		ModelAndView mv = new ModelAndView("redirect:/administratro/companyinfo/");
		
		if(br.hasFieldErrors()){
			return mv;
		}
		companyInfoLogic.updateCompanyInfo(companyInfoView);
		
		return mv;
	}
	
	/**
	 * 管理员页面跳转
	 * @param UserForm
	 * @param BindingResult
	 * @return
	 */
	@RequestMapping("/user/")
	public ModelAndView user(HttpServletRequest request){
		logger.debug("user");
		User  user = (User)request.getSession().getAttribute(SESSION_USER);
		ModelAndView mv = new ModelAndView("admin/companyinfo/admin_user");
		mv.addObject(ADMIN_CATEGORY_LIGHT, light);
		mv.addObject("userList", companyInfoLogic.getUserList(user));
		mv.addObject("userSession",user);
		
		
		return mv;
	}
	/**
	 * 编辑保存用户
	 * @param UserForm
	 * @param BindingResult
	 * @return
	 */
	@RequestMapping("/user/edit/save")
	@ResponseBody
	public String editSave(@RequestParam(value="userId") int userId, @RequestParam(value="password") String password,@RequestParam(value="status") byte status){
		logger.debug("editSave");
		String ret = "false";
		
		User user = new User();
		user.setId(userId);
		user.setPassword(password);
		user.setStatus(status);
		companyInfoLogic.updateUser(user);
		
		
		return ret;
	}
	
	/**
	 * 新增用户
	 * @param userForm
	 * @param BindingResult
	 * @return
	 */
	@RequestMapping("/user/add")
	public ModelAndView userSave(@ModelAttribute(value="userForm") UserForm userForm,BindingResult br,HttpServletRequest request){
		logger.debug("userSave");
		ModelAndView mv = new ModelAndView("redirect:/administratro/companyinfo/user/");
		
		if(br.hasFieldErrors()){
			return mv;
		}
		mv.addObject(ADMIN_CATEGORY_LIGHT, light);
		companyInfoLogic.saveUser(userForm,(User)request.getSession().getAttribute(SESSION_USER));
		
		return mv;
	}
	
	/**
	 * 删除用户
	 * @param UserForm
	 * @param BindingResult
	 * @return
	 */
	@RequestMapping("/user/delete")
	@ResponseBody
	public String delete(@RequestParam(value="userId") int userId){
		logger.debug("delete");
		String ret = "false";
		
		companyInfoLogic.deleteUser(userId);
		
		
		return ret;
	}
	
}
