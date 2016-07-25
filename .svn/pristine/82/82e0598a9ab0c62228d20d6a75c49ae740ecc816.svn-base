package com.easycart.db.dao.impl;

import java.util.List;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.hibernate.criterion.DetachedCriteria;
import org.hibernate.criterion.Order;
import org.hibernate.criterion.Restrictions;
import org.springframework.stereotype.Repository;

import com.easycart.db.dao.IToAddressDao;
import com.easycart.db.dao.support.HibernateTemplateDaoSupport;
import com.easycart.db.entity.Customer;
import com.easycart.db.entity.ToAddress;

@Repository("toAddressDao")
public class ToAddressDao extends HibernateTemplateDaoSupport<ToAddress> implements IToAddressDao{

	private static Logger logger = LogManager.getLogger(ToAddressDao.class);

	@Override
	public List<ToAddress> getToAddressByCustomerId(int customerId) {
		List<ToAddress> toAddresses = null;
		try {
			DetachedCriteria criteria = DetachedCriteria.forClass(ToAddress.class);
			criteria.add(Restrictions.eq("customer.id", customerId));
			
			criteria.addOrder(Order.desc("id"));
			toAddresses = (List<ToAddress>) hibernateTemplate.findByCriteria(criteria);
			
		} catch (Exception e) {
			logger.error(e.getMessage());
		}
	
		return toAddresses;
	}

	@Override
	public ToAddress getByToPhone(String toPhone) {
		ToAddress toAddress = null;
		try {
			DetachedCriteria criteria = DetachedCriteria.forClass(ToAddress.class);
			criteria.add(Restrictions.eq("toPhone", toPhone));
			
			List<?> list = hibernateTemplate.findByCriteria(criteria);
			if(list.size()==1){
				toAddress = (ToAddress) list.get(0);
			}
			
		} catch (Exception e) {
			logger.error(e.getMessage());
		}

		return toAddress;
	}

	@Override
	public ToAddress get(ToAddress toAddress) {
		ToAddress ret = null;
		try {
			DetachedCriteria criteria = DetachedCriteria.forClass(ToAddress.class);
			criteria.add(Restrictions.eq("customer.id", toAddress.getCustomer().getId()));
			criteria.add(Restrictions.eq("id", toAddress.getId()));
			
			List<ToAddress> toAddresses = (List<ToAddress>) hibernateTemplate.findByCriteria(criteria);
			if(toAddresses.size()==1){
				ret = toAddresses.get(0);
			}
			
		} catch (Exception e) {
			logger.error(e.getMessage());
		}
	
		return ret;
	}
	
}
