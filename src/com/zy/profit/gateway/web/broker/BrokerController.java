package com.zy.profit.gateway.web.broker;

import java.io.UnsupportedEncodingException;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.zy.broker.dto.BrokerExtInfoDto;
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
	public String brokerList(Model model,BrokerExtInfoDto queryDto,PageModel<BrokerExtInfo> pageModel){
		
		if(StringUtils.isNotBlank(queryDto.getBrokerName())){
			try {
				queryDto.setBrokerName(new String(queryDto.getBrokerName().getBytes("ISO-8859-1"),"UTF-8"));
			} catch (UnsupportedEncodingException e) {
				e.printStackTrace();
			}
		}
		model.addAttribute("brokerExtInfos", brokerExtInfoService.queryForPage(queryDto, pageModel));
		model.addAttribute("queryDto", queryDto);
		
		return "broker/brokerIndex";
	}
	
	@RequestMapping("/detail")
	public String brokerDetail(Model model,HttpServletRequest request){
		
		String brokerId = request.getParameter("id");
		if(StringUtils.isNoneBlank(brokerId))
			model.addAttribute("brokerExtInfo", brokerExtInfoService.get(brokerId));
		
		return "broker/brokerDetail";
	}
}