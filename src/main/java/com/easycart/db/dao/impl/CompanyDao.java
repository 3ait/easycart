package com.easycart.db.dao.impl;

import java.util.List;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.hibernate.criterion.DetachedCriteria;
import org.springframework.stereotype.Repository;

import com.easycart.db.dao.ICompanyDao;
import com.easycart.db.dao.support.HibernateTemplateDaoSupport;
import com.easycart.db.entity.Company;

@Repository("companyDao")
public class CompanyDao extends HibernateTemplateDaoSupport<Company> implements ICompanyDao{

	private static Logger logger = LogManager.getLogger(CompanyDao.class);

	@Override
	public Company getCompany() {
		Company company = null;
		try {
			DetachedCriteria criteria = DetachedCriteria.forClass(Company.class);
			
			List<?> list = hibernateTemplate.findByCriteria(criteria);
			if(list.size()>=1){
				company = (Company) list.get(0);
			}
			
		} catch (Exception e) {
			logger.error(e.getMessage());
		}

		return company;
	}
	
	
}
