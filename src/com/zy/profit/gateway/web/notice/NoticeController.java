package com.zy.profit.gateway.web.notice;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.zy.base.entity.Notice;
import com.zy.base.service.NoticeService;
import com.zy.member.entity.Member;
import com.zy.profit.gateway.util.HttpUtils;

@Controller
@RequestMapping("/notice")
public class NoticeController {

	@Autowired
	private NoticeService noticeService;
	
	@RequestMapping("/list")
	public String list(Model model,HttpServletRequest request){
		
		model.addAttribute("notices", noticeService.getAllNotice());
		model.addAttribute("linkNoticeId",request.getParameter("id"));
		
		model.addAttribute("allNumb", noticeService.getActiveNoticeNumb());
		model.addAttribute("mainNumb", noticeService.getNoticeNumbByType(Notice.NOTICETYPE_MAIN));
		model.addAttribute("breakNumb", noticeService.getNoticeNumbByType(Notice.NOTICETYPE_BREAK));
		model.addAttribute("repairNumb", noticeService.getNoticeNumbByType(Notice.NOTICETYPE_REPAIR));
		
		// 未登录用户、不能查看公告详情（因目前公告详情嵌套在用户中心）
		Member sessionMember = HttpUtils.getMember(request);
		if(sessionMember == null){
			return "redirect:/login";
		}
		
		return "notice/noticeList";
	}
	
	@RequestMapping("/breakList")
	public String breankNotice(Model model){
		
		model.addAttribute("notices", noticeService.getNoticeByStatusAndType(Notice.NOTICETYPE_BREAK));
		model.addAttribute("noticeType", Notice.NOTICETYPE_BREAK);
		
		model.addAttribute("allNumb", noticeService.getActiveNoticeNumb());
		model.addAttribute("mainNumb", noticeService.getNoticeNumbByType(Notice.NOTICETYPE_MAIN));
		model.addAttribute("breakNumb", noticeService.getNoticeNumbByType(Notice.NOTICETYPE_BREAK));
		model.addAttribute("repairNumb", noticeService.getNoticeNumbByType(Notice.NOTICETYPE_REPAIR));
		
		
		return "notice/noticeList";
	}
	
	@RequestMapping("/mainList")
	public String mainNotice(Model model){
		
		model.addAttribute("notices", noticeService.getNoticeByStatusAndType(Notice.NOTICETYPE_MAIN));
		model.addAttribute("noticeType", Notice.NOTICETYPE_MAIN);
		
		model.addAttribute("allNumb", noticeService.getActiveNoticeNumb());
		model.addAttribute("mainNumb", noticeService.getNoticeNumbByType(Notice.NOTICETYPE_MAIN));
		model.addAttribute("breakNumb", noticeService.getNoticeNumbByType(Notice.NOTICETYPE_BREAK));
		model.addAttribute("repairNumb", noticeService.getNoticeNumbByType(Notice.NOTICETYPE_REPAIR));
		
		return "notice/noticeList";
	}
	
	@RequestMapping("/repairList")
	public String repairNotice(Model model){
		
		model.addAttribute("notices", noticeService.getNoticeByStatusAndType(Notice.NOTICETYPE_REPAIR));
		model.addAttribute("noticeType", Notice.NOTICETYPE_REPAIR);
		
		model.addAttribute("allNumb", noticeService.getActiveNoticeNumb());
		model.addAttribute("mainNumb", noticeService.getNoticeNumbByType(Notice.NOTICETYPE_MAIN));
		model.addAttribute("breakNumb", noticeService.getNoticeNumbByType(Notice.NOTICETYPE_BREAK));
		model.addAttribute("repairNumb", noticeService.getNoticeNumbByType(Notice.NOTICETYPE_REPAIR));
		
		return "notice/noticeList";
	}
	
	
	
	
}
