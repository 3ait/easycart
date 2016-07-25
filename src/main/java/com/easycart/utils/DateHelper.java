package com.easycart.utils;

import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;

public class DateHelper {

	/**
	 * 获取当前系统时间 ，单位秒
	 */
	public static int getTime(){
		return (int) (System.currentTimeMillis()/1000);
	}
	
	/**
	 * @param long time System.currentTimeMillis()
	 * @return MM/dd/yyyy
	 */
	public static String getMMDDYYYY(long time){
		DateFormat df = new SimpleDateFormat("MM/dd/yyyy");
		return df.format(time);
	}
	
	/**
	 * @param long time System.currentTimeMillis()
	 * @return 'yyyy-MM-dd'.
	 */
	public static String getYYYYMMDD(long time){
		DateFormat df = new SimpleDateFormat("yyyy-MM-dd");
		return df.format(time);
	}

	/**
	 * 
	 * @return "yy.MM.dd"
	 */
	public static String getYYMMDD(int time){
		DateFormat df = new SimpleDateFormat("yy.MM.dd");
		return df.format(time*1000L);
	}
	/**
	 * 
	 * @return dd/MM/yyyy
	 */
	public static String getDDMMYYYY(){
		DateFormat df = new SimpleDateFormat("dd/MM/yyyy");
		return df.format(System.currentTimeMillis());
	}
	/**
	 * 
	 * @return ddMMyyyy
	 */
	public static String getDDMMYYYY_(){
		DateFormat df = new SimpleDateFormat("ddMMyyyy");
		return df.format(System.currentTimeMillis());
	}
	
	/**
	 * 
	 * @return yyyyMMdd
	 */
	public static String getYYYYMMDD(){
		DateFormat df = new SimpleDateFormat("yyyyMMdd");
		return df.format(System.currentTimeMillis());
	}

	
	/**
	 * @param  time
	 * @return MM/dd/yyyy HH:mm:ss
	 */
	public static String getMMDDYYYYHHMMSS(int time){
		DateFormat df = new SimpleDateFormat("MM/dd/yyyy HH:mm:ss");
		return df.format(time*1000L);
	}
	
	/**
	 * @param  time
	 * @return MMddyyyyHHmmss
	 */
	public static String getMMDDYYYYHHMMSS(){
		DateFormat df = new SimpleDateFormat("MMddyyyyHHmmss");
		return df.format(System.currentTimeMillis());
	}
	
	/**
	 * String time :MM/dd/yyyy
	 * 将time转换为int ,单位秒
	 * @return 
	 */
	public static int getTime(String time){
		DateFormat df = new SimpleDateFormat("MM/dd/yyyy");
		Calendar calendar = Calendar.getInstance();
		try {
			calendar.setTime(df.parse(time));
		} catch (ParseException e) {
			e.printStackTrace();
		}
		return (int) (calendar.getTimeInMillis()/1000);
	}
	/**
	 * String time :yyyy-MM-dd
	 * 将time转换为int ,单位秒
	 * @return 
	 */
	public static int getTime3(String time){
		DateFormat df = new SimpleDateFormat("yyyy-MM-dd");
		Calendar calendar = Calendar.getInstance();
		try {
			calendar.setTime(df.parse(time));
		} catch (ParseException e) {
			e.printStackTrace();
		}
		return (int) (calendar.getTimeInMillis()/1000);
	}
	/**
	 * String time MM-dd-yyyy HH:mm:ss
	 * 将time转换为int ,单位秒
	 * @return 
	 */
	public static int getTime2(String time){
		DateFormat df = new SimpleDateFormat("MM-dd-yyyy HH:mm:ss");
		Calendar calendar = Calendar.getInstance();
		try {
			calendar.setTime(df.parse(time));
		} catch (ParseException e) {
			e.printStackTrace();
		}
		return (int) (calendar.getTimeInMillis()/1000);
	}
	
	/**
	 * 获取当前日期所对应的秒数
	 * @return
	 */
	public static int getNowDateTime(){
		return getTime(getMMDDYYYY(System.currentTimeMillis()));
	}
	

}
