<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<!DOCTYPE>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<%@ include file="../common/common.jsp"%>

<script type="text/javascript">

$(function(){

	var noticeType = $('#noticeType').val();
	if(noticeType==null || noticeType==''){
		$('#allNotice_div').attr("class",'t_item current');
	}else if(noticeType == '0'){
		$('#mainNotice_div').attr("class",'t_item current');
	}else if(noticeType == '1'){
		$('#breakNotice_div').attr("class",'t_item current');
	}else if(noticeType == '2'){
		$('#repairNotice_div').attr("class",'t_item current');
	}
	
});



</script>

</head>

<%@ include file="../common/nice-validator.jsp" %>
<body>

	<%@ include file="../common/head.jsp" %>
    <div class="J_wrap">
       <%@ include file="../common/time.jsp" %>
        <div class="J_content mt20 bgfff bg1 hasShadow">
            
            <%@ include file="../common/menu.jsp" %>
            <div class="fr c_1000">


				<div class="J_title less">
					<div class="t_txt">最新公告</div>
					<div class="t_tips"></div>
					<div class="t_more"></div>
					<input type="hidden" value="${noticeType }" id="noticeType">
				</div>

				<div class="plr20">
					<div class="J_type">
						<div class="t_item" id="allNotice_div">
							<div class="i_txt"><a href="${ctx }/notice/list"><span>全部</span><b>${allNumb }</b></a></div>
						</div>
						<div class="t_item" id="mainNotice_div">
							<div class="i_txt"><a href="${ctx }/notice/mainList"><span>重要公告</span><b>${mainNumb }</b></a></div>
						</div>
						<div class="t_item" id="breakNotice_div">
							<div class="i_txt"><a href="${ctx }/notice/breakList"><span>休市安排</span><b>${breakNumb }</b></a></div>
						</div>
						<div class="t_item" id="repairNotice_div">
							<div class="i_txt"><a href="${ctx }/notice/repairList"><span>维护通知</span><b>${repairNumb }</b></a></div>
						</div>
					</div>
				</div>

 				<div class="plrb20">
                    <div data-ui="newsList"  class="J_newsList">
						<c:forEach items="${notices }" var="notice">
	                        <div class="n_item">
	                            <div class="i_title">
	                                <div class="t_time"><fmt:formatDate value="${notice.startDate}" pattern="yyyy-MM-dd"/></div>
	                                <div class="t_txt">
	                                    <a class="alink black hover" href="#">${notice.title }<img src="${ctx }/static/images/new.gif" /></a>
	                                </div>
	                            </div>
	                            <div class="i_content">${notice.content }</div>
	                        </div>				
						</c:forEach>
					</div>
				</div>



			</div>
        </div>
    </div>

	<%@ include file="../common/help.jsp" %>
	<%@ include file="../common/foot.jsp" %>

</body>
</html>
