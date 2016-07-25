package com.easycart.db.dao;

import java.util.List;

import com.easycart.controller.admin.product.SearchForm;
import com.easycart.db.dao.support.ISupport;
import com.easycart.db.entity.Product;
import com.easycart.utils.Page;

public interface IProductDao extends ISupport<Product>{

	/**
	 * 根据二级菜单ID获取产品
	 * @param menuId
	 * @param page
	 * @return
	 */
	public List<Product> getProductByMenu2Id(int menuId,Page page);
	
	/**
	 * 根据一级ID获取产品
	 * @param menuId
	 * @param page
	 * @return
	 */
	public List<Product> getProductByMenu1Id(int menuId,Page page);
	
	/**
	 * 根据品牌获取产品
	 * @param brandId
	 * @param page
	 * @return
	 */
	public List<Product> getProductsByBrandId(int brandId,Page page);
	
	
	/**
	 * 给用户浏览应用 不包含下线产品
	 * 获取产品
	 * @param menu1Id
	 * @param menu2Id
	 * @param brandId
	 * @param page
	 * @return
	 */
	public List<Product> getProdcut(SearchForm searchForm,Page page);
	
	/**
	 * 给用户浏览应用 不包含下线产品
	 * 获取产品总数
	 * @param searchForm
	 * @param page
	 * @return
	 */
	public int getProdcutCount(SearchForm searchForm, Page page);
	
	/**
	 * 查找产品
	 * @param page
	 * @return
	 */
	public List<Product> search(SearchForm searchForm, Page page);
	
	
	/**
	 * 查询结果总数
	 * @param searchForm
	 * @param page
	 * @return
	 */
	public int searchCount(SearchForm searchForm, Page page);

	
	/**
	 * 获取热销产品
	 * @return
	 */
	public List<Product> getHotProduct(Page page);
	
	/**
	 * 获取促销产品
	 * @return
	 */
	public List<Product> getPromoteProduct(Page page);
	
	/**
	 * 根据产品ID获取产品
	 * @param ids
	 * @return
	 */
	public List<Product> getProductByIds(Integer[] ids);

	
}
