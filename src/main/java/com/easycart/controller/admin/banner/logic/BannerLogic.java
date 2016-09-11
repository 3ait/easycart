package com.easycart.controller.admin.banner.logic;

import java.io.File;
import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.transaction.Transactional;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.web.multipart.MultipartFile;

import com.easycart.db.dao.impl.BannerDao;
import com.easycart.db.entity.Banner;
import com.easycart.utils.DateHelper;
import com.imgcompress.ImgCompress;

@Component("bannerLogic")
public class BannerLogic {
	private static Logger logger = LogManager.getLogger(BannerLogic.class);
	
	@Autowired
	BannerDao bannerDao;

	//PX
	private final int bannerWidth = 1420;
	private final int bannerHeight = 542;
	
	/**
	 * 列举首页banner图
	 * @return
	 */
	public List<Banner> listBanner() {
		return bannerDao.list(new Banner());
	}

	/**
	 * 新增banner图
	 * @param fuMultipartFile
	 * @param url
	 * @param position=1 表示首页banner
	 */
	@Transactional(rollbackOn=Exception.class)
	public void saveBanner(MultipartFile fuMultipartFile, Banner banner,HttpServletRequest request) {
		
		try {
			if((fuMultipartFile.getOriginalFilename().toLowerCase().endsWith("jpg") ||
					fuMultipartFile.getOriginalFilename().toLowerCase().endsWith("gif")||
					fuMultipartFile.getOriginalFilename().toLowerCase().endsWith("png")||
					fuMultipartFile.getOriginalFilename().toLowerCase().endsWith("bmp"))){
				
				String imgDir = "/resources/banner/";
				
				String fileName = "banner" + DateHelper.getTime() + fuMultipartFile.getOriginalFilename().substring(fuMultipartFile.getOriginalFilename().lastIndexOf("."));
				String filePath = request.getServletContext().getRealPath("/") + imgDir + fileName;
				
				ImgCompress.resizePic(fuMultipartFile.getInputStream(), new File(filePath), bannerWidth,bannerHeight);
				
				banner.setImgHref(imgDir + fileName);
			}
			bannerDao.save(banner);
		
			
		} catch (IOException e) {
			e.printStackTrace();
		}
		
	}

	/**
	 * 删除
	 * @param bannerId
	 */
	@Transactional(rollbackOn=Exception.class)
	public void deleteBannerById(int bannerId) {
		Banner banner = bannerDao.getById(bannerId);
		try {
			new File(banner.getImgHref()).deleteOnExit();
		} catch (Exception e) {
			logger.error(e);
		}
		bannerDao.delete(banner);
	}
	
	/**
	 * 更新
	 * @param banner
	 */
	@Transactional(rollbackOn=Exception.class)
	public void updateBanner(Banner banner) {
		Banner dbBanner = bannerDao.getById(banner.getId());
		dbBanner.setUrl(banner.getUrl());
		dbBanner.setTitle(banner.getTitle());
		dbBanner.setType(banner.getType());
		bannerDao.update(dbBanner);
	}
	
	
}
