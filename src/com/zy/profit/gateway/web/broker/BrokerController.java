package com.zy.profit.gateway.web.broker;

import java.util.Arrays;

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
	
	@RequestMapping("/list")
	public String brokerList(Model model,BrokerExtInfoDto queryDto,PageModel<BrokerExtInfo> pageModel,HttpServletRequest request){
		
		String params = (String)request.getParameter("orderByP");
		if(StringUtils.isNotBlank(params) && Arrays.asList(params.split("~")).size()>0){
			for(String param : Arrays.asList(params.split("~"))){
				if(param.split(",").length == 2){
					queryDto.getOrderByParamMap().put(param.split(",")[0], param.split(",")[1]);
					//用于保存页面箭头指向
					if("min_income_money".equals(param.split(",")[0])){//最低入金
						queryDto.setArrow_min_income_money(param.split(",")[1]);
						
					}else if("profit_star".equals(param.split(",")[0])){//安全评级
						queryDto.setArrow_profit_star(param.split(",")[1]);
						
					}else if("commission_llg".equals(param.split(",")[0])){//返佣比例(黄金返佣)
						queryDto.setArrow_commission_llg(param.split(",")[1]);
						
					}else if("is_recommet".equals(param.split(",")[0])){//至盈推荐
						queryDto.setArrow_is_recommet(param.split(",")[1]);
						
					}else if("is_in_out_free".equals(param.split(",")[0])){//出入金免手续费
						queryDto.setArrow_is_in_out_free(param.split(",")[1]);
						
					}else if("lever_rate".equals(param.split(",")[0])){//最大杠杆 
						queryDto.setArrow_lever_rate(param.split(",")[1]);
					}
				}
			}
		}
		
		pageModel.setPageSize(5);
		model.addAttribute("page", brokerExtInfoService.queryPage(queryDto, pageModel));
		model.addAttribute("queryDto", queryDto);
		
		return "broker/brokerIndex";
	}
	
	@RequestMapping("/detail")
	public String brokerDetail(Model model,HttpServletRequest request){
		
		String brokerId = request.getParameter("id");
		if(StringUtils.isNoneBlank(brokerId))
			model.addAttribute("broker", brokerExtInfoService.get(brokerId));
		
		return "broker/brokerDetail";
	}
}
