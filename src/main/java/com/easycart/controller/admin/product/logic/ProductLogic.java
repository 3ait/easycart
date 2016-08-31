package com.easycart.controller.admin.product.logic;

import java.io.File;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.transaction.Transactional;

import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.web.multipart.MultipartFile;

import com.easycart.controller.BaseLogic;
import com.easycart.controller.admin.product.ProductForm;
import com.easycart.controller.admin.product.SearchForm;
import com.easycart.controller.web.index.ProductView;
import com.easycart.db.dao.IMenuDao;
import com.easycart.db.dao.IProductBrandDao;
import com.easycart.db.dao.IProductDao;
import com.easycart.db.dao.IProductImgDao;
import com.easycart.db.entity.Menu;
import com.easycart.db.entity.Product;
import com.easycart.db.entity.ProductBrand;
import com.easycart.db.entity.ProductImg;
import com.easycart.utils.DateHelper;
import com.easycart.utils.Page;
import com.imgcompress.ImgCompress;

@Component("productLogic")
public class ProductLogic extends BaseLogic{

	@Autowired
	IMenuDao menuDao;
	@Autowired
	IProductBrandDao productBrandDao;
	@Autowired
	IProductDao productDao;
	@Autowired
	IProductImgDao productImgDao;
	
	private final int listImgWidth = 500;
	private final int descImgWidth = 640;
	
	
	/**
	 * 获取一级菜单分类
	 * @return
	 */
	public List<Menu> getMenu1() {
		return menuDao.getLevel1Menu();
	}

	/**
	 * 根据一级菜单获取二级菜单
	 * @param menu1Id
	 * @return List<Menu>
	 */
	public List<Menu>  getMenu2ByFatherId(int menu1Id) {
		return menuDao.getSubMenuByFatherId(menu1Id);
	}
	
	/**
	 * 根据一级菜单获取品牌
	 * @param menu1Id
	 * @return List<ProductBrand>
	 */
	public List<ProductBrand>  getBrandByMenuId(int menu1Id) {
		return productBrandDao.getByMenu1Id(menu1Id);
	}

	/**
	 * 保存产品
	 * @param productForm
	 * @throws Exception 
	 */
	@Transactional(rollbackOn=Exception.class)
	public void saveProduct(ProductForm productForm,HttpServletRequest request) throws Exception {
		
		//保存产品
		Product product = new Product();
		BeanUtils.copyProperties(productForm, product);
		Menu menu2 = new Menu();
		menu2.setId(productForm.getMenu2Id());
		product.setMenu(menu2);
		
		ProductBrand pb = new ProductBrand();
		pb.setId(productForm.getBrandId());
		product.setProductBrand(pb);
		product.setCreateTime(DateHelper.getTime());
		product.setModifyTime(DateHelper.getTime());
		productDao.save(product);
		
		saveImg(product, productForm, request);
	}
	
	/**
	 * 更新产品
	 * @param productForm
	 * @param request
	 */
	@Transactional(rollbackOn=Exception.class)
	public Product updateProduct(ProductForm productForm,HttpServletRequest request) throws Exception {

		
		//保存产品
		Product product = productDao.getById(productForm.getProductId());
		if(product!=null){
			BeanUtils.copyProperties(productForm, product);
			Menu menu2 = new Menu();
			menu2.setId(productForm.getMenu2Id());
			product.setMenu(menu2);
			
			ProductBrand pb = new ProductBrand();
			pb.setId(productForm.getBrandId());
			product.setProductBrand(pb);
			product.setModifyTime(DateHelper.getTime());
			productDao.update(product);
			
			saveImg(product, productForm, request);
			
		}
		
		return product;
	}
	
