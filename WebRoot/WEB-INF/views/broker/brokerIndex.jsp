<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <%@ include file="../common/common.jsp"%>
    
<script type="text/javascript">

	var slider1F = 0;
	var slider1T = 0;
	var slider2F = 0;
	var slider2T = 0;
	var slider3F = 0;
	var slider3T = 0;
	
	$(function () {
		
		//$("#slider").slider('option',{min: 0, max: 500});调整范围，后续加上
		
	    var points = 200;
	    $('.slider1').slider({min: 0, max: points, animate: true, range: true, values: [0, 200]});
	    $('.slider2').slider({min: 0, max: points, animate: true, range: true, values: [0, 300]});
	    $('.slider3').slider({min: 0, max: points, animate: true, range: true, values: [0, 200]});
	    
	    $('.slider1').slider('pips', { });
	    $('.slider2').slider('pips', { });
	    $('.slider3').slider('pips', { });
	    
	    if('${queryDto.slider1F}'!='' && parseInt('${queryDto.slider1F}')!=0){
	    	$(".slider1").slider('values',0, parseInt('${queryDto.slider1F}'));
	    } 
	    if('${queryDto.slider1T}'!='' && parseInt('${queryDto.slider1T}')!=0){
	    	$(".slider1").slider('values',1, parseInt('${queryDto.slider1T}'));
	    } 
	    if('${queryDto.slider2F}'!='' && parseInt('${queryDto.slider2F}')!=0){
	    	$(".slider2").slider('values',0, parseInt('${queryDto.slider2F}'));
	    } 
	    if('${queryDto.slider2T}'!='' && parseInt('${queryDto.slider2T}')!=0){
	    	$(".slider2").slider('values',1, parseInt('${queryDto.slider2T}'));
	    } 
	    if('${queryDto.slider3F}'!='' && parseInt('${queryDto.slider3F}')!=0){
	    	$(".slider3").slider('values',0, parseInt('${queryDto.slider3F}'));
	    } 
	    if('${queryDto.slider3T}'!='' && parseInt('${queryDto.slider3T}')!=0){
	    	$(".slider3").slider('values',1, parseInt('${queryDto.slider3T}'));
	    } 
	    
	    $(".slider1").slider({
	        stop: function (event, ui) {
	        	if($('a[name=productType].active').children().val()==''){
	        		jc.alert('请选择产品！');return false;
	        	}
	        	slider1F = ui.values[0];
	        	slider1T = ui.values[1];
	        	query();
	        }
	    });
	    $(".slider2").slider({
	        stop: function (event, ui) {
	        	if($('a[name=productType].active').children().val()==''){
	        		jc.alert('请选择产品！');return false;
	        	}
	        	slider2F = ui.values[0];
	        	slider2T = ui.values[1];
	        	query();
	        }
	    });
	    $(".slider3").slider({
	        stop: function (event, ui) {
	        	if($('a[name=productType].active').children().val()==''){
	        		jc.alert('请选择产品！');return false;
	        	}
	        	slider3F = ui.values[0];
	        	slider3T = ui.values[1];
	        	query();
	        }
	    });
	    
	    $('a[name=companyType]').click(function(){
	    	$('a[name=companyType]').each(function(){
	    		$(this).attr("class", "");
	    	});
	    	$(this).attr("class", "active");
	    	query();
	    });
	    $('a[name=productType]').click(function(){
	    	$('a[name=productType]').each(function(){
	    		$(this).attr("class", "");
	    	});
	    	$(this).attr("class", "active");
	    	query();
	    });
	    $('a[name=exchangeType]').click(function(){
	    	$('a[name=exchangeType]').each(function(){
	    		$(this).attr("class", "");
	    	});
	    	$(this).attr("class", "active");
	    	query();
	    });
	    
	    $('a[name=orderBy_href]').click(function(){
	    	$('a[name=orderBy_href]').each(function(){
	    		$(this).closest('li').attr("class", "");
	    	});
	    	$(this).closest('li').attr("class", "active");
	    	query();
	    });
	    
	    
	    $('input[name=isEaSupport]').click(function(){
	    	query();
	    });
	    $('input[name=isUnionpay]').click(function(){
	    	query();
	    });
	    $('input[name=isInOutFree]').click(function(){
	    	query();
	    });
	    
	    $('#search_href').click(function(event){
	    	event.preventDefault();
	    	query();
	    });
	});
	
	function query(){
		
		var params = "companyType="+$('a[name=companyType].active').children().val();
		
		if($('input[name=bkName]').val()!='' && $('input[name=bkName]').val()!=','){
			params += "&bkName="+$('input[name=bkName]').val();
		}
		
		params += "&productType="+$('a[name=productType].active').children().val();
		params += "&exTypeP="+$('a[name=exchangeType].active').children().val();
		params += "&orderP="+$('li[name=orderBy_li].active').children('a').children('input').val();
		
		if($('input[name=isEaSupport]').is(':checked'))
			params += "&isEaSupport=1";
		if($('input[name=isUnionpay]').is(':checked'))
			params += "&isUnionpay=1";
		if($('input[name=isInOutFree]').is(':checked'))
			params += "&isInOutFree=1";
		
		params += "&slider1F="+slider1F+"&slider1T="+slider1T;
		params += "&slider2F="+slider2F+"&slider2T="+slider2T;
		params += "&slider3F="+slider3F+"&slider3T="+slider3T;
		
    	window.location.href="${ctx }/bk/list?"+params;
	}
	
