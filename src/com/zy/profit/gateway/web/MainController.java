package com.zy.profit.gateway.web;

import java.io.InputStream;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.zy.base.entity.Nationality;
import com.zy.base.entity.Notice;
import com.zy.base.service.NationalityService;
import com.zy.base.service.NoticeService;
import com.zy.common.util.AjaxResult;
import com.zy.common.util.CommonConstants;
import com.zy.common.util.ConstantEnity;
import com.zy.member.entity.Member;
import com.zy.member.service.MemberService;
import com.zy.personal.entity.MemBankInfo;
import com.zy.profit.gateway.util.Constants;
import com.zy.profit.gateway.util.FileUploadUtil;
import com.zy.profit.gateway.util.HttpUtils;
import com.zy.profit.gateway.util.WebHelper;
import com.zy.util.Md5Util;

@Controller
@RequestMapping("/main")
public class MainController {

	@Autowired
	private NoticeService noticeService;
	
	@Autowired
	private NationalityService nationalityService;
	
	@Autowired
	private MemberService memberService;
	
	@RequestMapping
	public String main(HttpServletRequest request, Model model){
		
		model.addAttribute("notices", noticeService.getNoticeByStatusAndType(Notice.NOTICETYPE_MAIN));
		model.addAttribute(Constants.MENU_NAME, Constants.MENU_NAME_MAIN);
		return "/main";
	}
	
	@RequestMapping("/person")
	public String person(HttpServletRequest request, Model model){
		
		List<Nationality> nationalities = nationalityService.findNationalities();
		model.addAttribute("nationalities", nationalities);
		
		List<ConstantEnity> cardTypes = CommonConstants.getCardTypes();
		model.addAttribute("cardTypes", cardTypes);
		
		Member member = HttpUtils.getMember(request);
		member = memberService.find(member.getId());
		model.addAttribute("member", member);
		
		model.addAttribute(Constants.MENU_NAME, Constants.MENU_NAME_PERSON);
		
		return "/account/person";
	}
	
