package com.zy.profit.gateway.service.shiro;

import org.apache.commons.lang3.StringUtils;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.AuthenticationException;
import org.apache.shiro.authc.AuthenticationInfo;
import org.apache.shiro.authc.AuthenticationToken;
import org.apache.shiro.authc.LockedAccountException;
import org.apache.shiro.authc.SimpleAuthenticationInfo;
import org.apache.shiro.authc.UsernamePasswordToken;
import org.apache.shiro.authz.AuthorizationInfo;
import org.apache.shiro.realm.AuthorizingRealm;
import org.apache.shiro.session.Session;
import org.apache.shiro.subject.PrincipalCollection;
import org.apache.shiro.subject.Subject;
import org.springframework.beans.factory.annotation.Autowired;

import com.zy.member.entity.Member;
import com.zy.member.service.MemberService;
import com.zy.profit.gateway.util.WebHelper;

/** 
 * 自定义Shiro的realm
 * @author LL 
 * 
 */
public class ShiroDBRealm extends AuthorizingRealm {

	@Autowired
	private MemberService memberService;
	
	/**
	 * 当前登录的subject授予角色、权限
	 */
	@Override
	protected AuthorizationInfo doGetAuthorizationInfo(PrincipalCollection principals) {
	
		
		return null;
	}

	/**
	 * 验证当前用户
	 */
	@Override
	protected AuthenticationInfo doGetAuthenticationInfo(
			AuthenticationToken authcToken) throws AuthenticationException {

        UsernamePasswordToken token = (UsernamePasswordToken)authcToken;
        
        if(StringUtils.isEmpty(token.getUsername())){
        	return null;
        }
        
        Member member = memberService.findMemberByLogin(token.getUsername());
        
        if(member != null){
        	AuthenticationInfo authcInfo = new SimpleAuthenticationInfo(token.getUsername(), member.getPwd(), getName());
        	
        	String status = member.getStatus();
        	if("1".equals(status)){
        		throw new LockedAccountException("账号已经被冻结");
        	}else if("2".equals(status)){
        		throw new LockedAccountException("账号已经被列入黑名单");
        	}else if("3".equals(status)){
        		throw new LockedAccountException("账号已经被注销");
        	}
        	
        	/*Subject subject = SecurityUtils.getSubject();
        	
        	if(subject != null && subject.isAuthenticated()){
        		Session session = subject.getSession();
        		if(session != null){
        			session.setAttribute(WebHelper.SESSION_LOGIN_USER, member);
        		}
        	}*/
        	
        	return authcInfo;
        }else{
        	return null;
        }
	}

	
}
