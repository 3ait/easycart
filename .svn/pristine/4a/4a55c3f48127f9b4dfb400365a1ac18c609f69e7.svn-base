package com.easycart.db.dao;

import java.util.List;

import com.easycart.db.dao.support.ISupport;
import com.easycart.db.entity.Menu;

public interface IMenuDao extends ISupport<Menu>{

	public List<Menu> getSubMenuByFatherId(int fatherId);
	
	/**
	 * 获取一级菜单分类
	 * @return
	 */
	public List<Menu> getLevel1Menu();
	
	/**
	 * 获取所有分类
	 * @return
	 */
	public List<Menu> getAllMenu();
	
	/**
	 * desc (unit_price)
	 * @param ids
	 * @return
	 */
	public List<Menu> getMenuByIds(Integer[] ids);
	
}
