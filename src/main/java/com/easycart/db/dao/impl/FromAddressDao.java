package com.easycart.db.dao.impl;

import java.util.List;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.hibernate.criterion.DetachedCriteria;
import org.hibernate.criterion.Order;
import org.hibernate.criterion.Restrictions;
import org.springframework.stereotype.Repository;

import com.easycart.db.dao.IFromAddressDao;
import com.easycart.db.dao.support.HibernateTemplateDaoSupport;
import com.easycart.db.entity.Customer;
import com.easycart.db.entity.FromAddress;
import com.easycart.db.entity.User;

@Repository("fromAddressDao")
public class FromAddressDao extends HibernateTemplateDaoSupport<FromAddress> implements IFromAddressDao{

	private static Logger logger = LogManager.getLogger(FromAddressDao.class);
	
	@Override
	public List<FromAddress> getFromAddressByCustomerId(int customerId) {
		List<FromAddress> fromAddresseList = null;
		try {
			DetachedCriteria criteria = DetachedCriteria.forClass(FromAddress.class);
			criteria.add(Restrictions.eq("customer.id", customerId));
			
			criteria.addOrder(Order.desc("id"));
			fromAddresseList = (List<FromAddress>) hibernateTemplate.findByCriteria(criteria);
			
		} catch (Exception e) {
			logger.error(e.getMessage());
		}
	
		return fromAddresseList;
	}

	@Override
	public FromAddress getByFromPhone(String phone) {
		FromAddress fromAddress = null;
		try {
			DetachedCriteria criteria = DetachedCriteria.forClass(FromAddress.class);
			criteria.add(Restrictions.eq("fromPhone", phone));
			
			List<?> list = hibernateTemplate.findByCriteria(criteria);
			if(list.size()==1){
				fromAddress = (FromAddress) list.get(0);
			}
			
		} catch (Exception e) {
			logger.error(e.getMessage());
		}

		return fromAddress;
	}

	@Override
	public FromAddress get(FromAddress fromAddress) {
		FromAddress ret = null;
		try {
			DetachedCriteria criteria = DetachedCriteria.forClass(FromAddress.class);
			criteria.add(Restrictions.eq("customer.id", fromAddress.getCustomer().getId()));
			criteria.add(Restrictions.eq("id", fromAddress.getId()));
			
			List<FromAddress> fromAddresseList = (List<FromAddress>) hibernateTemplate.findByCriteria(criteria);
			if(fromAddresseList.size()==1){
				ret = fromAddresseList.get(0);
			}
			
		} catch (Exception e) {
			logger.error(e.getMessage());
		}
	
		return ret;
	}
	
}
