package com.easycart.controller.web.index;

import java.util.ArrayList;
import java.util.List;
import java.util.stream.Collectors;

import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.hibernate.annotations.common.util.StringHelper;
import org.hibernate.validator.constraints.Length;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.easycart.controller.BaseController;
import com.easycart.controller.admin.banner.logic.BannerLogic;
import com.easycart.controller.admin.product.SearchForm;
import com.easycart.controller.web.index.logic.IndexLogic;
import com.easycart.db.entity.Cart;
import com.easycart.db.entity.Customer;
import com.easycart.db.entity.Menu;
import com.easycart.db.entity.ProductBrand;
import com.easycart.utils.Page;

/**
 * admin login
 * @author yaoliang
 * 24-12-2015
 */
@Controller
public class IndexController extends BaseController{
	
	private static Logger logger = LogManager.getLogger(IndexController.class);
	
	//产品列表页产品数量 24个
	private int rowCount = 24;
	@Autowired
	IndexLogic indexLogic;
	@Autowired
	BannerLogic bannerLogic;
	/**
	 * 首页连接
	 * @return ModelAndView
	 */
	@RequestMapping(value={"/"})
	public ModelAndView index(HttpServletRequest request){
		logger.debug("index");
		ModelAndView modelAndView = new ModelAndView("web/index");
		
		Customer customer = (Customer)request.getSession().getAttribute(SESSION_CUSTOMER);
		//获取菜单
		List<MenuView> menuList = indexLogic.getMenus();
		modelAndView.addObject("menuViewList", menuList);
		
		
		//获取热销产品
		modelAndView.addObject("hotProductList", indexLogic.getHotProduct(new Page(20),customer));
		
		//获取促销产品
		modelAndView.addObject("promoteProductList", indexLogic.getPromoteProduct(new Page(8),customer));
		
		//获取首页产品列表
		modelAndView.addObject("menuProductList", indexLogic.getFrontPageProductByMenu(menuList,new Page(4),customer));
		
		//购物车产品数量
		List<Cart> cartProductList = this.getAllProductFromSession(-1,0, request);
		modelAndView.addObject("productInCartNum", super.getCartNum(cartProductList));
		modelAndView.addObject("productInCartPrice", super.getCartPrice(cartProductList,customer));
		
		modelAndView.addObject("customer", customer);
		
		modelAndView.addObject("bannerList", bannerLogic.listBanner());
		
		return modelAndView;
	}
	
	/**
	 * 首页产品列表tag切换
	 * @param model
	 * @return
	 */
	@RequestMapping(value="/ajax/product/list/{menuId}")
	public String ajaxProduct(Model model ,@PathVariable(value="menuId") int menuId,HttpServletRequest request){
		logger.debug("ajaxProduct");
		Customer customer = (Customer)request.getSession().getAttribute(SESSION_CUSTOMER);
		//获取首页产品列表
		Page page = new Page();
		page.setRows(4);
		model.addAttribute("productViewList", indexLogic.getProductByMenu2(menuId, page,customer));
		return "web/index_fragment :: product_view_list";
	}
	
	