	@RequestMapping("/ajax/save/person")
	@ResponseBody
	public AjaxResult ajaxSavePerson(HttpServletRequest request){
		AjaxResult ajaxResult = new AjaxResult();
		ajaxResult.setSuccess(false);
		
		try {
			String cnName = request.getParameter("cnName");
			String enName = request.getParameter("enName");
			String sex = request.getParameter("sex");
			String nationalityId = request.getParameter("nationalityId");
			String cardType = request.getParameter("cardType");
			String card = request.getParameter("card");
//			String mobile = request.getParameter("mobile");
			String email = request.getParameter("email");
			String address = request.getParameter("address");
			
			String bankAccount = request.getParameter("bankAccount");
			String bankCardNum = request.getParameter("bankCardNum");
			String bankAddress = request.getParameter("bankAddress");
			
			Member member = HttpUtils.getMember(request);
			member = memberService.find(member.getId());
			
			//有些字段有值得就不能再修改
			if(StringUtils.isBlank(member.getCnName())){
				member.setCnName(StringUtils.trim(cnName));
			}
			
			if(StringUtils.isBlank(member.getEnName())){
				member.setEnName(StringUtils.trim(enName));
			}
			
			if(member.getCardType() == null){
				if(StringUtils.isNotBlank(cardType)){
					member.setCardType(Integer.parseInt(cardType));
				}
			}
			
			if(StringUtils.isBlank(member.getCard())){
				member.setCard(StringUtils.trim(card));
			}
			
			MemBankInfo memBankInfo = member.getMemBankInfo();
			if(memBankInfo == null){
				memBankInfo = new MemBankInfo();
				member.setMemBankInfo(memBankInfo);
			}
			
			if(StringUtils.isBlank(memBankInfo.getBankAccount())){
				memBankInfo.setBankAccount(StringUtils.trim(bankAccount));
			}
			
			if(StringUtils.isBlank(memBankInfo.getBankCardNum())){
				memBankInfo.setBankCardNum(StringUtils.trim(bankCardNum));
			}
			
			if(StringUtils.isBlank(memBankInfo.getBankAddress())){
				memBankInfo.setBankAddress(StringUtils.trim(bankAddress));
			}
			
			//可以改的
			if(StringUtils.isNotBlank(sex)){
				member.setSex(Integer.parseInt(sex));
			}else{
				member.setSex(null);
			}
			if(StringUtils.isNotBlank(nationalityId)){
				Nationality nationalityBean = new Nationality();
				nationalityBean.setId(nationalityId);
				member.setNationality(nationalityBean);
			}else{
				member.setNationality(null);
			}
			
			/*if(!member.getMobile().equals(StringUtils.trim(mobile))){
				int ret = memberService.vaildUserByMobile(StringUtils.trim(mobile));
				if(ret > 0){
					ajaxResult.setMsg("手机号码已经被注册");
					return ajaxResult;
				}
			}
			member.setMobile(StringUtils.trim(mobile));
			*/
			
			if(member.getEmail() == null || !member.getEmail().equals(StringUtils.trim(email))){
				if(StringUtils.isNotBlank(email)){
					int ret = memberService.vaildUserByEmail(StringUtils.trim(email));
					if(ret > 0){
						ajaxResult.setMsg("电子邮箱已经被注册");
						return ajaxResult;
					}
				}
				member.setEmail(StringUtils.trim(email));
			}
			
			member.setAddress(StringUtils.trim(address));
			
			memberService.saveOrUpdateMember(member, memBankInfo);
			
			request.getSession().setAttribute(WebHelper.SESSION_LOGIN_USER, member);
			
			ajaxResult.setSuccess(true);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return ajaxResult;
	}
	
	@RequestMapping("/ajax/upload/img")
	@ResponseBody
	public AjaxResult ajaxUploadImg(HttpServletRequest request){
		AjaxResult ajaxResult = new AjaxResult();
		ajaxResult.setSuccess(false);
		
		try {
			MultipartHttpServletRequest multipartRequest = (MultipartHttpServletRequest) request;
			
			String paramName = request.getParameter("paramName");
			
			MultipartFile mf = multipartRequest.getFile("file");
			String originFileName = mf.getOriginalFilename();
			String ext = originFileName.substring(originFileName.lastIndexOf(".")).toLowerCase();
			String imgName = UUID.randomUUID() + ext;
			
			InputStream is = mf.getInputStream();
			
			String imgPath = FileUploadUtil.uploadAttachment(is, imgName);
			
			/*//修改资料路径
			Member member = HttpUtils.getMember(request);
			member = memberService.find(member.getId());
			if("imgIDCardA".equals(paramName)){
				member.setImgIDCardA(imgPath);
			}else if("imgIDCardB".equals(paramName)){
				member.setImgIDCardB(imgPath);
			}else if("imgAddress".equals(paramName)){
				member.setImgAddress(imgPath);
			}else if("imgBankCard1".equals(paramName)){
				member.setImgBankCard1(imgPath);
			}else if("imgBankCard2".equals(paramName)){
				member.setImgBankCard2(imgPath);
			}else if("imgBankCard3".equals(paramName)){
				member.setImgBankCard3(imgPath);
			}
			
			memberService.update(member);
			request.getSession().setAttribute(WebHelper.SESSION_LOGIN_USER, member);
			*/
			ajaxResult.setData(imgPath);
			ajaxResult.setSuccess(true);
			
		} catch (Exception e) {
			e.printStackTrace();
			ajaxResult.setMsg("上传图片失败");
		}
		
		return ajaxResult;
	}
	
	@RequestMapping("/update_pwd")
	public String updatePwd(Model model){
		
		model.addAttribute(Constants.MENU_NAME, Constants.MENU_NAME_PWD);
		
		return "/account/update_pwd";
	}
	
	@RequestMapping("/ajax/save/update_pwd")
	@ResponseBody
	public AjaxResult ajaxUpdatPwd(HttpServletRequest request){
		AjaxResult ajaxResult = new AjaxResult();
		ajaxResult.setSuccess(false);
		
		try {
			String oldPwd = request.getParameter("oldPwd");
			String pwd1 = request.getParameter("pwd1");
			String pwd2 = request.getParameter("pwd2");
			
			Member member = HttpUtils.getMember(request);
			
			//旧密码是否正确
			if(Md5Util.validatePassword(member.getPwd(), oldPwd)){
				
				member.setPwd(Md5Util.generatePassword(pwd1));
				memberService.update(member);
				
				ajaxResult.setSuccess(true);
				
			}else{
				ajaxResult.setMsg("旧密码不正确");
				return ajaxResult;
			}
			
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		
		return ajaxResult;
	}
	
}
