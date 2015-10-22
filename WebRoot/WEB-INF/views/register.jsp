<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />

	<%@ include file="common/common.jsp"%>

</head>

<%@ include file="common/nice-validator.jsp" %>

<script type="text/javascript">

$(function(){
	
	if('${msg}'){
		$('tr[data-type="msg"]').show();
	}
	
	$('input').on('blur', function(){
		$('tr[data-type="msg"]').hide();
	});
	
	//表单验证
	$('#registerForm').validator({
		timely : 0,
		focusCleanup : true,
		rules : {
			nickName : [/^[0-9a-zA-Z\u0391-\uFFE5]{2,8}$/, '昵称长度2到8个字符，支持汉子、英文及数字']
		},
		fields : {
			mobile : {
				rule : 'required;mobile;remote[${ctx}/register/vaild_mobile]',
				target : '#msg_mobile'
			},
			code : {
				rule : 'required;',
				target : '#msg_code'
			},
			nickName : {
				rule : 'required;nickName;remote[${ctx}/register/vaild_nick_name]',
				target : '#msg_nickName'
			},
			pwd : {
				rule : '密码: required;password',
				target : '#msg_pwd'
			},
			pwd1 : {
				rule : '密码确认: required;match[pwd]',
				target : '#msg_pwd1'
			},
			imgCode : {
				rule : 'required',
				target : '#msg_img_code'
			}
		},
		valid : function(form){
			form.submit();
		}
	});
	
});

function mySubmit(){
	$('#registerForm').submit();
}

var codeTimer = null;

function sendCode(_this){
	
	var $sendBtn = $(_this);
	if($sendBtn.attr('data-status') == 'no'){
		return;
	}
	
	//检查手机是否通过
	$('input[name="mobile"]').isValid(function(v){
		if(v){
			var seconds = 59;
			$sendBtn.removeClass('blue').addClass('gray').html("重新获取 ( 60 ) ");
			$sendBtn.attr('data-status', 'no');
			//调用短信接口
			$.ajax({
				url : '${ctx}/register/send_msg',
				data : {
					'mobile' : $('input[name="mobile"]').val()
				},
				async : false,
				success : function(result){
					
				}
			});
			
			codeTimer = setInterval(function(){
				if(seconds < 0){
					clearInterval(codeTimer);
					$sendBtn.removeClass('gray').addClass('blue').html('获取手机验证码');
					$sendBtn.attr('data-status', 'yes');
				}else{
					$sendBtn.html('重新获取 ( ' + (seconds--) + ' )');
				}
			}, 1000); 
			
		}else{
			jc.alert('请输入正确的手机号');
		}
	});
}


function changeCode(){
	$('#captchaCode').attr('src', '${ctx }/imageServlet?' + Math.floor(Math.random() * 100));
}


</script>

