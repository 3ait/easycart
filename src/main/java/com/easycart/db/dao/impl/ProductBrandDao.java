package com.easycart.db.dao.impl;

import java.util.List;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.hibernate.criterion.DetachedCriteria;
import org.hibernate.criterion.Restrictions;
import org.springframework.stereotype.Repository;

import com.easycart.db.dao.IProductBrandDao;
import com.easycart.db.dao.support.HibernateTemplateDaoSupport;
import com.easycart.db.entity.ProductBrand;

@Repository("productBrandDao")
public class ProductBrandDao extends HibernateTemplateDaoSupport<ProductBrand> implements IProductBrandDao{

	private static Logger logger = LogManager.getLogger(ProductBrandDao.class);

	@Override
	public List<ProductBrand> getByMenu1Id(int menuId) {
		List<ProductBrand> list = null;
		try {
			DetachedCriteria criteria = DetachedCriteria.forClass(ProductBrand.class);
			criteria.add(Restrictions.eq("menu.id", menuId));
			
			list = (List<ProductBrand>) hibernateTemplate.findByCriteria(criteria);
			
		} catch (Exception e) {
			logger.error(e.getMessage());
		}

		return list;
	}
	
}
