package com.easycart.db.dao.impl;

import java.util.Date;
import java.util.List;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.hibernate.criterion.DetachedCriteria;
import org.hibernate.criterion.Order;
import org.hibernate.criterion.ProjectionList;
import org.hibernate.criterion.Projections;
import org.hibernate.criterion.Restrictions;
import org.springframework.stereotype.Repository;

import com.easycart.db.dao.ILogUrlDao;
import com.easycart.db.dao.support.HibernateTemplateDaoSupport;
import com.easycart.db.entity.LogUrl;

@Repository("logUrlDao")
public class LogUrlDao extends HibernateTemplateDaoSupport<LogUrl> implements ILogUrlDao {

	private static Logger logger = LogManager.getLogger(LogUrlDao.class);

	@Override
	public LogUrl get(String url, Date date) {
		logger.debug("get");
		LogUrl logUrl = null;
		try {
			DetachedCriteria criteria = DetachedCriteria.forClass(LogUrl.class);
			criteria.add(Restrictions.eq("url", url));
			criteria.add(Restrictions.eq("date", date));
			List<?> list = hibernateTemplate.findByCriteria(criteria);
			if(list.size()==1){
				logUrl = (LogUrl) list.get(0);
			}
			
		} catch (Exception e) {
			throw e;
		}
		return logUrl;
		
	}

	@Override
	public List<Object> getByDate(Date from, Date to) {
		logger.debug("getByDate");
		 List<Object> list = null;
		try {
			DetachedCriteria criteria = DetachedCriteria.forClass(LogUrl.class);
			criteria.add(Restrictions.ge("date", from));
			criteria.add(Restrictions.le("date", to));
			
			ProjectionList pList = Projections.projectionList();
			pList.add(Projections.groupProperty("date").as("date"));
			pList.add(Projections.sum("number").as("number"));
			
			criteria.setProjection(pList);
			
			list =  (List<Object>) hibernateTemplate.findByCriteria(criteria);
		} catch (Exception e) {
			throw e;
		}
		return list;
		
	}

	@Override
	public List<Object> list(Date from, Date to, int size) {
		logger.debug("getByDate");
		 List<Object> list = null;
		try {
			DetachedCriteria criteria = DetachedCriteria.forClass(LogUrl.class);
			criteria.add(Restrictions.ge("date", from));
			criteria.add(Restrictions.le("date", to));
			
			ProjectionList pList = Projections.projectionList();
			pList.add(Projections.groupProperty("url").as("url"));
			pList.add(Projections.sum("number").as("number"));
			
			criteria.addOrder(Order.desc("number"));
			criteria.setProjection(pList);
			list =  (List<Object>) hibernateTemplate.findByCriteria(criteria,0,size);
		} catch (Exception e) {
			throw e;
		}
		return list;
		
	}

	

}
