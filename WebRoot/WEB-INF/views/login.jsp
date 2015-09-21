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
	
	$('#loginForm').validator({
		fields : {
			username : {
				rule : 'required',
				target : '#msg_username'
			},
			pwd : {
				rule : 'required',
				target : '#msg_pwd'
			}
		},
		valid : function(form){
			$('#loginForm').ajaxSubmit({
				url : '${ctx }/dologin',
				type : 'post',
				async : false,
				success : function(result){
					if(result.success){
						//写入cookie
						if(form.autoChk.checked){
							
						}
						window.location.href = '${ctx}/main';
					}else{
						jc.alert(result.msg);
					}
				}
			});
		}
	});
	
});

function mySubmit(){
	$('#loginForm').submit();
}

</script>

<body>
    
    <%@ include file="common/head.jsp" %>

	<div class="J_wrap">

        <div class="J_content mt20 bgfff hasShadow">
            <div class="pau">
                <div class="J_title">
                    <div class="t_txt">用户登录</div>
                    <div class="t_tips"></div>
                    <div class="t_more"></div>
                </div>
            </div>
            <div class="clearfix pb20">
                <div class="fl c_760 c_rightBorder">
                    <div class="pau">
                        <div class="J_form pl80 J_reg">
                        	<form action="" method="post" id="loginForm">
                            <table>
                                <tbody>
                                	<c:if test="${not empty msg }">
                                	<tr>
                                        <td>&nbsp;</td>
                                        <td>
                                            <div class="J_toolsBar">
                                            	<label style="color: red;">${msg }</label>
                                            </div>
                                        </td>
                                        <td>&nbsp;</td>
                                    </tr>
                                    </c:if>
                                    <tr>
                                        <td class="tar">
                                            <div class="J_toolsBar">
                                                <div class="t_label">手机号：</div>
                                            </div>
                                        </td>
                                        <td>
                                            <div class="J_toolsBar">
                                                <div style="width: 64px;" class="t_select">
                                                    <a href="javascript:;">中国 86</a>
                                                    <select name="mobilePfx">
                                                        <option value="86">中国 86</option>
                                                        <option value="852">香港 852</option>
                                                        <option value="853">澳门 853</option>
                                                    </select>
                                                </div>
                                                <div class="t_text ml10 t_phoneNumber">
                                                    <label>
                                                        <input type="text" name="username"/>
                                                    </label>
                                                </div>
                                            </div>
                                        </td>
                                        <td class="plr20" id="msg_username">
                                            
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
                                    <tr class="f_fixPadding">
                                        <td>&nbsp;</td>
                                        <td>
                                            <div class="J_toolsBar">
                                                <div class="fl t_check">
                                                    <label>
                                                        <input type="checkbox" name="autoChk" value="1"/>自动登录</label>
                                                </div>
                                                <div class="fr t_label">
                                                    <a class="alink blue" href="#">忘记密码?</a>
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
                                                    <a class="abtn green" href="javascript:mySubmit();">立即登录</a>
                                                </div>
                                            </div>
                                        </td>
                                        <td>&nbsp;</td>
                                    </tr>
                                    <tr>
                                        <td colspan="3">
                                            <div class="btd"></div>
                                            <div class="J_toolsBar mt10">
                                                <div class="t_label">
                                                   	 社交帐号登录
                                                </div>
                                                <div class="ml10 t_icon">
                                                    <!-- <a class="i_link i_sina" href="#"></a>
                                                    <a class="i_link i_qq" href="#"></a> -->
                                                    <a class="i_link i_wx" href="#"></a>
                                                </div>
                                            </div>
                                        </td>
                                    </tr>
                                </tbody>
                            </table>
                            </form>
                        </div>


                    </div>
                </div>
                <div class="fr c_430">
                    <div class="pau">
                        <div class="J_moreLogin">
                            <div class="m_txt">还沒有e桶金帐号?</div>
                            <div class="m_item tac">
                                <a class="abtn orange" href="${ctx }/register">
                                    <span>马上注册e桶金帐号</span>
                                </a>
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
