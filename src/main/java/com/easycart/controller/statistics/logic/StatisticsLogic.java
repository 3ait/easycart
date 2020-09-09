package com.easycart.controller.statistics.logic;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.easycart.db.dao.ILogUrlDao;

@Component("statisticsLogic")
public class StatisticsLogic {

	@Autowired
	ILogUrlDao logUrlDao;

	/**
	 * 获取from to 的日志结果
	 * @param from
	 * @param to
	 * @return String[]
	 */
	public String[] getLogUrl(Date from, Date to) {
		
		List<Object> list = logUrlDao.getByDate(from, to);
		
		String[] array = new String[2];
		StringBuilder dates = new StringBuilder();
		StringBuilder numbers =  new StringBuilder();
		
		list.forEach(obj ->{
			dates.append(((Object[])obj)[0].toString()).append(",");
			numbers.append(((Object[])obj)[1].toString()).append(",");
		});
		array[0] = dates.toString();
		array[1] = numbers.toString();
		
		return array;
	}
	
	/**
	 * 获取访问量最多的前N个URL
	 * @param from
	 * @param to
	 * @return String[]
	 */
	public List<Object[]> getLogUrlNumber(Date from, Date to,int size) {
		
		List<Object> list = logUrlDao.list(from, to,size);
		
		List<Object[]> retList = new ArrayList<Object[]>();
		list.forEach(obj ->{
			retList.add((Object[]) obj);
		});
		
		return retList;
	}
	
}
