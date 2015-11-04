package com.zy.profit.gateway.web;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.zy.common.util.AjaxResult;
import com.zy.common.util.BaseUtils;
import com.zy.member.entity.Member;
import com.zy.member.entity.MemberCode;
import com.zy.member.service.MemberCodeService;
import com.zy.member.service.MemberService;
import com.zy.profit.gateway.util.HttpUtils;
import com.zy.profit.gateway.util.MailUtils;
import com.zy.profit.gateway.util.SMSAPI;
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
	public String select(HttpServletRequest request, Model model){
//		return "/findpwd/select";
		
		model.addAttribute("msg", request.getParameter("msg"));
		
		return "/findpwd/page1";
	}
	
	@RequestMapping("/find/member")
	public String findMember(HttpServletRequest request, Model model, RedirectAttributes redirectAttributes){
		
		String username = request.getParameter("username");
		
		String code = request.getParameter("code");
		
		String captchaCode = HttpUtils.getCaptchaCode(request);
		if(StringUtils.isBlank(code) || !code.equalsIgnoreCase(captchaCode)){
			redirectAttributes.addAttribute("msg", "验证码有误");
			return "redirect:/findpwd/select";
		}
		
		Member member = memberService.findMemberByLogin(username);
		if(member == null){
			redirectAttributes.addAttribute("msg", "账号不存在");
			return "redirect:/findpwd/select";
		}
		
		model.addAttribute("memberId", member.getId());
		String mobile = member.getMobile();
		mobile = mobile.substring(0, 3) + "****" + mobile.substring(7);
		model.addAttribute("mobile", mobile);
		if(StringUtils.isNotBlank(member.getEmail())){
			String email = member.getEmail();
			if(email.contains("@")){
				String eAds = email.substring(email.lastIndexOf("@"));
				String ePre = email.substring(0, email.lastIndexOf("@"));
				if(ePre.length() > 3){
					ePre = ePre.substring(0, 2) + "..." + ePre.substring(ePre.length() - 1);
				}
				email = ePre + eAds;
			}
			model.addAttribute("email", email);
		}
		
		return "/findpwd/page2";
	}
	
	@RequestMapping("/send/code")
	@ResponseBody
	public AjaxResult sendMailCode(HttpServletRequest request){
		AjaxResult ajaxResult = new AjaxResult();
		ajaxResult.setSuccess(false);
		
		try {
			
			String memberId = request.getParameter("memberId");
			
			String type = StringUtils.trimToEmpty(request.getParameter("type"));
			
			String code = BaseUtils.getNumr(4);
			MemberCode memberCode = new MemberCode();
			memberCode.setCode(code);
			memberCode.setType(MemberCode.TYPE_FINDPWD);
			memberCode.setStatus(0);
			
			Member member = memberService.find(memberId);
			if(member == null){
				ajaxResult.setMsg("发送验证码失败");
				return ajaxResult;
			}
			
			memberCode.setMember(member);
			
			if("mobile".equals(type)){
				String msg = SMSAPI.sendRegisterCode(member.getMobile(), code);
				if(msg == null){
					memberCode.setMobile(member.getMobile());
					memberCodeService.save(memberCode);
				}else{
					ajaxResult.setMsg("发送验证码失败");
					return ajaxResult;
				}
			}else if("email".equals(type)){
				String email = member.getEmail();
				if(StringUtils.isNotBlank(email)){
					boolean b = MailUtils.send(email, code);
					if(b){
						memberCode.setEmail(email);
						memberCodeService.save(memberCode);
					}else{
						ajaxResult.setMsg("发送验证码失败");
						return ajaxResult;
					}
					
				}else{
					ajaxResult.setMsg("发送验证码失败");
					return ajaxResult;
				}
			}else{
				ajaxResult.setMsg("发送验证码失败");
				return ajaxResult;
			}
			
			ajaxResult.setSuccess(true);
		} catch (Exception e) {
			e.printStackTrace();
			ajaxResult.setMsg("发送验证码失败");
		}
		
		return ajaxResult;
	}
	
	@RequestMapping("/page3")
	public String page3(HttpServletRequest request, Model model, RedirectAttributes redirectAttributes){
		
		String code = StringUtils.trimToEmpty(request.getParameter("code"));
		
		String type = request.getParameter("type");
		String memberId = request.getParameter("memberId");
		
		Map<String, Object> map = null;
		String msg = "";
		Member member = memberService.find(memberId);
		if(member == null){
			msg = "找回密码失败";
			return "redirect:/findpwd/select";
		}else{
			if("mobile".equals(type)){
				//验证验证码
				map = memberCodeService.validatorCode(member.getMobile(), code, SystemConfig.getSMSVaildTimeInt());
				msg = map.get("msg").toString();	
			}else if("email".equals(type)){
				map = memberCodeService.validatorCodeEmail(member.getEmail(), code, SystemConfig.getMailVaildTimeInt());
				msg = map.get("msg").toString();	
			}
		}
		
		if(StringUtils.isNotBlank(msg)){
			redirectAttributes.addAttribute("msg", msg);
			return "redirect:/findpwd/select";
		}
		
		MemberCode memberCode = (MemberCode) map.get("memberCode");
		memberCode.setStatus(1);
		memberCodeService.update(memberCode);
		
		model.addAttribute("member", member);
		
		return "/findpwd/page3";
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
