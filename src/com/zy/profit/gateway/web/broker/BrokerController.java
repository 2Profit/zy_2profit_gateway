package com.zy.profit.gateway.web.broker;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.zy.broker.entity.BrokerExtInfo;
import com.zy.broker.service.BrokerExtInfoService;
import com.zy.broker.service.BrokerInfoService;
import com.zy.common.entity.PageModel;

@Controller
@RequestMapping("/bk")
public class BrokerController {

	@Autowired
	private BrokerInfoService brokerInfoService;
	@Autowired
	private BrokerExtInfoService brokerExtInfoService;
	
	@RequestMapping("/indexList")
	public String brokerList(Model model,HttpServletRequest request,BrokerExtInfo queryDto,PageModel<BrokerExtInfo> pageModel){
		
		
		model.addAttribute("brokerExtInfos", brokerExtInfoService.queryForPage(queryDto, pageModel));
		
		return "broker/brokerIndex";
	}
}
