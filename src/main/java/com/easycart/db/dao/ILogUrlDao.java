package com.easycart.db.dao;

import java.util.Date;
import java.util.List;

import com.easycart.db.dao.support.ISupport;
import com.easycart.db.entity.LogUrl;

public interface ILogUrlDao extends ISupport<LogUrl>{

	public LogUrl get(String url,Date date);

	/**
	 * 获取每天的访问量
	 * @param from
	 * @param to
	 * @return
	 */
	public List<Object> getByDate(Date from, Date to);

	/**
	 * 获取前 size 个 访问最多的URL
	 * @param from
	 * @param to
	 * @param size
	 * @return
	 */
	public List<Object> list(Date from, Date to, int size); 
}
