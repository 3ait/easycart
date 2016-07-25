package com.easycart.controller.admin.category;

import javax.validation.Valid;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.easycart.controller.BaseController;
import com.easycart.controller.admin.category.logic.CategoryLogic;
import com.easycart.db.entity.Menu;

/**
 * web index
 * @author yaoliang
 * 24-12-2015
 */
@Controller
@RequestMapping(value={"/admin/category"})
public class CategoryController extends BaseController{
	private static Logger logger = LogManager.getLogger(CategoryController.class);
	
	@Autowired
	CategoryLogic categoryLogic;
	private static int light = 4;
	/**
	 * 菜单首页
	 * @return
	 */
	@RequestMapping(value={"/"})
	public ModelAndView category(){
		logger.debug("index");
		ModelAndView modelAndView = new ModelAndView("admin/menu/admin_menu_class1");
		//设置菜单高亮,根据位置排序
		modelAndView.addObject(ADMIN_CATEGORY_LIGHT, light);
		
		//获取一级菜单
		modelAndView.addObject("categoryView",categoryLogic.getLevel1Menu());
		modelAndView.addObject("menuForm",new MenuForm());
		return modelAndView;
	}
	
	/**
	 * 一级菜单添加
	 * @return
	 */
	@RequestMapping(value={"/level1/add"})
	public ModelAndView levelAdd(@ModelAttribute("menuForm") @Valid MenuForm menuForm,BindingResult bindingResult){
		
		logger.debug("levelAdd");
		ModelAndView mov = new ModelAndView("redirect:/admin/category/");
		//数据验证
		if(bindingResult.hasFieldErrors()){
			return mov;
		}
		//获取一级菜单
		categoryLogic.save(menuForm);
		
		return mov;
	}
	
	/**
	 * 一级菜单编辑保存
	 * @return
	 */
	@RequestMapping(value={"/level1/edit/save"})
	public ModelAndView levelEditSave(@ModelAttribute @Valid CategoryView categoryView,BindingResult bindingResult){
		logger.debug("index");
		ModelAndView mov = new ModelAndView("redirect:/admin/category/");
		//数据验证
		if(bindingResult.hasFieldErrors()){
			return mov;
		}
		
		categoryLogic.saveCategoryView(categoryView);
		return mov;
	}
	
	/**
	 * 一级菜单删除
	 * @return
	 */
	@RequestMapping(value={"/level1/delete/{menuId}"})
	public ModelAndView level1Delete(@PathVariable(value="menuId") int menuId){
		logger.debug("index");
		ModelAndView mov = new ModelAndView("redirect:/admin/category/");
		//数据验证
		
		categoryLogic.deleteCategoryById(menuId);
		return mov;
	}
	
	

	/**
	 * 二级菜单连接
	 * @return
	 */
	@RequestMapping(value={"/level2/"})
	public ModelAndView categoryLevel2(){
		logger.debug("categoryLevel2");
		ModelAndView modelAndView = new ModelAndView("admin/menu/admin_menu_class2");
		//设置菜单高亮,根据位置排序
		modelAndView.addObject(ADMIN_CATEGORY_LIGHT,light);
		
		//获取一级菜单
		modelAndView.addObject("categoryView",categoryLogic.getLevel1Menu());
		
		return modelAndView;
	}
	
	/**
	 * 根据一级菜单获取二级菜单
	 * @return
	 */
	@RequestMapping(value={"/level2/ajax/{menu1Id}"})
	public String ajaxLevl2(Model model,@PathVariable(value="menu1Id") int menu1Id){
		logger.debug("categoryLevel2");
		
		//获取一级菜单
		model.addAttribute("categoryView",categoryLogic.getlevel2MenuByFatherId(menu1Id));
		
		model.addAttribute("menuForm",new MenuForm());
		model.addAttribute("fatherId",menu1Id);
		
		return "admin/menu/admin_menu_class2_fragment :: leve2_list";
	}
	
	/**
	 * 二级菜单编辑保存
	 * @return
	 */
	@RequestMapping(value={"/level2/ajax/edit/save"})
	public String level2Save(Model model,@ModelAttribute @Valid CategoryView categoryView,BindingResult bindingResult){
		logger.debug("level2Save");
		categoryLogic.saveCategoryView(categoryView);
		
		model.addAttribute("fatherId",categoryView.getMenuList().get(0).getFatherId());
		//获取二级菜单
		model.addAttribute("categoryView",categoryLogic.getlevel2MenuByFatherId(categoryView.getMenuList().get(0).getFatherId()));
		//空白添加对象
		model.addAttribute("menuForm",new MenuForm());
		
		return "admin/menu/admin_menu_class2_fragment :: leve2_list";
	}
	
