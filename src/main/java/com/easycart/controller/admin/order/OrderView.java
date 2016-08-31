package com.easycart.controller.admin.order;

import java.util.List;

import com.easycart.controller.web.index.ProductView;
import com.easycart.db.entity.Order;
import com.easycart.db.entity.OrderRecord;

public class OrderView {

	Order order;

	List<OrderRecord> orderRecordList;
	List<ProductView> productViewList;
	
	String modifyTime;
	public Order getOrder() {
		return order;
	}

	public void setOrder(Order order) {
		this.order = order;
	}

	public List<OrderRecord> getOrderRecordList() {
		return orderRecordList;
	}

	public void setOrderRecordList(List<OrderRecord> orderRecordList) {
		this.orderRecordList = orderRecordList;
	}

	public String getModifyTime() {
		return modifyTime;
	}

	public void setModifyTime(String modifyTime) {
		this.modifyTime = modifyTime;
	}

	public List<ProductView> getProductViewList() {
		return productViewList;
	}

	public void setProductViewList(List<ProductView> productViewList) {
		this.productViewList = productViewList;
	}
	
	
}
