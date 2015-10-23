package com.zy.profit.gateway.util;

import java.awt.Dimension;
import java.awt.Graphics;
import java.awt.Image;
import java.awt.Point;
import java.awt.Rectangle;
import java.awt.image.BufferedImage;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.util.Iterator;

import javax.imageio.ImageIO;
import javax.imageio.ImageReadParam;
import javax.imageio.ImageReader;
import javax.imageio.stream.ImageInputStream;

public class ImageUtil {
	
	public static BufferedImage  zoomInImage(BufferedImage  originalImage, Integer times){
        int width = originalImage.getWidth()*times;
        int height = originalImage.getHeight()*times;
        BufferedImage newImage = new BufferedImage(width,height,originalImage.getType());
        Graphics g = newImage.getGraphics();
        g.drawImage(originalImage, 0,0,width,height,null);
        g.dispose();
        return newImage;
    }
    /**
     * 对图片进行放大
     * @param srcPath 原始图片路径(绝对路径)
     * @param newPath 放大后图片路径（绝对路径）
     * @param times 放大倍数
     * @return 是否放大成功
     */
    public static boolean zoomInImage(String srcPath,String newPath,Integer times){
        BufferedImage bufferedImage = null;
        try {
            File of = new File(srcPath);
            if(of.canRead()){
                bufferedImage =  ImageIO.read(of);
            }
        } catch (IOException e) {
            //TODO: 打印日志
            return false;
        }
        if(bufferedImage != null){
            bufferedImage = zoomInImage(bufferedImage,times);
            try {
                //TODO: 这个保存路径需要配置下子好一点
                ImageIO.write(bufferedImage, "JPG", new File(newPath)); //保存修改后的图像,全部保存为JPG格式
            } catch (IOException e) {
                // TODO 打印错误信息
                return false;
            }
        }
        return true;
    }
    /**
     * 对图片进行缩小
     * @param originalImage 原始图片
     * @param times 缩小倍数
     * @return 缩小后的Image
     */
    public static BufferedImage  zoomOutImage(BufferedImage  originalImage, Integer times){
        int width = originalImage.getWidth()/times;
        int height = originalImage.getHeight()/times;
        BufferedImage newImage = new BufferedImage(width,height,originalImage.getType());
        Graphics g = newImage.getGraphics();
        g.drawImage(originalImage, 0,0,width,height,null);
        g.dispose();
        return newImage;
    }
    /**
     * 对图片进行缩小
     * @param srcPath 源图片路径（绝对路径）
     * @param newPath 新图片路径（绝对路径）
     * @param times 缩小倍数
     * @return 保存是否成功
     */
    public static boolean zoomOutImage(String srcPath,String newPath,Integer times){
        BufferedImage bufferedImage = null;
        try {
            File of = new File(srcPath);
            if(of.canRead()){
                bufferedImage =  ImageIO.read(of);
            }
        } catch (IOException e) {
            //TODO: 打印日志
            return false;
        }
        if(bufferedImage != null){
            bufferedImage = zoomOutImage(bufferedImage,times);
            try {
                //TODO: 这个保存路径需要配置下子好一点
                ImageIO.write(bufferedImage, "JPG", new File(newPath)); //保存修改后的图像,全部保存为JPG格式
            } catch (IOException e) {
                // TODO 打印错误信息
                return false;
            }
        }
        return true;
    }
    
    
    public static void writeImage(File src,File des ,int width,int height) throws IOException{
    	
    	if(src==null||des==null ){
    		throw new IllegalArgumentException("src or des must not be null!");
    	}
    	
    	BufferedImage originalImage = ImageIO.read(src);
    	
    	int colorType=originalImage.getType();
    	
    	if(originalImage.getType()==BufferedImage.TYPE_CUSTOM){
    		colorType=BufferedImage.TYPE_INT_BGR;
    	}
    	
    	BufferedImage newImage = new BufferedImage(width,height,colorType);
    	
    	Graphics g = newImage.getGraphics();
        g.drawImage(originalImage, 0,0,width,height,null);
        g.dispose();
        
        ImageIO.write(newImage, des.getName().substring(des.getName().lastIndexOf(".")+1), des);
    	
    }
    
