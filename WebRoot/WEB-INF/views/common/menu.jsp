<%@ page language="java" pageEncoding="UTF-8"%>

<%@ include file="jstl.jsp" %>

<script type="text/javascript">

$(function(){
	$('div.m_txt').each(function(idx, obj){
		var txt = $(obj).text();
		if(txt.indexOf('${menuName}') > -1){
			$(obj).addClass('current');
		}
	});
});

</script>

<div class="fl c_180">

	<div class="J_userInfo">
         <div class="u_left">
             <div class="l_face">
                 <a class="f_hg"></a>
                 <c:choose>
               		<c:when test="${empty sessionScope.login_user.headUrl }">
               			<img src="${ctx }/static/images/userface.jpg" style="width: 64px; height: 64px;"/>
               		</c:when>
               		<c:otherwise>
               			<img src="${ctx }${sessionScope.login_user.headUrl }" style="width: 64px; height: 64px;"/>
               		</c:otherwise>
               	</c:choose>
             </div>
         </div>
         <div class="u_right">
             <div class="r_name" style="">${sessionScope.login_user.nickName }</div>
             <div class="r_info">虚拟币：
             	<span class="cOrange">
             		<c:choose>
             			<c:when test="${not empty sessionScope.login_user.coin }">
             				${sessionScope.login_user.coin }
             			</c:when>
             			<c:otherwise>0</c:otherwise>
             		</c:choose>
             	</span>
             </div>
         </div>
     </div>

     <div class="J_leftMenu">
         <div class="l_item">
             <div class="i_default"><a href="javascript:void(0);"><i class="icon">󰃌</i>账户管理</a></div>
             <div class="i_menu">
                 <div class="m_txt"><a href="${ctx }/main"><i class="icon">󰂻</i>账户资料</a></div>
                 <div class="m_txt"><a href="${ctx }/main/person"><i class="icon">󰃔</i>个人资料</a></div>
                 <div class="m_txt"><a href="${ctx }/main/upload_head"><i class="icon">󰃬</i>更换头像</a></div>
                 <div class="m_txt"><a href="${ctx }/main/update_pwd"><i class="icon">󰃉</i>修改密码</a></div>
             </div>
         </div>
         <div class="l_item">
             <div class="i_default"><a href="#"><i class="icon">󰇸</i>资金管理</a></div>
             <div class="i_menu">
                 <div class="m_txt"><a href="${ctx }/fund/amount"><i class="icon">󰀥</i>额度明細</a></div>
                 <%-- <div class="m_txt"><a href="${ctx }/fund/pay"><i class="icon">󰀵</i>在线充值</a></div> --%>
             </div>
         </div>
         <!-- <div class="l_item">
             <div class="i_default"><a href="#"><i class="icon">󰃵</i>交易资料</a></div>
             <div class="i_menu">
                 <div class="m_txt"><a href="#"><i class="icon">󰄁</i>交易记录</a></div>
             </div>
         </div>
         <div class="l_item">
             <div class="i_default"><a href="#"><i class="icon">󰄎</i>服务管理</a></div>
             <div class="i_menu">
                 <div class="m_txt"><a href="#"><i class="icon">󰃾</i>消息订阅</a></div>
                 <div class="m_txt"><a href="#"><i class="icon">󰇫</i>微信服务</a></div>
                 <div class="m_txt"><a href="#"><i class="icon">󰊛</i>问题回馈</a></div>
             </div>
         </div>
         <div class="l_item">
             <div class="i_default"><a href="#"><i class="icon">󰄊</i>我的活动</a></div>
         </div> -->
         <div class="l_item">
             <div class="i_default"><a href="${ctx }/vote/index/list"><i class="icon">󰇀</i>投票功能</a></div>
         </div>
         <div class="l_item">
             <div class="i_default"><a href="${ctx }/notice/list"><i class="icon">󰊑</i>公告</a></div>
         </div>
         <!-- <div class="l_item">
             <div class="i_default"><a href="#"><i class="icon">󰃕</i>老师专区</a></div>
             <div class="i_menu">
                 <div class="m_txt"><a href="#"><i class="icon">󰂰</i>银行资料</a></div>
                 <div class="m_txt"><a href="#"><i class="icon">󰅐</i>取款</a></div>
             </div>
         </div> -->

     </div>


 </div>
