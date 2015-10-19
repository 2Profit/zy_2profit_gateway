package com.zy.profit.gateway.web;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.collections.CollectionUtils;
import org.apache.commons.lang3.StringUtils;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.AuthenticationException;
import org.apache.shiro.authc.DisabledAccountException;
import org.apache.shiro.authc.UsernamePasswordToken;
import org.apache.shiro.subject.Subject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.zy.base.entity.Notice;
import com.zy.base.service.NoticeService;
import com.zy.broker.service.BrokerExtInfoService;
import com.zy.common.entity.BaseEntity;
import com.zy.common.entity.PageModel;
import com.zy.common.util.AjaxResult;
import com.zy.common.util.BaseUtils;
import com.zy.member.entity.Member;
import com.zy.member.entity.MemberCode;
import com.zy.member.service.MemberCodeService;
import com.zy.member.service.MemberService;
import com.zy.profit.gateway.util.HttpUtils;
import com.zy.profit.gateway.util.SMSAPI;
import com.zy.profit.gateway.util.SystemConfig;
import com.zy.util.Md5Util;
import com.zy.vote.entity.VoteTopic;
import com.zy.vote.entity.VoteTopicPost;
import com.zy.vote.service.VoteTopicPostService;
import com.zy.vote.service.VoteTopicService;


/**
 * 登录页
 * @author LL
 *
 */
@Controller
public class IndexController {

	@Autowired
	private MemberService memberService;
	
	@Autowired
	private MemberCodeService memberCodeService;
	@Autowired
	private VoteTopicService voteTopicService;
	@Autowired
	private BrokerExtInfoService brokerExtInfoService;
	@Autowired
	private VoteTopicPostService voteTopicPostService;
	@Autowired
	private NoticeService noticeService;
	
	
	@RequestMapping("/index")
	public String index(Model model){
		
		VoteTopic currentTopic = voteTopicService.getCurrentTopic();
		List<VoteTopicPost> voteTopicPosts = voteTopicPostService.queryMostPraisePost(currentTopic.getId());
		if(CollectionUtils.isNotEmpty(voteTopicPosts)){
			currentTopic.setMostPraisePost1(voteTopicPosts.get(0));
			if(voteTopicPosts.size()>1){
				currentTopic.setMostPraisePost2(voteTopicPosts.get(1));
			}
		}
		
		Notice queryNotice = new Notice();
		queryNotice.setDeleteFlag(BaseEntity.DELETE_FLAG_NORMAL);
		queryNotice.setOrderByParam(Notice.PROP_START_DATE);
		List<Notice> noticeList = noticeService.queryForPage(queryNotice, new PageModel<Notice>(6)).getList();
		
		model.addAttribute("notices", noticeList);
		model.addAttribute("currentTopic", currentTopic);
		model.addAttribute("brokers", brokerExtInfoService.findIndexPageBrokers());
		
		return "/index";
	}
	
	@RequestMapping("/register")
	public String register(HttpServletRequest request, Model model){
		model.addAttribute("msg", request.getParameter("msg"));
		return "/register";
	}
	
	@RequestMapping("/register/agree")
	public String registerAgree(HttpServletRequest request){
		return "/register_agree";
	}
	
