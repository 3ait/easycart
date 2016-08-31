package com.easycart.controller.web.cart;

public enum ToArea {
	
	china("86",0),hongkong("852",40),newzeland("64",5);
	
	private String areaCode;
	private double priceAdjust;
	
	private ToArea(String areaCode,double priceAdjust){
		this.areaCode = areaCode;
		this.priceAdjust = priceAdjust;
	}
	
	public String getAreaCode() {
		return areaCode;
	}
	public void setAreaCode(String areaCode) {
		this.areaCode = areaCode;
	}
	public double getPriceAdjust() {
		return priceAdjust;
	}
	public void setPriceAdjust(double priceAdjust) {
		this.priceAdjust = priceAdjust;
	}
	
}
