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
	$(function() {
		
	});

</script>

<body>

	<%@ include file="../common/head.jsp"%>

	<div class="J_wrap">

		<%@ include file="../common/time.jsp"%>

		<div class="J_content mt20 bgfff bg1 hasShadow">
			<%@ include file="../common/menu.jsp"%>

			<div class="fr c_1000">

                <div class="J_title less">
                    <div class="t_txt">存款成功</div>
                    <div class="t_tips"></div>
                    <div class="t_more"></div>
                </div>

                <div class="J_success">
                    <div class="s_left">
                    <img src="${ctx }/static/images/success.png" /></div>
                    <div class="s_right">
                        <div class="r_big">存款通知提交成功！</div>
                        <div class="r_sm">申請編碼：<span class="cGreen">902150513Y668</span></div>
                    </div>
                </div>

                <div class="J_btnGroup md">
                    <a class="abtn orange" href="${ctx }/fund/pay">返回</a>
                </div>

            </div>
			
			
		</div>
	</div>


	<%@ include file="../common/help.jsp"%>
	<%@ include file="../common/foot.jsp"%>

</body>
</html>
