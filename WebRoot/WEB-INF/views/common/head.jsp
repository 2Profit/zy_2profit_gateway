<%@ page language="java" pageEncoding="UTF-8"%>

<%@ include file="jstl.jsp" %>

<div data-ui="header" class="J_header">
     <div class="h_inner">
         <div class="i_logo"><a href="javascript:void(0);"><img src="${ctx }/static/images/logo.png"></a></div>
         <div class="i_login">
         	<c:if test="${empty sessionScope.login_user }">
             <!-- 没登录显示这个 -->
             <div class="l_not">
                 <div class="n_item">
                     <div class="i_default">
                         <a href="${ctx }/login">登录</a>
                     </div>
                 </div>
                 <div class="n_item">
                     <div class="i_default">
                         <a href="${ctx }/register">注册</a>
                     </div>
                 </div>
             </div>
            </c:if>
            <c:if test="${not empty sessionScope.login_user }">
             <!-- 登录了显示这个 -->
             <div class="l_login">
                 <div class="l_face">
                     <c:choose>
                   		<c:when test="${empty sessionScope.login_user.headUrl }">
                   			<img src="${ctx }/static/images/userface.jpg" width="60" height="60"/>
                   		</c:when>
                   		<c:otherwise>
                   			<img src="${ctx }${sessionScope.login_user.headUrl }"  style="width: 64px; height: 64px;"/>
                   		</c:otherwise>
                   	</c:choose>
                     <a href="${ctx }/main">
                     	<img src="${ctx }/static/images/header_face.png">
                     </a>
                 </div>
                 <div class="l_info">
                     <div class="i_name">${sessionScope.login_user.nickName }</div>
                     <div class="i_logout"><a href="${ctx }/login_out">[退出]</a></div>
                 </div>
             </div>
            </c:if> 
         </div>
         <div class="i_nav">
             <div class="n_item">
                 <div class="i_default"><a href="${ctx }/index">首页</a></div>
                 <div class="i_menu"></div>
             </div>
             <div class="n_item">
                 <div class="i_default"><a href="#">金价行情</a></div>
                 <div class="i_menu"></div>
             </div>
             <div class="n_item">
                 <div class="i_default"><a href="#">财经日历</a></div>
                 <div class="i_menu"></div>
             </div>
             <div class="n_item">
                 <div class="i_default"><a href="${ctx }/bk/list">为你选经销商</a></div>
                 <div class="i_menu"></div>
             </div>
             <div class="n_item">
                 <div class="i_default"><a href="#">社区</a></div>
                 <div class="i_menu"></div>
             </div>
             <div class="n_item">
                 <div class="i_default"><a href="#">活动</a></div>
                 <div class="i_menu"></div>
             </div>
         </div>
     </div>


 </div>