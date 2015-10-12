package com.zy.profit.gateway.web;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * 
 * @author Administrator
 *
 */
@Controller
@RequestMapping("/findpwd")
public class FindPwdController {

	@RequestMapping("/select")
	public String select(){
		return "/findpwd/select";
	}
	
	@RequestMapping("/mobile1")
	public String mobile1(){
		return "/findpwd/mobile1";
	}
	
}
