<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />

	<%@ include file="common/common.jsp"%>

</head>

<%@ include file="common/nice-validator.jsp" %>

<body>
    
    <%@ include file="common/head.jsp" %>

	<div class="J_wrap">

        <%@ include file="common/time.jsp" %>

		<div class="J_content mt20 bgfff bg1 hasShadow">            
            <%@ include file="common/menu.jsp" %>
            
            <div class="fr c_1000">

                <div class="J_title less">
                    <div class="t_txt">账户资料</div>
                    <div class="t_tips"></div>
                    <div class="t_more"></div>
                </div>
                <div class="plrb20">
                    <div class="J_miniTitle">
                        <div class="m_token"></div>
                        <div class="m_txt">账户信息</div>
                    </div>

					<div class="J_userInfoTable">
                        <table>
                            <tbody>
                                <tr>
                                    <td><b>姓名：</b></td>
                                    <td>${loginUser.cnName }</td>
                                    <td><b>帐号：</b></td>
                                    <td>${loginUser.mobile }</td>
                                    <td><b>昵称：</b></td>
                                    <td>${loginUser.nickName }</td>
                                    <td><b>性别：</b></td>
                                    <td>
                                    	<c:choose>
                                    		<c:when test="${loginUser.sex eq 0 }">
                                    			男
                                    		</c:when>
                                    		<c:when test="${loginUser.sex eq 1 }">
                                    			女
                                    		</c:when>
                                    	</c:choose>
                                    </td>
                            </tr></tbody>
                        </table>
                    </div>

                    <div class="J_miniTitle">
                        <div class="m_token"></div>
                        <div class="m_txt">已绑定的交易帐号</div>
                    </div>

                    <div class="J_table mt10">
                        <table>
                            <thead>
                                <tr>
                                    <td>平台</td>
                                    <td>帐号</td>
                                    <td>经纪商</td>
                                    <td>状态</td>
                                    <td>虚拟币余额</td>
                                </tr>
                            </thead>
                            <tbody>
                            </tbody>
                        </table>
                    </div>

                </div>

                <div class="J_title less">
                    <div class="t_txt">最新公告</div>
                    <div class="t_tips"></div>
                    <div class="t_more"></div>
                </div>

                <div class="pau">
                    <div class="J_table mt10">
                        <table style="width:100%;">
                            <thead>
                                <tr>
                                    <td>标题</td>
                                    <td>时间</td>
                                </tr>
                            </thead>
                            <tbody>
                            	<c:forEach items="${notices }" var="notice" varStatus="loop">
                            		<c:if test="${loop.index <= 5}">
		                            	<tr>
		                                    <td>${notice.title }</td>
		                                    <td><fmt:formatDate value="${notice.startDate}" pattern="yyyy-MM-dd HH:mm:ss"/></td>
		                                </tr>
	                                </c:if>
                            	</c:forEach>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>
    </div>

    
	<%@ include file="common/help.jsp" %>
	<%@ include file="common/foot.jsp" %>

</body>
</html>
