<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />

<%@ include file="../common/common.jsp"%>

</head>

<%@ include file="../common/nice-validator.jsp"%>

<script type="text/javascript">

$(function(){
	
	$('select[name="userType"]').on('change', function(){
		var val = $(this).val();
		var $userNameSel = $('select[name="userName"]').html('');
		if(val == 0){
			$userNameSel.append('<option value="${loginUser.mobile }">${loginUser.mobile }</option>');
		}else if(val == 1){
			
		}
		$userNameSel.change();
	});
	
	$('#myForm').validator({
		fields : {
			userType : {
				rule : 'required',
				target : '#userType'
			},
			userName : {
				rule : 'required',
				target : '#userName'
			},
			oldPwd : {
				rule : '旧密码: required',
				target : '#oldPwd'
			},
			pwd1 : {
				rule : '新密码: required;password',
				target : '#pwd1'
			},
			pwd2 : {
				rule : '重复新密码: required;match[pwd1]',
				target : '#pwd2'
			}
		},
		valid : function(form){
			$(form).ajaxSubmit({
				url : '${ctx}/main/ajax/save/update_pwd',
				async : false,
				success : function(result){
					if(result.success){
						jc.alert('修改成功，请重新登录');
						window.location.href = '${ctx}/login_out';
					}else{
						jc.alert(result.msg);
					}
				}
			});
		}
	});
	
});

function mySubmit(){
	$('#myForm').submit();
}

</script>

<body>

	<%@ include file="../common/head.jsp"%>
		<div class="J_wrap">

	        <%@ include file="../common/time.jsp" %>
	
			<div class="J_content mt20 bgfff bg1 hasShadow">            
	            <%@ include file="../common/menu.jsp" %>
            
				<div class="fr c_1000">
			
					<div class="J_title less">
						<div class="t_txt">修改密码</div>
						<div class="t_tips"></div>
						<div class="t_more"></div>
					</div>
					
					<form action="" id="myForm">
					<div class="plrb20">
						<div style="" class="J_form J_reg ma mt20">
							<table>
								<tbody>
									<tr>
										<td class="tar">
											<div class="J_toolsBar">
												<div class="t_label plr10 fr">
													<span class="cDeepRed fz16">* </span>项目：
												</div>
											</div>
										</td>
										<td>
											<div class="J_toolsBar">
												<div class="t_select">
													<a href="javascript:;">用户中心</a> 
													<select name="userType">
														<option value="0">用户中心</option>
														<option value="1">交易平台</option>
													</select>
												</div>
											</div>
										</td>
										<td class="plr20" id="utType">
										</td>
									</tr>
									<tr>
										<td class="tar">
											<div class="J_toolsBar">
												<div class="t_label plr10 fr">
													<span class="cDeepRed fz16">* </span>帐号：
												</div>
											</div>
										</td>
										<td>
											<div class="J_toolsBar">
												<div class="t_select">
													<a href="javascript:;">${loginUser.mobile }</a> 
													<select name="userName">
														<option value="${loginUser.mobile }">${loginUser.mobile }</option>
													</select>
												</div>
											</div>
										</td>
										<td class="plr20" id="userName">
										</td>
									</tr>
									<tr>
										<td class="tar">
											<div class="J_toolsBar">
												<div class="t_label plr10 fr">
													<span class="cDeepRed fz16">* </span>请输入旧密码：
												</div>
											</div>
										</td>
										<td>
											<div class="J_toolsBar">
												<div class="t_text">
													<label> 
														<input type="password" name="oldPwd">
													</label>
												</div>
											</div>
										</td>
										<td class="plr20" id="oldPwd">
										</td>
									</tr>
									<tr>
										<td class="tar">
											<div class="J_toolsBar">
												<div class="t_label plr10 fr">
													<span class="cDeepRed fz16">* </span>请输入新密码：
												</div>
											</div>
										</td>
										<td>
											<div class="J_toolsBar">
												<div class="t_text">
													<label> 
														<input type="password" name="pwd1">
													</label>
												</div>
											</div>
										</td>
										<td class="plr20" id="pwd1">
										</td>
									</tr>
									<tr>
										<td class="tar">
											<div class="J_toolsBar">
												<div class="t_label plr10 fr">
													<span class="cDeepRed fz16">* </span>再输入新密码：
												</div>
											</div>
										</td>
										<td>
											<div class="J_toolsBar">
												<div class="t_text">
													<label> 
														<input type="password" name="pwd2">
													</label>
												</div>
											</div>
										</td>
										<td class="plr20" id="pwd2">
										</td>
									</tr>
									<tr>
										<td>&nbsp;</td>
										<td>
											<div class="J_toolsBar">
												<div class="t_button t_regBtn">
													<a class="abtn green" href="javascript:void(0);" onclick="mySubmit()">更改密码</a>
												</div>
											</div>
										</td>
										<td>&nbsp;</td>
									</tr>
								</tbody>
							</table>
						</div>
			
					</div>
					</form>
				</div>
		</div>
    </div>

	<%@ include file="../common/help.jsp"%>
	<%@ include file="../common/foot.jsp"%>

</body>
</html>
