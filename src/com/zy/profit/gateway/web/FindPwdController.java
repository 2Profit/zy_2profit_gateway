package com.zy.profit.gateway.web;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.zy.member.entity.Member;
import com.zy.member.entity.MemberCode;
import com.zy.member.service.MemberCodeService;
import com.zy.member.service.MemberService;
import com.zy.profit.gateway.util.SystemConfig;
import com.zy.util.Md5Util;

/**
 * 
 * @author Administrator
 *
 */
@Controller
@RequestMapping("/findpwd")
public class FindPwdController {

	@Autowired
	private MemberService memberService;
	
	@Autowired
	private MemberCodeService memberCodeService;
	
	@RequestMapping("/select")
	public String select(){
		return "/findpwd/select";
	}
	
	@RequestMapping("/mobile1")
	public String mobile1(Model model, HttpServletRequest request){
		model.addAttribute("msg", request.getParameter("msg"));
		return "/findpwd/mobile1";
	}
	
	@RequestMapping("/mobile2")
	public String mobile2(HttpServletRequest request, Model model, RedirectAttributes redirectAttributes){
		
		String mobile = StringUtils.trimToEmpty(request.getParameter("mobile"));
		String code = StringUtils.trimToEmpty(request.getParameter("code"));
		
		Map<String, Object> map = null;
		String msg = "";
		Member member = memberService.findMemberByLogin(mobile);
		if(member == null){
			msg = "手机号输入有误";
		}else{
			//验证验证码
			map = memberCodeService.validatorCode(mobile, code, SystemConfig.getSMSVaildTimeInt());
			msg = map.get("msg").toString();
		}
		
		if(StringUtils.isNotBlank(msg)){
			redirectAttributes.addAttribute("msg", msg);
			return "redirect:/findpwd/mobile1";
		}
		
		MemberCode memberCode = (MemberCode) map.get("memberCode");
		memberCode.setStatus(1);
		memberCodeService.update(memberCode);
		
		model.addAttribute("member", member);
		
		return "/findpwd/mobile2";
	}
	
	@RequestMapping("/updatepwd")
	public String updatepwd(HttpServletRequest request){
		
		String memberId = request.getParameter("memberId");
		String pwd = request.getParameter("pwd");
		
		Member member = memberService.find(memberId);
		
		member.setPwd(Md5Util.generatePassword(pwd));
		memberService.update(member);
		
		return "redirect:/findpwd/success";
	}
	
	@RequestMapping("/success")
	public String finish(){
		return "/findpwd/success";
	}
	
}
