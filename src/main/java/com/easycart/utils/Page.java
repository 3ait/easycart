package com.easycart.utils;


/**
 * 翻页参数传递
 * @author yaoliang
 *
 */
public class Page {

	
	private int st = 0;
	private int rows = 30;
	
	//总记录数
	private int total;
	private int totalPage;
	
	//页码
	private int pageNum;
	
	private String order = "desc";
	private String orderby = "id";
	

	
	
	public Page(){
	}
	
	public Page(int rows){
		this.rows = rows;
	}
	
	
	/**
	 * 
	 * @param pageNum
	 * @param total
	 */
	public Page(int pageNum,int total){
		
		this.pageNum = pageNum;
		this.total = total;
		
		if(total%this.getRows()==0){
			totalPage = total/this.getRows();
		}else{
			totalPage = total/this.getRows()+1;
		}
		if(pageNum<1){
			this.pageNum  = 1;
		}else if(pageNum>totalPage){
			this.pageNum  = totalPage;
		}
		this.setSt((this.pageNum-1)*this.getRows());
	}
	/**
	 * 
	 * @param pageNum
	 * @param total
	 */
	public Page(int pageNum,int rows,int total){
		
		this.pageNum = pageNum;
		this.total = total;
		this.rows = rows;
		
		if(total%this.getRows()==0){
			totalPage = total/this.getRows();
		}else{
			totalPage = total/this.getRows()+1;
		}
		if(pageNum<1){
			this.pageNum  = 1;
		}else if(pageNum>totalPage){
			this.pageNum  = totalPage;
		}
		this.setSt((this.pageNum-1)*this.getRows());
	}
	
	/**
	 * 
	 * @param totalNum
	 * @param pageNum
	 * @return
	 */
	public int getPageNum(int totalNum,int pageNum){
		
		if(totalNum%rows==0){
			totalPage = totalNum/rows;
		}else{
			totalPage = totalNum/rows+1;
		}
		
		if(pageNum>totalPage){
			pageNum = totalPage;
		}else if(pageNum<1){
			pageNum = 1;
		}
		
		this.setSt((pageNum-1)*rows);
		
		return pageNum;
	}
	

	public int getSt() {
		return st;
	}
	public void setSt(int st) {
		this.st = st;
	}
	public int getRows() {
		return rows;
	}
	public void setRows(int rows) {
		this.rows = rows==0?Integer.MAX_VALUE:rows;
	}
	/**
	 * 已经转换为大
	 * @return
	 */
	public String getOrder() {
		return order;
	}
	public void setOrder(String order) {
		this.order = order.toUpperCase();
	}
	public String getOrderby() {
		return orderby;
	}
	public void setOrderby(String orderby) {
		this.orderby = orderby;
	}

	public int getTotal() {
		return total;
	}

	public void setTotal(int total) {
		this.total = total;
	}

	public int getTotalPage() {
		return totalPage;
	}

	public void setTotalPage(int totalPage) {
		this.totalPage = totalPage;
	}

	public int getPageNum() {
		return pageNum;
	}

	public void setPageNum(int pageNum) {
		this.pageNum = pageNum;
	}


	
	
}
