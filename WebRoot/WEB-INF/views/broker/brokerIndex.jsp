<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <%@ include file="../common/common.jsp"%>
    
<script type="text/javascript">

	$(function () {
	    var points = 10;
	    $('.slider3').slider({
	        min: 0,
	        max: points,
	        animate: true,
	        range: true,
	        values: [0, 10]
	    });
	    $('.slider3').slider('pips', {
	        /*rest: 'number'*/
	    });
	    $(".slider3").slider({
	        stop: function (event, ui) {
	            jc.alert('该功能需求不清晰暂未实现');
	        	//alert(ui.values[0] + "," + ui.values[1]);
	        }
	    });
	    
	    $('a[name=companyType]').click(function(){
	    	$('a[name=companyType]').each(function(){
	    		$(this).attr("class", "");
	    	});
	    	$(this).attr("class", "active");
	    	query('','');
	    });
	    $('a[name=productType]').click(function(){
	    	$('a[name=productType]').each(function(){
	    		$(this).attr("class", "");
	    	});
	    	$(this).attr("class", "active");
	    	query('','');
	    });
	    $('a[name=exchangeType]').click(function(){
	    	$('a[name=exchangeType]').each(function(){
	    		$(this).attr("class", "");
	    	});
	    	$(this).attr("class", "active");
	    	query('','');
	    });
	    
	    $('a[name=orderBy_href]').click(function(){
	    	$('a[name=order_href]').each(function(){
	    		$(this).closest('li').attr("class", "");
	    	});
	    	$(this).closest('li').attr("class", "active");
	    	
	    	var orderByParam = $(this).closest('input').val();
	    	var orderByDirection = '';
	    	query(orderByParam,orderByDirection);
	    });
	    
	    $('#search_href').click(function(event){
	    	event.preventDefault();
	    	query('','');
	    });
	});
	
	function query(orderByParam,orderByDirection){
		
		var params = "brokerName="+$('input[name=brokerName]').val();
		params += "&companyType="+$('a[name=companyType].active').children().val();
		params += "&productType="+$('a[name=productType].active').children().val();
		params += "&exchangeType="+$('a[name=exchangeType].active').children().val();
		params += "&orderByParam="+orderByParam+"&orderByDirection="+orderByDirection;
    	
    	window.location.href="${ctx }/bk/indexList?"+params;
	}
</script>


