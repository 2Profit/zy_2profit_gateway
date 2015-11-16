<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <%@ include file="../common/common.jsp"%>
    
<script type="text/javascript">

	/* var param_min_income_money = 'min_income_money,desc';
	var param_profit_star = 'profit_star,desc';
	var param_commission_llg = 'commission_llg,desc';
	var param_is_recommet = 'is_recommet,desc'; */
	var params = '';
	var currentPage = 1;
	var totalSize = 10;
	
	$(function () {
		headerAddClass();
		
		brokerHtml(currentPage);
	    
	    $('a[name=orderBy_href]').click(function(){
    		if($(this).attr("class")=='up'){
    			if($(this).children("input").val()=='min_income_money'){
    				params = 'min_income_money,desc';
    			}else if($(this).children("input").val()=='profit_star'){
    				params = 'profit_star,desc';
    			}else if($(this).children("input").val()=='commission_llg'){
    				params = 'commission_llg,desc';
    			}else if($(this).children("input").val()=='is_recommet'){
    				params = 'is_recommet,desc';
    			}
    		}else if($(this).attr("class")=='down'){
    			if($(this).children("input").val()=='min_income_money'){
    				params = 'min_income_money,asc';
    			}else if($(this).children("input").val()=='profit_star'){
    				params = 'profit_star,asc';
    			}else if($(this).children("input").val()=='commission_llg'){
    				params = 'commission_llg,asc';
    			}else if($(this).children("input").val()=='is_recommet'){
    				params = 'is_recommet,asc';
    			}
    		}
    		
    		//var params = 'orderByP='+ param_min_income_money +'~'+ param_profit_star +'~'+ param_commission_llg +'~'+ param_is_recommet;
	    	//window.location.href="${ctx }/bk/list?"+params;
	    	brokerHtml(currentPage);
	    });
	});
	
	function brokerHtml(currentPage){
		
		$.ajax({
   			url:'${ctx}/brokers',
   			type:'GET',
   			async:false,
   			data:{
   				'orderByP':params,
   				"currentPage":currentPage
   			},
   			success:function(json){
   				if(json.success){
   					var html = '';
   		   			var pageModel = json.pageModel;
   		   			var model = json.model;
   		   			currentPage = json.pageModel.currentPage;
   		   			totalSize = json.pageModel.totalCount;
   		   			
   		   			//修改排序箭头指向
   		   			if(model.arrow_min_income_money=='desc'){
   		   				$('#arrow_min_income_money').attr('class','down');
   		   			}else if(model.arrow_min_income_money=='asc'){
   		   				$('#arrow_min_income_money').attr('class','up');
   		   			}
   		   			if(model.arrow_profit_star=='desc'){
   		   				$('#arrow_profit_star').attr('class','down');
   		   			}else if(model.arrow_profit_star=='asc'){
   		   				$('#arrow_profit_star').attr('class','up');
   		   			}
   		   			if(model.arrow_commission_llg=='desc'){
   		   				$('#arrow_commission_llg').attr('class','down');
   		   			}else if(model.arrow_commission_llg=='asc'){
   		   				$('#arrow_commission_llg').attr('class','up');
   		   			}
   		   			if(model.arrow_is_recommet=='desc'){
   		   				$('#arrow_is_recommet').attr('class','down');
   		   			}else if(model.arrow_is_recommet=='asc'){
   		   				$('#arrow_is_recommet').attr('class','up');
   		   			}
   		   			
   		   			for(var i=0; i<pageModel.list.length; i++){
   		   				var broker = pageModel.list[i];
   		   				
   		   				var nation = '&nbsp;';
   		   				if(broker.companyArea == '0'){
   		   					nation = '香港'; 
   		   				}else if(broker.companyArea == '1'){
   		   					nation = '中国';
   		   				}else if(broker.companyArea == '2'){
   		   					nation = '台湾';
   		   				}else if(broker.companyArea == '3'){
   		   					nation = '其他';
   		   				}
   		   				
   		   				var exchangeInfo = '';
   		   				if(broker.exchangeNo1!=''){
   		   					exchangeInfo += '金银业贸易场('+ broker.exchangeNo1+ ')、';
   		   				}else if(broker.exchangeNo2!=''){
   		   					exchangeInfo += '证监会('+ broker.exchangeNo2+ ')、';
   		   				}else if(broker.exchangeNo3!=''){
   		   					exchangeInfo += '英国FCA('+ broker.exchangeNo3+ ')、';
   		   				}else if(broker.exchangeNo4!=''){
   		   					exchangeInfo += '日本FSA('+ broker.exchangeNo4+ ')、';
   		   				}
   		   				
   		   				var isUnionpay = '&nbsp;';
   		   				if(broker.isUnionpay == '0'){
   		   					isUnionpay = '不支持';
   		   				}else if(broker.isUnionpay == '1'){
   		   					isUnionpay = '支持';
   		   				}
   		   				
   		   				var profitStar = '';
   		   				if(broker.profitStar == 1){
   		   					profitStar = '<img src="${ctx }/static/images/icon_star.png" />';
   		   				}else if(broker.profitStar == 2){
   		   					profitStar = '<img src="${ctx }/static/images/icon_star.png" />'+
							 			'<img src="${ctx }/static/images/icon_star.png" />';
   		   				}else if(broker.profitStar == 3){
   		   					profitStar = '<img src="${ctx }/static/images/icon_star.png" />'+
   		   								'<img src="${ctx }/static/images/icon_star.png" />'+
							 			'<img src="${ctx }/static/images/icon_star.png" />';
  		   				}else if(broker.profitStar == 4){
   		   					profitStar = '<img src="${ctx }/static/images/icon_star.png" />'+
   		   								'<img src="${ctx }/static/images/icon_star.png" />'+
   		   								'<img src="${ctx }/static/images/icon_star.png" />'+
							 			'<img src="${ctx }/static/images/icon_star.png" />';
   		   				}else if(broker.profitStar == 5){
   		   					profitStar = '<img src="${ctx }/static/images/icon_star.png" />'+
   		   								'<img src="${ctx }/static/images/icon_star.png" />'+
   		   								'<img src="${ctx }/static/images/icon_star.png" />'+
   		   								'<img src="${ctx }/static/images/icon_star.png" />'+
							 			'<img src="${ctx }/static/images/icon_star.png" />';
  		   				}else if(broker.profitStar == 6){
   		   					profitStar = '<img src="${ctx }/static/images/icon_star.png" />'+
   		   								'<img src="${ctx }/static/images/icon_star.png" />'+
   		   								'<img src="${ctx }/static/images/icon_star.png" />'+
										'<img src="${ctx }/static/images/icon_star.png" />'+
										'<img src="${ctx }/static/images/icon_star.png" />'+
							 			'<img src="${ctx }/static/images/icon_star.png" />';
  		   				}
   		   				
   			   			html +=  '<div class="m_item">'+
				   			   	   '<table class="i_parent">'+
					   			        '<tbody>'+
					   			            '<tr>'+
					   			                '<td class="p10 tac">'+
					   			                    '<div class="p_logo">'+
					   			                        '<img style="width:140px; height:46px;" src="${ctx}/'+ broker.imageUrl + '" />'+
					   			                    '</div>'+
					   			                    '<div class="p_txt mt10">所属地：'+ nation +'</div>'+
					   			                    '<div class="p_txt mt10">'+
					   			                        '<a class="abtn orange" href="${ctx}/bk/detail?id='+ broker.id + '">了解详情 &gt;&gt;</a>'+
					   			                    '</div>'+
					   			                '</td>'+
					   			                '<td class="p10 lh30" style="width:500px;">'+
					   			                    '<div class="p_txt"><span class="cOrange">公司简介：</span>'+ broker.introduction +'</div>'+
					   			                    '<div class="p_txt"><span class="cOrange">监管机构：</span>'+exchangeInfo +'</div>'+
					   			                '</td>'+
					   			            '</tr>'+
					   			            '<tr>'+
					   			                '<td class="tac">黄金返佣：<b class="fz24 cOrange">'+ broker.commissionLlg + '</b></td>'+
					   			                '<td class="p10">'+
					   			                    '<table class="i_inner">'+
					   			                        '<tbody>'+
					   			                            '<tr>'+
					   			                                '<td>黄金点差</td>'+
					   			                                '<td>最低入金</td>'+
					   			                                '<td>支持银联</td>'+
					   			                                '<td>至盈评级</td>'+
					   			                            '</tr>'+
					   			                            '<tr>'+
					   			                                '<td>'+ broker.pointDiffMinLlg +'美金</td>'+
					   			                                '<td>'+ broker.minIncomeMoney +'</td>'+
					   			                                '<td>'+ isUnionpay +'</td>'+
					   			                                '<td>'+ profitStar +'</td>'+
			   					                            '</tr>'+
			   					                        '</tbody>'+
			   					                    '</table>'+
			   					                '</td>'+
			   					            '</tr>'+
			   					        '</tbody>'+
			   					    '</table>'+
			   					'</div>';
   		   			}//for
   		   			$("#append_div").empty();
	   				$('#append_div').append(html);
	   				
	   				if(currentPage>=1){
						currentPage=currentPage-1;
					}
	   				
				 	if(totalSize > 0){
					 	$("#pagination").pagination(totalSize,{
							items_per_page : 5,
							num_display_entries : 5,
							current_page : currentPage,
							num_edge_entries : 0,
							link_to : "javaScript:void(0);",
							prev_text : "前一页",
							next_text : "下一页",
							ellipse_text : "...",
							prev_show_always : true,
							next_show_always : true,
							callback : function(index) {
								currentPage = index+1;
								brokerHtml((index+1));
							}
						});
				  	}
   				}
   			}		
		});
	}
	
	

	
	
	
