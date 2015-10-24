package com.zy.profit.gateway.web;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/help")
public class HelpController {

	@RequestMapping("/aboutUs")
	public String aboutUs(){
		
		return "help/aboutUs";
	}
	
	@RequestMapping("/moreInfo")
	public String moreInfo(Model model, HttpServletRequest request){
		
		model.addAttribute("tabId", request.getParameter("id"));
		
		return "help/moreInfo";
	}
	
	@RequestMapping("/joinUs")
	public String joinUs(){
		
		return "help/joinUs";
	}
	
	
}
