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

		headerAddClass();
		
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

    <div data-ui="silder" class="J_silder">
        <div class="s_main">
            <div class="m_item" style="background-image: url(${ctx}/static/tmp/b1.png)"><a href="#"></a></div>
            <div class="m_item" style="background-image: url(${ctx}/static/tmp/b2.png)"><a href="#"></a></div>
            <div class="m_item" style="background-image: url(${ctx}/static/tmp/b3.png)"><a href="#"></a></div>
        </div>
        <div class="s_controller"></div>
        <div class="s_step">
            <a class="s_btn b_left" href="javascript:;">
                <img src="${ctx}/static/images/b_left.png" /></a>
            <a class="s_btn b_right" href="javascript:;">
                <img src="${ctx}/static/images/b_right.png" /></a>
        </div>
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

                <div class="J_jjsHeader clearfix">
                    <div class="j_left">
                        <div class="l_txt">比较超过××间经纪商<br/>  为你省时省心省力</div>
                    </div>
                    <div class="j_right">
                        <div class="r_top clearfix">
                            <div class="t_left">立即寻找你想要的经纪商</div>
                            <div class="t_right">
                                <a class="abtn orange" href="${ctx }/bk/list">了解更多</a>
                            </div>
                        </div>
                        <div class="r_bottom clearfix">
                            <a class="abtn blue" href="${ctx }/bk/list">最低开户入金?</a>
                            <a class="abtn blue" href="${ctx }/bk/list">出入金免手续费?</a>
                            <a class="abtn blue" href="${ctx }/bk/list">最大的杠杆?</a>
                        </div>
                    </div>
                </div>

				<div class="J_jjsList">
					<div class="j_inner">
						<div class="i_main">
							<c:forEach items="${brokers }" var="broker">
								<div class="m_item">
									<div class="i_pic">
										<img width="100" height="33" src="/${broker.imageUrl }" />
									</div>
									<div class="i_info">
	                                    <div class="i_left">
	                                        <div class="l_name">${broker.cnName }/${broker.enName }</div>
	                                        <div class="l_txt">
	                                        	<c:choose>
	                                        		<c:when test="${broker.exchangeNo1!=null && broker.exchangeNo1!='' }">金银业贸易场(${broker.exchangeNo1})</c:when>
	                                        		<c:when test="${broker.exchangeNo2!=null && broker.exchangeNo2!='' }">证监会(${broker.exchangeNo2})</c:when>
	                                        		<c:when test="${broker.exchangeNo3!=null && broker.exchangeNo3!='' }">英国FCA(${broker.exchangeNo3})</c:when>
	                                        		<c:when test="${broker.exchangeNo4!=null && broker.exchangeNo4!='' }">日本FSA(${broker.exchangeNo4})</c:when>
	                                        		<c:otherwise>&nbsp;</c:otherwise>
	                                        	</c:choose>
	                                        </div>
	                                        <div class="l_info">伦敦金点差:<span class="cOrange">${broker.pointDiffMinLlg }</span>  
	                                        					伦敦银点差:<span class="cOrange">${broker.pointDiffMinLls }</span>  
	                                        					港金点差:<span class="cOrange">${broker.pointDiffMinHkg }</span>  
	                                        					人民币公斤点差:<span class="cOrange">${broker.pointDiffMinLkg }</span>
	                                        </div>
	                                    </div>
	                                    <div class="i_right">
	                                        <div class="r_txt">至盈推荐</div>
	                                        <div class="r_btn">
	                                            <a class="abtn orange" href="${broker.commissionUrl }">马上开户</a>
	                                        </div>
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
                    <div class="t_txt">行情</div>
                    <div class="t_tips">实时更新最新动态</div>
                    <div class="t_more"><a href="#">更多&nbsp;&gt;</a></div>
                </div>

                <div data-ui="market" class="J_market">
                    <div class="m_table mt10">
                        <table>
                            <tbody>
                                <tr class="up">
                                    <td>伦敦金/美元</td>
                                    <td><i class="icon">󰄓</i></td>
                                    <td>1172.19</td>
                                    <td>-10.26</td>
                                </tr>
                                <tr class="down">
                                    <td>伦敦金/美元</td>
                                    <td><i class="icon">󰄑</i></td>
                                    <td>1172.19</td>
                                    <td>-10.26</td>
                                </tr>
                                <tr class="down">
                                    <td>美元指数</td>
                                    <td><i class="icon">󰄑</i></td>
                                    <td>1172.19</td>
                                    <td>-10.26</td>
                                </tr>
                                <tr class="down">
                                    <td>纽约原油</td>
                                    <td><i class="icon">󰄑</i></td>
                                    <td>1172.19</td>
                                    <td>-10.26</td>
                                </tr>
                            </tbody>
                        </table>
                    </div>

                    <div class="m_tab mt20">
                        <div class="t_title">
                            <div class="t_item active"><a href="javascript:;">伦敦金</a></div>
                            <div class="t_item"><a href="javascript:;">伦敦银</a></div>

                        </div>
                        <div class="t_main">
                            <div class="m_item active"><img src="${ctx }/static/tmp/tmp_kline.png" /></div>
                            <div class="m_item"><img src="${ctx }/static/tmp/tmp_kline.png" /></div>
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
			                    <c:choose>
			                   		<c:when test="${empty currentTopic.mostPraisePost1.publisher.headUrl }">
			                   			<img src="${ctx }/static/images/userface.jpg"/>
			                   		</c:when>
			                   		<c:otherwise>
			                   			<img src="${ctx }${currentTopic.mostPraisePost1.publisher.headUrl }"/>
			                   		</c:otherwise>
			                   	</c:choose>		
		                   	</div>					
							<div class="l_hg"></div>
						</div>
						<div class="i_right">
							<div class="r_info clearfix">
								<div class="fl">${fn:substring(currentTopic.mostPraisePost1.publisher.mobile, 0, 3)}****${fn:substring(currentTopic.mostPraisePost1.publisher.mobile, 8, 11)}
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
								<c:choose>
			                   		<c:when test="${empty currentTopic.mostPraisePost2.publisher.headUrl }">
			                   			<img src="${ctx }/static/images/userface.jpg"/>
			                   		</c:when>
			                   		<c:otherwise>
			                   			<img src="${ctx }${currentTopic.mostPraisePost2.publisher.headUrl }"/>
			                   		</c:otherwise>
			                   	</c:choose>
							</div>
							<div class="l_hg"></div>
						</div>
						<div class="i_right">
							<div class="r_info clearfix">
								<div class="fl">${fn:substring(currentTopic.mostPraisePost2.publisher.mobile, 0, 3) }****${fn:substring(currentTopic.mostPraisePost2.publisher.mobile, 8, 11)}
									时间:
									<fmt:formatDate value="${currentTopic.mostPraisePost2.createDate }"
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
                    <div class="t_txt">公告</div>
                    <div class="t_tips"></div>
                    <div class="t_more"><a href="#">更多公告&nbsp;&gt;</a></div>
                </div>
				<div class="J_cjzxList">
                    <div class="c_inner">
                        <div class="i_main">
                        	<c:forEach items="${notices }" var="notice">
	                        	<div class="m_item">
	                                <div class="i_info">
	                                    <div class="i_name"><a href="#">${notice.title }</a></div>
	                                    <div class="i_txt"><i class="icon">󰃄</i>
	                                    	<span><fmt:formatDate value="${notice.startDate }"
														type="both" pattern="yyyy-MM-dd HH:mm:ss" /></span>
	                                    </div>
	                                </div>
	                            </div>
                        	</c:forEach>
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

