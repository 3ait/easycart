package com.easycart.db.dao.impl;

import java.util.List;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.hibernate.FetchMode;
import org.hibernate.annotations.common.util.StringHelper;
import org.hibernate.criterion.DetachedCriteria;
import org.hibernate.criterion.Disjunction;
import org.hibernate.criterion.Restrictions;
import org.springframework.stereotype.Repository;

import com.easycart.db.dao.IOrderRecordDao;
import com.easycart.db.dao.support.HibernateTemplateDaoSupport;
import com.easycart.db.entity.Order;
import com.easycart.db.entity.OrderRecord;

@Repository("orderRecordDao")
public class OrderRecordDao extends HibernateTemplateDaoSupport<OrderRecord> implements IOrderRecordDao{

	private static Logger logger = LogManager.getLogger(OrderRecordDao.class);

	@Override
	public List<OrderRecord> getByOrderId(int orderId) {
		List<OrderRecord> list = null;
		try {
			DetachedCriteria criteria = DetachedCriteria.forClass(OrderRecord.class);
			criteria.setFetchMode("product", FetchMode.JOIN);
			
			criteria.add(Restrictions.eq("order.id", orderId));
			list = (List<OrderRecord>) hibernateTemplate.findByCriteria(criteria);
			
		} catch (Exception e) {
			logger.error(e.getMessage());
			throw e;
		}

		return list;
	}
	
	
}