</head>
<body>
    
    <%@ include file="../common/head.jsp" %>

	<div data-ui="indexMask" class="J_indexMask mini"></div>

    <div class="bgfff">
        <div class="J_content">

            <div class="J_jjsSearch clearfix">
                <div class="j_left">
                    <input placeholder="经纪商 / 活动" type="text" name="brokerName" value="${queryDto.brokerName }"/>
                </div>
                <div class="j_right">
                    <a class="abtn green" id="search_href" href=''>搜索</a>
                </div>
            </div>

            <div class="J_router"><a href="#">首页</a><span></span><a href="#">经纪商</a></div>
            <div class="J_jjsFilter clearfix">
                <div class="j_left">
                    <div class="l_item clearfix">
                        <div class="i_left">类型：</div>
                        <div class="i_right">
                            <a name="companyType" <c:if test="${queryDto.companyType==null || queryDto.companyType=='' }">class="active"</c:if> href="#">
                            	<input type="hidden" value="">不限</a>
                            <a name="companyType" <c:if test="${queryDto.companyType == '0' }">class="active"</c:if> href='#'>
                            	<input type="hidden" value="0">贵金属</a>
                            <a name="companyType" <c:if test="${queryDto.companyType == '1' }">class="active"</c:if> href="#">
                            	<input type="hidden" value="1">外汇</a>
                            <a name="companyType" <c:if test="${queryDto.companyType == '2' }">class="active"</c:if> href="#">
                            	<input type="hidden" value="2">中国A股</a>
                        </div>
                    </div>
                    <div class="l_item clearfix">
                        <div class="i_left">产品：</div>
                        <div class="i_right">
                            <a name="productType" <c:if test="${queryDto.productType==null || queryDto.productType=='' }">class="active"</c:if> href="#">
                            	<input type="hidden" value="">不限</a>
                            <a name="productType" <c:if test="${queryDto.productType == '0' }">class="active"</c:if> href="#">
                            	<input type="hidden" value="0">国际现货金</a>
                            <a name="productType" <c:if test="${queryDto.productType == '1' }">class="active"</c:if> href="#">
                            	<input type="hidden" value="1">国际现货银</a>
                            <a name="productType" <c:if test="${queryDto.productType == '2' }">class="active"</c:if> href="#">
                            	<input type="hidden" value="2">港金</a>
                            <a name="productType" <c:if test="${queryDto.productType == '3' }">class="active"</c:if> href="#">
                            	<input type="hidden" value="3">人民币公斤条</a>
                        </div>
                    </div>
                    <div class="l_item clearfix">
                        <div class="i_left">会员/监管机构：</div>
                        <div class="i_right">
                            <a name="exchangeType" <c:if test="${queryDto.exchangeType==null || queryDto.exchangeType=='' }">class="active"</c:if> href="#">
                            	<input type="hidden" value="">不限</a>
                            <a name="exchangeType" <c:if test="${queryDto.exchangeType == '0' }">class="active"</c:if> href="#">
                            	<input type="hidden" value="0">香港金银业贸易场</a>
                            <a name="exchangeType" <c:if test="${queryDto.exchangeType == '1' }">class="active"</c:if> href="#">
                            	<input type="hidden" value="1">香港证监会</a>
                            <a name="exchangeType" <c:if test="${queryDto.exchangeType == '2' }">class="active"</c:if> href="#">
                            	<input type="hidden" value="2">英国FCA</a>
                            <a name="exchangeType" <c:if test="${queryDto.exchangeType == '3' }">class="active"</c:if> href="#">
                            	<input type="hidden" value="3">日本FSA</a>
                        </div>
                    </div>
                    <div class="l_input">
                       <label><input type="checkbox" <c:if test="${queryDto.isEaSupport == '1' }">checked</c:if> name="isEaSupport" value="1"> 支持EA</label>
                       <label><input type="checkbox" name="isEaSupport"> 银联入金</label>
                       <label><input type="checkbox" <c:if test="${queryDto.isOpenFee == '1' }">checked</c:if> name="isOpenFee" value="1"> 出金免手续费</label>
                       <label><input type="checkbox" <c:if test="${queryDto.isCloseFee == '1' }">checked</c:if> name="isCloseFee" value="1"> 入金免手续费</label>
                    </div>
                </div>
                <div class="j_right">


                    <div class="c_title">最低产品点差</div>
                    <div class="c_tips">0 - 2000000</div>
                    <div class="wrapper"><div class="slider3"></div></div>
                    

                    <div class="c_title">杠杆比列</div>
                    <div class="c_tips">1:1 - 3000:1</div>
                    <div class="wrapper"><div class="slider3"></div></div>
                    

                    <div class="c_title">开仓保证金</div>
                    <div class="c_tips">0 - 5</div>
                    <div class="wrapper"><div class="slider3"></div></div>
                    

                </div>
            </div>


            <div class="J_jjsList mt20">
                <div class="j_filter clearfix">
                    <div class="f_txt">经纪商筛选结果 共 <span class="cOrange">${fn:length(brokerExtInfos.list)}</span> 个</div>
                    <div class="f_btn">
                        <ul class="clearfix">
                            <li <c:if test="${queryDto.orderByParam == 'companyIndex' }">class="active"</c:if>>
                            	<a name="orderBy_href" href="#">综合推荐<input type="hidden" value="companyIndex"> <i class="icon">󰄓</i></a>
                            </li>
                            <li <c:if test="${queryDto.orderByParam == 'companyIndex'}">class="active"</c:if>>
                            	<a name="orderBy_href" href="#">高返佣推荐 <input type="hidden" value=""><i class="icon">󰄓</i></a>
                            </li>
                            <li <c:if test="${queryDto.orderByParam == 'commissionEurope'}">class="active"</c:if>>
                            	<a name="orderBy_href" href="#">欧美返佣 <input type="hidden" value="commissionEurope"><i class="icon">󰄓</i></a>
                            </li>
                            <li <c:if test="${queryDto.orderByParam == 'commissionGold'}">class="active"</c:if>>
                            	<a name="orderBy_href" href="#">黄金返佣<input type="hidden" value="commissionGold"><i class="icon">󰄓</i></a>
                            </li>
                            <li <c:if test="${queryDto.orderByParam == 'commissionSilver'}">class="active"</c:if>>
                            	<a name="orderBy_href" href="#">白银返佣 <input type="hidden" value="commissionSilver"><i class="icon">󰄓</i></a>
                            </li>
                            <li <c:if test="${queryDto.orderByParam == 'commissionOil'}">class="active"</c:if>>
                            	<a name="orderBy_href" href="#">原油返佣 <input type="hidden" value="commissionOil"><i class="icon">󰄓</i></a>
                            </li>
                        </ul>
                    </div>
                </div>
                
                <div class="j_list">
                
                	<c:forEach items="${brokerExtInfos.list }" var="broker">
                	
						<div class="j_item good clearfix">
	                        <div class="i_left">
	                            <img style="width: 120px; height: 57px;" src="${ctx}/${broker.imageUrl}" />
	                        </div>
	                        <div class="i_center">
	                            <div class="c_list">
	                                <div class="l_item">
	                                    <div class="i_title">经纪商名称:</div>
	                                    <div class="i_content">${broker.cnName }</div>
	                                </div>
	                                <div class="l_item">
	                                    <div class="i_title">点差:</div>
	                                    <div class="i_content">黃金點差:<span class="cDeepRed">${broker.pointDiffMinLlg }</span> /
	                                    					白銀點差:<span class="cDeepRed">${broker.pointDiffMinLls }</span> /
	                                    					港金:<span class="cDeepRed">${broker.pointDiffMinHkg }</span> /
	                                    					人民币公斤条:<span class="cDeepRed">${broker.pointDiffMinLkg }</span></div>
	                                </div>
	                                <div class="l_item">
	                                    <div class="i_title">开仓保证金:</div>
	                                    <div class="i_content">黃金點差:<span class="cDeepRed">${broker.openMoneyLlg }</span> /
	                                    					白銀點差: <span class="cDeepRed">${broker.openMoneyLls }</span> / 
	                                    					港金: <span class="cDeepRed">${broker.openMoneyHkg }</span> /
	                                    					人民币公斤条: <span class="cDeepRed">${broker.openMoneyLkg }</span></div>
	                                </div>
	                                <div class="l_item">
	                                    <div class="i_title">会员/监管机构:</div>
	                                    <div class="i_content">
	                                    	<c:if test="${broker.exchangeType == '0' }">金银业贸易场</c:if>
	                                    	<c:if test="${broker.exchangeType == '1' }">证监会</c:if>
	                                    	<c:if test="${broker.exchangeType == '2' }">&nbsp;</c:if>
	                                    </div>
	                                </div>
	                            </div>
	                        </div>
	                        <div class="i_right">
	                            <div class="t_ctrl">
	                                <div class="r_logo">
	                                    <img src="${ctx }/static/images/logo_2.png" />
	                                </div>
	                                <div class="r_btns">
	                                    <a class="abtn orange" href="#">马上开户</a>
	                                    <a class="abtn blue" href="${ctx}/bk/detail?id=${broker.id}">详细信息</a>
	                                </div>
	                            </div>
	                        </div>
	                    </div>                	
                	
                	</c:forEach>
                
                </div>
                
                
                <div class="j_page">
                </div>
            </div>


        </div>
    </div>



    <div class="J_cooperation">
        <div class="c_title"><span>合作伙伴</span></div>
        <div class="c_inner">
            <img src="../static/tmp/cooperation.png" />
        </div>
    </div>

   	<%@ include file="../common/help.jsp" %>
	<%@ include file="../common/foot.jsp" %>

</body>
</html>