	/**
	 * 保存图片
	 * @param product
	 * @param productForm
	 * @param request
	 * @throws Exception
	 */
	private void saveImg(Product product, ProductForm productForm,HttpServletRequest request)  throws Exception{

		//保存List图片
		//jpg gif png bmp
		File folder = new File(request.getServletContext().getRealPath("/") + imgDir + DateHelper.getYYYYMMDD());
		if(!folder.isDirectory()){
			folder.mkdirs();
		}
		
		//处理产品图片
		for(int i=0;i<productForm.getListImgs().length;i++){
			//保存图片
			MultipartFile file = productForm.getListImgs()[i];
			if(!(file.getOriginalFilename().toLowerCase().endsWith("jpg") ||
					file.getOriginalFilename().toLowerCase().endsWith("gif")||
					file.getOriginalFilename().toLowerCase().endsWith("png")||
					file.getOriginalFilename().toLowerCase().endsWith("bmp"))){
				continue;
			}

			//保存小图
			String fileName = product.getId() + i + "_list" + DateHelper.getTime() + file.getOriginalFilename().substring(file.getOriginalFilename().lastIndexOf("."));
			String listFileName = folder.getPath() + "/" + fileName;
			
			ImgCompress.resizePicture(file.getInputStream(), new File(listFileName), listImgWidth, 0);
			
			
			//保存图片数据
			ProductImg pImg = new ProductImg();
			pImg.setDefaultImg((byte)1);
			pImg.setHref(imgDir + DateHelper.getYYYYMMDD() + "/" + fileName );
			pImg.setImgType(LIST);
			pImg.setPosition(0);
			pImg.setProduct(product);
			productImgDao.save(pImg);
		}
		
		//处理描述图片
		for(int i=0;i<productForm.getDescImgs().length;i++){
			//保存图片
			MultipartFile file = productForm.getDescImgs()[i];
			if(!(file.getOriginalFilename().toLowerCase().endsWith("jpg") ||
					file.getOriginalFilename().toLowerCase().endsWith("gif")||
					file.getOriginalFilename().toLowerCase().endsWith("png")||
					file.getOriginalFilename().toLowerCase().endsWith("bmp"))){
				continue;
			}
			
			
			//保存描述图
			String fileName = product.getId() + i + "_desc" + DateHelper.getTime() + file.getOriginalFilename().substring(file.getOriginalFilename().lastIndexOf("."));
			String descFileName = folder.getPath() + "/" + fileName;
			
			ImgCompress.resizePicture(file.getInputStream(), new File(descFileName), descImgWidth, 1);
			
			//保存图片数据
			ProductImg pImg = new ProductImg();
			pImg.setDefaultImg((byte)1);
			pImg.setHref(imgDir + DateHelper.getYYYYMMDD() + "/" + fileName );
			pImg.setImgType(this.DESC);
			pImg.setPosition(0);
			pImg.setProduct(product);
			
			productImgDao.save(pImg);
			
		}
	
	}
	
	/**
	 * search
	 * @return
	 */
	@Transactional(rollbackOn=Exception.class)
	public List<ProductView> getProductViewList(SearchForm searchForm,Page page){
		
		return super.getProductViewList(productDao.search(searchForm,page),null);
	}
	
	/**
	 * search
	 * @return
	 */
	@Transactional(rollbackOn=Exception.class)
	public int getProductViewListCount(SearchForm searchForm,Page page){
		return productDao.searchCount(searchForm,page);
	}

	/**
	 * 列表直接编辑保存
	 * @param product
	 */
	@Transactional(rollbackOn=Exception.class)
	public void listEditSave(Product product) {
		Product p = productDao.getById(product.getId());
		p.setId(product.getId());
		p.setCost(product.getCost());
		p.setPrice1(product.getPrice1());
		p.setStock(product.getStock());
		p.setStatus(product.getStatus());
		p.setSoldNum(product.getSoldNum());
		p.setHot(product.getHot());
		p.setPromote(product.getPromote());
		p.setFrontPage(product.getFrontPage());
		p.setRecommend(product.getRecommend());
		p.setMemo(product.getMemo());
		
		productDao.update(p);
	}
	
	/**
	 * 根据productId获取
	 * @param productId
	 * @return
	 */
	@Transactional(rollbackOn=Exception.class)
	public ProductForm getByProductId(int productId) {
		ProductForm productForm = new ProductForm();
		
		Product product = productDao.getById(productId);
		BeanUtils.copyProperties(product, productForm);
		
		productForm.setProductId(productId);
		int brandId = product.getProductBrand()==null?-1:product.getProductBrand().getId();
		productForm.setBrandId(brandId);
		productForm.setMenu1Id(product.getMenu().getFatherId());
		productForm.setMenu2Id(product.getMenu().getId());
		
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
		productForm.setListImgList(listImgs);
		productForm.setDescImgList(descImgs);
		
		return productForm;
	}
	/**
	 * 删除图片
	 * @param imgId
	 * @return
	 */
	@Transactional(rollbackOn=Exception.class)
	public boolean delImgById(int imgId,HttpServletRequest request) {
		boolean ret = true;
		
		ProductImg img = productImgDao.getById(imgId);
		new File(request.getServletContext().getRealPath("/")+img.getHref()).deleteOnExit();
		
		boolean delFlag = productImgDao.delete(img);
		return ret && delFlag;
	}

}
