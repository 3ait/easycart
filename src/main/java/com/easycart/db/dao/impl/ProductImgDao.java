package com.easycart.db.dao.impl;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.stereotype.Repository;

import com.easycart.db.dao.IProductImgDao;
import com.easycart.db.dao.support.HibernateTemplateDaoSupport;
import com.easycart.db.entity.ProductImg;

@Repository("productImgDao")
public class ProductImgDao extends HibernateTemplateDaoSupport<ProductImg> implements IProductImgDao{

	private static Logger logger = LogManager.getLogger(ProductImgDao.class);

	
}
