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

	var params = '';
	
	$(function() {

		var arrow1 = '${queryDto.arrow_min_income_money}';
		var arrow2 = '${queryDto.arrow_is_in_out_free}';
		var arrow3 = '${queryDto.arrow_commission_llg}';
		var arrow4 = '${queryDto.arrow_is_recommet}';
		var arrow5 = '${queryDto.arrow_lever_rate}';
		var bkName = '${queryDto.bkName}';
		var currentPage = '${page.currentPage}';
		
		if(arrow1!='' || arrow2!='' || arrow3!='' || arrow4!='' || arrow5!='' 
				|| currentPage!=1 || bkName!=''){
			document.location.href="#afterPageAnchor";
		}
		
		headerAddClass();

		$('div[data-ui="header"]').addClass('index');
		
		setCurrentMenu('index');
		
		$('a[name=orderBy_href]').click(function(){
    		if($(this).attr("class")=='up'){
    			if($(this).children("input").val()=='min_income_money'){
    				params = 'orderByP=min_income_money,desc';
    			}else if($(this).children("input").val()=='is_in_out_free'){
    				params = 'orderByP=is_in_out_free,desc';
    			}else if($(this).children("input").val()=='commission_llg'){
    				params = 'orderByP=commission_llg,desc';
    			}else if($(this).children("input").val()=='is_recommet'){
    				params = 'orderByP=is_recommet,desc';
    			}else if($(this).children("input").val()=='lever_rate'){
    				params = 'orderByP=lever_rate,desc';
    			}
    		}else if($(this).attr("class")=='down'){
    			if($(this).children("input").val()=='min_income_money'){
    				params = 'orderByP=min_income_money,asc';
    			}else if($(this).children("input").val()=='is_in_out_free'){
    				params = 'orderByP=is_in_out_free,asc';
    			}else if($(this).children("input").val()=='commission_llg'){
    				params = 'orderByP=commission_llg,asc';
    			}else if($(this).children("input").val()=='is_recommet'){
    				params = 'orderByP=is_recommet,asc';
	    		}else if($(this).children("input").val()=='lever_rate'){
					params = 'orderByP=lever_rate,asc';
				}
    		}
    		if($('input[name=bkName]').val()!='' && $('input[name=bkName]').val()!=','){
    			window.location.href="${ctx }/index?"+params+"&bkName="+$('input[name=bkName]').val();
    		}
    		window.location.href="${ctx }/index?"+params;
	    });
		
		$('input[name=bkName]').keyup(function(event){
			window.location.href="${ctx }/index?bkName="+$('input[name=bkName]').val();
		});
		
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
	<form action="index" name="form" id="form" method="post" theme="simple">
	<div class="J_content mt-260 bgfff hasShadow" id="afterPageAnchor">
		<div class="fl c_760">
			<div class="pau">

				<div class="J_jjsHeader clearfix">
					<div class="j_left"></div>
					<div class="j_right">
						<div class="r_top clearfix">
							<div class="t_left">
								<input placeholder="经纪商 （中文/英文）" type="text" name="bkName" value="${queryDto.bkName }"/>
							</div>
							<div class="t_right">
							<a 	<c:choose>
	                           		<c:when test="${queryDto.arrow_is_recommet == 'desc'}">class='down'</c:when>
	                           		<c:when test="${queryDto.arrow_is_recommet == 'asc'}">class='up'</c:when>
	                           		<c:otherwise>class='down'</c:otherwise>
                           		</c:choose>
								name='orderBy_href' href="#">至盈推荐<input type="hidden" value="is_recommet"><span></span></a>
							</div>
						</div>
						<div class="r_bottom clearfix">
							<a 	<c:choose>
	                           		<c:when test="${queryDto.arrow_commission_llg == 'desc'}">class='down'</c:when>
	                           		<c:when test="${queryDto.arrow_commission_llg == 'asc'}">class='up'</c:when>
	                           		<c:otherwise>class='down'</c:otherwise>
                           		</c:choose>
								name='orderBy_href' href="#">黄金返佣<input type="hidden" value="commission_llg"><span></span></a> 
							<a 	<c:choose>
	                           		<c:when test="${queryDto.arrow_min_income_money == 'desc'}">class='down'</c:when>
	                           		<c:when test="${queryDto.arrow_min_income_money == 'asc'}">class='up'</c:when>
	                           		<c:otherwise>class='down'</c:otherwise>
                           		</c:choose>
								name='orderBy_href' href="#">最低开户入金<input type="hidden" value="min_income_money"><span></span></a> 
							<a 	<c:choose>
	                           		<c:when test="${queryDto.arrow_is_in_out_free == 'desc'}">class='down'</c:when>
	                           		<c:when test="${queryDto.arrow_is_in_out_free == 'asc'}">class='up'</c:when>
	                           		<c:otherwise>class='down'</c:otherwise>
                           		</c:choose>
								name='orderBy_href' href="#">出入金免手续费<input type="hidden" value="is_in_out_free"><span></span></a> 
							<a 	<c:choose>
	                           		<c:when test="${queryDto.arrow_lever_rate == 'desc'}">class='down'</c:when>
	                           		<c:when test="${queryDto.arrow_lever_rate == 'asc'}">class='up'</c:when>
	                           		<c:otherwise>class='down'</c:otherwise>
                           		</c:choose>
								name='orderBy_href' href="#">最大的杠杆<input type="hidden" value="lever_rate"><span></span></a>
						</div>
					</div>
				</div>


				<div class="J_jjsList">
					<div class="j_inner">
						<div class="i_main" id="append_div">
							
							<c:forEach items="${page.list }" var="broker">
								<div class="m_item">
									<div class="i_pic">
										<div class="p_logo">
											<img style="width: 140px; height: 46px;" src="${ctx}/${broker.imageUrl}" />
										</div>
										<div class="p_num">${broker.commissionLlg }美元</div>
										<div class="p_txt">黄金返佣</div>
										<div class="p_over">
											<i class="icon">󰅖</i><span>2020</span>已申请
										</div>
										<div class="p_btn">
											<a href="${ctx }/register"><img src="${ctx }/static/images/mskh_btn_bg.png" /></a>
										</div>
									</div>
									<div class="i_info clearfix">
										<div class="i_left">
											<div class="l_name">${broker.cnName }</div>
											<div class="l_txt">
												<span class="cRed">优势</span>：
												<c:choose>
													<c:when test="${broker.exchangeNo1!=null && broker.exchangeNo1!='' }">金银业贸易场(${broker.exchangeNo1}) </c:when>
													<c:when test="${broker.exchangeNo2!=null && broker.exchangeNo2!='' }">证监会(${broker.exchangeNo2}) </c:when>
													<c:when test="${broker.exchangeNo3!=null && broker.exchangeNo3!='' }">英国FCA(${broker.exchangeNo3}) </c:when>
													<c:when test="${broker.exchangeNo4!=null && broker.exchangeNo4!='' }">日本FSA(${broker.exchangeNo4}) </c:when>
													<c:otherwise>&nbsp;</c:otherwise>
												</c:choose>
											</div>
											<div class="l_txt">点差：黄金${broker.pointDiffMinLlg }</div>
											<div class="l_txt">最少入金：${broker.minIncomeMoney }</div>
											<div class="l_txt">最小交易：${broker.minTradeNumLlg }</div>
											<div class="l_txt">最小开户：${broker.openMoneyLlg }</div>
											<div class="l_txt">
												<c:choose>
													<c:when test="${broker.leverRate!=null && broker.leverRate!=0}">最大杠杆：1:${broker.leverRate}</c:when>
													<c:otherwise>&nbsp;</c:otherwise>
												</c:choose>
											</div>
										</div>
										<div class="i_right">
											<div class="r_txt">
												<c:choose>
				                            		<c:when test="${broker.isRecommet == 1}">
				                            			<span>至盈推荐</span>
														<img src="${ctx }/static/images/good_orange.png" />
				                            		</c:when>
				                            		<c:otherwise><span></span></c:otherwise>
				                            	</c:choose>												
											</div>
											<div class="r_btn">
												<a class="abtn green" href="#">优惠活动</a>
											</div>
											<div class="r_btn">
												<a class="abtn orange" href="${ctx}/bk/detail?id=${broker.id}">了解详情</a>
											</div>
										</div>
									</div>
								</div>							
							</c:forEach>
							
						</div>
					</div>
				</div>
                
                <div class="j_page">
                	<tr><td colspan="50" style="text-align:center;"><%@ include file="common/pager.jsp"%></td></tr>
                </div>			

			</div>
		</div>
		<div class="fr c_430">
			<div class="pau">

				<div class="J_btnList">
					<div class="b_item big">
						<a href="javascript:dialogBackDiscount()">申请返佣</a>
					</div>
					<div class="b_item">
						<a class="i1" href="${ctx }/bk/list"><span></span>更多经纪商</a>
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
	</form>

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
	                                    <div class="i_name"><a href="${ctx }/notice/list?id=${notice.id }">${notice.title }</a></div>
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