</script>


</head>
<body>
    <form action="" name="form" id="form" method="post" theme="simple">
    <%@ include file="../common/head.jsp" %>

    <div class="bgfff">
        <div class="J_content bgfff">
            <div class="J_router"><a href="${ctx }/index">首页</a><span>&gt;</span><a href="${ctx }/bk/list">经纪商</a></div>
            <div class="fl c_760">
                <div class="J_jjsMore">
                    <div class="j_header">
                        <a  <c:choose>
                           		<c:when test="${queryDto.arrow_min_income_money == 'desc'}">class='down'</c:when>
                           		<c:when test="${queryDto.arrow_min_income_money == 'asc'}">class='up'</c:when>
                           		<c:otherwise>class='down'</c:otherwise>
                           	</c:choose>
                           	id='arrow_min_income_money' name='orderBy_href' href="#">最低入金<input type="hidden" value="min_income_money"><span></span></a>
                        <a  <c:choose>
                           		<c:when test="${queryDto.arrow_profit_star == 'desc'}">class='down'</c:when>
                           		<c:when test="${queryDto.arrow_profit_star == 'asc'}">class='up'</c:when>
                           		<c:otherwise>class='down'</c:otherwise>
                           	</c:choose>
                        	id='arrow_profit_star' name='orderBy_href' href="#">安全评级<input type="hidden" value="profit_star"><span></span></a>
                        <a  <c:choose>
                           		<c:when test="${queryDto.arrow_commission_llg == 'desc'}">class='down'</c:when>
                           		<c:when test="${queryDto.arrow_commission_llg == 'asc'}">class='up'</c:when>
                           		<c:otherwise>class='down'</c:otherwise>
                           	</c:choose>
                        	id='arrow_commission_llg' name='orderBy_href' href="#">返佣比例<input type="hidden" value="commission_llg"><span></span></a>
                        <a  <c:choose>
                           		<c:when test="${queryDto.arrow_is_recommet == 'desc'}">class='down'</c:when>
                           		<c:when test="${queryDto.arrow_is_recommet == 'asc'}">class='up'</c:when>
                           		<c:otherwise>class='down'</c:otherwise>
                           	</c:choose>
                        	id='arrow_is_recommet' name='orderBy_href' href="#">至盈推荐<input type="hidden" value="is_recommet"><span></span></a>
                    </div>
                    <div class="j_main" id='append_div'>
                    </div>

                    <%-- <div class="j_page">
	                	<tr><td colspan="50" style="text-align:center;"><%@ include file="../common/pager.jsp"%></td></tr>
	                </div> --%>
                    
                    <br/>
                    <div class="J_page" id="pagination"></div>
                    <br/>
                </div>

            </div>
            <div class="fr c_430">

                <div class="J_titleGray">
                    <div class="t_txt">金融资讯热点</div>
                </div>

                <div class="J_hotNews">
                    <div class="h_item"><a href="#">这一个非常非常非常非常非常非常长的标题</a></div>
                    <div class="h_item"><a href="#">这一个非常非常非常非常非常非常长的标题</a></div>
                    <div class="h_item"><a href="#">这一个非常非常非常非常非常非常长的标题</a></div>
                    <div class="h_item"><a href="#">这一个非常非常非常非常非常非常长的标题</a></div>
                    <div class="h_item"><a href="#">这一个非常非常非常非常非常非常长的标题</a></div>
                    <div class="h_item"><a href="#">这一个非常非常非常非常非常非常长的标题</a></div>
                    <div class="h_item"><a href="#">这一个非常非常非常非常非常非常长的标题</a></div>

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
                    <div class="t_txt clearfix">
                        <div class="fl">开户记录</div>
                        <div class="fr"><span class="fz12">已开户 </span><b class="fz12 cRed">1230</b><span class="fz12"> 人</span></div>
                    </div>
                </div>


                <div class="J_newUser">
                    <div class="n_item">
                        <div class="i_title"><span>一天前</span> 客户 <span class="cBlue">137*****763</span></div>
                        <div class="i_info">
                            <div class="i_txt">成功开通 <span class="cOrange">至盈网</span> 帐号</div>
                            <div class="i_token1"></div>
                            <div class="i_token2"></div>
                        </div>
                    </div>
                    <div class="n_item">
                        <div class="i_title"><span>一天前</span> 客户 <span class="cBlue">137*****763</span></div>
                        <div class="i_info">
                            <div class="i_txt">成功开通 <span class="cOrange">至盈网</span> 帐号</div>
                            <div class="i_token1"></div>
                            <div class="i_token2"></div>
                        </div>
                    </div>
                    <div class="n_item">
                        <div class="i_title"><span>一天前</span> 客户 <span class="cBlue">137*****763</span></div>
                        <div class="i_info">
                            <div class="i_txt">成功开通 <span class="cOrange">至盈网</span> 帐号</div>
                            <div class="i_token1"></div>
                            <div class="i_token2"></div>
                        </div>
                    </div>
                    <div class="n_item">
                        <div class="i_title"><span>一天前</span> 客户 <span class="cBlue">137*****763</span></div>
                        <div class="i_info">
                            <div class="i_txt">成功开通 <span class="cOrange">至盈网</span> 帐号</div>
                            <div class="i_token1"></div>
                            <div class="i_token2"></div>
                        </div>
                    </div>

                </div>
            </div>
        </div>

    </div>



    <div class="J_follow">
        <div class="f_txt">
            <div class="t_center">为何选择<span>至盈网</span>？
            </div>
        </div>
        <div class="f_pic">
            <img src="${ctx }/static/images/follow.png" />
        </div>
    </div>

   	<%@ include file="../common/help.jsp" %>
	<%@ include file="../common/foot.jsp" %>
	</form>
</body>
</html>
