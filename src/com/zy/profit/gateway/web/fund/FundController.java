package com.zy.profit.gateway.web.fund;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.zy.member.entity.Member;
import com.zy.personal.entity.MemOrder;
import com.zy.personal.service.MemOrderService;
import com.zy.profit.gateway.util.Constants;
import com.zy.profit.gateway.util.HttpUtils;

/**
 * 
 * @author Administrator
 *
 */
@Controller
@RequestMapping("/fund")
public class FundController {

	@Autowired
	private MemOrderService memOrderService;
	
	@RequestMapping("/pay")
	public String pay(Model model){
		
		model.addAttribute(Constants.MENU_NAME, Constants.MENU_NAME_PAY);
		
		return "/fund/play";
	}
	
	@RequestMapping("/pay/submit")
	public String paySubmit(HttpServletRequest request, MemOrder order, Model model){
		
		Member member = HttpUtils.getMember(request);
		
		Member m = new Member();
		m.setId(member.getId());
		order.setMember(m);
		
		order.setStatus(MemOrder.statusNoPay);
		order.setCreateId(member.getId());
		order.setCreateName(member.getUserName());
		
		memOrderService.save(order);

		model.addAttribute(Constants.MENU_NAME, Constants.MENU_NAME_PAY);
		
		return "/fund/play_success";
	}
	
}
