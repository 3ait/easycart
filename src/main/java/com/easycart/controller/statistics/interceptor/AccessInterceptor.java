package com.easycart.controller.statistics.interceptor;

import java.util.Calendar;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.transaction.Transactional;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import com.easycart.db.dao.ILogUrlDao;
import com.easycart.db.entity.LogUrl;

/**
 * 访问统计
 * @author leo
 *
 */
public class AccessInterceptor implements HandlerInterceptor{

	private final Logger logger = LogManager.getLogger(AccessInterceptor.class);
	
	@Autowired
	ILogUrlDao logUrlDao;
	
	@Override
	public void afterCompletion(HttpServletRequest arg0,
			HttpServletResponse arg1, Object arg2, Exception arg3)
			throws Exception {
		
	}

	@Override
	public void postHandle(HttpServletRequest arg0, HttpServletResponse arg1,
			Object arg2, ModelAndView arg3) throws Exception {
		
	}
	
	@Override
	@Transactional
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response,Object object) throws Exception {
		boolean ret = true;
		
		String url = request.getRequestURL().toString();
		
		LogUrl logUrl = logUrlDao.get(url, Calendar.getInstance().getTime());
		if(logUrl==null){
			logUrl = new LogUrl();
			logUrl.setDate(Calendar.getInstance().getTime());
			logUrl.setUrl(url);
			logUrl.setNumber(1);
			logUrlDao.save(logUrl);	
		}else{
			logUrl.setNumber(logUrl.getNumber()+1);
			logUrlDao.update(logUrl);
		}
		
		return ret;
	}


}
