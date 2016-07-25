package com.easycart.controller.admin.banner;

import javax.servlet.http.HttpServletRequest;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.view.RedirectView;

import com.easycart.controller.BaseController;
import com.easycart.controller.admin.banner.logic.BannerLogic;
import com.easycart.controller.cart.CartController;
import com.easycart.db.entity.Banner;

/**
 * 
 * 广告切换管理
 * @author yaoliang
 *
 */
@RequestMapping(value="/admin/banner")
@Controller
public class BannerController extends BaseController{

	private static Logger logger = LogManager.getLogger(CartController.class);
	private static int light = 5;
	
	@Autowired
	BannerLogic bannerLogic;
	
	/**
	 * banner列表
	 * @return ModelAndView
	 */
	@RequestMapping(value="/")
	public ModelAndView index(){
		logger.debug("index");
		ModelAndView modelAndView = new ModelAndView("admin/banner/banner");
		//设置菜单高亮,根据位置排序
		modelAndView.addObject(ADMIN_CATEGORY_LIGHT, light);
		
		modelAndView.addObject("bannerList",bannerLogic.listBanner());

		return modelAndView;
	}
	
	/**
	 * banner save
	 * @return ModelAndView
	 * 
	 */
	@RequestMapping(value="/save",method=RequestMethod.POST)
	public ModelAndView bannerSave(MultipartFile multipartFile,String url,HttpServletRequest request){
		logger.debug("bannerSave");
		
		bannerLogic.saveBanner(multipartFile,url,1,request);
		return new ModelAndView(new RedirectView(request.getServletContext().getContextPath()+"/admin/banner/"));
	}
	
	/**
	 * deleteBanner
	 * @return ModelAndView
	 */
	@ResponseBody
	@RequestMapping(value="/delete/{bannerId}")
	public String deleteBanner(@PathVariable("bannerId") int bannerId,HttpServletRequest request){
		logger.debug("deleteBanner");
		String ret = "success";
		bannerLogic.deleteBannerById(bannerId);
		return ret;
	}
	
	/**
	 * update
	 * @return ModelAndView
	 */
	@ResponseBody
	@RequestMapping(value="/update/{bannerId}")
	public String updateBanner(@PathVariable("bannerId") int bannerId,@RequestParam("url") String url,HttpServletRequest request){
		logger.debug("deleteBanner");
		String ret = "success";
		
		Banner banner = new Banner();
		banner.setId(bannerId);
		banner.setUrl(url);
		bannerLogic.updateBanner(banner);
		
		return ret;
	}
	
	
}
