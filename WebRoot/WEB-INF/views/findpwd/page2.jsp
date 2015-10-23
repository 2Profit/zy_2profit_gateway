<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />

	<%@ include file="../common/common.jsp"%>

</head>

<%@ include file="../common/nice-validator.jsp" %>

<script type="text/javascript">

$(function(){
	
	$('#myForm').validator({
		timely : 0,
		focusCleanup : true,
		fields : {
			mobile : {
				rule : 'required;mobile;remote[${ctx}/register/vaild_mobile_exist]',
				target : '#msg_mobile'
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
	
	
	
});

function sendCode(_this){
	
	var $sendBtn = $(_this);
	if($sendBtn.attr('data-status') == 'no'){
		return;
	}
	
	var seconds = 59;
	$sendBtn.removeClass('green').addClass('gray').html("重新获取 ( 60 ) ");
	$sendBtn.attr('data-status', 'no');
	
	var type = $('select[name="type"]').val();
	var memberId = $('input[name="memberId"]').val();

	codeTimer = setInterval(function(){
		if(seconds < 0){
			clearInterval(codeTimer);
			$sendBtn.removeClass('gray').addClass('green').html('获取验证码');
			$sendBtn.attr('data-status', 'yes');
		}else{
			$sendBtn.html('重新获取 ( ' + (seconds--) + ' )');
		}
	}, 1000); 
	
	$.ajax({
		url : '${ctx}/findpwd/send/code',
		data : {
			'type' : type,
			'memberId' : memberId
		},
		async : false,
		success : function(result){
		}
	});
	
	
	/*
	//检查手机是否通过
	$('input[name="mobile"]').isValid(function(v){
		if(v){
			var seconds = 59;
			$sendBtn.removeClass('green').addClass('gray').html("重新获取 ( 60 ) ");
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
					$sendBtn.removeClass('gray').addClass('green').html('获取手机验证码');
					$sendBtn.attr('data-status', 'yes');
				}else{
					$sendBtn.html('重新获取 ( ' + (seconds--) + ' )');
				}
			}, 1000); 
			
		}else{
			jc.alert('请输入正确的手机号');
		}
	});
	*/
}

function mySubmit(){
	$('#myForm').submit();
}

</script>

<body>
    
    <%@ include file="../common/head.jsp" %>

	<!-- 主体内容 -->
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
                        <div class="h_item active clearfix">
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
                <form action="${ctx }/findpwd/page3" method="post" id="myForm">
                	<input type="hidden" name="memberId" value="${memberId }"/>
                    <table class="r_table">
                        <tbody>
                        	<c:if test="${not empty msg }">
	                        	<tr class="tar">
	                        		<td></td>
	                        		<td style="color: red;text-align: left;">${msg }</td>
	                        	</tr>
                        	</c:if>
                            <tr class="tar">
                                <td>
                                    <div class="J_toolsBar">
                                        <div class="t_label">验证方式：</div>
                                    </div>
                                </td>
                                <td class="t_phone" style="width: 370px;">
                                    <div class="J_toolsBar">
                                        <div class="t_select not" style="width: 250px;">
                                        	<a href="javascript:;" style="text-align: left;">手机号码：${mobile }</a>
                                        	<select name="type">
                                        		<option value="mobile">手机号码：${mobile }</option>
                                        		<c:if test="${not empty email }">
                                        			<option value="email">电子邮箱：${email }</option>
                                        		</c:if>
                                        	</select>
                                        </div>
                                    </div>
                                </td>
                                <td class="t_tips" id="msg_mobile">
                                </td>
                            </tr>
                            <tr class="tar">
                                <td>
                                    <div class="J_toolsBar">
                                        <div class="t_label"><b class="cDeepRed">*</b> 验证码：</div>
                                    </div>
                                </td>
                                <td>
                                    <div class="J_toolsBar">
                                        <div class="t_text" style="width: 100px;">
                                            <label>
                                                <input type="text" name="code">
                                            </label>
                                        </div>
                                        <div class="t_button" style="width: 150px;margin-left: 10px;">
                                        	<a style="padding: 0px;text-align: center;" id="sendCode" onclick="sendCode(this)" class="abtn green" href="javascript:void(0);">获取验证码</a>
                                        </div>
                                    </div>
                                </td>
                                <td class="t_tips" id="msg_code">
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
    
    
	<%@ include file="../common/foot.jsp" %>

</body>
</html>
