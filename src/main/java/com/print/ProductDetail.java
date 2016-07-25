package com.print;



public class ProductDetail {
	
	private int productDetailId;
	
	private float weight;
	
	/**
	 * 物品Id / 商家编码
	 */
	private String productId;
	/**
	 * mpn
	 */
	private String mpn;
	/**
	 * 邮寄物品简称
	 */
	private String productName;
	
	/**
	 * 
	 */
	private String productNameEn;
	/**
	 * 物品全称
	 */
	private String productFullName;
	/**
	 * 邮寄物品件数
	 */
	private Integer num;
	
	/**
	 * 申报价值
	 */
	private String declaredValue;
	
	/**
	 * 原产地
	 */
	private String orign;

	public String location;
	
	public Float weight_single;
	
	

	public Float getWeight_single() {
		return weight_single;
	}

	public void setWeight_single(Float weight_single) {
		this.weight_single = weight_single;
	}


	public String getLocation() {
		return location;
	}

	public void setLocation(String location) {
		this.location = location;
	}
	
	public String getProductName() {
		return productName;
	}

	public void setProductName(String productName) {
		this.productName = productName;
	}

	
	public int getProductDetailId() {
		return productDetailId;
	}

	public void setProductDetailId(int productDetailId) {
		this.productDetailId = productDetailId;
	}

	public Integer getNum() {
		return num;
	}

	public void setNum(Integer num) {
		this.num = num;
	}


	public String getDeclaredValue() {
		return declaredValue;
	}

	public void setDeclaredValue(String declaredValue) {
		this.declaredValue = declaredValue;
	}

	public String getOrign() {
		return orign;
	}

	public void setOrign(String orign) {
		this.orign = orign;
	}

	public String getProductFullName() {
		return productFullName;
	}

	public void setProductFullName(String productFullName) {
		this.productFullName = productFullName;
	}

	public String getProductId() {
		return productId;
	}

	public void setProductId(String productId) {
		this.productId = productId;
	}

	
	public float getWeight() {
		return weight;
	}

	public void setWeight(float weight) {
		this.weight = weight;
	}

	public String getMpn() {
		return mpn;
	}

	public void setMpn(String mpn) {
		this.mpn = mpn;
	}

	public String getProductNameEn() {
		return productNameEn;
	}

	public void setProductNameEn(String productNameEn) {
		this.productNameEn = productNameEn;
	}
	
}