    /**
     * 切割图片
     * @param x 截点横坐标 (从左开始计数)
     * @param y 截点纵坐标 (从上开始计数)
     * @param width 截取的宽度
     * @param height 截取的长度
     * @param oldpath 图片位置
     * @param newpath 新生成的图片位置
     */
    public static void cutImage(int x, int y, int width, int height, String oldpath, String newpath) {
    	FileInputStream is = null;
    	ImageInputStream iis = null;
 
    	//这个是获取图片扩展名的方法，比如：jpg。我这里有现成的，如果没有，自己实现
    	String imgType = oldpath.substring(oldpath.lastIndexOf(".") + 1, oldpath.length());
    	try {
    		is = new FileInputStream(oldpath);
			Iterator<ImageReader> it = ImageIO.getImageReadersByFormatName(imgType);
			ImageReader reader = it.next();
			iis = ImageIO.createImageInputStream(is);
			reader.setInput(iis, true);
			ImageReadParam param = reader.getDefaultReadParam();
			Point p = new Point();
			p.setLocation(x, y);
			Dimension d = new Dimension();
			d.setSize(width, height);
			Rectangle rect = new Rectangle(p, d);
			param.setSourceRegion(rect);
			BufferedImage bi = reader.read(0, param);
			ImageIO.write(bi, imgType, new File(newpath));
			is.close();
			iis.close();
		} catch (Exception e) {
			System.out.println(e.getStackTrace());
		}
    }
    
    /**
     * 缩略图片
     * @param oldpath 原图片
     * @param newpath 新生成的图片存放地址
     * @param wdith   缩略后的宽
     * @param height  缩略后的高
     */
    public static void scaleImage(String oldpath, String newpath, int wdith, int height) {
    	// 获取老的图片
    	File oldimg = new File(oldpath);
		try {
			BufferedImage bi = ImageIO.read(oldimg);
			Image Itemp = bi.getScaledInstance(wdith, height, BufferedImage.SCALE_SMOOTH);
			BufferedImage thumbnail = new BufferedImage(wdith, height, BufferedImage.TYPE_INT_RGB);
			thumbnail.getGraphics().drawImage(Itemp, 0, 0, null);
			// 缩略后的图片路径
			File newimg = new File(newpath);
			//FileOutputStream out = new FileOutputStream(newimg);
			// 绘图
			//JPEGImageEncoder encoder = JPEGCodec.createJPEGEncoder(out);
			//JPEGEncodeParam param = encoder.getDefaultJPEGEncodeParam(thumbnail);
			//param.setQuality(1.0f, false);
			//encoder.encode(thumbnail);
			//out.close();
			String formatName = newpath.substring(newpath.lastIndexOf(".") + 1); 
			ImageIO.write(thumbnail,  formatName , newimg );
			bi.flush();
			bi = null;
		} catch (IOException e) {
			e.printStackTrace();
		}
    }
    
    /**
	 * 获取图片的宽、高
	 * @param src
	 * @return
	 * @throws IOException
	 */
	public static Integer[] getImageWidthHeight(File src) throws IOException {
		if (src == null) {
			throw new IllegalArgumentException("src must not be null!");
		}
		BufferedImage originalImage = ImageIO.read(src);
		return new Integer[]{originalImage.getWidth(), originalImage.getHeight()};
	}
    
    
    public static void main(String[] args) throws IOException {
    	
    	//writeImage(new File("F:\\api结构图\\colection.bmp"),new File("F:\\api结构图\\ffdsf.bmp"),1000,1000);
    	ImageUtil.scaleImage("D:\\test\\old.png", "D:\\test\\new.png", 300, 300);
    	cutImage(19, 100, 200, 200, "D:\\test\\new.png", "D:\\test\\new1.png");
    }

}
