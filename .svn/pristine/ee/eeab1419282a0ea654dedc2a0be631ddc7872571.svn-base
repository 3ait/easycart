package com.easycart.db.dao.impl;

import java.util.List;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.hibernate.criterion.DetachedCriteria;
import org.hibernate.criterion.Restrictions;
import org.springframework.stereotype.Repository;

import com.easycart.db.dao.IUserDao;
import com.easycart.db.dao.support.HibernateTemplateDaoSupport;
import com.easycart.db.entity.User;

@Repository("userDao")
public class UserDao extends HibernateTemplateDaoSupport<User> implements IUserDao{

	private static Logger logger = LogManager.getLogger(UserDao.class);
	@Override
	public User login(String email, String password) {
		User user = null;
		try {
			DetachedCriteria criteria = DetachedCriteria.forClass(User.class);
			criteria.add(Restrictions.eq("email", email));
			criteria.add(Restrictions.eq("password", password));
			
			
			criteria.add(Restrictions.eq("status", (byte)1));
			List<?> list = hibernateTemplate.findByCriteria(criteria);
			if(list.size()==1){
				user = (User) list.get(0);
			}
			
		} catch (Exception e) {
			logger.error(e.getMessage());
		}

		return user;
	}
	
	
	@Override
	public List<User> getByCompanyId(Integer id) {
		List<User> list = null;
		try {
			DetachedCriteria criteria = DetachedCriteria.forClass(User.class);
			criteria.add(Restrictions.eq("company.id", id));
			
			list = (List<User>) hibernateTemplate.findByCriteria(criteria);
			
		} catch (Exception e) {
			logger.error(e.getMessage());
		}

		return list;
	}
	
}
