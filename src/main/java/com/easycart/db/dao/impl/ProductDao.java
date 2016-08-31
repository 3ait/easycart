package com.easycart.db.dao.impl;

import java.util.List;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.hibernate.FetchMode;
import org.hibernate.annotations.common.util.StringHelper;
import org.hibernate.criterion.DetachedCriteria;
import org.hibernate.criterion.Disjunction;
import org.hibernate.criterion.MatchMode;
import org.hibernate.criterion.Order;
import org.hibernate.criterion.Projections;
import org.hibernate.criterion.Restrictions;
import org.springframework.stereotype.Repository;

import com.easycart.controller.admin.product.SearchForm;
import com.easycart.db.dao.IProductDao;
import com.easycart.db.dao.support.HibernateTemplateDaoSupport;
import com.easycart.db.entity.Product;
import com.easycart.utils.Page;

@Repository("productDao")
public class ProductDao extends HibernateTemplateDaoSupport<Product> implements IProductDao{

	private static Logger logger = LogManager.getLogger(ProductDao.class);

	
	
	@Override
	public Product getById(int id) {
		Product product = null;
		try {
			DetachedCriteria criteria = DetachedCriteria.forClass(Product.class);
			criteria.setFetchMode("menu", FetchMode.JOIN);
			criteria.setFetchMode("productBrand", FetchMode.JOIN);
			
			criteria.add(Restrictions.eq("id", id));
			List<Product> list = (List<Product>) hibernateTemplate.findByCriteria(criteria);
			if(list.size()==1){
				product = list.get(0);
				hibernateTemplate.initialize(product.getProductImgs());
			}
		} catch (Exception e) {
			logger.error(e.getMessage());
			throw e;
		}

		return product;
	}

	@Override
	public List<Product> getProductByMenu2Id(int menuId, Page page) {
		List<Product> list = null;
		try {
			DetachedCriteria criteria = DetachedCriteria.forClass(Product.class);
			criteria.add(Restrictions.eq("menu.id", menuId));
			
			if(page.getOrder().equalsIgnoreCase("asc")){
				criteria.addOrder(Order.asc(page.getOrderby()));
			}else{
				criteria.addOrder(Order.desc(page.getOrderby()));
			}
			list = (List<Product>) hibernateTemplate.findByCriteria(criteria,page.getSt(),page.getRows());
			list.forEach(p -> hibernateTemplate.initialize(p.getProductImgs()));
		} catch (Exception e) {
			logger.error(e.getMessage());
			throw e;
		}

		return list;
	}
	
	@Override
	public List<Product> getProductByMenu1Id(int menuId, Page page) {
		List<Product> list = null;
		try {
			DetachedCriteria criteria = DetachedCriteria.forClass(Product.class);
			criteria.createAlias("menu", "menu");
			criteria.add(Restrictions.eq("menu.fatherId", menuId));
			if(page.getOrder().equalsIgnoreCase("asc")){
				criteria.addOrder(Order.asc(page.getOrderby()));
			}else{
				criteria.addOrder(Order.desc(page.getOrderby()));
			}
			
			list = (List<Product>) hibernateTemplate.findByCriteria(criteria,page.getSt(),page.getRows());
			list.forEach(p -> hibernateTemplate.initialize(p.getProductImgs()));
		} catch (Exception e) {
			logger.error(e.getMessage());
			throw e;
		}
		
		return list;
	}

	@Override
	public List<Product> getProductsByBrandId(int productBrandId, Page page) {
		List<Product> list = null;
		try {
			DetachedCriteria criteria = DetachedCriteria.forClass(Product.class);
			criteria.add(Restrictions.eq("productBrand.id", productBrandId));
			
			if(page.getOrder().equalsIgnoreCase("asc")){
				criteria.addOrder(Order.asc(page.getOrderby()));
			}else{
				criteria.addOrder(Order.desc(page.getOrderby()));
			}
			list = (List<Product>) hibernateTemplate.findByCriteria(criteria,page.getSt(),page.getRows());
			list.forEach(p -> hibernateTemplate.initialize(p.getProductImgs()));
		} catch (Exception e) {
			logger.error(e.getMessage());
			throw e;
		}

		return list;
	}


	@Override
	public List<Product> getHotProduct(Page page) {
		List<Product> list = null;
		try {
			DetachedCriteria criteria = DetachedCriteria.forClass(Product.class);
			criteria.add(Restrictions.eq("hot", (byte)1));
			
			if(page.getOrder().equalsIgnoreCase("asc")){
				criteria.addOrder(Order.asc(page.getOrderby()));
			}else{
				criteria.addOrder(Order.desc(page.getOrderby()));
			}
			list = (List<Product>) hibernateTemplate.findByCriteria(criteria,page.getSt(),page.getRows());
			list.forEach(p -> hibernateTemplate.initialize(p.getProductImgs()));
			
		} catch (Exception e) {
			logger.error(e.getMessage());
			throw e;
		}

		return list;
	}