	/**
	 * 查询
	 * @param q
	 * @param orderby
	 * @param order
	 * @param status 0 下线，1在线，2缺货
	 * @param pageNum
	 * @param request
	 * @return
	 */
	@RequestMapping(value={"/s"})
	public ModelAndView search(@RequestParam(value="q") @Valid @Length(min=1,max=30) String q, 
			@RequestParam(required=false,value="orderby",defaultValue="") String orderby,
			@RequestParam(required=false,value="order",defaultValue="") String order,
			@RequestParam(required=false,value="status",defaultValue="-1") byte status,
			@RequestParam(required=false,value="pageNum",defaultValue="1") int pageNum,
			HttpServletRequest request){
		logger.debug("search");
		ModelAndView modelAndView = new ModelAndView("web/list/search_list");
		
		//获取菜单
		List<MenuView> menuList = indexLogic.getMenus();
		modelAndView.addObject("menuViewList", menuList);
		
		//获取分类导航 一级分类 > 二级分类
		List<MenuView> navList = new ArrayList<>();
		MenuView menu1Nav = null;
		if(navList.size()>0){
			menu1Nav = navList.get(0);
		}else{
			menu1Nav = new MenuView();
		}
		modelAndView.addObject("menu1Nav", menu1Nav);
		
		
		//获取产品
		SearchForm searchForm = new SearchForm();
		searchForm.setStatus(status);
		searchForm.setQ(q);
		Page currentPage = new Page(pageNum,rowCount,indexLogic.getProductCount(searchForm, new Page()));
		currentPage.setPageNum(pageNum);
		if(StringHelper.isNotEmpty(orderby)){
			currentPage.setOrderby(orderby);
			currentPage.setOrder(order);
		}
		Customer customer = (Customer)request.getSession().getAttribute(SESSION_CUSTOMER);
		//获取产品列表
		currentPage.setRows(rowCount);
		modelAndView.addObject("productViewList", indexLogic.searchProduct(searchForm,currentPage,customer));
		
		//获取推荐商品
		modelAndView.addObject("recommendProductViewList",indexLogic.getRecomandProduct(new Page(6),customer));
		//购物车产品数量
		List<Cart> cartProductList = this.getAllProductFromSession(-1,0, request);
		modelAndView.addObject("productInCartNum", super.getCartNum(cartProductList));
		modelAndView.addObject("productInCartPrice", super.getCartPrice(cartProductList,customer));
		//品牌
		modelAndView.addObject("customer", customer);
		//获取页码
		modelAndView.addObject("page", currentPage);
		modelAndView.addObject("searchForm", searchForm);
		modelAndView.addObject("q", q);
		return modelAndView;
	}
	
	
	/**
	 * 列表页
	 */
	@RequestMapping(value={"/list/{menu1NameEn}"})
	public ModelAndView menu1ProductList(@PathVariable(value="menu1NameEn") String menu1NameEn,
			@RequestParam(required=false,value="submenu") String menu2NameEn,
			@RequestParam(required=false,value="brandId",defaultValue="0") int brandId,
			@RequestParam(required=false,value="orderby",defaultValue="") String orderby,
			@RequestParam(required=false,value="order",defaultValue="") String order,
			@RequestParam(required=false,value="status",defaultValue="-1") byte status,
			@RequestParam(value="pageNum",required=false,defaultValue="1") int pageNum,
			HttpServletRequest request){
		logger.debug("menu1ProductList");
		ModelAndView modelAndView = new ModelAndView("web/list/list");
		Customer customer = (Customer)request.getSession().getAttribute(SESSION_CUSTOMER);
		//获取菜单
		List<MenuView> menuList = indexLogic.getMenus();
		modelAndView.addObject("menuViewList", menuList);
		
		//获取分类导航 一级分类 > 二级分类
		List<MenuView> navList = menuList.stream().filter(menuView -> menuView.getMenu().getNameEn().equals(menu1NameEn)).collect(Collectors.toList());
		MenuView menu1Nav = null;
		int menu1Id = 0;
		int menu2Id = 0;
		if(navList.size()>0){
			menu1Nav = navList.get(0);
			menu1Id = menu1Nav.getMenu().getId();
		}else{
			menu1Nav = new MenuView();
		}
		modelAndView.addObject("menu1Nav", menu1Nav);
		
		if(StringHelper.isNotEmpty(menu2NameEn)){
			Menu menu2 = menu1Nav.getSubMenuList().stream().filter(menu -> menu.getNameEn().equals(menu2NameEn)).collect(Collectors.toList()).get(0);
			modelAndView.addObject("menu2Nav",menu2);
			menu2Id = menu2.getId();
		}
		//获取产品
		SearchForm searchForm = new SearchForm();
		searchForm.setBrandId(brandId);
		searchForm.setMenu1Id(menu1Id);
		searchForm.setMenu2Id(menu2Id);
		searchForm.setStatus(status);
		
		
		
		Page page = new Page(pageNum,rowCount,indexLogic.getProductCount(searchForm, new Page()));
		page.setPageNum(pageNum);
		
		//获取产品列表
		page.setRows(rowCount);
		if(StringHelper.isNotEmpty(orderby)){
			page.setOrderby(orderby);
			page.setOrder(order);
		}
		modelAndView.addObject("searchForm", searchForm);
		
		modelAndView.addObject("productViewList", indexLogic.getProduct(searchForm, page,customer));
		//获取页码
		modelAndView.addObject("page", page);
		//获取二级分类列表
		modelAndView.addObject("menu2List",menu1Nav.getSubMenuList());
		
		//获取品牌
		
		List<ProductBrand> productBrandList = new ArrayList<>();
		menu1Nav.getMenu().getProductBrands().forEach(pb -> productBrandList.add((ProductBrand) pb));
		productBrandList.sort((p1,p2) -> p1.getId().compareTo(p2.getId()));
		modelAndView.addObject("productBrandList",productBrandList);
		
		//获取推荐商品
		modelAndView.addObject("recommendProductViewList",indexLogic.getRecomandProduct(new Page(6),customer));
		
		//购物车产品数量
		List<Cart> cartProductList = this.getAllProductFromSession(-1,0, request);
		modelAndView.addObject("productInCartNum", super.getCartNum(cartProductList));
		modelAndView.addObject("productInCartPrice", super.getCartPrice(cartProductList,customer));
		modelAndView.addObject("customer", customer);
		
		return modelAndView;
	}

