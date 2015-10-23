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
	
	$('#myForm').validator({
		timely : 0,
		focusCleanup : true,
		fields : {
			username : {
				rule : 'required;',
				target : '#msg_username'
			},
			code : {
				rule : 'required;',
				target : '#msg_code'
			}
		},
		valid : function(form){
			form.submit();
		}
	});
	
	$('#myForm input').on('focus', function(){
		$('#msg').hide();
	});
	
});

function changeCode(){
	$('#captchaCode').attr('src', '${ctx }/imageServlet?' + Math.floor(Math.random() * 100));
}

function mySubmit(){
	$('#myForm').submit();
}

</script>

<body>

	<%@ include file="../common/head.jsp"%>

	<div class="J_content bgfff mt20 hasShadow">
		<div class="J_title">
			<div class="t_txt has">找回密码</div>
		</div>
		<div class="pt40">
			<div class="J_retrieve">
				<div class="r_inner">
					<div class="i_header">
						<div class="h_item active clearfix">
							<div class="i_icon i1"></div>
							<div class="i_txt">输入账号</div>
						</div>
						<div class="h_item clearfix">
							<div class="i_icon i2"></div>
							<div class="i_txt">验证身份</div>
						</div>
						<div class="h_item clearfix">
							<div class="i_icon i3"></div>
							<div class="i_txt">重置密码</div>
						</div>
						<div class="h_item clearfix">
							<div class="i_icon i4"></div>
							<div class="i_txt">完成</div>
						</div>

					</div>


				</div>


			</div>
		</div>
		<div class="mt40">
			<div class="J_register pb40">
				<form action="${ctx }/findpwd/find/member" id="myForm" method="post">
					<table class="r_table">
						<tbody>
							<c:if test="${not empty msg }">
								<tr id="msg">
									<td class="tar"></td>
									<td colspan="2">
										<div class="J_toolsBar">
											<div class="t_label">
												<font color="red">${msg }</font>
											</div>
										</div>
									</td>	
								</tr>
							</c:if>
							<tr>
								<td class="tar">
									<div class="J_toolsBar">
										<div class="t_label">
											<b class="cDeepRed">*</b>账号：
										</div>
									</div>
								</td>
								<td style="width: 200px;">
									<div class="J_toolsBar">
										<div class="t_text" style="width: 250px;">
											<label> <input type="text" name="username" placeholder="手机号码/邮箱"></label>
										</div>
									</div>
								</td>
								<td class="t_tips" id="msg_username">
								</td>
							</tr>
							<tr>
								<td class="tar">
									<div class="J_toolsBar">
										<div class="t_label">
											<b class="cDeepRed">*</b> 验证码：
										</div>
									</div>
								</td>
								<td>
									<div class="J_toolsBar fl">
										<div class="t_text" style="width: 150px;">
											<label> <input type="text" name="code" placeholder="验证码"></label>
										</div>

											<a href="javascript:void(0);" style="margin-left: 10px;"> 
												<img id="captchaCode" src="${ctx }/imageServlet" title="看不清，下一张" onclick="changeCode()">
											</a>

									</div>
								</td>
								<td class="t_tips" id="msg_code">
								</td>
							</tr>
							<tr>
								<td></td>
								<td>
									<div class="J_btnGroup mt20">
										<a class="abtn green" href="javascript:mySubmit();">下一步</a>
									</div>
								</td>
								<td></td>
							</tr>
						</tbody>

					</table>
				</form>
			</div>


		</div>
	</div>


	<%@ include file="../common/foot.jsp"%>

</body>
</html>
