<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />

	<%@ include file="../common/common.jsp"%>

</head>

<body>
    
    <%@ include file="../common/head.jsp" %>

	<!-- 主体内容 -->
    <div class="J_content bgfff mt20 hasShadow">
        <div class="J_title">
            <div class="t_txt has">找回密码方式选择</div>
        </div>
        <div class="mt80 pb80">
            <div style="width:400px;" class="ma clearfix">
                <div class="fl">
                    <div class="J_toolsBar">
                        <div class="t_button">
                            <a class="abtn green" href="${ctx }/findpwd/mobile1">通过手机号找回</a>
                        </div>
                    </div>
                </div>
                <div class="fr">
                    <div class="J_toolsBar">
                        <div class="t_button">
                            <a class="abtn green" href="#">通过邮箱找回</a>
                        </div>
                    </div>
                </div>

            </div>
        </div>
    </div>
    
    
	<%@ include file="../common/foot.jsp" %>

</body>
</html>
