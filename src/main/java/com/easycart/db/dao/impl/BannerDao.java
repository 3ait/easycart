package com.easycart.db.dao.impl;

import java.util.List;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.hibernate.criterion.DetachedCriteria;
import org.hibernate.criterion.Order;
import org.springframework.stereotype.Repository;

import com.easycart.db.dao.IBannerDao;
import com.easycart.db.dao.support.HibernateTemplateDaoSupport;
import com.easycart.db.entity.Banner;

@Repository("bannerDao")
public class BannerDao extends HibernateTemplateDaoSupport<Banner> implements IBannerDao{

	private static Logger logger = LogManager.getLogger(UserDao.class);

	@Override
	public List<Banner> list(Banner banner) {
		List<Banner> list = null;
		try {
			
			DetachedCriteria criteria = DetachedCriteria.forClass(Banner.class);
			
			criteria.addOrder(Order.desc("id"));
			criteria.addOrder(Order.asc("type"));
			list = (List<Banner>) hibernateTemplate.findByCriteria(criteria);
			
		} catch (Exception e) {
			logger.error(e.getMessage());
		}

		return list;
	}
	
	
}