	/**
	 * 二级菜单添加
	 * @return
	 */
	@RequestMapping(value={"/level2/ajax/add"})
	public String leve2Add(Model model,@ModelAttribute("menuForm") @Valid MenuForm menuForm,BindingResult bindingResult){
		
		logger.debug("leve2Add");
		//数据验证
		if(bindingResult.hasFieldErrors()){
			return "admin/menu/admin_menu_class2_fragment :: leve2_list";
		}
		Menu subMenu = categoryLogic.save(menuForm);
		
		//获取二级菜单
		model.addAttribute("categoryView",categoryLogic.getlevel2MenuByFatherId(subMenu.getFatherId()));
		
		//空白添加对象
		model.addAttribute("fatherId",menuForm.getFatherId());
		model.addAttribute("menuForm",new MenuForm());
		return "admin/menu/admin_menu_class2_fragment :: leve2_list";
	 
		
	}
	
	/**
	 * 二级菜单删除
	 * @return
	 */
	@RequestMapping(value={"/level2/delete/{menuId}"})
	public String level2Delete(Model model,@PathVariable(value="menuId") int menuId,@RequestParam("fid") int fid){
		logger.debug("level2Delete");
		
		categoryLogic.deleteCategoryById(menuId);
		
		model.addAttribute("fatherId",fid);
		//获取二级菜单
		model.addAttribute("categoryView",categoryLogic.getlevel2MenuByFatherId(fid));
		//空白添加对象
		model.addAttribute("menuForm",new MenuForm());
		
		return "admin/menu/admin_menu_class2_fragment :: leve2_list";
	}

	/**
	 * 品牌跳转页
	 * @return ModelAndView
	 */
	@RequestMapping(value={"/brand/"})
	public ModelAndView brand(){
		logger.debug("brand");
		ModelAndView modelAndView = new ModelAndView("admin/menu/admin_menu_brand");
		//设置菜单高亮,根据位置排序
		modelAndView.addObject(ADMIN_CATEGORY_LIGHT, light);
		
		//获取一级菜单
		modelAndView.addObject("categoryView",categoryLogic.getLevel1Menu());
		
		modelAndView.addObject("brandForm",new BrandForm());
		return modelAndView;
	}
	
	/**
	 * 根据1级菜单选择品牌
	 * @return ModelAndView
	 */
	@RequestMapping(value={"/brand/ajax/{menuId}"})
	public String getBrandsByMenuId(Model model,@PathVariable("menuId") int menuId){
		logger.debug("brand");
		//获取一级菜单
		model.addAttribute("categoryView",categoryLogic.getBrandByMenu1Id(menuId));
		
		model.addAttribute("brandForm",new BrandForm());
		model.addAttribute("menuId",menuId);
		
		return "admin/menu/admin_menu_brand :: brand_list";
	}
	
	/**
	 * 删除品牌
	 * @return
	 */
	@RequestMapping(value={"/brand/delete/{brandId}"})
	public String brandDel(Model model,@PathVariable("brandId") int brandId,@RequestParam(value="mid") int menuId){
		logger.debug("brandDel");
		
		String retHtml = "admin/menu/admin_menu_brand :: brand_list";
		
		categoryLogic.delBrand(brandId);
		//获取一级菜单
		model.addAttribute("categoryView",categoryLogic.getBrandByMenu1Id(menuId));
		model.addAttribute("brandForm",new BrandForm());
		model.addAttribute("menuId",menuId);
		
		return retHtml;
	}
	
	/**
	 * 添加品牌
	 * @return
	 */
	@RequestMapping(value={"/brand/ajax/add"})
	public String brandAdd(Model model, @ModelAttribute("brandForm") @Valid BrandForm brandForm,BindingResult bindingResult){
		logger.debug("brandAdd");
		
		String retHtml = "admin/menu/admin_menu_brand :: brand_list";
		if(bindingResult.hasFieldErrors()){
			model.addAttribute("categoryView",categoryLogic.getBrandByMenu1Id(brandForm.getMenu().getId()));
			model.addAttribute("brandForm",new BrandForm());
			return retHtml;
		}
		
		//获取一级菜单
		categoryLogic.addBrand(brandForm);
		model.addAttribute("categoryView",categoryLogic.getBrandByMenu1Id(brandForm.getMenu().getId()));
		model.addAttribute("brandForm",new BrandForm());
		model.addAttribute("menuId",brandForm.getMenu().getId());
		return retHtml;
	}
	
}
