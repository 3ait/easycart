package com.easycart.controller;

import java.text.DecimalFormat;
import java.util.ArrayList;
import java.util.List;
import java.util.stream.Collectors;

import com.easycart.controller.web.index.ProductView;
import com.easycart.db.entity.Customer;
import com.easycart.db.entity.Product;
import com.easycart.db.entity.ProductImg;

/**
 * logic
 * @author yaoliang
 *
 */
public abstract class BaseLogic{

	//产品表 imgType = list
	public final String LIST = "list";
	//产品表 imgType = Desc
	public final String DESC = "desc";
	
	/**
	 * "/resources/product_img/"
	 */
	public static final String imgDir = "resources/product_img/";
	
	/**
	 * 获取产品和图片的组合，返回给页面
	 * @param productList
	 * @return  List<ProductView> 
	 */
	public List<ProductView> getProductViewList(List<Product> productList,Customer customer){
		List<ProductView> productViewList = new ArrayList<>();
		productList.forEach(product -> {
			productViewList.add(getProductView(product,customer));
		});
		
		return productViewList;
	}
	
	/**
	 * 获取产品和图片的组合，返回给页面
	 * @param Product
	 * @return  ProductView
	 */
	public ProductView getProductView(Product product,Customer customer){
		ProductView pv = new ProductView();
		pv.setProduct(product);
		if(customer!=null){
			pv.setDiscountPrice(Double.valueOf(new DecimalFormat(".00").format(customer.getDiscount()*product.getPrice1())));
		}else{
			pv.setDiscountPrice(Double.valueOf(new DecimalFormat(".00").format(product.getPrice1())));
		}
		List<ProductImg> allImgs = new ArrayList<>(product.getProductImgs());
		
		List<ProductImg> listImgs = new ArrayList<>();
		List<ProductImg> descImgs = new ArrayList<>();
		
		allImgs.forEach(p -> {
			//区分list desc 图片
			if(p.getImgType().equals(LIST)){
				listImgs.add(p);
			}else{
				descImgs.add(p);
			}
		});
		listImgs.sort((p1,p2) -> p1.getId().compareTo(p2.getId()));
		descImgs.sort((p1,p2) -> p1.getId().compareTo(p2.getId()));
		pv.setProductImgList(listImgs);
		pv.setDescImgs(descImgs);
		
		List<ProductImg> imgDefaultList =  pv.getProductImgList().stream().filter(img -> img.getDefaultImg()== (byte)1).collect(Collectors.toList());
		if(imgDefaultList.size()>0){
			pv.setDefaultImg(imgDefaultList.get(0));
		}else{
			pv.setDefaultImg(new ProductImg());
		}
		return pv;
	}
	
	public static void main(String[] args){
		Double d1 = 11112.99;
		Double d2 = 6.0;
		DecimalFormat df = new DecimalFormat(".00");
		System.out.println(df.format(d1*d2));
	}
}
