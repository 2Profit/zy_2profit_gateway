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
	
	headerAddClass();
	
});

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
                        <div class="h_item clearfix">
                            <div class="i_icon i3"></div>
                            <div class="i_txt">重置密码</div>
                        </div>
                        <div class="h_item active clearfix">
                            <div class="i_icon i4"></div>
                            <div class="i_txt">完成</div>
                        </div>

                    </div>


                </div>
			</div>
		</div>
		<div class="mt80">
			<div class="J_registerOver pb80 clearfix">
				<div class="r_icon">
					<img src="${ctx }/static/images/success.png">
				</div>
				<div class="r_txt">
					<div class="t_title full">恭喜您，完成密码设置</div>
				</div>
			</div>

		</div>
	</div>


	<%@ include file="../common/foot.jsp"%>

</body>
</html>
