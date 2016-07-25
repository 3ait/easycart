package com.print.pdf;

import java.io.OutputStream;
import java.util.List;

import com.print.Courier;


public interface IPDF {

	/*
	 * 1cm = 28.346px;
	 */
	public static final float cm2px = 28.346f;
	
	
	/**
	 * 多页PDF输出
	 * @param List<Courier>
	 * @param OutputStream
	 * @return void
	 */
	public void pdfOutputStream(List<Courier> courierList,OutputStream os);
	
}