<body>
    
    <%@ include file="common/head.jsp" %>

    <div class="J_wrap">

        <div class="J_content mt20 bgfff hasShadow">
            <div class="pau">
                <div class="J_title">
                    <div class="t_txt">用户注册</div>
                    <div class="t_tips"></div>
                    <div class="t_more"><a class="cDef" href="${ctx }/login">已有帐号?马上登录&nbsp;&gt;</a></div>
                </div>
            </div>
            <div class="clearfix pb20">
            
            	<form action="${ctx }/register/save" id="registerForm" method="post">
                <div class="fl c_760 c_rightBorder">
                    <div class="pau">
                        <div class="J_form pl80 J_reg">
                            <table>
                                <tbody>
                                	<tr data-type="msg" style="display: none;">
                                        <td>&nbsp;</td>
                                        <td>
                                            <div class="J_toolsBar">
                                                <label style="color: red;">${msg }</label>
                                            </div>
                                        </td>
                                        <td>&nbsp;</td>
                                    </tr>
                                    <tr>
                                        <td class="tar">
                                            <div class="J_toolsBar">
                                                <div class="t_label">手机号：</div>
                                            </div>
                                        </td>
                                        <td>
                                            <div class="J_toolsBar">
                                                <div style="width:64px;" class="t_select">
                                                    <a href="javascript:;">中国86</a>
                                                    <select name="mobilePfx">
                                                        <option value="86">中国86</option>
                                                        <option value="852">香港852</option>
                                                        <option value="853">澳门853</option>
                                                    </select>
                                                </div>
                                                <div class="t_text ml10 t_phoneNumber">
                                                    <label>
                                                        <input type="text" name="mobile"/>
                                                    </label>
                                                </div>
                                            </div>
                                        </td>
                                        <td class="plr20" id="msg_mobile">
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="tar">
                                            <div class="J_toolsBar">
                                                <div class="t_label">短信验证：</div>
                                            </div>
                                        </td>
                                        <td>
                                            <div class="J_toolsBar">
                                                <div class="t_text t_regCode">
                                                    <label>
                                                        <input type="text" name="code"/>
                                                    </label>
                                                </div>
                                                <div class="t_button ml10">
                                                    <a class="abtn blue" data-status="yes" href="javascript:void(0);" onclick="sendCode(this)">获取手机验证码</a>
                                                </div>
                                            </div>
                                        </td>
                                        <td class="plr20" id="msg_code">
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="tar">
                                            <div class="J_toolsBar">
                                                <div class="t_label">呢称：</div>
                                            </div>
                                        </td>
                                        <td>
                                            <div class="J_toolsBar">
                                                <div class="t_text">
                                                    <label>
                                                        <input type="text" name="nickName"/>
                                                    </label>
                                                </div>
                                            </div>
                                        </td>
                                        <td class="plr20" id="msg_nickName">
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="tar">
                                            <div class="J_toolsBar">
                                                <div class="t_label">密码：</div>
                                            </div>
                                        </td>
                                        <td>
                                            <div class="J_toolsBar">
                                                <div class="t_text">
                                                    <label>
                                                        <input type="password" name="pwd"/>
                                                    </label>
                                                </div>
                                            </div>
                                        </td>
                                        <td class="plr20" id="msg_pwd">
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="tar">
                                            <div class="J_toolsBar">
                                                <div class="t_label">密码确认：</div>
                                            </div>
                                        </td>
                                        <td>
                                            <div class="J_toolsBar">
                                                <div class="t_text">
                                                    <label>
                                                        <input type="password" name="pwd1"/>
                                                    </label>
                                                </div>
                                            </div>
                                        </td>
                                        <td class="plr20" id="msg_pwd1">
                                        </td>
                                    </tr>
                                    
                                    <tr>
                                        <td class="tar">
                                            <div class="J_toolsBar">
                                                <div class="t_label">验证码：</div>
                                            </div>
                                        </td>
                                        <td>
                                            <div class="J_toolsBar">
                                                <div class="t_text t_regCode">
                                                    <label>
                                                        <input type="text" name="imgCode"/>
                                                    </label>
                                                </div>
                                                <div class="t_button ml10">
                                                	<a href="javascript:void(0);">
                                                    	<img src="${ctx }/imageServlet" title="看不清，换一张" id="captchaCode" onclick="changeCode()" width="100" height="36"/>
                                                    </a>
                                                </div>
                                            </div>
                                        </td>
                                        <td class="plr20" id="msg_img_code">
                                        </td>
                                    </tr>
                                    
                                    <tr class="f_fixPadding">
                                        <td>&nbsp;</td>
                                        <td>
                                            <div class="J_toolsBar">
                                                <div class="t_check">
                                                    <label><input type="checkbox" checked="checked" disabled="disabled"/>我已阅读至盈网<a class="alink blue" target="_blank" href="${ctx }/register/agree">用户协议</a></label>
                                                </div>
                                            </div>
                                        </td>
                                        <td>&nbsp;</td>
                                    </tr>
                                    <tr>
                                        <td>&nbsp;</td>
                                        <td>
                                            <div class="J_toolsBar">
                                                <div class="t_button t_regBtn">
                                                    <a class="abtn green" href="javascript:mySubmit();">立即注册</a>
                                                </div>
                                            </div>
                                        </td>
                                        <td>&nbsp;</td>
                                    </tr>
                                </tbody>
                            </table>
                        </div>

                    </div>
                </div>
                </form>
                
                <div class="fr c_430">
                    <div class="pau">
                        <div class="J_moreLogin">
                            <div class="m_txt">直接使用社交帐号登录至盈网</div>
                            <%-- <div class="m_item">
                                <a class="abtn blue" href="#"><i><img src="${ctx }/static/images/i_2.png" /></i><span>使用QQ帐号登录</span></a>
                            </div> --%>
                            <div class="m_item">
                                <a class="abtn green" href="javascript:void(0)"><i><img src="${ctx }/static/images/i_3.png" /></i><span>使用微信帐号登录</span></a>
                            </div>
                        </div>
                    </div>
                </div>

            </div>
        </div>
    </div>

	<%@ include file="common/help.jsp" %>
	<%@ include file="common/foot.jsp" %>

</body>
</html>
