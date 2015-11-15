<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<%@include file="common/common.jsp"%>
<%@ include file="common/nice-validator.jsp" %>

</head>

<script type="text/javascript">
	$(function() {

		headerAddClass();

		$('div[data-ui="header"]').addClass('index');
		
		setCurrentMenu('index');
		
	});
	
	function dialogBackDiscount(){
		
		/* <c:if test="${empty loginUser }">
			jc.alert('请先登录', function(){
				window.location.href = '${ctx}/login';
			});
			return;
		</c:if> */
		
		jc.dialog.get("${ctx}/dialog/back_discount",
			function(obj){
				obj.show();
			}, "back_discount");
	}
	
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
			<a class="s_btn b_left" href="javascript:void(0);">
                <img src="${ctx}/static/images/b_left.png" />
            </a>
            <a class="s_btn b_right" href="javascript:void(0);">
                <img src="${ctx}/static/images/b_right.png" />
            </a>
		</div>
	</div>

	<!-- 经纪商 -->
	<div class="J_content mt-260 bgfff hasShadow">
		<div class="fl c_760">
			<div class="pau">

				<div class="J_jjsHeader clearfix">
					<div class="j_left"></div>
					<div class="j_right">
						<div class="r_top clearfix">
							<div class="t_left">
								<input placeholder="输入关键字进行搜索" type="text" />
							</div>
							<div class="t_right">
								<a class="up" href="javascript:;">至盈推荐<span></span></a>
							</div>
						</div>
						<div class="r_bottom clearfix">
							<a class="up" href="javascript:;">黄金返佣<span></span></a> <a
								class="down" href="javascript:;">最低开户入金<span></span></a> <a
								href="javascript:;">出入金免手续费<span></span></a> <a
								href="javascript:;">最大的杠杆<span></span></a>
						</div>
					</div>
				</div>


				<div class="J_jjsList">
					<div class="j_inner">
						<div class="i_main">
							
							<div class="m_item">
								<div class="i_pic">
									<div class="p_logo">
										<img style="width: 140px; height: 46px;" src="${ctx }/static/tmp/j2.jpg" />
									</div>
									<div class="p_num">20美元</div>
									<div class="p_txt">黄金返佣</div>
									<div class="p_over">
										<i class="icon">󰅖</i><span>2020</span>已申请
									</div>
									<div class="p_btn">
										<a href="#"><img src="${ctx }/static/images/mskh_btn_bg.png" /></a>
									</div>
								</div>
								<div class="i_info clearfix">
									<div class="i_left">
										<div class="l_name">金道環球投資有限公司</div>
										<div class="l_txt">
											<span class="cRed">优势</span>：NDD模式 上市子公司
										</div>
										<div class="l_txt">点差：黄金4.5</div>
										<div class="l_txt">最少入金：5</div>
										<div class="l_txt">最小交易：0.01</div>
										<div class="l_txt">最小开户：500</div>
										<div class="l_txt">最大杠杆：1:400</div>
									</div>
									<div class="i_right">
										<div class="r_txt">
											<span>至盈推荐</span>
											<img src="${ctx }/static/images/good_orange.png" />
											<img src="${ctx }/static/images/good_orange.png" />
											<img src="${ctx }/static/images/good_orange.png" />
										</div>
										<div class="r_btn">
											<a class="abtn green" href="#">优惠活动</a>
										</div>
										<div class="r_btn">
											<a class="abtn orange" href="#">了解详情</a>
										</div>
									</div>
								</div>
							</div>
							
						</div>
					</div>
				</div>
				
				<div class="J_page mt20">这里分页</div>
				

			</div>
		</div>
		<div class="fr c_430">
			<div class="pau">

				<div class="J_btnList">
					<div class="b_item big">
						<a href="javascript:dialogBackDiscount()">申请返佣</a>
					</div>
					<div class="b_item">
						<a class="i1" href="javascript:void(0)"><span></span>更多经纪商</a>
					</div>
					<div class="b_item">
						<a class="i2" href="javascript:void(0)"><span></span>赠金优惠</a>
					</div>
					<div class="b_item">
						<a class="i3" href="javascript:void(0)"><span></span>外汇资讯</a>
					</div>
				</div>

				<div class="J_titleGray mt20">
					<div class="t_txt">行情</div>
				</div>

				<div data-ui="market" class="J_market">
					<div class="m_table">
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
							<div class="t_item active">
								<a href="javascript:;">伦敦金</a>
							</div>
							<div class="t_item">
								<a href="javascript:;">伦敦银</a>
							</div>

						</div>
						<div class="t_main">
							<div class="m_item active">
								<img style="width: 100%;" src="${ctx }/static/tmp/tmp_kline.png" />
							</div>
							<div class="m_item">
								<img style="width: 100%;" src="${ctx }/static/tmp/tmp_kline.png" />
							</div>
						</div>
					</div>

				</div>


				<div class="J_titleGray mt20">
					<div class="t_txt">返佣流程</div>
				</div>
				<div class="J_step">
					<div class="s_item">
						<div class="i_left">
							<div class="l_icon">1</div>
						</div>
						<div class="i_right">
							<div class="r_title">注册会员开户</div>
							<div class="r_info">于至盈网注册登记成为会员</div>
						</div>
					</div>

					<div class="s_item">
						<div class="i_left">
							<div class="l_icon">2</div>
						</div>
						<div class="i_right">
							<div class="r_title">选择经纪商</div>
							<div class="r_info">选择适合您的经纪商</div>
						</div>
					</div>

					<div class="s_item">
						<div class="i_left">
							<div class="l_icon">3</div>
						</div>
						<div class="i_right">
							<div class="r_title">在2Profit开户</div>
							<div class="r_info">在2Profit进行开户，只有在本站开户才能获得返佣。</div>
						</div>
					</div>
					<div class="s_item">
						<div class="i_left">
							<div class="l_icon">4</div>
						</div>
						<div class="i_right">
							<div class="r_title">申请返佣</div>
							<div class="r_info">开户完成后，请您点击“申请返佣” 进行信息登记。</div>
						</div>
					</div>
					<div class="s_item">
						<div class="i_left">
							<div class="l_icon">5</div>
						</div>
						<div class="i_right">
							<div class="r_title">最终确认</div>
							<div class="r_info">工作人员会在1个工作日内通知申请结果。</div>
						</div>
					</div>

				</div>


				<div class="J_titleGray mt20">
					<div class="t_txt">返佣规则</div>
				</div>

				<div class="J_rule">

					<p>1、确认通过金斧子外汇网开户并在线提交了返佣申请。</p>

					<p>2、所有平台实现周返（每周三返上周佣金，法定节假日往后延迟第一个工作日）。</p>

					<p>3、0元起付，没有手数要求和限制。</p>

					<p>4、返佣支付方式为银行卡实时转账，免手续费。</p>

					<p>5、未提到的相关品种返佣比例以外汇平台官方支付给金斧子外汇的90%返还。</p>

					<p>6、返佣服务最终解释权归深圳市金斧子网络科技有限公司所有。</p>
				</div>

				<div class="J_titleGray mt20">
					<div class="t_txt">风险提示</div>
				</div>


				<div class="J_rule">
					<p>投资有风险，入市需谨慎，先求知，再投资，少损失！2Profit提供贵金属外汇平台商开户和返佣，为客户降低交易成本，但不接触客户资金，不参与外汇平台经营和交易；如果外汇平台出现不可抗拒的因素无法出金或返佣，我们也会及时提醒客户，客户需要自行承担风险。</p>
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

				<div class="J_voteTitle mt10">
					${currentTopic.titleContent }
					<span class="fz14 cOrange">回应数量(${currentTopic.postCount })</span>
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
								<div class="fl">
									${fn:substring(currentTopic.mostPraisePost2.publisher.mobile, 0, 3) }****${fn:substring(currentTopic.mostPraisePost2.publisher.mobile, 8, 11)}
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
					<a class="abtn green" href="${ctx }/vote/index/list">我要投票</a> 
					<a class="abtn blue" href="${ctx }/vote/index/list">我要回应</a>
				</div>

			</div>


		</div>
		<div class="fr c_430">
			<div class="pau">
				<div class="J_title">
					<div class="t_txt">公告</div>
					<div class="t_tips"></div>
					<div class="t_more"><a href="${ctx }/notice/list">更多公告&nbsp;&gt;</a></div>
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

	<!--
    <div class="J_cooperation mt20">
        <div class="c_title"><span>合作伙伴</span></div>
        <div class="c_inner">
            <img src="../tmp/cooperation.png" />
        </div>
    </div>
    -->

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

