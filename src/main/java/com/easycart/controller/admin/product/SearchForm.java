package com.easycart.controller.admin.product;

import javax.validation.constraints.Max;
import javax.validation.constraints.Min;

import org.hibernate.validator.constraints.Length;

/**
 * 查询表单提交
 * @author yaoliang
 *
 */
public class SearchForm {

	@Length(min=0,max=30)
	private String q;
	
	
	@Min(-1)
	@Max(2)
	private byte status = -1;
	@Min(-1)
	@Max(1)
	private byte hot = -1;
	@Min(-1)
	@Max(1)
	private byte promote = -1;
	@Min(-1)
	@Max(1)
	private byte frontPage = -1;
	@Min(-1)
	@Max(1)
	private byte recommend = -1;
	
	private int menu1Id = -1;
	private int menu2Id = -1;
	private int brandId = -1;
	
	public String getQ() {
		return q;
	}
	public void setQ(String q) {
		this.q = q;
	}
	public byte getStatus() {
		return status;
	}
	public void setStatus(byte status) {
		this.status = status;
	}
	public byte getHot() {
		return hot;
	}
	public void setHot(byte hot) {
		this.hot = hot;
	}
	public byte getPromote() {
		return promote;
	}
	public void setPromote(byte promote) {
		this.promote = promote;
	}
	public byte getFrontPage() {
		return frontPage;
	}
	public void setFrontPage(byte frontPage) {
		this.frontPage = frontPage;
	}
	public byte getRecommend() {
		return recommend;
	}
	public void setRecommend(byte recommend) {
		this.recommend = recommend;
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
	
	
}
