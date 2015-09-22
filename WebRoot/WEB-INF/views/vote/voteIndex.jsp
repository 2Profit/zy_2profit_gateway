<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <!-- 页面设计：?? | 页面重构：黄健聪 | 创建：2015-09-01 | 最后修改：2015-?-? -->
    <title>e桶金</title>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<%@ include file="common/common.jsp"%>

</head>
<body>
    <div class="J_wrap">

        <div class="J_content mt20 bgfff hasShadow">
            <div class="J_time clearfix">
                <div class="t_item">
                    <div class="i_icon">
                        <img height="24" src="../images/flag_xg.png" />
                    </div>
                    <div class="i_txt">00:00:00</div>
                </div>
                <div class="t_item">
                    <div class="i_icon">
                        <img height="24" src="../images/flag_xxl.png" />
                    </div>
                    <div class="i_txt">00:00:00</div>
                </div>
                <div class="t_item">
                    <div class="i_icon">
                        <img height="24" src="../images/flag_rb.png" />
                    </div>
                    <div class="i_txt">00:00:00</div>
                </div>
                <div class="t_item">
                    <div class="i_icon">
                        <img height="24" src="../images/flag_yg.png" />
                    </div>
                    <div class="i_txt">00:00:00</div>
                </div>
                <div class="t_item">
                    <div class="i_icon">
                        <img height="24" src="../images/flag_mg.png" />
                    </div>
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
                    <div class="t_txt">投票</div>
                    <div class="t_tips"></div>
                    <div class="t_more"></div>
                </div>
                <div class="plrb20">
                    <div class="clearfix">
                        <div class="fl w50p">

                            <div class="plr10">

                                <div class="J_miniTitle">
                                    <div class="m_token"></div>
                                    <div class="m_txt">本期投票</div>
                                </div>

                                <div class="J_vote">
                                    <div class="v_title">${currentTopic.titleContent}</div>
                                    <div class="v_content">
                                    	<c:forEach items="${currentTopic.options }" var="option">
                                    		<div class="c_item">
                                            <a href="javascript:">
                                            	 <label><input type="radio" />${option.optionContent }</label></a>
                                        	</div>
                                    	</c:forEach>
                                    </div>
                                </div>

                            </div>
                        </div>
                        <div class="fr w50p">

                            <div class="plr10">

                                <div class="J_miniTitle">
                                    <div class="m_token"></div>
                                    <div class="m_txt">下期投票</div>
                                </div>

                                <div class="J_vote next">
                                    <div class="v_title">你想下一期投票的題目是?</div>
                                    <div class="v_content">
                                        <div class="c_item">
                                            <a href="javascript:">
                                                <label>
                                                    <input disabled="disabled" type="radio" />你認為美元何時加息</label></a>
                                        </div>
                                        <div class="c_item">
                                            <a href="javascript:">
                                                <label>
                                                    <input disabled="disabled" type="radio" />你是否認為A股已見底</label></a>
                                        </div>
                                        <div class="c_item">
                                            <a href="javascript:">
                                                <label>
                                                    <input disabled="disabled" type="radio" />你認為中央救市已有成效</label></a>
                                        </div>

                                    </div>
                                </div>

                            </div>
                        </div>
                    </div>




                    <div class="J_miniTitle mt10">
                        <div class="m_token"></div>
                        <div class="m_txt">本期投票结果（<span class="cOrange">${currentTopic.voteCount}</span>人参与）</div>
                    </div>
                    <div class="J_voteSuccess">
                    	<c:forEach items="${currentTopic.options }" var="option">
	                        <div class="v_item">
	                            <div class="i_left">${option.optionContent }</div>
	                            <div class="i_right">
	                                <div style="width: 100%; background-color: #ee6a53;" class="r_bar">
	                                    <div class="b_txt">
	                                    	<fmt:formatNumber type="number" value="${option.voteCount*100/currentTopic.voteCount)}" maxFractionDigits="2"/>%
	                                    </div>
	                                </div>
	                            </div>
	                        </div>
                        </c:forEach>
                    </div>

                    <div class="J_toolsBar">
                        <div class="fr">
                            <div class="t_text mini">
                                <label>
                                    <input placeholder="验证码" type="text">
                                </label>
                            </div>
                            <div class="ml10 t_code">
                                <a href="#">
                                    <img src="../tmp/code.png" />
                                </a>
                            </div>
                            <div class="ml10 t_button">
                                <a class="abtn orange" href="#">我要投票</a>
                            </div>
                        </div>

                    </div>

                </div>

                <div class="J_title less">
                    <div class="t_txt">我要回应</div>
                    <div class="t_tips"></div>
                    <div class="t_more"></div>
                </div>

                <div class="pau">
                    <div data-ui="commentsList" class="J_commentsList">
                        <div class="c_item">
                        	<c:forEach items="${currentTopic.posts }" var="post">
                        		<div class="i_left">
	                                <div class="l_img">
	                                    <img src="../tmp/face_08.jpg">
	                                </div>
	                                <div class="l_hg"></div>
	                            </div>
								<div class="i_right">
	                                <div class="r_info clearfix">
	                                    <div class="fl">${post.publisher.userName } 时间: <fmt:formatDate value="${post.createDate}" type="both" pattern="yyyy-MM-dd"/></div>
	                                    <div class="fr">
	                                        <a class="i_replyBtn" href="javascript:;"><i class="icon"></i> 赞(${post.praiseCount }) </a>
	                                        <span>| </span>
	                                        <a class="i_replyBtn" href="javascript:showDialog();">回复</a>
	                                        <span>| </span>
	                                        <a class="i_replyBtn" href="javascript:;">举报(${post.reportCount })</a>
	                                    </div>
	                                </div>
	                                <div class="r_content">${post.postContent }</div>
		                                <div class="r_reply">
		                                	<c:forEach items="${post.postReplays }" var="replay">
			                                    <div class="c_item">
			                                        <div class="i_left">
			                                            <div class="l_img">
			                                                <img src="../tmp/face_06.jpg">
			                                            </div>
			                                            <div class="l_hg"></div>
			                                        </div>
			                                        <div class="i_right">
			                                            <div class="r_info">${replay.replayer.userName } 回复 ${post.publisher.userName } 时间: 
			                                            	<fmt:formatDate value="${post.createDate}" type="both" pattern="yyyy-MM-dd"/></div>
			                                            <div class="r_content">${replay.replayContent }</div>
			                                        </div>
			                                    </div>
		                                    </c:forEach>
		                                </div>
		                        	</div>
	                            </div>                        	
                        	</c:forEach>
                        </div>
                    </div>

                    <div data-ui="reply" class="J_reply">
                        <div data-ui="title" class="J_title">
                            <div class="t_txt">我要发表</div>
                        </div>

                        <!-- 登录后请display:none -->
                        <div class="r_textarea">
                            <textarea class="t_textarea"></textarea>
                            <div class="t_tips">请先 <a class="abtn green" href="javascript:;">登录</a> | <a class="abtn green" href="javascript:;">注册</a> </div>
                        </div>
                        <!-- 登录后请display:none -->

                        <div class="J_toolsBar">
                            <div class="fr">
                                <div class="t_label plr10">还可以输入<span class="l_range cOrange">255</span>字</div>
                                <div class="ml10 t_button">
                                    <!-- 登录后请display:none -->
                                    <a class="b_submit abtn gray" href="javascript:;">回复</a>
                                    <!-- 显示这个 -->
                                    <a style="display: none;" class="b_submit abtn orange" href="javascript:;">回复</a>
                                </div>
                            </div>

                        </div>

                    </div>
                </div>

                <div class="J_title less">
                    <div class="t_txt">更多投票</div>
                    <div class="t_tips"></div>
                    <div class="t_more"></div>
                </div>

                <div class="J_voteList">
                    <table>
                        <tbody>
                        	<c:forEach items="${topics }" var="topic">
	                        	<tr>
	                                <td style="width:100px;" class="vat tac c999"><fmt:formatDate value="${topic.startDate}" pattern="yyyy-MM-dd"/></td>
	                                <td><a class="alink black hover" href="#">${topic.titleContent}<span><i class="icon"></i> 166</span></a></td>
	                            </tr>
                        	</c:forEach>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </div>



    <script>
        function showDialog() {
            jc.dialog.get("../dialog/回复评论弹窗.html", function (obj) {
                obj.show();

            }, "token_21")

        }

    </script>

</body>
       
    <%@ include file="common/help.jsp" %>
	<%@ include file="common/foot.jsp" %>
             
</html>