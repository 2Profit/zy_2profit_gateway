package com.zy.profit.gateway.web;

import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.AuthenticationException;
import org.apache.shiro.authc.DisabledAccountException;
import org.apache.shiro.authc.UsernamePasswordToken;
import org.apache.shiro.subject.Subject;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;


/**
 * 登录页
 * @author LL
 *
 */
@Controller
public class IndexController {

	@RequestMapping("/index")
	public String index(){
		return "/index";
	}
	
	/**
	 * 登录
	 * @param user
	 * @param model
	 * @return
	 */
	@RequestMapping(value="/dologin", method=RequestMethod.POST)
	public String doLogin(Model model){
//		Subject subject = SecurityUtils.getSubject();
//		
//		UsernamePasswordToken token = new UsernamePasswordToken(user.getUserName(), user.getPassword());
//		
//		try {
//			subject.login(token);
//			return "redirect:/main";
//		} catch (DisabledAccountException dae) {
//			model.addAttribute("msg", "账号已被删除");
//		} catch (AuthenticationException e) {
//			LOG.error("登录失败:" + e.getMessage());
//			model.addAttribute("msg", "账号或密码错误");
//		}
//		token.clear();
		return "forward:/index";
		
	}
	
	/**
	 * 注销
	 * @return
	 */
	@RequestMapping("/login_out")
	public String loginOut(){
		return "redirect:/index";
	}
}
