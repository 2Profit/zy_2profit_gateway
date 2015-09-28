<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<!DOCTYPE>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<%@ include file="../common/common.jsp"%>

<script type="text/javascript">

$(function(){
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
            alert(ui.values[0] + "," + ui.values[1]);
        }
    });
	
});

</script>

</head>

<%@ include file="../common/nice-validator.jsp" %>
<body>

	<%@ include file="../common/head.jsp" %>
    
    
    
   	<div data-ui="indexMask" class="J_indexMask mini"></div>

    <div class="bgfff">
        <div class="J_content">

            <div class="J_jjsSearch clearfix">
                <div class="j_left">
                    <input placeholder="经纪商 / 活动" type="text" />
                </div>
                <div class="j_right">
                    <a class="abtn green" href="#">搜索</a>
                </div>
            </div>

            <div class="J_router"><a href="#">首页</a><span>&gt;</span><a href="#">经纪商</a></div>
            <div class="J_jjsFilter clearfix">
                <div class="j_left">
                    <div class="l_item clearfix">
                        <div class="i_left">类型：</div>
                        <div class="i_right">
                            <a class="not active" href="#">不限</a>
                            <a href="#">贵金属</a>
                            <a href="#">外汇</a>
                        </div>
                    </div>
                    <div class="l_item clearfix">
                        <div class="i_left">产品：</div>
                        <div class="i_right">
                            <a class="not active" href="#">不限</a>
                            <a href="#">国际现货金</a>
                            <a href="#">国际现货银</a>
                            <a href="#">港金</a>
                            <a href="#">人民币公斤条</a>
                        </div>
                    </div>
                    <div class="l_item clearfix">
                        <div class="i_left">会员/监管机构：</div>
                        <div class="i_right">
                            <a class="not active" href="#">不限</a>
                            <a href="#">香港金银业贸易场</a>
                            <a href="#">香港证监会</a>
                            <a href="#">英国FCA</a>
                            <a href="#">日本FSA</a>
                        </div>
                    </div>
                    <div class="l_input">
                       <label><input type="checkbox"> 支持EA</label>
                       <label><input type="checkbox"> 银联入金</label>
                       <label><input type="checkbox"> 出入金面手续费</label>
                    </div>
                </div>
                <div class="j_right">


                    <div class="c_title">最少保证金</div>

                    <div class="c_tips">0 - 2000000</div>


                    <div class="wrapper">
                        <div class="slider3"></div>
                    </div>

                    <div class="c_title">最大杠杆</div>

                    <div class="c_tips">1:1 - 3000:1</div>

                    <div class="wrapper">
                        <div class="slider3"></div>
                    </div>

                    <div class="c_title">最少保证金</div>
                    <div class="c_tips">0 - 5</div>

                    <div class="wrapper">
                        <div class="slider3"></div>
                    </div>

                </div>
            </div>


            <div class="J_jjsList mt20">
                <div class="j_filter clearfix">
                    <div class="f_txt">经纪商筛选结果 共 <span class="cOrange">12186</span> 个</div>
                    <div class="f_btn">
                        <ul class="clearfix">
                            <li class="active"><a href="#">综合推荐 <i class="icon">󰄓</i></a></li>
                            <li><a href="#">高返佣推荐 <i class="icon">󰄓</i></a></li>
                            <li><a href="#">按欧美返佣 <i class="icon">󰄓</i></a></li>
                            <li><a href="#">黄金返佣 <i class="icon">󰄓</i></a></li>
                            <li><a href="#">白银返佣 <i class="icon">󰄓</i></a></li>
                            <li><a href="#">原油返佣 <i class="icon">󰄓</i></a></li>
                        </ul>
                    </div>
                </div>
                
                <div class="j_list">
                
                	<c:forEach items="${brokerExtInfos }" var="broker">
                	
						<div class="j_item good clearfix">
	                        <div class="i_left">
	                            <img style="width: 120px; height: 57px;" src="${ctx}/static/tmp/j1.png" />
	                        </div>
	                        <div class="i_center">
	                            <div class="c_list">
	                                <div class="l_item">
	                                    <div class="i_title">经纪商名称:</div>
	                                    <div class="i_content">${broker.cnName }</div>
	                                </div>
	                                <div class="l_item">
	                                    <div class="i_title">点差:</div>
	                                    <div class="i_content">黃金點差:<span class="cDeepRed">${broker.pointDiffMinLlg }</span>  
	                                    					白銀點差:<span class="cDeepRed">${broker.pointDiffMinLls }</span>  
	                                    					港金:<span class="cDeepRed">${broker.pointDiffMinHkg }</span></div>
	                                    					人民币公斤条:<span class="cDeepRed">${broker.pointDiffMinLkg }</span></div>
	                                </div>
	                                <div class="l_item">
	                                    <div class="i_title">保证金:</div>
	                                    <div class="i_content">最低入金:<span class="cDeepRed">70</span>美元 / 最大槓: <span class="cDeepRed">1:200</span> / 最低開倉保證金: <span class="cDeepRed">70</span>美元</div>
	                                </div>
	                                <div class="l_item">
	                                    <div class="i_title">会员/监管机构:</div>
	                                    <div class="i_content">香港金銀貿易場AA會員</div>
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
	                                    <a class="abtn blue" href="#">详细信息</a>
	                                </div>
	                            </div>
	                        </div>
	                    </div>                	
                	
                	</c:forEach>
                
                </div>
                
                
                
                <div class="j_page">这里是分页</div>
            </div>


        </div>
    </div>
    
    
    

	<%@ include file="../common/help.jsp" %>
	<%@ include file="../common/foot.jsp" %>

</body>
</html>
