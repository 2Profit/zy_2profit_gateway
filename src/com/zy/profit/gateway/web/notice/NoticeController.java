package com.zy.profit.gateway.web.notice;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.zy.base.entity.Notice;
import com.zy.base.service.NoticeService;

@Controller
@RequestMapping("/notice")
public class NoticeController {

	@Autowired
	private NoticeService noticeService;
	
	@RequestMapping("/list")
	public String list(Model model){
		
		model.addAttribute("notices", noticeService.getAllNotice());
		
		model.addAttribute("allNumb", noticeService.getActiveNoticeNumb());
		model.addAttribute("mainNumb", noticeService.getNoticeNumbByType(Notice.NOTICETYPE_MAIN));
		model.addAttribute("breakNumb", noticeService.getNoticeNumbByType(Notice.NOTICETYPE_BREAK));
		model.addAttribute("repairNumb", noticeService.getNoticeNumbByType(Notice.NOTICETYPE_REPAIR));
		
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
