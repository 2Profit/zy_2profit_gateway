<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <%@ include file="../common/common.jsp"%>
    
<script type="text/javascript">

	$(function () {
		
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
                    <div class="l_bg">
                        <img src="../static/images/bg.jpg" />
                    </div>
                    <div class="l_logo">
                        <img src="../static/tmp/j2.jpg" />
                    </div>
                </div>
                <div class="j_right">
                    <div class="r_title">
                        <span>返佣金额</span>
                    </div>
                    <div class="r_list clearfix">
                        <div class="l_item">
                            <div class="i_title">欧美</div>
                            <div class="i_num">${brokerExtInfo.commissionEurope }$</div>
                        </div>
                        <div class="l_item">
                            <div class="i_title">黄金</div>
                            <div class="i_num">${brokerExtInfo.commissionGold }$</div>
                        </div>
                        <div class="l_item">
                            <div class="i_title">白银</div>
                            <div class="i_num">${brokerExtInfo.commissionSilver }$</div>
                        </div>
                        <div class="l_item">
                            <div class="i_title">原油</div>
                            <div class="i_num">${brokerExtInfo.commissionOil }$</div>
                        </div>

                    </div>
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
                            <td>${brokerExtInfo.cnName }</td>
                            <td style="width:100px;" class="t_title">英文名称</td>
                            <td>${brokerExtInfo.enName }</td>
                        </tr>
                        <tr>
                            <td class="t_title">会员/监管机构授予编号</td>
                            <td colspan="3">香港证监会(AIM232) , 英國FCA(XXXX),香港证监会(AIM232) , 英國FCA(XXXX),香港证监会(AIM232) , 英國FCA(XXXX)</td>
                        </tr>
                        <tr>
                            <td class="t_title">会员/监管机构</td>
                            <td colspan="3">黃金、白銀、外匯</td>
                        </tr>
                    </tbody>

                </table>


                <div class="j_title">出入金信息</div>
                <table>
                    <tbody>
                        <tr>
                            <td style="width:100px;" class="t_title">人民币入金</td>
                            <td>支持</td>
                            <td style="width:100px;" class="t_title">银联入金</td>
                            <td>支持</td>
                        </tr>
                        <tr>
                            <td class="t_title">建仓手续费</td>
                            <td>
                            	<c:choose>
                            		<c:when test="${brokerExtInfo.isOpenFee == '0'}">不收取</c:when>
                            		<c:when test="${brokerExtInfo.isOpenFee == '1'}">收取</c:when>
                            		<c:otherwise>&nbsp;</c:otherwise>
                            	</c:choose>
                            </td>
                            <td class="t_title">平仓手续费</td>
                            <td>
                            	<c:choose>
                            		<c:when test="${brokerExtInfo.isCloseFee == '0'}">不收取</c:when>
                            		<c:when test="${brokerExtInfo.isCloseFee == '1'}">收取</c:when>
                            		<c:otherwise>&nbsp;</c:otherwise>
                            	</c:choose>
                            </td>
                        </tr>
                        <tr>
                            <td class="t_title">开户最低存款</td>
                            <td>XXXUSD(顯示幣種)</td>
                            <td class="t_title">结算币</td>
                            <td>
                            	<c:choose>
                            		<c:when test="${brokerExtInfo.moneyType == '0'}">美元</c:when>
                            		<c:when test="${brokerExtInfo.moneyType == '1'}">人民币</c:when>
                            		<c:when test="${brokerExtInfo.moneyType == '2'}">港元</c:when>
                            		<c:when test="${brokerExtInfo.moneyType == '3'}">混合</c:when>
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
                            <td>黃金點差: ${brokerExtInfo.pointDiffMinLlg } / 白銀點差: ${brokerExtInfo.pointDiffMinLls } 
                            / 港金點差: ${brokerExtInfo.pointDiffMinHkg } / 人民币公斤點差: ${brokerExtInfo.pointDiffMinLkg }</td>
                        </tr>
                        <tr>
                            <td class="t_title">单次最低交易手数</td>
                            <td>黃金:${brokerExtInfo.minTradeNumLlg }手 / 白銀:${brokerExtInfo.minTradeNumLls }手 
                            / 港金:${brokerExtInfo.minTradeNumHkg }手 / 人民币公斤条:${brokerExtInfo.minTradeNumLkg }手</td>
                        </tr>
                        <tr>
                            <td class="t_title">开仓保险金</td>
                            <td>黃金:${brokerExtInfo.openMoneyLlg } / 白銀:${brokerExtInfo.openMoneyLls } 
                            / 港金:${brokerExtInfo.openMoneyHkg } / 人民币公斤条:${brokerExtInfo.openMoneyLkg }</td>
                        </tr>
                        <tr>
                            <td class="t_title">多仓利息</td>
                            <td>${brokerExtInfo.longRate }</td>
                        </tr>
                        <tr>
                            <td class="t_title">空仓利息</td>
                            <td>${brokerExtInfo.shortRate }</td>
                        </tr>
                        <tr>
                            <td class="t_title">支持EA</td>
                            <td>
                            	<c:choose>
                            		<c:when test="${brokerExtInfo.isEaSupport == '0'}">不支持</c:when>
                            		<c:when test="${brokerExtInfo.isEaSupport == '1'}">支持</c:when>
                            		<c:otherwise>&nbsp;</c:otherwise>
                            	</c:choose>
                            </td>
                        </tr>
                        <tr>
                            <td class="t_title">交易平台</td>
                            <td>
                            	<c:if test="${fn:contains(brokerExtInfo.platform, '0')}">MT4、</c:if>
                            	<c:if test="${fn:contains(brokerExtInfo.platform, '1')}">MT5、</c:if>
                            	<c:if test="${fn:contains(brokerExtInfo.platform, '2')}">GTS1、</c:if>
                            	<c:if test="${fn:contains(brokerExtInfo.platform, '3')}">GTS2、</c:if>
                            	<c:if test="${fn:contains(brokerExtInfo.platform, '4')}">mFinance、</c:if>
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