	@RequestMapping("/register/send_msg")
	@ResponseBody
	public AjaxResult sendCode(HttpServletRequest request){
		AjaxResult ajaxResult = new AjaxResult();
		ajaxResult.setSuccess(false);
		try {
			String mobile = request.getParameter("mobile");
			
			String code = BaseUtils.getNumr(4);
			String msg = SMSAPI.sendRegisterCode(mobile, code);
			if(msg == null){
				MemberCode memberCode = new MemberCode();
				memberCode.setMobile(mobile);
				memberCode.setCode(code);
				memberCode.setStatus(0);
				
				memberCodeService.save(memberCode);
				
				ajaxResult.setSuccess(true);
			}else{
				ajaxResult.setMsg(msg);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return ajaxResult;
	}

	@RequestMapping(value="/register/vaild_email")
	@ResponseBody
	public AjaxResult validEmail(HttpServletRequest request){
		
		AjaxResult ajaxResult = new AjaxResult();
		
		String retMsg = "";
		
		String email = request.getParameter("email");
		
		int ret = memberService.vaildUserByEmail(email);
		if(ret > 0){
			retMsg = "该电子邮箱已经被绑定";
		}
		
		Map<String, Object> map = new HashMap<String, Object>();
		if(StringUtils.isNotBlank(retMsg)){
			map.put("error", retMsg);
		}else{
			map.put("ok", "");
		}
		ajaxResult.setData(map);
		
		return ajaxResult;
	}
	
	@RequestMapping(value="/register/vaild_mobile_exist")
	@ResponseBody
	public AjaxResult validMobileExist(HttpServletRequest request){
		
		AjaxResult ajaxResult = new AjaxResult();
		
		String retMsg = "";
		
		String mobile = request.getParameter("mobile");
		
		int ret = memberService.vaildUserByMobile(mobile);
		if(ret <= 0){
			retMsg = "该手机号未注册";
		}
		
		Map<String, Object> map = new HashMap<String, Object>();
		if(StringUtils.isNotBlank(retMsg)){
			map.put("error", retMsg);
		}else{
			map.put("ok", "");
		}
		ajaxResult.setData(map);
		
		return ajaxResult;
	}
	
	@RequestMapping(value="/register/vaild_mobile")
	@ResponseBody
	public AjaxResult validMobile(HttpServletRequest request){
		
		AjaxResult ajaxResult = new AjaxResult();
		
		String retMsg = "";
		
		String mobile = request.getParameter("mobile");
		
		int ret = memberService.vaildUserByMobile(mobile);
		if(ret > 0){
			retMsg = "该手机号已经被注册";
		}
		
		Map<String, Object> map = new HashMap<String, Object>();
		if(StringUtils.isNotBlank(retMsg)){
			map.put("error", retMsg);
		}else{
			map.put("ok", "");
		}
		ajaxResult.setData(map);
		
		return ajaxResult;
	}
	
	@RequestMapping("/register/vaild_nick_name")
	@ResponseBody
	public AjaxResult vaildNickName(HttpServletRequest request){
		
		AjaxResult ajaxResult = new AjaxResult();
		
		String retMsg = "";
		
		String nickName = request.getParameter("nickName");
		
		int ret = memberService.vaildUserByNickName(nickName);
		if(ret > 0){
			retMsg = "该昵称已经被使用";
		}
		
		Map<String, Object> map = new HashMap<String, Object>();
		if(StringUtils.isNotBlank(retMsg)){
			map.put("error", retMsg);
		}else{
			map.put("ok", "");
		}
		ajaxResult.setData(map);
		
		return ajaxResult;
	}
	
	@RequestMapping("/register/save")
	public String registerSave(Member member, RedirectAttributes redirectAttributes, HttpServletRequest request){
		
		String msg = "";
		
		member.setMobile(member.getMobile().trim());
		member.setNickName(member.getNickName().trim());
		
		//判断短信验证码
		String code = request.getParameter("code");
		Map<String, Object> map = memberCodeService.validatorCode(member.getMobile(), code, SystemConfig.getSMSVaildTimeInt());
		
		msg = map.get("msg").toString();
		
		int ret = memberService.vaildUserByMobile(member.getMobile());
		if(ret > 0){
			msg = "注册失败，请重新再试";
		}
		
		ret = memberService.vaildUserByNickName(member.getNickName());
		if(ret > 0){
			msg = "注册失败，请重新再试";
		}
		
		if(StringUtils.isNotBlank(msg)){
			redirectAttributes.addAttribute("msg", msg);
			return "redirect:/register";
		}
		
		member.setPwd(Md5Util.generatePassword(member.getPwd().trim()));
		MemberCode memberCode = (MemberCode) map.get("memberCode");
		memberService.saveMember(member, memberCode);
		redirectAttributes.addAttribute("msg", "注册成功，马上登陆");
		
		return "redirect:/login";
	}
	
	@RequestMapping("/login")
	public String login(HttpServletRequest request, Model model){
		model.addAttribute("msg", request.getParameter("msg"));
		return "/login";
	}
	
	/**
	 * 登录
	 * @param user
	 * @param model
	 * @return
	 */
	@RequestMapping(value="/dologin", method=RequestMethod.POST)
	@ResponseBody
	public AjaxResult doLogin(HttpServletRequest request){
		
		AjaxResult ajaxResult = new AjaxResult();
		ajaxResult.setSuccess(false);
		
		Subject subject = SecurityUtils.getSubject();
		
		String username = request.getParameter("username").trim();
		String pwd = request.getParameter("pwd").trim();
		
		String autoChk = request.getParameter("autoChk");
		boolean rememberMe = false;
		if(StringUtils.isNotBlank(autoChk) && "1".equals(autoChk)){
			rememberMe = true;
		}
		
		UsernamePasswordToken token = new UsernamePasswordToken(username, Md5Util.generatePassword(pwd), rememberMe);
		
		try {
			subject.login(token);
			
			//
			Member member = HttpUtils.getMember(request);
			member.setLastLoginDate(new Date());
			member.setLastLoginIp(request.getRemoteAddr());
			memberService.update(member);
			
			ajaxResult.setSuccess(true);
		} catch (DisabledAccountException dae) {
			dae.printStackTrace();
			ajaxResult.setMsg("账号已被删除");
		} catch (AuthenticationException e) {
			e.printStackTrace();
			ajaxResult.setMsg("账号或密码错误");
		}
		token.clear();
		
		return ajaxResult;
		
	}
	
	/**
	 * 注销
	 * @return
	 */
	@RequestMapping("/login_out")
	public String loginOut(HttpServletRequest request){
		
		Subject subject = SecurityUtils.getSubject();
		subject.logout();
		
		return "redirect:/login";
	}
}