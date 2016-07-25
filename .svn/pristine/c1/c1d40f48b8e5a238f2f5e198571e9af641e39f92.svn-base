package com.easycart.controller.admin.product;

import java.util.List;

import javax.validation.constraints.DecimalMin;
import javax.validation.constraints.Min;
import javax.validation.constraints.Pattern;

import org.hibernate.validator.constraints.Length;
import org.springframework.web.multipart.MultipartFile;

import com.easycart.db.entity.Menu;
import com.easycart.db.entity.ProductBrand;
import com.easycart.db.entity.ProductImg;

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
public class ProductForm {

	@Min(1)
	private Integer productId;
	
	private Menu menu;
	@Min(1)
	private int menu1Id;
	@Min(1)
	private int menu2Id;
	@Min(1)
	private int brandId;
	
	private ProductBrand productBrand;
	
	@Length(min=0,max=200)
	private String productLable;
	private String mpn;
	
	
	@Min(0)
	private Integer stock;
	
	@Length(min=1,max=200)
	private String productNameCn;
	
	@Length(min=1,max=200)
	private String productNameEn;
	
	@DecimalMin("0")
	private Double price1;
	@DecimalMin("0")
	private Double price2;
	@DecimalMin("0")
	private Double price3;
	@DecimalMin("0")
	private Double price4;
	@DecimalMin("0")
	private Double cost;
	
	private Byte status;
	private Byte hot;
	private Byte promote;
	private Byte frontPage;
	private Byte recommend;
	@Min(0)
	private Integer soldNum;
	
	@DecimalMin("0")
	private Double weight;
	
	@Length(min=0,max=500)
	private String memo;
	
	private Integer createTime;
	private Integer modifyTime;
	
	private List<ProductImg> listImgList;
	
	private List<ProductImg> descImgList;
	
	private MultipartFile[] listImgs;
	
	private MultipartFile[] descImgs;
	

	public Menu getMenu() {
		return menu;
	}
	public void setMenu(Menu menu) {
		this.menu = menu;
	}
	public ProductBrand getProductBrand() {
		return productBrand;
	}
	public void setProductBrand(ProductBrand productBrand) {
		this.productBrand = productBrand;
	}
	public String getProductLable() {
		return productLable;
	}
	public void setProductLable(String productLable) {
		this.productLable = productLable;
	}
	public String getMpn() {
		return mpn;
	}
	public void setMpn(String mpn) {
		this.mpn = mpn;
	}
	public Integer getStock() {
		return stock;
	}
	public void setStock(Integer stock) {
		this.stock = stock;
	}
	public String getProductNameCn() {
		return productNameCn;
	}
	public void setProductNameCn(String productNameCn) {
		this.productNameCn = productNameCn;
	}
	public String getProductNameEn() {
		return productNameEn;
	}
	public void setProductNameEn(String productNameEn) {
		this.productNameEn = productNameEn;
	}
	public Double getPrice1() {
		return price1;
	}
	public void setPrice1(Double price1) {
		this.price1 = price1;
	}
	public Double getPrice2() {
		return price2;
	}
	public void setPrice2(Double price2) {
		this.price2 = price2;
	}
	public Double getPrice3() {
		return price3;
	}
	public void setPrice3(Double price3) {
		this.price3 = price3;
	}
	public Double getPrice4() {
		return price4;
	}
	public void setPrice4(Double price4) {
		this.price4 = price4;
	}
	public Double getCost() {
		return cost;
	}
	public void setCost(Double cost) {
		this.cost = cost;
	}
	public Byte getStatus() {
		return status;
	}
	public void setStatus(Byte status) {
		this.status = status;
	}
	public Byte getHot() {
		return hot;
	}
	public void setHot(Byte hot) {
		this.hot = hot;
	}
	public Byte getPromote() {
		return promote;
	}
	public void setPromote(Byte promote) {
		this.promote = promote;
	}
	public Byte getFrontPage() {
		return frontPage;
	}
	public void setFrontPage(Byte frontPage) {
		this.frontPage = frontPage;
	}
	public Byte getRecommend() {
		return recommend;
	}
	public void setRecommend(Byte recommend) {
		this.recommend = recommend;
	}
	public Integer getSoldNum() {
		return soldNum;
	}
	public void setSoldNum(Integer soldNum) {
		this.soldNum = soldNum;
	}
	public Double getWeight() {
		return weight;
	}
	public void setWeight(Double weight) {
		this.weight = weight;
	}
	public String getMemo() {
		return memo;
	}
	public void setMemo(String memo) {
		this.memo = memo;
	}
	public Integer getCreateTime() {
		return createTime;
	}
	public void setCreateTime(Integer createTime) {
		this.createTime = createTime;
	}
	public Integer getModifyTime() {
		return modifyTime;
	}
	public void setModifyTime(Integer modifyTime) {
		this.modifyTime = modifyTime;
	}
	public int getMenu1Id() {
		return menu1Id;
	}
	public void setMenu1Id(int menu1Id) {
		this.menu1Id = menu1Id;
	}
	public int getMenu2Id() {
		return menu2Id;
	}
	public void setMenu2Id(int menu2Id) {
		this.menu2Id = menu2Id;
	}
	public int getBrandId() {
		return brandId;
	}
	public void setBrandId(int brandId) {
		this.brandId = brandId;
	}
	public MultipartFile[] getListImgs() {
		return listImgs;
	}
	public void setListImgs(MultipartFile[] listImgs) {
		this.listImgs = listImgs;
	}
	public MultipartFile[] getDescImgs() {
		return descImgs;
	}
	public void setDescImgs(MultipartFile[] descImgs) {
		this.descImgs = descImgs;
	}
	public List<ProductImg> getListImgList() {
		return listImgList;
	}
	public void setListImgList(List<ProductImg> listImgList) {
		this.listImgList = listImgList;
	}
	public List<ProductImg> getDescImgList() {
		return descImgList;
	}
	public void setDescImgList(List<ProductImg> descImgList) {
		this.descImgList = descImgList;
	}
	public Integer getProductId() {
		return productId;
	}
	public void setProductId(Integer productId) {
		this.productId = productId;
	}
	
	
}
