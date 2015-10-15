package com.zy.profit.gateway.web.fund;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.zy.base.entity.ExchangeRate;
import com.zy.base.service.ExchangeRateService;
import com.zy.common.util.AjaxResult;
import com.zy.common.util.DateUtils;
import com.zy.member.entity.Member;
import com.zy.personal.entity.MemCoinLog;
import com.zy.personal.entity.MemOrder;
import com.zy.personal.service.MemCoinLogService;
import com.zy.personal.service.MemOrderService;
import com.zy.personal.service.MemPayService;
import com.zy.profit.gateway.util.Constants;
import com.zy.profit.gateway.util.HttpUtils;
import com.zy.profit.gateway.util.WebHelper;

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
	
	@Autowired
	private ExchangeRateService exchangeRateService;
	
	@Autowired
	private MemCoinLogService memCoinLogService;
	
	@Autowired
	private MemPayService memPayService;
	
	@RequestMapping("/amount")
	public String amount(HttpServletRequest request, Model model){
		
		model.addAttribute(Constants.MENU_NAME, Constants.MENU_NAME_AMOUNT);
		
		ExchangeRate exchangeRate = exchangeRateService.findCurrentExchangeRate();
		model.addAttribute("exchangeRate", exchangeRate);
		
		Member member = HttpUtils.getMember(request);
		
		Map<String, Object> params = new HashMap<String, Object>();
		params.put("memberId", member.getId());
		
		String startDateStr = request.getParameter("startDate");
		model.addAttribute("startDate", startDateStr);
		Date startDate = DateUtils.getStartDate(startDateStr);
		if(startDate != null){
			params.put("startDate", startDate);
		}
		
		String endDateStr = request.getParameter("endDate");
		model.addAttribute("endDate", endDateStr);
		Date endDate = DateUtils.getEndDate(endDateStr);
		if(endDate != null){
			params.put("endDate", endDate);
		}
		
		List<MemCoinLog> memCoinLogs = memCoinLogService.findMemCoinLogs(params);
		model.addAttribute("memCoinLogs", memCoinLogs);
		
		return "/fund/amount";
	}
	
	@RequestMapping("/pay")
	public String pay(Model model){
		
		model.addAttribute(Constants.MENU_NAME, Constants.MENU_NAME_AMOUNT);
		
		return "/fund/pay";
	}
	
	@RequestMapping("/dialog_paying")
	public String dialogPaying(){
		return "/fund/dialog_paying";
	}
	
	/**
	 * 先提交订单
	 * @param request
	 * @param order
	 * @param model
	 * @return
	 */
	@RequestMapping("/pay/order/submit")
	@ResponseBody
	public AjaxResult paySubmit(HttpServletRequest request, MemOrder order, Model model){
		AjaxResult ajaxResult = new AjaxResult();
		ajaxResult.setSuccess(false);
		
		try {
			
			Member member = HttpUtils.getMember(request);
			
			Member m = new Member();
			m.setId(member.getId());
			order.setMember(m);
			
			order.setStatus(MemOrder.statusNoPay);
			order.setCreateId(member.getId());
			order.setCreateName(member.getUserName());
			
			order = memOrderService.save(order);
			
			//充值付款时
			member = memPayService.savePay(order.getId(), member);
			request.getSession().setAttribute(WebHelper.SESSION_LOGIN_USER, member);
			
			ajaxResult.setSuccess(true);
		} catch (Exception e) {
			e.printStackTrace();
			ajaxResult.setMsg("操作异常");
		}

//		model.addAttribute(Constants.MENU_NAME, Constants.MENU_NAME_PAY);
		
		return ajaxResult;
	}
	
	
	
}
