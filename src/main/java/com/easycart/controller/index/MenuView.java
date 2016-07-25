package com.easycart.controller.index;

import java.util.List;

import com.easycart.db.entity.Menu;

/**
 * 
 * @author yaoliang
 *
 */
public class MenuView{
	private Menu menu;
	private List<Menu> subMenuList;
	
	
	public Menu getMenu() {
		return menu;
	}
	public void setMenu(Menu menu) {
		this.menu = menu;
	}
	public List<Menu> getSubMenuList() {
		return subMenuList;
	}
	public void setSubMenuList(List<Menu> subMenuList) {
		this.subMenuList = subMenuList;
	}
	
}