	@Override
	public List<Product> getPromoteProduct(Page page) {
		List<Product> list = null;
		try {
			DetachedCriteria criteria = DetachedCriteria.forClass(Product.class);
			criteria.add(Restrictions.eq("promote", (byte)1));
			
//			if(page.getOrder().equalsIgnoreCase("asc")){
//				criteria.addOrder(Order.asc(page.getOrderby()));
//			}else{
//				criteria.addOrder(Order.desc(page.getOrderby()));
//			}
			
			criteria.add(Restrictions.sqlRestriction("1=1 order by rand()"));
			
			list = (List<Product>) hibernateTemplate.findByCriteria(criteria,page.getSt(),page.getRows());
			list.forEach(p -> hibernateTemplate.initialize(p.getProductImgs()));
		} catch (Exception e) {
			logger.error(e.getMessage());
			throw e;
		}

		return list;
	}

	@Override
	public List<Product> getProductByIds(Integer[] ids) {
		List<Product> list = null;
		try {
			DetachedCriteria criteria = DetachedCriteria.forClass(Product.class);
			criteria.add(Restrictions.in("id", ids));
			
			list = (List<Product>) hibernateTemplate.findByCriteria(criteria);
			list.forEach(p -> hibernateTemplate.initialize(p.getProductImgs()));
		} catch (Exception e) {
			logger.error(e.getMessage());
			throw e;
		}

		return list;
	}


	@Override
	public List<Product> search(SearchForm searchForm, Page page) {
		List<Product> list = null;
		try {
			DetachedCriteria criteria = DetachedCriteria.forClass(Product.class);
			criteria.createAlias("menu", "menu");
			Disjunction disjunction = Restrictions.disjunction();
			if(StringHelper.isNotEmpty(searchForm.getQ())){
				disjunction.add(Restrictions.like("productNameCn", searchForm.getQ(), MatchMode.ANYWHERE));
				disjunction.add(Restrictions.like("productNameEn", searchForm.getQ(), MatchMode.ANYWHERE));
				disjunction.add(Restrictions.like("productLable", searchForm.getQ(), MatchMode.ANYWHERE));
				disjunction.add(Restrictions.like("mpn", searchForm.getQ(), MatchMode.ANYWHERE));
			}
			criteria.add(disjunction);
			
			if(searchForm.getMenu1Id()!=-1){
				criteria.add(Restrictions.eq("menu.fatherId", searchForm.getMenu1Id()));
			}
			if(searchForm.getMenu2Id()!=-1){
				criteria.add(Restrictions.eq("menu.id", searchForm.getMenu2Id()));
			}
			if(searchForm.getStatus()!=-1){
				criteria.add(Restrictions.eq("status", searchForm.getStatus()));
			}
			if(searchForm.getHot()!=-1){
				criteria.add(Restrictions.eq("hot", searchForm.getHot()));
			}
			if(searchForm.getPromote()!=-1){
				criteria.add(Restrictions.eq("promote", searchForm.getPromote()));
			}
			if(searchForm.getRecommend()!=-1){
				criteria.add(Restrictions.eq("recommend", searchForm.getRecommend()));
			}
			if(searchForm.getFrontPage()!=-1){
				criteria.add(Restrictions.eq("frontPage", searchForm.getFrontPage()));
			}
			
			if(page.getOrder().equalsIgnoreCase("asc")){
				criteria.addOrder(Order.asc(page.getOrderby()));
			}else{
				criteria.addOrder(Order.desc(page.getOrderby()));
			}
			list = (List<Product>) hibernateTemplate.findByCriteria(criteria,page.getSt(),page.getRows());
			list.forEach(p -> hibernateTemplate.initialize(p.getProductImgs()));
		} catch (Exception e) {
			logger.error(e.getMessage());
			throw e;
		}

		return list;
	}

	@Override
	public int searchCount(SearchForm searchForm, Page page) {
		int ret = 0;
		try {
			DetachedCriteria criteria = DetachedCriteria.forClass(Product.class);
			criteria.createAlias("menu", "menu");
			Disjunction disjunction = Restrictions.disjunction();
			if(StringHelper.isNotEmpty(searchForm.getQ())){
				disjunction.add(Restrictions.like("productNameCn", searchForm.getQ(), MatchMode.ANYWHERE));
				disjunction.add(Restrictions.like("productNameEn", searchForm.getQ(), MatchMode.ANYWHERE));
				disjunction.add(Restrictions.like("productLable", searchForm.getQ(), MatchMode.ANYWHERE));
				disjunction.add(Restrictions.like("mpn", searchForm.getQ(), MatchMode.ANYWHERE));
			}
			criteria.add(disjunction);
			if(searchForm.getMenu1Id()!=-1){
				criteria.add(Restrictions.eq("menu.fatherId", searchForm.getMenu1Id()));
			}
			if(searchForm.getMenu2Id()!=-1){
				criteria.add(Restrictions.eq("menu.id", searchForm.getMenu2Id()));
			}
			
			if(searchForm.getStatus()!=-1){
				criteria.add(Restrictions.eq("status", searchForm.getStatus()));
			}
			if(searchForm.getHot()!=-1){
				criteria.add(Restrictions.eq("hot", searchForm.getHot()));
			}
			if(searchForm.getPromote()!=-1){
				criteria.add(Restrictions.eq("promote", searchForm.getPromote()));
			}
			if(searchForm.getRecommend()!=-1){
				criteria.add(Restrictions.eq("recommend", searchForm.getRecommend()));
			}
			if(searchForm.getFrontPage()!=-1){
				criteria.add(Restrictions.eq("frontPage", searchForm.getFrontPage()));
			}
			
			criteria.setProjection(Projections.count("id"));
			ret = Integer.valueOf(hibernateTemplate.findByCriteria(criteria).get(0)+"");
		} catch (Exception e) {
			logger.error(e.getMessage());
			throw e;
		}

		return ret;
	}

