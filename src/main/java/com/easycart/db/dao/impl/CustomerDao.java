package com.easycart.db.dao.impl;

import java.util.List;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.hibernate.criterion.DetachedCriteria;
import org.hibernate.criterion.Disjunction;
import org.hibernate.criterion.MatchMode;
import org.hibernate.criterion.Order;
import org.hibernate.criterion.Projections;
import org.hibernate.criterion.Restrictions;
import org.hibernate.internal.util.StringHelper;
import org.springframework.stereotype.Repository;

import com.easycart.db.dao.ICustomerDao;
import com.easycart.db.dao.support.HibernateTemplateDaoSupport;
import com.easycart.db.entity.Customer;
import com.easycart.utils.Page;

@Repository("customerDao")
public class CustomerDao extends HibernateTemplateDaoSupport<Customer> implements ICustomerDao{

	private static Logger logger = LogManager.getLogger(CustomerDao.class);
	
	@Override
	public Customer login(String phone, String password) {
		Customer customer = null;
		try {
			DetachedCriteria criteria = DetachedCriteria.forClass(Customer.class);
			criteria.add(Restrictions.eq("phone", phone));
			criteria.add(Restrictions.eq("password", password));
			
			//激活用户才能登陆
			criteria.add(Restrictions.eq("status", (byte)1));
			List<?> list = hibernateTemplate.findByCriteria(criteria);
			if(list.size()==1){
				customer = (Customer) list.get(0);
			}
			
		} catch (Exception e) {
			logger.error(e.getMessage());
		}

		return customer;
	}


	@Override
	public Customer getByPhone(String phone) {
		Customer customer = null;
		try {
			DetachedCriteria criteria = DetachedCriteria.forClass(Customer.class);
			criteria.add(Restrictions.eq("phone", phone));
			
			List<?> list = hibernateTemplate.findByCriteria(criteria);
			if(list.size()==1){
				customer = (Customer) list.get(0);
			}
			
		} catch (Exception e) {
			logger.error(e.getMessage());
		}

		return customer;
	}


	@Override
	public int listCount(String q, Page page) {
		int ret = 0;
		try {
			DetachedCriteria criteria = DetachedCriteria.forClass(Customer.class);
			
			Disjunction disjunction = Restrictions.disjunction();
			if(StringHelper.isNotEmpty(q)){
				disjunction.add(Restrictions.like("email", q,MatchMode.ANYWHERE));
				disjunction.add(Restrictions.like("name", q,MatchMode.ANYWHERE));
				disjunction.add(Restrictions.like("phone", q,MatchMode.ANYWHERE));
			}
			criteria.add(disjunction);
			criteria.setProjection(Projections.count("id"));
			ret = Integer.valueOf(hibernateTemplate.findByCriteria(criteria).get(0)+"");
		} catch (Exception e) {
			logger.error(e.getMessage());
		}

		return ret;
	}


	@Override
	public List<Customer> list(String q, Page page) {
		List<Customer> list = null;
		try {
			DetachedCriteria criteria = DetachedCriteria.forClass(Customer.class);
			
			Disjunction disjunction = Restrictions.disjunction();
			if(StringHelper.isNotEmpty(q)){
				disjunction.add(Restrictions.like("email", q,MatchMode.ANYWHERE));
				disjunction.add(Restrictions.like("name", q,MatchMode.ANYWHERE));
				disjunction.add(Restrictions.like("phone", q,MatchMode.ANYWHERE));
			}
			criteria.add(disjunction);
			if(page.getOrder().equalsIgnoreCase("asc")){
				criteria.addOrder(Order.asc(page.getOrderby()));
			}else{
				criteria.addOrder(Order.desc(page.getOrderby()));
			}
			list = (List<Customer>) hibernateTemplate.findByCriteria(criteria);
		} catch (Exception e) {
			logger.error(e.getMessage());
		}

		return list;
	}
	
}
