package com.zy.profit.gateway.web;

import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.lang3.StringUtils;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.zy.common.util.AjaxResult;
import com.zy.profit.gateway.util.HttpUtils;
import com.zy.profit.gateway.util.ImageUtils;
import com.zy.profit.gateway.util.SystemConfig;

/**
 * 
 * @author LL
 *
 */
@RequestMapping("/file")
@Controller
public class FileUploadController {

	
	@RequestMapping("/upload/headImage")
	@ResponseBody
	public AjaxResult uploadHeadImg(HttpServletRequest request) {
		
		MultipartHttpServletRequest multipartRequest = (MultipartHttpServletRequest) request;
		
		AjaxResult ajaxResult = new AjaxResult();
		ajaxResult.setSuccess(false);
		
		try {
			MultipartFile mf = multipartRequest.getFile("headImage");
			String originFileName = mf.getOriginalFilename();
			String ext = originFileName.substring(originFileName.lastIndexOf(".")).toLowerCase();
			
			InputStream is = mf.getInputStream();
			String tmpPath = SystemConfig.getTmpPath();
			String fileName = UUID.randomUUID() + ext;
			String filePath = HttpUtils.getBasePath(request) + tmpPath;
			
			File file = new File(filePath);
			if(!file.exists()){
				file.mkdirs();
			}
			
			ImageUtils.saveHeadImage(is, filePath + "/" + fileName);
			
			ajaxResult.setData(tmpPath + "/" + fileName);
			
			ajaxResult.setSuccess(true);
		} catch (Exception e) {
			e.printStackTrace();
//			ajaxResult.setMsg(Constants.MSG_EXCEPTION);
		}
		return ajaxResult;
	}
	
	@RequestMapping("/download")
	public ResponseEntity<byte[]> download(HttpServletRequest request) throws IOException {
		String fileUrl = request.getParameter("fileUrl");
    	String fileName = request.getParameter("fileName");
		
    	if(StringUtils.isBlank(fileUrl) && StringUtils.isBlank(fileName)){
    		return null;
    	}
    	fileUrl = SystemConfig.getWebRoot() + fileUrl;
    	return HttpUtils.download(fileName, fileUrl);
	}
	
}
