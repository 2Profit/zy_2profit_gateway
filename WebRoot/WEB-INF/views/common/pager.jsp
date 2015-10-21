<%@ page contentType="text/html; charset=UTF-8"%>
<%-- <%@ page session="false"%> --%>
<%@ taglib uri="http://jsptags.com/tags/navigation/pager" prefix="pg"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>

<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<style type="text/css">
.pageLink {
	border: 1px solid #dddddd;
	padding: 4px 12px;
	text-decoration: none;
}

.selectPageLink {
	border: 1px solid #0088cc;
	padding: 4px 12px;
	color: #0088cc;
	background-color: #dddddd;
	text-decoration: none;
}
</style>

<script type="text/javascript">
$(function(){
	$("a[name='first']").bind("click",function(event){
		event.preventDefault();
		$("input[name='currentPage']").val(1);
		pageAction();
	});
	$("a[name='prev']").bind("click",function(event){
		event.preventDefault();
		
		var currentPage = parseInt($("input[name='currentPage']").val());
		if(currentPage>1){
			$("input[name='currentPage']").val(currentPage-1);
		}else{
			$("input[name='currentPage']").val(currentPage);
		}
		pageAction();
	});
	$("a[name='next']").bind("click",function(event){
		event.preventDefault();
		
		var totalPage = parseInt($("#totalPage").val());
		var currentPage = parseInt($("input[name='currentPage']").val());
		if(totalPage>currentPage){
			$("input[name='currentPage']").val(currentPage+1);
		}else{
			$("input[name='currentPage']").val(currentPage);
		}
		pageAction();
	});
	$("a[name='doNumberPage']").bind("click",function(event){
		event.preventDefault();
		$("input[name='currentPage']").val($(this).html());
		pageAction();
	});
	$("a[name='last']").bind("click",function(event){
		event.preventDefault();
		$("input[name='currentPage']").val($("#totalPage").val());
		pageAction();
	});
	
	$('a[name="doMyPage"]').bind("click",function(event){
		event.preventDefault();
		if(isNaN($('#myPageNumber').val())){
			$('#myPageNumber').val('');	return false;
		}
		if(parseInt($("#myPageNumber").val()) > parseInt($("#totalPage").val())){
			$("#myPageNumber").val('');return false;
		};
		$("input[name='currentPage']").val($("#myPageNumber").val());
		pageAction();
	});
});
function pageAction(){
	var _form = $("form");
	_form.attr("action",$("button[method='list']").attr("method"));
	_form.submit();
}

</script>

</head>

<body>
	<!-- 分页标签 -->
	<div style="text-align: right; border: 0;padding: 4px 12px;" class="pageDiv">
		<input type="hidden" name="currentPage" value="${page.currentPage }">
		<input type="hidden" id="totalPage" value="${page.totalPage }">
		<c:set var="pageUrl" value="${ctx}/${requestScope['javax.servlet.forward.request_uri']}"/>
		<pg:pager url="${pageUrl}?currentPage=${page.currentPage}" items="${page.totalCount}"
			export="currentPageNumber=pageNumber"
			maxPageItems="${page.pageSize}" maxIndexPages="100" isOffset="true">
					总共：${page.totalCount}条,共:${page.totalPage}页
					<pg:param name="cc" />
			<input type="text" id="myPageNumber" style="width:2%" value="${page.currentPage }" style="color:green;">
			<a name="doMyPage" class="pageLink" href="">跳转</a>
			<pg:first>
				<a name="first" class="pageLink" href="">首页</a>
			</pg:first>
			<pg:prev>
				<a name="prev" class="pageLink" href="">上一页</a>
			</pg:prev>
			<pg:pages>
				<c:choose>
					<c:when test="${page.currentPage==pageNumber}">
						<span class="selectPageLink">${pageNumber}</span>
					</c:when>
					<c:otherwise>
						<c:if test="${(pageNumber-page.currentPage lt 3) and (pageNumber-page.currentPage gt -3)}">
							<a name="doNumberPage" class="pageLink" href="">${pageNumber}</a>
						</c:if>
					</c:otherwise>
				</c:choose>
			</pg:pages>
			<pg:next>
			    <a name="next" class="pageLink" href="">下一页</a>
			</pg:next>
			<pg:last>
				<a name="last" class="pageLink" href="">尾页</a>
			</pg:last>
		</pg:pager>
	</div>
</body>
</html>
