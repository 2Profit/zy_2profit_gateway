<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<%@include file="common/common.jsp"%>

</head>

<script type="text/javascript">
	$(function() {
		$('div[data-ui="header"]').addClass('index');
	});
</script>

<body>
	<jsp:include page="common/head.jsp" />

	<c:if test="${empty loginUser }">
		<div data-ui="loginWrap" class="J_loginWrap">
			<div class="l_left">
				<div class="J_toolsBar">
					<div class="t_label">跟随顶尖交易员投资</div>
					<div class="ml10 t_button">
						<a class="abtn green" href="${ctx }/register">立即注册</a>
					</div>
				</div>
			</div>
			<div class="l_right">
				<form action="" id="loginForm">
					<div class="J_toolsBar">
						<div class="t_text w180">
							<label> <input placeholder="手机号码/邮箱" type="text"
								name="username" />
							</label>
						</div>
						<div class="ml10 t_text w180">
							<label> <input placeholder="密码" type="password"
								name="pwd" />
							</label>
						</div>
						<div class="ml10 t_button">
							<a class="abtn red" href="javascript:myLoginSubmit('/main');">登录</a>
						</div>

						<div class="ml20 t_label">社交帐号登录</div>

						<div class="ml10 t_icon">
							<!-- <a class="i_link i_sina" href="#"></a>
	                    <a class="i_link i_qq" href="#"></a> -->
							<a class="i_link i_wx" href="#"></a>
						</div>
					</div>
				</form>
			</div>
		</div>
	</c:if>

	<div data-ui="indexMask" class="J_indexMask"></div>

	<div data-ui="banner" class="J_banner">
		<div class="b_background"></div>
	</div>

	<div class="J_content mt-260 bgfff hasShadow">
		<div class="fl c_760">
			<div class="pau">
				<div class="J_title">
					<div class="t_txt">经纪商</div>
					<div class="t_tips">从事经纪商活动的人不能直接进入交易所经营，他们的主要作用是接受投资者的委托</div>
					<div class="t_more">
						<a href="${ctx }/bk/list">更多&nbsp;&gt;</a>
					</div>
				</div>

				<div class="J_jjsList">
					<div class="j_inner">
						<div class="i_main">
							<c:forEach items="${brokers }" var="broker">
								<div class="m_item">
									<div class="i_pic">
										<img width="54" height="54" src="/${broker.imageUrl }" />
									</div>
									<div class="i_info">
										<div class="i_name">${broker.cnName }${broker.enName }</div>
										<div class="i_abstract">
											<div class="a_left">
												<div class="l_txt">评定1</div>
												<div class="l_prog">
													<div style="width: 88%;" class="p_bar"></div>
												</div>
												<div class="ml10 l_txt">评定2</div>
												<div class="l_prog">
													<div style="width: 88%;" class="p_bar"></div>
												</div>
											</div>
											<div class="a_right">5分钟前</div>
										</div>
									</div>
								</div>
							</c:forEach>
						</div>
					</div>
				</div>

			</div>
		</div>


		<div class="fr c_430">
			<div class="pau">
				<div class="J_title">
					<div class="t_txt">晒单</div>
					<div class="t_tips">实时更新最新动态</div>
					<div class="t_more">
						<a href="#">更多&nbsp;&gt;</a>
					</div>
				</div>

				<div class="J_sdList">
					<div class="s_inner">
						<div class="i_main">


							<div class="m_item">
								<div class="i_pic">
									<img width="54" height="54" src="${ctx }/static/tmp/u1.png" />
								</div>
								<div class="i_info">
									<div class="i_name">Barack Hussein Obama</div>
									<div class="i_abstract">
										<div class="a_left">
											<div class="l_txt">评定1</div>
											<div class="l_prog">
												<div style="width: 88%;" class="p_bar"></div>
											</div>
											<div class="ml10 l_txt">评定2</div>
											<div class="l_prog">
												<div style="width: 88%;" class="p_bar"></div>
											</div>
										</div>
										<div class="a_right">36人跟随</div>
									</div>
								</div>
							</div>
							<div class="m_item">
								<div class="i_pic">
									<img width="54" height="54" src="${ctx }/static/tmp/u1.png" />
								</div>
								<div class="i_info">
									<div class="i_name">Barack Hussein Obama</div>
									<div class="i_abstract">
										<div class="a_left">
											<div class="l_txt">评定1</div>
											<div class="l_prog">
												<div style="width: 88%;" class="p_bar"></div>
											</div>
											<div class="ml10 l_txt">评定2</div>
											<div class="l_prog">
												<div style="width: 88%;" class="p_bar"></div>
											</div>
										</div>
										<div class="a_right">36人跟随</div>
									</div>
								</div>
							</div>
							<div class="m_item">
								<div class="i_pic">
									<img width="54" height="54" src="${ctx }/static/tmp/u1.png" />
								</div>
								<div class="i_info">
									<div class="i_name">Barack Hussein Obama</div>
									<div class="i_abstract">
										<div class="a_left">
											<div class="l_txt">评定1</div>
											<div class="l_prog">
												<div style="width: 88%;" class="p_bar"></div>
											</div>
											<div class="ml10 l_txt">评定2</div>
											<div class="l_prog">
												<div style="width: 88%;" class="p_bar"></div>
											</div>
										</div>
										<div class="a_right">36人跟随</div>
									</div>
								</div>
							</div>
							<div class="m_item">
								<div class="i_pic">
									<img width="54" height="54" src="${ctx }/static/tmp/u1.png" />
								</div>
								<div class="i_info">
									<div class="i_name">Barack Hussein Obama</div>
									<div class="i_abstract">
										<div class="a_left">
											<div class="l_txt">评定1</div>
											<div class="l_prog">
												<div style="width: 88%;" class="p_bar"></div>
											</div>
											<div class="ml10 l_txt">评定2</div>
											<div class="l_prog">
												<div style="width: 88%;" class="p_bar"></div>
											</div>
										</div>
										<div class="a_right">36人跟随</div>
									</div>
								</div>
							</div>
							<div class="m_item">
								<div class="i_pic">
									<img width="54" height="54" src="${ctx }/static/tmp/u1.png" />
								</div>
								<div class="i_info">
									<div class="i_name">Barack Hussein Obama</div>
									<div class="i_abstract">
										<div class="a_left">
											<div class="l_txt">评定1</div>
											<div class="l_prog">
												<div style="width: 88%;" class="p_bar"></div>
											</div>
											<div class="ml10 l_txt">评定2</div>
											<div class="l_prog">
												<div style="width: 88%;" class="p_bar"></div>
											</div>
										</div>
										<div class="a_right">36人跟随</div>
									</div>
								</div>
							</div>
							<div class="m_item">
								<div class="i_pic">
									<img width="54" height="54" src="${ctx }/static/tmp/u1.png" />
								</div>
								<div class="i_info">
									<div class="i_name">Barack Hussein Obama</div>
									<div class="i_abstract">
										<div class="a_left">
											<div class="l_txt">评定1</div>
											<div class="l_prog">
												<div style="width: 88%;" class="p_bar"></div>
											</div>
											<div class="ml10 l_txt">评定2</div>
											<div class="l_prog">
												<div style="width: 88%;" class="p_bar"></div>
											</div>
										</div>
										<div class="a_right">36人跟随</div>
									</div>
								</div>
							</div>

						</div>
					</div>

				</div>
			</div>

		</div>
	</div>



	<div class="J_content mt20 bgfff hasShadow">
		<div class="fl c_760">
			<div class="pau">
				<div class="J_title">
					<div class="t_txt">至盈社区</div>
					<div class="t_tips"></div>
					<div class="t_more">
						<a href="${ctx }/vote/index/list">更多投票&nbsp;&gt;</a>
					</div>
				</div>

				<div class="J_voteTitle mt10">${currentTopic.titleContent }<span
						class="fz14 cOrange">回应数量(${currentTopic.postCount })</span>
				</div>
				<div class="J_voteSuccess mt10">
					<c:forEach items="${currentTopic.options }" var="option"
						varStatus="index">
						<div class="v_item">
							<div class="i_left">${option.optionContent }</div>
							<div class="i_right">
								<c:choose>
									<c:when
										test="${currentTopic.voteCount == null || currentTopic.voteCount == 0 }">
										<div style="width: 0%; background-color: #ee6a53;"
											class="r_bar">
											<div class="b_txt">0%</div>
										</div>
									</c:when>
									<c:otherwise>
										<div
											style="width:<fmt:formatNumber type='number' value='${option.voteCount*100/currentTopic.voteCount}' maxFractionDigits='0'/>%; background-color: #ee6a53;"
											class="r_bar">
											<div class="b_txt">
												<fmt:formatNumber type="number"
													value="${option.voteCount*100/currentTopic.voteCount}"
													maxFractionDigits="0" />
												%
											</div>
										</div>
									</c:otherwise>
								</c:choose>
							</div>
						</div>
					</c:forEach>
				</div>

				<div data-ui="commentsList" class="J_commentsList">
					<div class="c_item">
						<div class="i_left">
							<div class="l_img">
								<img src="${ctx }/static/tmp/face_08.jpg">
							</div>
							<div class="l_hg"></div>
						</div>
						<div class="i_right">
							<div class="r_info clearfix">
								<div class="fl">${currentTopic.mostPraisePost1.publisher.userName }
									时间:
									<fmt:formatDate
										value="${currentTopic.mostPraisePost1.createDate }"
										type="both" pattern="yyyy-MM-dd HH:mm:ss" />
								</div>
							</div>
							<div class="r_content">${currentTopic.mostPraisePost1.postContent }</div>
						</div>

					</div>

					<div class="c_item">
						<div class="i_left">
							<div class="l_img">
								<img src="${ctx }/static/tmp/face_03.jpg">
							</div>
							<div class="l_hg"></div>
						</div>
						<div class="i_right">
							<div class="r_info clearfix">
								<div class="fl">${currentTopic.mostPraisePost2.publisher.userName }
									时间:
									<fmt:formatDate
										value="${currentTopic.mostPraisePost2.createDate }"
										type="both" pattern="yyyy-MM-dd HH:mm:ss" />
								</div>
							</div>
							<div class="r_content">${currentTopic.mostPraisePost2.postContent }</div>
						</div>

					</div>
				</div>


				<div class="J_btnGroup mt20 md">
					<a class="abtn green" href="${ctx }/vote/index/list">我要投票</a> <a class="abtn blue"
						href="${ctx }/vote/index/list">我要回应</a>
				</div>

			</div>

		</div>
		<div class="fr c_430">
			<div class="pau">
				<div class="J_title">
					<div class="t_txt">财经资讯</div>
					<div class="t_tips"></div>
					<div class="t_more">
						<a href="#">更多资讯&nbsp;&gt;</a>
					</div>
				</div>
				<div class="J_cjzxList">
					<div class="c_inner">
						<div class="i_main">
							<div class="m_item">
								<div class="i_pic">
									<a href="#"> <img src="${ctx }/static/tmp/k1.jpg" />
									</a>
								</div>
								<div class="i_info">
									<div class="i_name">
										<a href="#">Barack Hussein Obama</a>
									</div>
									<div class="i_txt">这里是内容这里是内容这里是内容这里是内容这里是内容这里是内容这里是内容这里是内容这里是内容这里是内容这里是内容</div>
								</div>
							</div>
							<div class="m_item">
								<div class="i_pic">
									<a href="#"> <img src="${ctx }/static/tmp/k2.jpg" />
									</a>
								</div>
								<div class="i_info">
									<div class="i_name">
										<a href="#">Barack Hussein Obama</a>
									</div>
									<div class="i_txt">这里是内容这里是内容这里是内容这里是内容这里是内容这里是内容这里是内容这里是内容这里是内容这里是内容这里是内容</div>
								</div>
							</div>
							<div class="m_item">
								<div class="i_pic">
									<a href="#"> <img src="${ctx }/static/tmp/k3.jpg" />
									</a>
								</div>
								<div class="i_info">
									<div class="i_name">
										<a href="#">Barack Hussein Obama</a>
									</div>
									<div class="i_txt">这里是内容这里是内容这里是内容这里是内容这里是内容这里是内容这里是内容这里是内容这里是内容这里是内容这里是内容</div>
								</div>
							</div>
							<div class="m_item">
								<div class="i_pic">
									<a href="#"> <img src="${ctx }/static/tmp/k4.jpg" />
									</a>
								</div>
								<div class="i_info">
									<div class="i_name">
										<a href="#">Barack Hussein Obama</a>
									</div>
									<div class="i_txt">这里是内容这里是内容这里是内容这里是内容这里是内容这里是内容这里是内容这里是内容这里是内容这里是内容这里是内容</div>
								</div>
							</div>
						</div>
					</div>

				</div>
			</div>



		</div>
	</div>


	<%-- <div class="J_cooperation mt20">
        <div class="c_title"><span>合作伙伴</span></div>
        <div class="c_inner">
            <img src="${ctx }/static/tmp/cooperation.png" />
        </div>
    </div> --%>
	<div class="J_follow mt20">
		<div class="f_txt">
			<div class="t_center">
				为何选择<span>至盈网</span>？
			</div>
		</div>
		<div class="f_pic">
			<img src="${ctx }/static/images/follow.png">
		</div>

	</div>

	<jsp:include page="common/help.jsp" />

	<jsp:include page="common/foot.jsp" />

</body>
</html>

