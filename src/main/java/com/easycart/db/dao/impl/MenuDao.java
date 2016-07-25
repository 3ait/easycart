package com.easycart.db.dao.impl;

import java.util.List;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.hibernate.criterion.DetachedCriteria;
import org.hibernate.criterion.Order;
import org.hibernate.criterion.Restrictions;
import org.springframework.stereotype.Repository;

import com.easycart.db.dao.IMenuDao;
import com.easycart.db.dao.support.HibernateTemplateDaoSupport;
import com.easycart.db.entity.Menu;

@Repository("menuDao")
public class MenuDao extends HibernateTemplateDaoSupport<Menu> implements IMenuDao{

	private static Logger logger = LogManager.getLogger(MenuDao.class);
	
	@Override
	public List<Menu> getSubMenuByFatherId(int fatherId) {
		List<Menu> list = null;
		try {
			DetachedCriteria criteria = DetachedCriteria.forClass(Menu.class);
			
			criteria.add(Restrictions.eq("fatherId", fatherId));
			
			criteria.addOrder(Order.asc("position"));
			list = (List<Menu>) hibernateTemplate.findByCriteria(criteria);
			
		} catch (Exception e) {
			logger.error(e.getMessage());
			throw e;
		}

		return list;
	}
	
	@Override
	public List<Menu> getLevel1Menu() {
		List<Menu> list = null;
		try {
			DetachedCriteria criteria = DetachedCriteria.forClass(Menu.class);
			
			criteria.add(Restrictions.eq("level", 1));
			criteria.addOrder(Order.asc("position"));
			list = (List<Menu>) hibernateTemplate.findByCriteria(criteria);
			
		} catch (Exception e) {
			logger.error(e.getMessage());
			throw e;
		}

		return list;
	}

	@Override
	public List<Menu> getAllMenu() {
		List<Menu> list = null;
		try {
			DetachedCriteria criteria = DetachedCriteria.forClass(Menu.class);
			
			criteria.addOrder(Order.asc("level"));
			criteria.addOrder(Order.asc("position"));
			
			list = (List<Menu>) hibernateTemplate.findByCriteria(criteria);
			list.forEach(menu -> hibernateTemplate.initialize(menu.getProductBrands()));
		} catch (Exception e) {
			logger.error(e.getMessage());
			throw e;
		}

		return list;
	}

	@Override
	public List<Menu> getMenuByIds(Integer[] ids) {
		List<Menu> list = null;
		try {
			DetachedCriteria criteria = DetachedCriteria.forClass(Menu.class);
			
			criteria.add(Restrictions.in("id", ids));
			criteria.addOrder(Order.desc("unitePrice"));
			list = (List<Menu>) hibernateTemplate.findByCriteria(criteria);
			
		} catch (Exception e) {
			logger.error(e.getMessage());
			throw e;
		}

		return list;
	}
	
}