	/**
	 * 列表页 根据品牌获取数据
	 * @param model
	 * @param brandId
	 * @return
	 */
	@RequestMapping(value="/ajax/brand/{brandId}")
	public String getProductsByBrandId(Model model, @PathVariable(value="brandId") int brandId,HttpServletRequest request){
		logger.debug("getProductsByBrandId");
		Customer customer = (Customer)request.getSession().getAttribute(SESSION_CUSTOMER);
		//获取首页产品列表
		Page page = new Page();
		page.setRows(4);
		model.addAttribute("productViewList", indexLogic.getProductsByBrandId(brandId, page,customer));
		
		return "web/list/list_fragment :: product_list";
		
	}
	
	/**
	 * 产品明细
	 */
	@RequestMapping(value="/product/{productId}")
	public ModelAndView product(@PathVariable(value="productId") int productId,HttpServletRequest request){
		logger.debug("product");
		ModelAndView modelAndView = new ModelAndView("web/detail/product");
		Customer customer = (Customer)request.getSession().getAttribute(SESSION_CUSTOMER);
		//获取菜单
		List<MenuView> menuList = indexLogic.getMenus();
		modelAndView.addObject("menuViewList", menuList);
		
		//获取单个产品明细
		ProductView pv = indexLogic.getProductById(productId,customer);
		
		//获取分类导航 一级分类 > 
		MenuView menu1Nav = menuList.stream().filter(menuView -> menuView.getMenu().getId().equals(pv.getProduct().getMenu().getFatherId())).collect(Collectors.toList()).get(0);
		modelAndView.addObject("menu1Nav", menu1Nav);
		//二级分类
		modelAndView.addObject("menu2Nav",pv.getProduct().getMenu());
		
		modelAndView.addObject("productView",pv);
		
		//获取推荐商品
		modelAndView.addObject("recommendProductViewList",indexLogic.getRecomandProduct(new Page(6),customer));
		
		//购物车产品数量
		List<Cart> cartProductList = this.getAllProductFromSession(-1,0, request);
		modelAndView.addObject("productInCartNum", super.getCartNum(cartProductList));
		modelAndView.addObject("productInCartPrice", super.getCartPrice(cartProductList,customer));
		
		modelAndView.addObject("customer", customer);
		return modelAndView;
	}
}
