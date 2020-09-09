package com.easycart.controller.admin.product;

import javax.servlet.http.HttpServletRequest;
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
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.easycart.controller.BaseController;
import com.easycart.controller.admin.product.logic.ProductLogic;
import com.easycart.db.entity.Product;
import com.easycart.utils.Page;

/**
 * web index
 * @author yaoliang
 * 24-12-2015
 */
@Controller
@RequestMapping(value={"/administratro/product"})
public class ProductController extends BaseController{
	private static Logger logger = LogManager.getLogger(ProductController.class);
	private static int light = 2;
	@Autowired
	ProductLogic productLogic;

	
	/**
	 * 产品首页列表
	 * @return
	 */
	@RequestMapping("/")
	public ModelAndView index(@ModelAttribute(value="searchForm") @Valid SearchForm searchForm,BindingResult br,
			@RequestParam(value="pageNum",required=false,defaultValue="1") int pageNum){
		logger.debug("index");
		
		ModelAndView mv = new ModelAndView("admin/product/admin_product");
		mv.addObject(ADMIN_CATEGORY_LIGHT, light);
		
		mv.addObject("searchForm", searchForm);
		//获取一级菜单分类
		mv.addObject("menu1List" ,productLogic.getMenu1());
		mv.addObject("menu2List",productLogic.getMenu2ByFatherId(searchForm.getMenu1Id()));
		mv.addObject("menu2Id",searchForm.getMenu2Id());
		
		if(br.hasFieldErrors()){
			return mv;
		}
		
		Page page = new Page(pageNum,productLogic.getProductViewListCount(searchForm, new Page()));
		page.setPageNum(pageNum);
		
		mv.addObject("page", page);
		mv.addObject("productViewList", productLogic.getProductViewList(searchForm,page));
		
		return mv;
	}
	
	
	/**
	 * 产品列表---编辑保存
	 * @return
	 */
	@RequestMapping("/list/edit/confirm")
	@ResponseBody
	public String listEditConfirm(
			@RequestParam(value="id",required=true,defaultValue="-1") int productId,
			@RequestParam(value="cost",required=false,defaultValue="0") Double cost,
			@RequestParam(value="price1",required=false,defaultValue="0") Double price1,
			@RequestParam(value="stock",required=false,defaultValue="0") int stock,
			@RequestParam(value="status",required=false,defaultValue="0") byte status,
			@RequestParam(value="soldNum",required=false,defaultValue="0") int soldNum,
			@RequestParam(value="hot",required=false,defaultValue="0") byte hot,
			@RequestParam(value="promote",required=false,defaultValue="0") byte promote,
			@RequestParam(value="frontPage",required=false,defaultValue="0") byte frontPage,
			@RequestParam(value="recommend",required=false,defaultValue="0") byte recommend,
			@RequestParam(value="memo",required=false,defaultValue="") String memo
			){
		String ret = "success";
		if(productId!=-1){
			Product product = new Product();
			product.setId(productId);
			product.setCost(cost);
			product.setPrice1(price1);
			product.setStock(stock);
			product.setStatus(status);
			product.setSoldNum(soldNum);
			product.setHot(hot);
			product.setPromote(promote);
			product.setFrontPage(frontPage);
			product.setRecommend(recommend);
			product.setMemo(memo);
			productLogic.listEditSave(product);
		}else{
			ret = "fail";
		}
		return ret;
	}
	
	
	
	/**
	 * 新增产品首页
	 * @return
	 */
	@RequestMapping("/add/")
	public ModelAndView newProduct(){
		ModelAndView mv = new ModelAndView("admin/product/admin_product_new");
		mv.addObject(ADMIN_CATEGORY_LIGHT, light);
		
		
		//获取一级菜单分类
		mv.addObject("menu1List" ,productLogic.getMenu1());
		ProductForm pf = new ProductForm();
		mv.addObject("productForm" ,pf);
		
		return mv;
	}
	