</script>


</head>
<body>
    <form action="" name="form" id="form" method="post" theme="simple">
    <%@ include file="../common/head.jsp" %>

	<div data-ui="indexMask" class="J_indexMask mini"></div>

    <div class="bgfff">
        <div class="J_content">

            <div class="J_jjsSearch clearfix">
                <div class="j_left">
                    <input placeholder="经纪商 名称（中文/英文）" type="text" name="bkName" value="${queryDto.bkName }"/>
                </div>
                <div class="j_right">
                    <a class="abtn green" id="search_href" href=''>搜索</a>
                </div>
            </div>

            <div class="J_router"><a href="${ctx }/index">首页</a><span>&gt;</span><a href="${ctx }/bk/list">经纪商</a></div>
            <div class="J_jjsFilter clearfix">
                <div class="j_left">
                    <div class="l_item clearfix">
                        <div class="i_left">类型：</div>
                        <div class="i_right">
                            <a name="companyType" <c:if test="${queryDto.companyType==null || queryDto.companyType=='' }">class="active"</c:if> href="#">
                            	<input type="hidden" value="">不限</a>
                            <a name="companyType" <c:if test="${queryDto.companyType == '0' }">class="active"</c:if> href='#'>
                            	<input type="hidden" value="0">黄金</a>
                            <a name="companyType" <c:if test="${queryDto.companyType == '1' }">class="active"</c:if> href="#">
                            	<input type="hidden" value="1">外汇</a>
                            <a name="companyType" <c:if test="${queryDto.companyType == '2' }">class="active"</c:if> href="#">
                            	<input type="hidden" value="2">二元期权</a>
                            <a name="companyType" <c:if test="${queryDto.companyType == '3' }">class="active"</c:if> href="#">
                            	<input type="hidden" value="3">国际现货金银</a>
                            <a name="companyType" <c:if test="${queryDto.companyType == '4' }">class="active"</c:if> href="#">
                            	<input type="hidden" value="4">混合</a>
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
                            <a name="productType" <c:if test="${queryDto.productType == '4' }">class="active"</c:if> href="#">
                            	<input type="hidden" value="4">外汇</a>
                            <a name="productType" <c:if test="${queryDto.productType == '5' }">class="active"</c:if> href="#">
                            	<input type="hidden" value="5">原油</a>
                        </div>
                    </div>
                    <div class="l_item clearfix">
                        <div class="i_left">会员/监管机构：</div>
                        <div class="i_right">
                            <a name="exchangeType" <c:if test="${queryDto.exTypeP==null || queryDto.exTypeP=='' }">class="active"</c:if> href="#">
                            	<input type="hidden" value="">不限</a>
                            <a name="exchangeType" <c:if test="${queryDto.exTypeP == '0' }">class="active"</c:if> href="#">
                            	<input type="hidden" value="0">香港金银业贸易场</a>
                            <a name="exchangeType" <c:if test="${queryDto.exTypeP == '1' }">class="active"</c:if> href="#">
                            	<input type="hidden" value="1">香港证监会</a>
                            <a name="exchangeType" <c:if test="${queryDto.exTypeP == '2' }">class="active"</c:if> href="#">
                            	<input type="hidden" value="2">英国FCA</a>
                            <a name="exchangeType" <c:if test="${queryDto.exTypeP == '3' }">class="active"</c:if> href="#">
                            	<input type="hidden" value="3">日本FSA</a>
                        </div>
                    </div>
                    <div class="l_input">
                       <label><input type="checkbox" <c:if test="${queryDto.isEaSupport == '1' }">checked</c:if> name="isEaSupport" value="1"> 支持EA</label>
                       <label><input type="checkbox" <c:if test="${queryDto.isUnionpay == '1' }">checked</c:if> name="isUnionpay" value="1"> 银联入金</label>
                       <label><input type="checkbox" <c:if test="${queryDto.isInOutFree == '1' }">checked</c:if> name="isInOutFree" value="1"> 出入金免手续费</label>
                    </div>
                </div>
                <div class="j_right">

                    <div class="c_title">最低产品点差</div>
                    <div class="c_tips">0 - 200</div>
                    <div class="wrapper"><div class="slider1"></div></div>

                    <div class="c_title">杠杆比列</div>
                    <div class="c_tips">1:1 - 200:1</div>
                    <div class="wrapper"><div class="slider2"></div></div>

                    <div class="c_title">开仓保证金</div>
                    <div class="c_tips">0 - 200</div>
                    <div class="wrapper"><div class="slider3"></div></div>

                </div>
            </div>


            <div class="J_jjsList mt20">
                <div class="j_filter clearfix">
                    <div class="f_txt">经纪商筛选结果 共 <span class="cOrange">${page.totalCount}</span> 个</div>
                    <div class="f_btn">
                        <ul class="clearfix">
                            <li name='orderBy_li' <c:if test="${queryDto.orderP==null || queryDto.orderP == 'company_index' }">class='active'</c:if>>
                            	<a name='orderBy_href' href="#">综合推荐<input type="hidden" value="company_index"> <i class="icon">󰄓</i></a>
                            </li>
                            <li name='orderBy_li' <c:if test="${queryDto.orderP == 'commission_llg'}">class="active"</c:if>>
                            	<a name='orderBy_href' href="#">黄金返佣推荐 <input type="hidden" value="commission_llg"><i class="icon">󰄓</i></a>
                            </li>
                            <li name='orderBy_li' <c:if test="${queryDto.orderP == 'commission_lls'}">class="active"</c:if>>
                            	<a name='orderBy_href' href="#">白银返佣 <input type="hidden" value="commission_lls"><i class="icon">󰄓</i></a>
                            </li>
                            <li name='orderBy_li' <c:if test="${queryDto.orderP == 'commission_hkg'}">class="active"</c:if>>
                            	<a name='orderBy_href' href="#">港金返佣<input type="hidden" value="commission_hkg"><i class="icon">󰄓</i></a>
                            </li>
                            <li name='orderBy_li' <c:if test="${queryDto.orderP == 'commission_lkg'}">class="active"</c:if>>
                            	<a name='orderBy_href' href="#">人民币公斤返佣 <input type="hidden" value="commission_lkg"><i class="icon">󰄓</i></a>
                            </li>
                            <li name='orderBy_li' <c:if test="${queryDto.orderP == 'commission_wh'}">class="active"</c:if>>
                            	<a name='orderBy_href' href="#">外汇返佣 <input type="hidden" value="commission_wh"><i class="icon">󰄓</i></a>
                            </li>
                            <li name='orderBy_li' <c:if test="${queryDto.orderP == 'commission_yy'}">class="active"</c:if>>
                            	<a name='orderBy_href' href="#">原油返佣 <input type="hidden" value="commission_yy"><i class="icon">󰄓</i></a>
                            </li>
                        </ul>
                    </div>
                </div>
                
                <div class="j_list">
                
                	<c:forEach items="${page.list }" var="broker">
                	
						<div class="j_item <c:if test='${broker.isRecommet==1 }'>good</c:if> clearfix">
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
	                                    	<c:if test="${broker.exchangeNo1!=null && broker.exchangeNo1!='' }">金银业贸易场(${broker.exchangeNo1}) /</c:if>
	                                    	<c:if test="${broker.exchangeNo2!=null && broker.exchangeNo2!='' }">证监会(${broker.exchangeNo2}) /</c:if>
	                                    	<c:if test="${broker.exchangeNo3!=null && broker.exchangeNo3!='' }">英国FCA(${broker.exchangeNo3}) /</c:if>
	                                    	<c:if test="${broker.exchangeNo4!=null && broker.exchangeNo4!='' }">日本FSA(${broker.exchangeNo4}) /</c:if>
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
	                                    <a class="abtn orange" target="_blank" href="http://${broker.commissionUrl}">马上开户</a>
	                                    <a class="abtn blue" href="${ctx}/bk/detail?id=${broker.id}">详细信息</a>
	                                </div>
	                            </div>
	                        </div>
	                    </div>                	
                	
                	</c:forEach>
                
                </div>
                
                
                <div class="j_page">
                	<tr><td colspan="50" style="text-align:center;"><%@ include file="../common/pager.jsp"%></td></tr>
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
	</form>
</body>
</html>
