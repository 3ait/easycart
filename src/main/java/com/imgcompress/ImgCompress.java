package com.imgcompress;

import java.awt.Graphics2D;
import java.awt.image.BufferedImage;
import java.io.File;
import java.io.IOException;
import java.io.InputStream;

import javax.imageio.ImageIO;

/**
 * 图片压缩处理
 * @author Leo
 */
public class ImgCompress {
	
	
	/**
	 * 重新定义图片尺寸宽度
	 * @param File inputPic
	 * @param File outputPic
	 * @param outputPicWidth
	 * @param flag ==0?正方形:1 等比例缩放
	 * 
	 */
	public static void resizePicture(File inputPic,File outputPic,int outputPicWidth,int flag){
		BufferedImage image;
		try {
			image = ImageIO.read(inputPic);
			int outputPicHeight = outputPicWidth;
			
			if(flag==1){
				outputPicHeight = outputPicWidth*image.getWidth()/image.getWidth();
			}
			
			BufferedImage bufferedImage = new BufferedImage(outputPicWidth, outputPicHeight,BufferedImage.TYPE_INT_RGB );
			Graphics2D graphics2d = bufferedImage.createGraphics();
			graphics2d.drawImage(image, 0,0,outputPicWidth,outputPicHeight, null);
			bufferedImage.flush();
			ImageIO.write(bufferedImage, "jpg", outputPic);
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	/**
	 * 重新定义图片尺寸宽度
	 * @param File inputPic
	 * @param File outputPic
	 * @param outputPicWidth
	 * @param flag ==0?正方形:1 等比例缩放
	 * 
	 */
	public static void resizePicture(InputStream fileInputStream,File outputPic,int outputPicWidth,int flag){
		BufferedImage image;
		try {
			image = ImageIO.read(fileInputStream);
			
			if(image.getWidth()<outputPicWidth){
				outputPicWidth =  image.getWidth();
			}
			
			int outputPicHeight = outputPicWidth;
			if(flag==1){
				outputPicHeight = outputPicWidth*image.getHeight()/image.getWidth();
			}
			
			BufferedImage bufferedImage = new BufferedImage(outputPicWidth, outputPicHeight,BufferedImage.TYPE_INT_RGB );
			Graphics2D graphics2d = bufferedImage.createGraphics();
			
			if(image.getWidth()>outputPicWidth){
				graphics2d.drawImage(image, 0,0,outputPicWidth,outputPicHeight, null);
			}else{
				graphics2d.drawImage(image, 0,0,image.getWidth(),outputPicHeight, null);
			}
			
			bufferedImage.flush();
			ImageIO.write(bufferedImage, "jpg", outputPic);
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	/**
	 * 重新自定义尺寸 固定高宽
	 * @param fileInputStream
	 * @param outputPic
	 * @param outputPicWidth
	 * @param outputPicHeight
	 */
	public static void resizePic(InputStream fileInputStream,File outputPic,int outputPicWidth,int outputPicHeight){
		BufferedImage image;
		try {
			image = ImageIO.read(fileInputStream);
			
			if(image.getWidth()<outputPicWidth){
				outputPicWidth =  image.getWidth();
				outputPicHeight = image.getHeight();
			}
			BufferedImage bufferedImage = new BufferedImage(outputPicWidth, outputPicHeight,BufferedImage.TYPE_INT_RGB );
			Graphics2D graphics2d = bufferedImage.createGraphics();
			graphics2d.drawImage(image, 0,0,outputPicWidth,outputPicHeight, null);
			bufferedImage.flush();
			ImageIO.write(bufferedImage, "jpg", outputPic);
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
}