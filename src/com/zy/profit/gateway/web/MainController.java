package com.zy.profit.gateway.web;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.zy.profit.gateway.util.Constants;

@Controller
@RequestMapping("/main")
public class MainController {

	@RequestMapping
	public String main(HttpServletRequest request, Model model){
		
		model.addAttribute(Constants.MENU_NAME, Constants.MENU_NAME_MAIN);
		
		return "/main";
	}
	
	@RequestMapping("/person")
	public String person(HttpServletRequest request, Model model){
		
		model.addAttribute(Constants.MENU_NAME, Constants.MENU_NAME_PERSON);
		
		return "/account/person";
	}
	
}
