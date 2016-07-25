package com.print.pdf;

import java.io.IOException;
import java.io.OutputStream;
import java.util.List;

import com.itextpdf.text.Document;
import com.itextpdf.text.DocumentException;
import com.itextpdf.text.Font;
import com.itextpdf.text.Rectangle;
import com.itextpdf.text.pdf.BaseFont;
import com.itextpdf.text.pdf.PdfWriter;
import com.print.Courier;


public abstract class PdfTemplate implements IPDF{

	
	public Font fontChinese = null;
	public float urx;
	public float ury;
	
	/**
	 * 
	 * @param urx cm
	 * @param ury cm
	 */
	public PdfTemplate(float urx,float ury){
		this.urx = getPxFromCm(urx);
		this.ury = getPxFromCm(ury);
        BaseFont bf = null;
        if(fontChinese==null){
        	try {
        		bf = BaseFont.createFont("SIMFANG.TTF",BaseFont.IDENTITY_H, BaseFont.EMBEDDED);
        		fontChinese = new Font(bf, 12, Font.BOLD);
        	} catch (DocumentException e) {
        		e.printStackTrace();
        	} catch (IOException e) {
        		e.printStackTrace();
        	}
        }
	
	}
	
	/**
	 * cm to px
	 * @param float cm
	 * @return float px
	 */
	public float getPxFromCm(float cm){
		return cm2px*cm;
	}

	/**
	 * 单页pdf构造
	 * @param pdfwriter
	 * @param courier
	 */
	public abstract void pageFormat(PdfWriter pdfwriter,Courier courier);
	
	/**
	 * 
	 * @param courierList
	 * @param os
	 */
	@Override
	public void pdfOutputStream(List<Courier> courierList,OutputStream os) {
		Document document = new Document();
		Rectangle rectangle = new Rectangle(urx, ury);
		document.setPageSize(rectangle);
		document.setMargins(0, 0, 0, 0);
		try {
			PdfWriter pdfwriter = PdfWriter.getInstance(document,  os);
			document.open();
			for(Courier courier: courierList){
				pageFormat(pdfwriter,courier);
				document.newPage();
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		document.close();
	}

	
}
