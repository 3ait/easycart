package com.easycart.controller.about;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.easycart.controller.BaseController;
import com.easycart.controller.index.MenuView;
import com.easycart.controller.index.logic.IndexLogic;

@Controller
@RequestMapping(value = "/about") //
public class AboutController extends BaseController {

	private static Logger logger = LogManager.getLogger(AboutController.class);

	@Autowired
	IndexLogic indexLogic;

	/**
	 * 公司信息
	 * 
	 * @return
	 */

	@RequestMapping("/us")
	public ModelAndView about(HttpServletRequest request) {

		logger.debug("aboutAftersell");
		ModelAndView modelAndView = new ModelAndView("web/about/about_us");
		// 购物车产品数量
		modelAndView.addObject("productInCartNum", super.getCartNum(this.getAllProductFromSession(-1, 0, request)));

		// 获取菜单
		List<MenuView> menuList = indexLogic.getMenus();
		return modelAndView.addObject("menuViewList", menuList);

	}

	@RequestMapping("/exceptions")
	public ModelAndView a1(HttpServletRequest request) {
		logger.debug("aboutReturn");

		ModelAndView modelAndView = new ModelAndView("web/about/about_exceptions");

		// 购物车产品数量
		modelAndView.addObject("productInCartNum", super.getCartNum(this.getAllProductFromSession(-1, 0, request)));

		// 获取菜单
		List<MenuView> menuList = indexLogic.getMenus();
		return modelAndView.addObject("menuViewList", menuList);
	}

	@RequestMapping("/freight")
	public ModelAndView a2(HttpServletRequest request) {
		logger.debug("aboutRefund");
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("web/about/about_freight");

		// 购物车产品数量
		modelAndView.addObject("productInCartNum", super.getCartNum(this.getAllProductFromSession(-1, 0, request)));

		// 获取菜单
		List<MenuView> menuList = indexLogic.getMenus();
		modelAndView.addObject("menuViewList", menuList);
		return modelAndView;
	}

	@RequestMapping("/policy")
	public ModelAndView a3(HttpServletRequest request) {
		logger.debug("aboutUs");
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("web/about/about_policy");

		// 购物车产品数量
		modelAndView.addObject("productInCartNum", super.getCartNum(this.getAllProductFromSession(-1, 0, request)));

		// 获取菜单
		List<MenuView> menuList = indexLogic.getMenus();
		modelAndView.addObject("menuViewList", menuList);
		return modelAndView;
	}

	@RequestMapping("/state")
	public ModelAndView a4(HttpServletRequest request) {
		logger.debug("aboutRelief");
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("web/about/about_state");

		// 购物车产品数量
		modelAndView.addObject("productInCartNum", super.getCartNum(this.getAllProductFromSession(-1, 0, request)));

		// 获取菜单
		List<MenuView> menuList = indexLogic.getMenus();
		modelAndView.addObject("menuViewList", menuList);
		return modelAndView;
	}

	@RequestMapping("/product_returns")
	public ModelAndView a5(HttpServletRequest request) {
		logger.debug("aboutShopping");
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("web/about/product_returns");

		// 购物车产品数量
		modelAndView.addObject("productInCartNum", super.getCartNum(this.getAllProductFromSession(-1, 0, request)));

		// 获取菜单
		List<MenuView> menuList = indexLogic.getMenus();
		modelAndView.addObject("menuViewList", menuList);
		return modelAndView;
	}

}
