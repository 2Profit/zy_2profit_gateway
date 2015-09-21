<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />

	<%@ include file="common/common.jsp"%>

</head>

<%@ include file="common/nice-validator.jsp" %>

<body>
    
    <%@ include file="common/head.jsp" %>

	<div class="J_wrap">

        <div class="J_content mt20 bgfff hasShadow">
            <div class="J_time clearfix">
                <div class="t_item">
                    <div class="i_icon"><img height="24" src="${ctx }/static/images/flag_xg.png" /></div>
                    <div class="i_txt">00:00:00</div>
                </div>
                <div class="t_item">
                    <div class="i_icon"><img height="24" src="${ctx }/static/images/flag_xxl.png" /></div>
                    <div class="i_txt">00:00:00</div>
                </div>
                <div class="t_item">
                    <div class="i_icon"><img height="24" src="${ctx }/static/images/flag_rb.png" /></div>
                    <div class="i_txt">00:00:00</div>
                </div>
                <div class="t_item">
                    <div class="i_icon"><img height="24" src="${ctx }/static/images/flag_yg.png" /></div>
                    <div class="i_txt">00:00:00</div>
                </div>
                <div class="t_item">
                    <div class="i_icon"><img height="24" src="${ctx }/static/images/flag_mg.png" /></div>
                    <div class="i_txt">00:00:00</div>
                </div>

            </div>
        </div>

        <div class="J_content mt20 bgfff bg1 hasShadow">
            <div class="fl c_180">

                <div class="J_leftMenu">
                    <div class="l_item current">
                        <div class="i_default"><a href="#"><i class="icon">󰃌</i>账户管理</a></div>
                        <div class="i_menu">
                            <div class="m_txt current"><a href="#"><i class="icon">󰂻</i>账户资料</a></div>
                            <div class="m_txt"><a href="#"><i class="icon">󰃔</i>个人资料</a></div>
                            <div class="m_txt"><a href="#"><i class="icon">󰃉</i>修改密码</a></div>
                        </div>
                    </div>
                    <div class="l_item">
                        <div class="i_default"><a href="#"><i class="icon">󰇸</i>资金管理</a></div>
                        <div class="i_menu">
                            <div class="m_txt"><a href="#"><i class="icon">󰀥</i>额度明細</a></div>
                            <div class="m_txt"><a href="#"><i class="icon">󰀵</i>存款</a></div>
                        </div>
                    </div>
                    <div class="l_item">
                        <div class="i_default"><a href="#"><i class="icon">󰃵</i>交易资料</a></div>
                        <div class="i_menu">
                            <div class="m_txt"><a href="#"><i class="icon">󰄁</i>交易记录</a></div>
                        </div>
                    </div>
                    <div class="l_item">
                        <div class="i_default"><a href="#"><i class="icon">󰄎</i>服务管理</a></div>
                        <div class="i_menu">
                            <div class="m_txt"><a href="#"><i class="icon">󰃾</i>消息订阅</a></div>
                            <div class="m_txt"><a href="#"><i class="icon">󰇫</i>微信服务</a></div>
                            <div class="m_txt"><a href="#"><i class="icon">󰊛</i>问题回馈</a></div>
                        </div>
                    </div>
                    <div class="l_item">
                        <div class="i_default"><a href="#"><i class="icon">󰄊</i>我的活动</a></div>
                    </div>
                    <div class="l_item">
                        <div class="i_default"><a href="#"><i class="icon">󰇀</i>投票功能</a></div>
                    </div>
                    <div class="l_item">
                        <div class="i_default"><a href="#"><i class="icon">󰊑</i>公告</a></div>
                    </div>
                    <div class="l_item">
                        <div class="i_default"><a href="#"><i class="icon">󰃕</i>老师专区</a></div>
                        <div class="i_menu">
                            <div class="m_txt"><a href="#"><i class="icon">󰂰</i>银行资料</a></div>
                            <div class="m_txt"><a href="#"><i class="icon">󰅐</i>取款</a></div>
                        </div>
                    </div>

                </div>


            </div>
            <div class="fr c_1000">

                <div class="J_title less">
                    <div class="t_txt">账户资料</div>
                    <div class="t_tips"></div>
                    <div class="t_more"></div>
                </div>
                <div class="plrb20">
                    <div class="J_miniTitle">
                        <div class="m_token"></div>
                        <div class="m_txt">帳戶信息</div>
                    </div>

                    <div class="J_userInfoTable">
                        <table>
                            <tbody>
                                <tr>
                                    <td>姓名：</td>
                                    <td>张生</td>
                                </tr>
                                <tr>
                                    <td>帐号：</td>
                                    <td>4028263</td>
                                </tr>
                                <tr>
                                    <td>用户名：</td>
                                    <td>abc123</td>
                                </tr>
                            </tbody>
                        </table>
                    </div>

                    <div class="J_miniTitle">
                        <div class="m_token"></div>
                        <div class="m_txt">已绑定的交易帐号</div>
                    </div>



                    <div class="J_table mt10">
                        <table>
                            <thead>
                                <tr>
                                    <td>平台</td>
                                    <td>帐号</td>
                                    <td>公司</td>
                                    <td>级别</td>
                                    <td>余额</td>
                                </tr>
                            </thead>
                            <tbody>
                                <tr>
                                    <td>MT4</td>
                                    <td>Member_21awdad1aa</td>
                                    <td>深圳市腾讯计算机系统有限公司</td>
                                    <td>高级</td>
                                    <td><span class="cOrange">￥300,000,00</span> USD</td>
                                </tr>
                                <tr>
                                    <td>MT4</td>
                                    <td>Member_78adwa1baa</td>
                                    <td>阿里巴巴网络技术有限公司</td>
                                    <td>高级</td>
                                    <td><span class="cOrange">￥842,000,00</span> USD</td>
                                </tr>
                                <tr>
                                    <td>MT4</td>
                                    <td>Member_awd1212317</td>
                                    <td>深圳市迅雷网络技术有限公司</td>
                                    <td>高级</td>
                                    <td><span class="cOrange">￥420,000,00</span> USD</td>
                                </tr>
                                <tr>
                                    <td>MT4</td>
                                    <td>Member_515af12121</td>
                                    <td>北京小米科技有限责任公司</td>
                                    <td>高级</td>
                                    <td><span class="cOrange">￥542,000,00</span> USD</td>
                                </tr>
                                <tr>
                                    <td>MT4</td>
                                    <td>Member_12adwaaw21</td>
                                    <td>北京小米科技有限责任公司</td>
                                    <td>高级</td>
                                    <td><span class="cOrange">￥384,000,00</span> USD</td>
                                </tr>
                                <tr>
                                    <td>MT4</td>
                                    <td>Member_131cf1c121</td>
                                    <td>魅族科技有限公司</td>
                                    <td>高级</td>
                                    <td><span class="cOrange">￥246,000,00</span> USD</td>
                                </tr>

                            </tbody>
                        </table>
                    </div>



                </div>



                <div class="J_title less">
                    <div class="t_txt">最新公告</div>
                    <div class="t_tips"></div>
                    <div class="t_more"></div>
                </div>

                <div class="pau">
                    <div class="J_table mt10">
                        <table style="width:100%;">
                            <thead>
                                <tr>
                                    <td>标题</td>
                                    <td>时间</td>
                                </tr>
                            </thead>
                            <tbody>
                                <tr>
                                    <td>好消息!e桶金网上线了,千万好礼等着你来领取!</td>
                                    <td>2015-09-11</td>
                                </tr>
                                <tr>
                                    <td>好消息!e桶金网上线了,千万好礼等着你来领取!</td>
                                    <td>2015-09-11</td>
                                </tr>
                            </tbody>
                        </table>
                    </div>

                </div>


            </div>
        </div>
    </div>

    
	<%@ include file="common/help.jsp" %>
	<%@ include file="common/foot.jsp" %>

</body>
</html>
