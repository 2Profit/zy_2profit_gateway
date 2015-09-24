package com.zy.profit.gateway.web;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.zy.base.entity.Notice;
import com.zy.base.service.NoticeService;
import com.zy.profit.gateway.util.Constants;

@Controller
@RequestMapping("/main")
public class MainController {

	@Autowired
	private NoticeService noticeService;
	
	@RequestMapping
	public String main(HttpServletRequest request, Model model){
		
		model.addAttribute("notices", noticeService.getNoticeByStatusAndType(Notice.NOTICETYPE_MAIN));
		model.addAttribute(Constants.MENU_NAME, Constants.MENU_NAME_MAIN);
		return "/main";
	}
	
	@RequestMapping("/person")
	public String person(HttpServletRequest request, Model model){
		
		model.addAttribute(Constants.MENU_NAME, Constants.MENU_NAME_PERSON);
		
		return "/account/person";
	}
	
}
