package com.zy.profit.gateway.util;

import java.io.IOException;
import java.util.Properties;

import org.springframework.core.io.ClassPathResource;
import org.springframework.core.io.support.PropertiesLoaderUtils;

/**
 * 
 * @author LL
 *
 */
public class SystemConfig {

	private static Properties properties = null;
	
	static{
		try {
			properties = PropertiesLoaderUtils.loadProperties(new ClassPathResource("systemConfig.properties"));
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	/**
	 * 项目的物理路径 
	 * @return
	 */
	public static String getWebRoot(){
		return System.getProperty("school.root");
	}
	
	/**
	 * 临时文件路径
	 * @return
	 */
	public static String getTmpPath(){
		return properties.getProperty("tmp");
	}
	
	/**
	 * 头像存放路径
	 * @return
	 */
	public static String getHeadImagePath(){
		return properties.getProperty("head.image.url");
	}
	
	/**
	 * 附件存放路径
	 * @return
	 */
	public static String getAttachmentPath(){
		return properties.getProperty("attachment");
	}
	
	/**
	 * 门户地址
	 * @return
	 */
	public static String getMemberUrl(){
		return properties.getProperty("member_url");
	}
	
}
