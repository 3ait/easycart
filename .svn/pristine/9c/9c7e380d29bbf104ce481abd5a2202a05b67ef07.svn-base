package com.easycart.db.dao.impl;

import java.util.List;
import java.util.regex.Pattern;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.hibernate.FetchMode;
import org.hibernate.annotations.common.util.StringHelper;
import org.hibernate.criterion.DetachedCriteria;
import org.hibernate.criterion.Disjunction;
import org.hibernate.criterion.MatchMode;
import org.hibernate.criterion.Projections;
import org.hibernate.criterion.Restrictions;
import org.springframework.stereotype.Repository;

import com.easycart.controller.admin.order.OrderSearchForm;
import com.easycart.db.dao.IOrderDao;
import com.easycart.db.dao.support.HibernateTemplateDaoSupport;
import com.easycart.db.entity.Order;
import com.easycart.utils.Page;

@Repository("orderDao")
public class OrderDao extends HibernateTemplateDaoSupport<Order> implements IOrderDao{

	private static Logger logger = LogManager.getLogger(OrderDao.class);

	@Override
	public List<Order> list(OrderSearchForm orderSearchForm, Page page) {
		List<Order> list = null;
		try {
			DetachedCriteria criteria = DetachedCriteria.forClass(Order.class);
			criteria.setFetchMode("customer", FetchMode.JOIN);
			if(StringHelper.isNotEmpty(orderSearchForm.getQ())){
				Disjunction disjunction = Restrictions.disjunction();
				Pattern pattern = Pattern.compile("[0-9]+");
				if(pattern.matcher(orderSearchForm.getQ()).matches()){
					disjunction.add(Restrictions.eq("id", Integer.valueOf(orderSearchForm.getQ())));
				}
				disjunction.add(Restrictions.like("fromName", orderSearchForm.getQ(),MatchMode.ANYWHERE));
				disjunction.add(Restrictions.like("fromPhone", orderSearchForm.getQ(),MatchMode.ANYWHERE));
				disjunction.add(Restrictions.like("toName", orderSearchForm.getQ(),MatchMode.ANYWHERE));
				disjunction.add(Restrictions.like("toPhone", orderSearchForm.getQ(),MatchMode.ANYWHERE));
				criteria.add(disjunction);
			}
			if(orderSearchForm.getStatus()!=-1){
				criteria.add(Restrictions.eq("status", orderSearchForm.getStatus()));
			}
			if(orderSearchForm.getCustomerId()!=-1){
				criteria.add(Restrictions.eq("customer.id", orderSearchForm.getCustomerId()));
			}
			
			if(page.getOrder().equalsIgnoreCase("asc")){
				criteria.addOrder(org.hibernate.criterion.Order.asc(page.getOrderby()));
			}else{
				criteria.addOrder(org.hibernate.criterion.Order.desc(page.getOrderby()));
			}
			
			list = (List<Order>) hibernateTemplate.findByCriteria(criteria,page.getSt(),page.getRows());
			list.forEach(o ->hibernateTemplate.initialize(o.getOrderRecords()));
			
		} catch (Exception e) {
			logger.error(e.getMessage());
			throw e;
		}

		return list;
	}

	@Override
	public int listCount(OrderSearchForm orderSearchForm, Page page) {
		int ret = 0;
		try {
			DetachedCriteria criteria = DetachedCriteria.forClass(Order.class);
			if(StringHelper.isNotEmpty(orderSearchForm.getQ())){
				Disjunction disjunction = Restrictions.disjunction();
				Pattern pattern = Pattern.compile("[0-9]+");
				if(pattern.matcher(orderSearchForm.getQ()).matches()){
					disjunction.add(Restrictions.eq("id", Integer.valueOf(orderSearchForm.getQ())));
				}
				disjunction.add(Restrictions.like("fromName", orderSearchForm.getQ(),MatchMode.ANYWHERE));
				disjunction.add(Restrictions.like("fromPhone", orderSearchForm.getQ(),MatchMode.ANYWHERE));
				disjunction.add(Restrictions.like("toName", orderSearchForm.getQ(),MatchMode.ANYWHERE));
				disjunction.add(Restrictions.like("toPhone", orderSearchForm.getQ(),MatchMode.ANYWHERE));
				criteria.add(disjunction);
			}
			if(orderSearchForm.getStatus()!=-1){
				criteria.add(Restrictions.eq("status", orderSearchForm.getStatus()));
			}
			if(orderSearchForm.getCustomerId()!=-1){
				criteria.add(Restrictions.eq("customer.id", orderSearchForm.getCustomerId()));
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
	public Order getOrder(int id, int customerId) {
		Order order = null;
		try {
			DetachedCriteria criteria = DetachedCriteria.forClass(Order.class);
			criteria.add(Restrictions.eq("id", id));
			criteria.add(Restrictions.eq("customer.id", customerId));
			
			List<Order> list = (List<Order>) hibernateTemplate.findByCriteria(criteria);
			if(list.size()==1){
				order = list.get(0);
			}
			
		} catch (Exception e) {
			logger.error(e.getMessage());
			throw e;
		}

		return order;
	}
	
}
