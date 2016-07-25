package com.easycart.controller.admin.category;
// Generated 2016-5-6 11:43:32 by Hibernate Tools 4.3.1.Final

import java.util.HashSet;
import java.util.Set;

import javax.validation.constraints.DecimalMax;
import javax.validation.constraints.DecimalMin;
import javax.validation.constraints.Min;
import javax.validation.constraints.Pattern;

import org.hibernate.validator.constraints.Length;

/**
@Null   被注释的元素必须为 null  
@NotNull    被注释的元素必须不为 null  
@AssertTrue     被注释的元素必须为 true  
@AssertFalse    被注释的元素必须为 false  
@Min(value)     被注释的元素必须是一个数字，其值必须大于等于指定的最小值  
@Max(value)     被注释的元素必须是一个数字，其值必须小于等于指定的最大值  
@DecimalMin(value)  被注释的元素必须是一个数字，其值必须大于等于指定的最小值  
@DecimalMax(value)  被注释的元素必须是一个数字，其值必须小于等于指定的最大值  
@Size(max=, min=)   被注释的元素的大小必须在指定的范围内  
@Digits (integer, fraction)     被注释的元素必须是一个数字，其值必须在可接受的范围内  
@Past   被注释的元素必须是一个过去的日期  
@Future     被注释的元素必须是一个将来的日期  
@Pattern(regex=,flag=)  被注释的元素必须符合指定的正则表达式  
  
Hibernate Validator 附加的 constraint  
@NotBlank(message =)   验证字符串非null，且长度必须大于0  
@Email  被注释的元素必须是电子邮箱地址  
@Length(min=,max=)  被注释的字符串的大小必须在指定的范围内  
@NotEmpty   被注释的字符串的必须非空  
@Range(min=,max=,message=)  被注释的元素必须在合适的范围内  
 */
public class MenuForm implements java.io.Serializable {

	@Min(1)
	private Integer id;
	
	@Length(min=1, max=50,message="中文名称1-50个字符")
	private String nameCn;
	
	@Length(min=1, max=100,message="英文名称需唯一")
	@Pattern(regexp="[a-z,0-9,A-Z,\\s]+")
	private String nameEn;
	private int level;
	
	
	@Min(0)
	private Integer position;
	private Integer fatherId;
	
	@DecimalMin(value="0")
	@DecimalMax(value="100")
	private Double unitePrice;
	
	@DecimalMin(value="0")
	@DecimalMax(value="100")
	private Double boxWeight;
	
	@DecimalMin(value="0")
	private Double otherCharge;
	
	private Set productBrands = new HashSet(0);
	private Set menuAttrs = new HashSet(0);
	private Set products = new HashSet(0);

	public MenuForm() {
	}

	public MenuForm(String nameCn, String nameEn, int level) {
		this.nameCn = nameCn;
		this.nameEn = nameEn;
		this.level = level;
	}

	public MenuForm(String nameCn, String nameEn, int level, Integer position, Integer fatherId, Double unitePrice,
			Double boxWeight, Double otherCharge, Set productBrands, Set menuAttrs, Set products) {
		this.nameCn = nameCn;
		this.nameEn = nameEn;
		this.level = level;
		this.position = position;
		this.fatherId = fatherId;
		this.unitePrice = unitePrice;
		this.boxWeight = boxWeight;
		this.otherCharge = otherCharge;
		this.productBrands = productBrands;
		this.menuAttrs = menuAttrs;
		this.products = products;
	}

	public Integer getId() {
		return this.id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getNameCn() {
		return this.nameCn;
	}

	public void setNameCn(String nameCn) {
		this.nameCn = nameCn;
	}

	public String getNameEn() {
		return this.nameEn;
	}

	public void setNameEn(String nameEn) {
		this.nameEn = nameEn;
	}

	public int getLevel() {
		return this.level;
	}

	public void setLevel(int level) {
		this.level = level;
	}

	public Integer getPosition() {
		return this.position;
	}

	public void setPosition(Integer position) {
		this.position = position;
	}

	public Integer getFatherId() {
		return this.fatherId;
	}

	public void setFatherId(Integer fatherId) {
		this.fatherId = fatherId;
	}

	public Double getUnitePrice() {
		return this.unitePrice;
	}

	public void setUnitePrice(Double unitePrice) {
		this.unitePrice = unitePrice;
	}

	public Double getBoxWeight() {
		return this.boxWeight;
	}

	public void setBoxWeight(Double boxWeight) {
		this.boxWeight = boxWeight;
	}

	public Double getOtherCharge() {
		return this.otherCharge;
	}

	public void setOtherCharge(Double otherCharge) {
		this.otherCharge = otherCharge;
	}

	public Set getProductBrands() {
		return this.productBrands;
	}

	public void setProductBrands(Set productBrands) {
		this.productBrands = productBrands;
	}

	public Set getMenuAttrs() {
		return this.menuAttrs;
	}

	public void setMenuAttrs(Set menuAttrs) {
		this.menuAttrs = menuAttrs;
	}

	public Set getProducts() {
		return this.products;
	}

	public void setProducts(Set products) {
		this.products = products;
	}

}