	@Override
	public List<Product> getProdcut(SearchForm searchForm, Page page) {
		List<Product> list = null;
		try {
			DetachedCriteria criteria = DetachedCriteria.forClass(Product.class);
			criteria.createAlias("menu", "menu");
			
			Disjunction disjunction = Restrictions.disjunction();
			if(StringHelper.isNotEmpty(searchForm.getQ())){
				disjunction.add(Restrictions.like("productNameCn", searchForm.getQ(), MatchMode.ANYWHERE));
				disjunction.add(Restrictions.like("productNameEn", searchForm.getQ(), MatchMode.ANYWHERE));
				disjunction.add(Restrictions.like("productLable", searchForm.getQ(), MatchMode.ANYWHERE));
				disjunction.add(Restrictions.like("mpn", searchForm.getQ(), MatchMode.ANYWHERE));
			}
			criteria.add(disjunction);
			
			if(searchForm.getMenu1Id()!=0){
				criteria.add(Restrictions.eq("menu.fatherId", searchForm.getMenu1Id()));
			}
			if(searchForm.getMenu2Id()!=0){
				criteria.add(Restrictions.eq("menu.id", searchForm.getMenu2Id()));
			}
			if(searchForm.getBrandId()!=0){
				criteria.add(Restrictions.eq("productBrand.id", searchForm.getBrandId()));
			}
			if(searchForm.getStatus()==1){
				criteria.add(Restrictions.eq("status", (byte)1));
			}else{
				criteria.add(Restrictions.in("status", new Object[]{(byte)1,(byte)2}));
			}
			
			if(page.getOrder().equalsIgnoreCase("asc")){
				criteria.addOrder(Order.asc(page.getOrderby()));
			}else{
				criteria.addOrder(Order.desc(page.getOrderby()));
			}
			list = (List<Product>) hibernateTemplate.findByCriteria(criteria,page.getSt(),page.getRows());
			list.forEach(p -> hibernateTemplate.initialize(p.getProductImgs()));
			
		} catch (Exception e) {
			logger.error(e.getMessage());
			throw e;
		}
		
		return list;
	}

	@Override
	public int getProdcutCount(SearchForm searchForm, Page page) {
		int ret = 0;
		try {
			DetachedCriteria criteria = DetachedCriteria.forClass(Product.class);
			criteria.createAlias("menu", "menu");
			
			Disjunction disjunction = Restrictions.disjunction();
			if(StringHelper.isNotEmpty(searchForm.getQ())){
				disjunction.add(Restrictions.like("productNameCn", searchForm.getQ(), MatchMode.ANYWHERE));
				disjunction.add(Restrictions.like("productNameEn", searchForm.getQ(), MatchMode.ANYWHERE));
				disjunction.add(Restrictions.like("productLable", searchForm.getQ(), MatchMode.ANYWHERE));
				disjunction.add(Restrictions.like("mpn", searchForm.getQ(), MatchMode.ANYWHERE));
			}
			criteria.add(disjunction);
			if(searchForm.getMenu1Id()!=0){
				criteria.add(Restrictions.eq("menu.fatherId", searchForm.getMenu1Id()));
			}
			if(searchForm.getMenu2Id()!=0){
				criteria.add(Restrictions.eq("menu.id", searchForm.getMenu2Id()));
			}
			if(searchForm.getBrandId()!=0){
				criteria.add(Restrictions.eq("productBrand.id", searchForm.getBrandId()));
			}
			if(searchForm.getStatus()==1){
				criteria.add(Restrictions.eq("status", (byte)1));
			}else{
				criteria.add(Restrictions.in("status", new Object[]{(byte)1,(byte)2}));
			}
			
			if(page.getOrder().equalsIgnoreCase("asc")){
				criteria.addOrder(Order.asc(page.getOrderby()));
			}else{
				criteria.addOrder(Order.desc(page.getOrderby()));
			}
			criteria.setProjection(Projections.count("id"));
			ret =  Integer.valueOf(hibernateTemplate.findByCriteria(criteria).get(0)+"");
			
		} catch (Exception e) {
			logger.error(e.getMessage());
			throw e;
		}
		
		return ret;
	}
	
}
