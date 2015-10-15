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

function mySubmit(){
	$('#myForm').submit();
}

</script>

<body>

	<%@ include file="../common/head.jsp"%>

	<div class="J_wrap">

		<%@ include file="../common/time.jsp"%>

		<div class="J_content mt20 bgfff bg1 hasShadow">
			<%@ include file="../common/menu.jsp"%>
			<div class="fr c_1000">

				<div class="J_title less">
					<div class="t_txt">额度明细</div>
					<div class="t_tips"></div>
					<div class="t_more"></div>
				</div>
				<div class="plrb20">

					<div class="J_toolsBar mt20">
						<div class="t_label fz28 cOrange">
							<c:choose>
		             			<c:when test="${not empty sessionScope.login_user.coin }">
		             				${sessionScope.login_user.coin }
		             			</c:when>
		             			<c:otherwise>0</c:otherwise>
		             		</c:choose>
						</div>
						<div class="t_label ml40 fz14 c999">虚拟币 ( <fmt:formatNumber value="${exchangeRate.rmb }" pattern="0"/>人名币 = ${exchangeRate.coin }虚拟币  )</div>

						<div class="t_button ml40">
							<a class="abtn orange" href="${ctx }/fund/pay">在线充值</a>
						</div>
						
					</div>


					<div class="J_miniTitle mt10">
						<div class="m_token"></div>
						<div class="m_txt">流水详情</div>
					</div>

					<form action="${ctx }/fund/amount" id="myForm">
						<div class="J_toolsBar mt10">
							<div class="t_label">查询时间：</div>
							<div class="t_text w180">
								<label> 
									<input type="text" value="${startDate }" name="startDate" onclick="WdatePicker()" class="Wdate"/>
								</label>
							</div>
							<div class="t_label ml10">至</div>
							<div class="t_text w180 ml10">
								<label> 
									<input type="text" value="${endDate }" name="endDate" onclick="WdatePicker()" class="Wdate"/>
								</label>
							</div>
							<div class="t_button ml10">
								<a class="abtn green" href="javascript:void(0);" onclick="mySubmit()">查询</a>
							</div>
						</div>
					</form>

					<div class="J_table mt20">
						<table>
							<thead>
								<tr>
									<td>时间</td>
									<td>额度变化前</td>
									<td>变化金额</td>
									<td>额度变化后</td>
								</tr>
							</thead>
							<tbody>
								<c:forEach items="${memCoinLogs }" var="log">
									<tr data-type="${log.type }" date-change-type="${log.changeType }">
										<td><fmt:formatDate value="${log.createDate }" pattern="yyyy-MM-dd HH:mm"/></td>
										<td>${log.beforeCoin }</td>
										<td>${log.coin }</td>
										<td>${log.afterCoin }</td>
									</tr>
								</c:forEach>
							</tbody>
						</table>
					</div>


				</div>

			</div>

		</div>
	</div>

	<%@ include file="../common/foot.jsp"%>

</body>
</html>
