<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <%@ include file="../common/common.jsp"%>
    
<script type="text/javascript">

	$(function () {
		
		headerAddClass();
		
	});
</script>


</head>
<body>
    
    <%@ include file="../common/head.jsp" %>

	<div data-ui="indexMask" class="J_indexMask mini"></div>

    <div class="bgfff">
        <div class="J_content">

            <div class="J_jjsHolder">
                <div class="j_left">
                    <div class="l_logo">
                        <img src="${ctx }/${broker.imageUrl}" />
                    </div>
                </div>
                <div class="j_right">
                    <div class="r_btn">
                        <a class="b_btn" href="#">
                            <img src="../static/images/khfy.png" /></a>
                        <a class="b_link" href="#">了解返佣规则</a>
                    </div>
                </div>
            </div>


            <div class="J_jjsInfo">
                <div class="j_title">基本信息</div>
                <table>
                    <tbody>
                        <tr>
                            <td style="width:100px;" class="t_title">中文名称</td>
                            <td>${broker.cnName }</td>
                            <td style="width:100px;" class="t_title">英文名称</td>
                            <td>${broker.enName }</td>
                        </tr>
                        <tr>
                            <td class="t_title">会员/监管机构授予编号</td>
                            <td colspan="3">
                            	<c:if test="${broker.exchangeNo1!=null && broker.exchangeNo1!='' }">金银业贸易场(${broker.exchangeNo1}), </c:if>
                            	<c:if test="${broker.exchangeNo2!=null && broker.exchangeNo2!='' }">证监会(${broker.exchangeNo2}), </c:if>
	                            <c:if test="${broker.exchangeNo3!=null && broker.exchangeNo3!='' }">英国FCA(${broker.exchangeNo3}), </c:if>
	                            <c:if test="${broker.exchangeNo4!=null && broker.exchangeNo4!='' }">日本FSA(${broker.exchangeNo4}), </c:if>
                            </td>
                        </tr>
                        <tr>
                            <td class="t_title">会员/监管机构</td>
		                    <td>
		                       	<c:if test="${broker.exchangeNo1!=null && broker.exchangeNo1!='' }">金银业贸易场, </c:if>
		                       	<c:if test="${broker.exchangeNo2!=null && broker.exchangeNo2!='' }">证监会, </c:if>
		                        <c:if test="${broker.exchangeNo3!=null && broker.exchangeNo3!='' }">英国FCA, </c:if>
		                        <c:if test="${broker.exchangeNo4!=null && broker.exchangeNo4!='' }">日本FSA, </c:if>                    
		                    </td>
                        </tr>
                    </tbody>
                </table>

                <div class="j_title">出入金信息</div>
                <table>
                    <tbody>
                        <tr>
                            <td style="width:100px;" class="t_title">人民币入金</td>
                            <td>
                            	<c:choose>
                            		<c:when test="${broker.isRmbSupport == '0'}">不支持</c:when>
                            		<c:when test="${broker.isRmbSupport == '1'}">支持</c:when>
                            		<c:otherwise>&nbsp;</c:otherwise>
                            	</c:choose>                            
                            </td>
                            <td style="width:100px;" class="t_title">银联入金</td>
                            <td>
                           		<c:choose>
                            		<c:when test="${broker.isUnionpay == '0'}">不支持</c:when>
                            		<c:when test="${broker.isUnionpay == '1'}">支持</c:when>
                            		<c:otherwise>&nbsp;</c:otherwise>
                            	</c:choose> 
                            </td>
                        </tr>
                        <tr>
                            <td class="t_title">建仓手续费</td>
                            <td>
                            	<c:choose>
                            		<c:when test="${broker.isOpenFee == '0'}">不收取</c:when>
                            		<c:when test="${broker.isOpenFee == '1'}">收取</c:when>
                            		<c:otherwise>&nbsp;</c:otherwise>
                            	</c:choose>
                            </td>
                            <td class="t_title">平仓手续费</td>
                            <td>
                            	<c:choose>
                            		<c:when test="${broker.isCloseFee == '0'}">不收取</c:when>
                            		<c:when test="${broker.isCloseFee == '1'}">收取</c:when>
                            		<c:otherwise>&nbsp;</c:otherwise>
                            	</c:choose>
                            </td>
                        </tr>
                        <tr>
                            <td class="t_title">开户最低存款</td>
                            <td>${broker.minIncomeMoney }(显示币种)</td>
                            <td class="t_title">结算币</td>
                            <td>
                            	<c:choose>
                            		<c:when test="${broker.moneyType == '0'}">美元</c:when>
                            		<c:when test="${broker.moneyType == '1'}">人民币</c:when>
                            		<c:when test="${broker.moneyType == '2'}">港元</c:when>
                            		<c:when test="${broker.moneyType == '3'}">混合</c:when>
                            		<c:otherwise>&nbsp;</c:otherwise>
                            	</c:choose>
                            </td>
                        </tr>
                    </tbody>

                </table>

                <div class="j_title">交易信息</div>
                <table>
                    <tbody>
                        <tr>
                            <td style="width:120px;" class="t_title">点差</td>
                            <td>
                                <c:if test="${broker.pointDiffMinLlg != null }">伦敦金：(${broker.pointDiffMinLlg}) /</c:if>
                            	<c:if test="${broker.pointDiffMinLls != null }">伦敦银：(${broker.pointDiffMinLls}) /</c:if>
                            	<c:if test="${broker.pointDiffMinHkg != null }">港金：(${broker.pointDiffMinHkg}) /</c:if>
                            	<c:if test="${broker.pointDiffMinLkg != null }">人民币公斤条：(${broker.pointDiffMinLkg}) /</c:if>
                            	<c:if test="${broker.pointDiffMinWh != null }">外汇：(${broker.pointDiffMinWh}) /</c:if>
                            	<c:if test="${broker.pointDiffMinYy != null }">原油：(${broker.pointDiffMinYy}) </c:if>
                            </td>                            
                        </tr>
                        <tr>
                            <td class="t_title">单次最低交易手数</td>
                            <td>
                                <c:if test="${broker.minTradeNumLlg != null }">伦敦金：(${broker.minTradeNumLlg})手 /</c:if>
                            	<c:if test="${broker.minTradeNumLls != null }">伦敦银：(${broker.minTradeNumLls})手 /</c:if>
                            	<c:if test="${broker.minTradeNumHkg != null }">港金：(${broker.minTradeNumHkg})手 /</c:if>
                            	<c:if test="${broker.minTradeNumLkg != null }">人民币公斤条：(${broker.minTradeNumLkg})手 /</c:if>
                            	<c:if test="${broker.minTradeNumWh != null }">外汇：(${broker.minTradeNumWh})手 /</c:if>
                            	<c:if test="${broker.minTradeNumYy != null }">原油：(${broker.minTradeNumYy}) </c:if>
                            </td>
                        </tr>
                        <tr>
                            <td class="t_title">开仓保险金</td>
                            <td>
                            	<c:if test="${broker.openMoneyLlg != null }">伦敦金：(${broker.openMoneyLlg}) /</c:if>
                            	<c:if test="${broker.openMoneyLls != null }">伦敦银：(${broker.openMoneyLls}) /</c:if>
                            	<c:if test="${broker.openMoneyHkg != null }">港金：(${broker.openMoneyHkg}) /</c:if>
                            	<c:if test="${broker.openMoneyLkg != null }">人民币公斤条：(${broker.openMoneyLkg}) /</c:if>
                            	<c:if test="${broker.openMoneyWh != null }">外汇：(${broker.openMoneyWh}) /</c:if>
                            	<c:if test="${broker.openMoneyYy != null }">原油：(${broker.openMoneyYy}) </c:if>
                            </td>
                        </tr>
                        <tr>
                            <td class="t_title">多仓利息</td>
                            <td>${broker.longRate }</td>
                        </tr>
                        <tr>
                            <td class="t_title">空仓利息</td>
                            <td>${broker.shortRate }</td>
                        </tr>
                        <tr>
                            <td class="t_title">支持EA</td>
                            <td>
                            	<c:choose>
                            		<c:when test="${broker.isEaSupport == '0'}">不支持</c:when>
                            		<c:when test="${broker.isEaSupport == '1'}">支持</c:when>
                            		<c:otherwise>&nbsp;</c:otherwise>
                            	</c:choose>
                            </td>
                        </tr>
                        <tr>
                            <td class="t_title">交易平台</td>
                            <td>
                            	<c:if test="${fn:contains(broker.platform, '0')}">MT4、</c:if>
                            	<c:if test="${fn:contains(broker.platform, '1')}">MT5、</c:if>
                            	<c:if test="${fn:contains(broker.platform, '2')}">GTS1、</c:if>
                            	<c:if test="${fn:contains(broker.platform, '3')}">GTS2、</c:if>
                            	<c:if test="${fn:contains(broker.platform, '4')}">mFinance、</c:if>
                            </td>
                        </tr>
                    </tbody>
                </table>
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
