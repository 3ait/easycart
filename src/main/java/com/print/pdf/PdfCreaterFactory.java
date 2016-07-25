package com.print.pdf;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;

/**
 * 
 * @author yaoliang
 * PdfCreaterFactory
 */
public class PdfCreaterFactory {

	private static IPDF iPdf = null;
	private static Logger logger = LogManager.getLogger(PdfCreaterFactory.class);
	/**
	 * 
	 * @param name FlywayPDF FtdPDF
	 * @return
	 */
	public static IPDF pdfCreate(String name){
		try {
			iPdf = (IPDF) Class.forName("com.print.pdf.pdfTemplate." + name).newInstance();
		} catch (InstantiationException e) {
			logger.error("pdfCreate:"+name);
			e.printStackTrace();
		} catch (IllegalAccessException e) {
			e.printStackTrace();
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}
		return iPdf;
	}
}
