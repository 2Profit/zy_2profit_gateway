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

        <%@ include file="common/timeZone.jsp" %>

        <div class="J_content mt20 bgfff bg1 hasShadow">
            
            <%@ include file="common/leftMenu.jsp" %>
            
            <div class="fr c_1000">

                <div class="J_title less">
                    <div class="t_txt">账户资料</div>
                    <div class="t_tips"></div>
                    <div class="t_more"></div>
                </div>
                <div class="plrb20">
                    <div class="J_miniTitle">
                        <div class="m_token"></div>
                        <div class="m_txt">帳戶信息</div>
                    </div>

                    <div class="J_userInfoTable">
                        <table>
                            <tbody>
                                <tr>
                                    <td>姓名：</td>
                                    <td>张生</td>
                                </tr>
                                <tr>
                                    <td>帐号：</td>
                                    <td>4028263</td>
                                </tr>
                                <tr>
                                    <td>用户名：</td>
                                    <td>abc123</td>
                                </tr>
                            </tbody>
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
                                    <td>公司</td>
                                    <td>级别</td>
                                    <td>余额</td>
                                </tr>
                            </thead>
                            <tbody>
                                <tr>
                                    <td>MT4</td>
                                    <td>Member_21awdad1aa</td>
                                    <td>深圳市腾讯计算机系统有限公司</td>
                                    <td>高级</td>
                                    <td><span class="cOrange">￥300,000,00</span> USD</td>
                                </tr>
                                <tr>
                                    <td>MT4</td>
                                    <td>Member_78adwa1baa</td>
                                    <td>阿里巴巴网络技术有限公司</td>
                                    <td>高级</td>
                                    <td><span class="cOrange">￥842,000,00</span> USD</td>
                                </tr>
                                <tr>
                                    <td>MT4</td>
                                    <td>Member_awd1212317</td>
                                    <td>深圳市迅雷网络技术有限公司</td>
                                    <td>高级</td>
                                    <td><span class="cOrange">￥420,000,00</span> USD</td>
                                </tr>
                                <tr>
                                    <td>MT4</td>
                                    <td>Member_515af12121</td>
                                    <td>北京小米科技有限责任公司</td>
                                    <td>高级</td>
                                    <td><span class="cOrange">￥542,000,00</span> USD</td>
                                </tr>
                                <tr>
                                    <td>MT4</td>
                                    <td>Member_12adwaaw21</td>
                                    <td>北京小米科技有限责任公司</td>
                                    <td>高级</td>
                                    <td><span class="cOrange">￥384,000,00</span> USD</td>
                                </tr>
                                <tr>
                                    <td>MT4</td>
                                    <td>Member_131cf1c121</td>
                                    <td>魅族科技有限公司</td>
                                    <td>高级</td>
                                    <td><span class="cOrange">￥246,000,00</span> USD</td>
                                </tr>

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