	/**
	 * 新增产品--选择一级菜单
	 * @return
	 */
	@RequestMapping("/add/ajax/menu1/{menu1Id}")
	public String men1Select(Model model,@PathVariable(value="menu1Id") int menu1Id){
		
		
		//获取二级菜单分类
		model.addAttribute("menu2List" ,productLogic.getMenu2ByFatherId(menu1Id));
		model.addAttribute("brandList" ,productLogic.getBrandByMenuId(menu1Id));
		model.addAttribute("menu2Id" ,0);
		model.addAttribute("brandId" ,0);
		
		return "admin/product/admin_product_new :: menu2_brand";
	}
	
	/**
	 * 新增产品--保存
	 * @return
	 */
	@RequestMapping(value="/add/save")
	public ModelAndView saveProduct(@ModelAttribute("productForm") @Valid ProductForm productForm,BindingResult bindingResult,HttpServletRequest request){
		logger.debug("saveProduct");
		ModelAndView mv = new ModelAndView("admin/product/admin_product_new");
		
		mv.addObject("productForm",productForm);
		mv.addObject("menu1List" ,productLogic.getMenu1());
		mv.addObject("menu2List" ,productLogic.getMenu2ByFatherId(productForm.getMenu1Id()));
		mv.addObject("brandList" ,productLogic.getBrandByMenuId(productForm.getMenu1Id()));
		
		mv.addObject("menu1Id" ,productForm.getMenu1Id());
		mv.addObject("menu2Id" ,productForm.getMenu2Id());
		mv.addObject("brandId" ,productForm.getBrandId());
		
		if(bindingResult.hasFieldErrors()){
			return mv;
		}
		try {
			productLogic.saveProduct(productForm,request);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return mv;
	}
  
	/**
	 * 编辑跳转
	 * @return
	 */
	@RequestMapping("/edit/{productId}")
	public ModelAndView edit(@PathVariable("productId") int productId){
		ModelAndView mv = new ModelAndView("admin/product/admin_product_edit");
		mv.addObject(ADMIN_CATEGORY_LIGHT, light);
		
		
		//获取返回表单
		ProductForm pf = productLogic.getByProductId(productId);
		mv.addObject("productForm" ,pf);
		
		//获取一级菜单分类
		mv.addObject("menu1List" ,productLogic.getMenu1());
		//获取二级菜单分类
		mv.addObject("menu2List" ,productLogic.getMenu2ByFatherId(pf.getMenu1Id()));
		//获取品牌
		mv.addObject("brandList" ,productLogic.getBrandByMenuId(pf.getMenu1Id()));
		return mv;
	}
	
	/**
	 * 编辑页面删除跳转
	 * @return
	 */
	@RequestMapping(value="/edit/ajax/delimg/{imgId}")
	@ResponseBody
	public String editDelimg(@PathVariable(value="imgId") int imgId,HttpServletRequest request){
		String ret = "fail";
		
		boolean delFlag = productLogic.delImgById(imgId,request);
		if(delFlag){
			ret = "success";
		}
		
		return ret;
	}
	
	/**
	 * 查询条件选择一级菜单
	 * @return
	 */
	@RequestMapping("/ajax/menu1/{menu1Id}")
	public ModelAndView formMenu1Select(@PathVariable(value="menu1Id") int menu1Id){
		logger.debug("formMenu1Select");
		ModelAndView model = new ModelAndView("admin/product/admin_product :: menu2_brand");
		model.addObject("menu2List",productLogic.getMenu2ByFatherId(menu1Id));
		model.addObject("menu2", -1);
		return model;
	}
	
	
	/**
	 * 编辑页面--保存
	 * @return
	 */
	@RequestMapping(value="/edit/save")
	public ModelAndView editSave(@ModelAttribute("productForm") @Valid ProductForm productForm,BindingResult bindingResult,HttpServletRequest request){
		logger.debug("saveProduct");
		ModelAndView mv = new ModelAndView("admin/product/admin_product_edit");
		
		
		if(bindingResult.hasFieldErrors()){
			return mv;
		}
		try {
			productLogic.updateProduct(productForm,request);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return new ModelAndView("redirect:/administratro/product/edit/"+ productForm.getProductId());
	}
}
