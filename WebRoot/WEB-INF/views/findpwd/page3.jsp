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
	
	//表单验证
	$('#myForm').validator({
		timely : 0,
		focusCleanup : true,
		fields : {
			pwd : {
				rule : '密码: required;password',
				target : '#msg_pwd'
			},
			pwd1 : {
				rule : '密码确认: required;match[pwd]',
				target : '#msg_pwd1'
			}
		},
		valid : function(form){
			form.submit();
		}
	});
	
});

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
                        <div class="h_item clearfix">
                            <div class="i_icon i1"></div>
                            <div class="i_txt">输入账号</div>
                        </div>
                        <div class="h_item clearfix">
                            <div class="i_icon i2"></div>
                            <div class="i_txt">验证身份</div>
                        </div>
                        <div class="h_item active clearfix">
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
				<form action="${ctx }/findpwd/updatepwd" id="myForm" method="post">
					<input type="hidden" name="memberId" value="${member.id }" />
					<table class="r_table">
						<tbody>
							<tr>
								<td style="width: 88px;" class="tar"><div
										class="J_toolsBar">
										<div class="t_label">
											<b class="cDeepRed">*</b>设置密码：
										</div>
									</div>
								</td>
								<td style="width: 370px;">
									<div class="J_toolsBar">
										<div class="t_text">
											<label><input type="password" name="pwd" placeholder="密码为8-6位字母或数字组合"></label>
										</div>
									</div>
								</td>
								<td class="t_tips" id="msg_pwd">
								</td>
							</tr>
							<tr>
								<td class="tar"></td>
								<td class="fz14" colspan="2">
									<div class="mlr20">
									</div>
								</td>
							</tr>
							<tr>
								<td class="tar">
									<div class="J_toolsBar">
										<div class="t_label">
											<b class="cDeepRed">*</b>确认密码：
										</div>
									</div>
								</td>
								<td>
									<div class="J_toolsBar">
										<div class="t_text">
											<label><input type="password" name="pwd1" placeholder="再次输入密码"></label>
										</div>
									</div>
								</td>

								<td class="t_tips" id="msg_pwd1">
								</td>
							</tr>
							<tr>
								<td></td>
								<td>
									<div class="J_btnGroup mt40">
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
