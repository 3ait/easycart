package com.easycart.db.dao.support;


import java.lang.reflect.ParameterizedType;
import java.util.List;

import javax.annotation.Resource;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.orm.hibernate4.HibernateTemplate;


public abstract class HibernateTemplateDaoSupport<T> implements ISupport<T>{

	private static final Logger logger = LogManager.getLogger(HibernateTemplateDaoSupport.class.getName());
	
	@Resource(name="hibernateTemplate")
	public HibernateTemplate hibernateTemplate;
	public void setHibernateTemplate(HibernateTemplate hibernateTemplate) {
		this.hibernateTemplate = hibernateTemplate;
	}
	
	public static final String ASC = "ASC";
	public static final String DESC = "DESC";
	
	@SuppressWarnings("unchecked")
	Class<T> entityClass = (Class<T>) ((ParameterizedType)this.getClass().getGenericSuperclass()).getActualTypeArguments()[0];
	
	/**
	 * 
	 * @param id
	 * @return
	 */
	@Override
	public T getById(int id){
		T t = null;
		try {
			t = hibernateTemplate.get(entityClass, id);
		} catch (RuntimeException e) {
			e.printStackTrace();
			throw e;
		}
		return t;
	}
	
	
	
	@Override
	public T loadById(int id) {
		T t = null;
		try {
			t = hibernateTemplate.load(entityClass, id);
		} catch (RuntimeException e) {
			e.printStackTrace();
			throw e;
		}
		return t;
	}



	@Override
	public boolean update(T t) {
		boolean ret = true;
		try {
			hibernateTemplate.update(t);
		} catch (RuntimeException e) {
			ret = false;
			e.printStackTrace();
			throw e;
		}
		return ret;
	}
	
	@Override
	public boolean save(T t) {
		boolean ret = true;
		try {
			hibernateTemplate.save(t);
		} catch (RuntimeException e) {
			ret = false;
			e.printStackTrace();
			throw e;
		}
		return ret;
	}

	@Override
	public boolean delete(T t){

		boolean ret = true;
		try {
			hibernateTemplate.delete(t);
		} catch (RuntimeException e) {
			ret = false;
			e.printStackTrace();
			logger.error("");
			throw e;
		}
		return ret;
	}
	
	@Override
	public boolean deleteAll(List<T> list) {

		boolean ret = true;
		try {
			hibernateTemplate.deleteAll(list);
		} catch (RuntimeException e) {
			ret = false;
			e.printStackTrace();
			logger.error("");
			throw e;
		}
		return ret;
	}
	
	@Override
	public boolean saveOrUpdate(T t) {
		
		boolean ret = true;
		try {
			hibernateTemplate.saveOrUpdate(t);
//			hibernateTemplate.flush();
		} catch (RuntimeException e) {
			ret = false;
			e.printStackTrace();
			logger.error("");
			throw e;
		}
		return ret;
	}

}
