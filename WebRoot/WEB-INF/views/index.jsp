<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<%@include file="common/common.jsp"%>

</head>

<script type="text/javascript">

$(function(){
	$('div[data-ui="header"]').addClass('index');
});

</script>

<body>
    <jsp:include page="common/head.jsp"/>

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
	                    <label>
	                        <input placeholder="手机号码/邮箱" type="text" name="username"/>
	                    </label>
	                </div>
	                <div class="ml10 t_text w180">
	                    <label>
	                        <input placeholder="密码" type="password" name="pwd"/>
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

    <div data-ui="banner" class="J_banner">
        <div class="b_background"></div>
    </div>

    <div class="J_content mt-260 bgfff hasShadow">
        <div class="fl c_760">
            <div class="pau">
                <div class="J_title">
                    <div class="t_txt">经纪商</div>
                    <div class="t_tips">从事经纪商活动的人不能直接进入交易所经营，他们的主要作用是接受投资者的委托</div>
                    <div class="t_more"><a href="${ctx }/bk/list">更多&nbsp;&gt;</a></div>
                </div>

                <div class="J_jjsList">
                    <div class="j_inner">
                        <div class="i_main">
                       	 	<c:forEach items="${brokers }" var="broker">
	                            <div class="m_item">
	                                <div class="i_pic">
	                                    <img width="54" height="54" src="/${broker.imageUrl }" />
	                                </div>
	                                <div class="i_info">
	                                    <div class="i_name">${broker.cnName } ${broker.enName }</div>
	                                    <div class="i_abstract">
	                                        <div class="a_left">
	                                            <div class="l_txt">评定1</div>
	                                            <div class="l_prog">
	                                                <div style="width: 88%;" class="p_bar"></div>
	                                            </div>
	                                            <div class="ml10 l_txt">评定2</div>
	                                            <div class="l_prog">
	                                                <div style="width: 88%;" class="p_bar"></div>
	                                            </div>
	                                        </div>
	                                        <div class="a_right">5分钟前</div>
	                                    </div>
	                                </div>
	                            </div>                       	 	
                       	 	</c:forEach>
                        </div>
                    </div>
                </div>
                
            </div>
        </div>
        
        
        <div class="fr c_430">
            <div class="pau">
                <div class="J_title">
                    <div class="t_txt">晒单</div>
                    <div class="t_tips">实时更新最新动态</div>
                    <div class="t_more"><a href="#">更多&nbsp;&gt;</a></div>
                </div>

                <div class="J_sdList">
                    <div class="s_inner">
                        <div class="i_main">

                            
                            <div class="m_item">
                                <div class="i_pic">
                                    <img width="54" height="54" src="${ctx }/static/tmp/u1.png" />
                                </div>
                                <div class="i_info">
                                    <div class="i_name">Barack Hussein Obama</div>
                                    <div class="i_abstract">
                                        <div class="a_left">
                                            <div class="l_txt">评定1</div>
                                            <div class="l_prog">
                                                <div style="width: 88%;" class="p_bar"></div>
                                            </div>
                                            <div class="ml10 l_txt">评定2</div>
                                            <div class="l_prog">
                                                <div style="width: 88%;" class="p_bar"></div>
                                            </div>
                                        </div>
                                        <div class="a_right">36人跟随</div>
                                    </div>
                                </div>
                            </div>
                            <div class="m_item">
                                <div class="i_pic">
                                    <img width="54" height="54" src="${ctx }/static/tmp/u1.png" />
                                </div>
                                <div class="i_info">
                                    <div class="i_name">Barack Hussein Obama</div>
                                    <div class="i_abstract">
                                        <div class="a_left">
                                            <div class="l_txt">评定1</div>
                                            <div class="l_prog">
                                                <div style="width: 88%;" class="p_bar"></div>
                                            </div>
                                            <div class="ml10 l_txt">评定2</div>
                                            <div class="l_prog">
                                                <div style="width: 88%;" class="p_bar"></div>
                                            </div>
                                        </div>
                                        <div class="a_right">36人跟随</div>
                                    </div>
                                </div>
                            </div>
                            <div class="m_item">
                                <div class="i_pic">
                                    <img width="54" height="54" src="${ctx }/static/tmp/u1.png" />
                                </div>
                                <div class="i_info">
                                    <div class="i_name">Barack Hussein Obama</div>
                                    <div class="i_abstract">
                                        <div class="a_left">
                                            <div class="l_txt">评定1</div>
                                            <div class="l_prog">
                                                <div style="width: 88%;" class="p_bar"></div>
                                            </div>
                                            <div class="ml10 l_txt">评定2</div>
                                            <div class="l_prog">
                                                <div style="width: 88%;" class="p_bar"></div>
                                            </div>
                                        </div>
                                        <div class="a_right">36人跟随</div>
                                    </div>
                                </div>
                            </div>
                            <div class="m_item">
                                <div class="i_pic">
                                    <img width="54" height="54" src="${ctx }/static/tmp/u1.png" />
                                </div>
                                <div class="i_info">
                                    <div class="i_name">Barack Hussein Obama</div>
                                    <div class="i_abstract">
                                        <div class="a_left">
                                            <div class="l_txt">评定1</div>
                                            <div class="l_prog">
                                                <div style="width: 88%;" class="p_bar"></div>
                                            </div>
                                            <div class="ml10 l_txt">评定2</div>
                                            <div class="l_prog">
                                                <div style="width: 88%;" class="p_bar"></div>
                                            </div>
                                        </div>
                                        <div class="a_right">36人跟随</div>
                                    </div>
                                </div>
                            </div>
                            <div class="m_item">
                                <div class="i_pic">
                                    <img width="54" height="54" src="${ctx }/static/tmp/u1.png" />
                                </div>
                                <div class="i_info">
                                    <div class="i_name">Barack Hussein Obama</div>
                                    <div class="i_abstract">
                                        <div class="a_left">
                                            <div class="l_txt">评定1</div>
                                            <div class="l_prog">
                                                <div style="width: 88%;" class="p_bar"></div>
                                            </div>
                                            <div class="ml10 l_txt">评定2</div>
                                            <div class="l_prog">
                                                <div style="width: 88%;" class="p_bar"></div>
                                            </div>
                                        </div>
                                        <div class="a_right">36人跟随</div>
                                    </div>
                                </div>
                            </div>
                            <div class="m_item">
                                <div class="i_pic">
                                    <img width="54" height="54" src="${ctx }/static/tmp/u1.png" />
                                </div>
                                <div class="i_info">
                                    <div class="i_name">Barack Hussein Obama</div>
                                    <div class="i_abstract">
                                        <div class="a_left">
                                            <div class="l_txt">评定1</div>
                                            <div class="l_prog">
                                                <div style="width: 88%;" class="p_bar"></div>
                                            </div>
                                            <div class="ml10 l_txt">评定2</div>
                                            <div class="l_prog">
                                                <div style="width: 88%;" class="p_bar"></div>
                                            </div>
                                        </div>
                                        <div class="a_right">36人跟随</div>
                                    </div>
                                </div>
                            </div>

                        </div>
                    </div>

                </div>
            </div>

        </div>
    </div>



    <div class="J_content mt20 bgfff hasShadow">
        <div class="fl c_760">
            <div class="pau">
                <div class="J_title">
                    <div class="t_txt">话题社区</div>
                    <div class="t_tips"></div>
                    <div class="t_more"><a href="${ctx }/vote/index">更多投票&nbsp;&gt;</a></div>
                </div>

                <div class="J_news mt20">
                    <div class="n_left">
                        <a href="${ctx }/vote/link?id=${currentTopic.id}">
                            <img src="/${currentTopic.imageUrl }" />
                        </a>
                    </div>
                    <div class="n_right">
                        <div class="r_title">
                            <a href="${ctx }/vote/link?id=${currentTopic.id}">${currentTopic.titleContent }</a>
                        </div>
                        <div class="r_info">
                            <div class="i_txt">${currentTopic.titleContent }</div>
                            <div class="i_time"><span>时间:</span><fmt:formatDate value="${currentTopic.startDate }" type="both" pattern="yyyy-MM-dd"/></div>
                        </div>

                    </div>
                </div>

                <div class="J_picHolder middle">
                    <div class="p_main clearfix">
                        <c:forEach items="${topics }" var="topic">
	                        <div class="m_item">
	                            <div class="i_pic">
	                                <a href="${ctx }/vote/link?id=${topic.id}">
	                                    <img src="/${topic.imageUrl }" />
	                                </a>
	                                <div class="p_title">
	                                    <div class="t_txt">
	                                        <a href="${ctx }/vote/link?id=${topic.id}">${topic.titleContent }</a>
	                                    </div>
	                                </div>
	                            </div>
	                            <div class="i_info">
	                                <div class="i_txt"><a href="${ctx }/vote/link?id=${topic.id}">${topic.titleContent }</a></div>
	                                <div class="i_time"><span>时间:</span><fmt:formatDate value="${topic.startDate }" type="both" pattern="yyyy-MM-dd"/></div>
	                            </div>
	                        </div>	                        
	                   	</c:forEach>
                    </div>
                </div>
            </div>


        </div>
        <div class="fr c_430">
            <div class="pau">
                <div class="J_title">
                    <div class="t_txt">财经资讯</div>
                    <div class="t_tips"></div>
                    <div class="t_more"><a href="#">更多资讯&nbsp;&gt;</a></div>
                </div>
                <div class="J_cjzxList">
                    <div class="c_inner">
                        <div class="i_main">
                            <div class="m_item">
                                <div class="i_pic">
                                    <a href="#">
                                        <img src="${ctx }/static/tmp/k1.jpg" />
                                    </a>
                                </div>
                                <div class="i_info">
                                    <div class="i_name"><a href="#">Barack Hussein Obama</a></div>
                                    <div class="i_txt">这里是内容这里是内容这里是内容这里是内容这里是内容这里是内容这里是内容这里是内容这里是内容这里是内容这里是内容</div>
                                </div>
                            </div>
                            <div class="m_item">
                                <div class="i_pic">
                                    <a href="#">
                                        <img src="${ctx }/static/tmp/k2.jpg" />
                                    </a>
                                </div>
                                <div class="i_info">
                                    <div class="i_name"><a href="#">Barack Hussein Obama</a></div>
                                    <div class="i_txt">这里是内容这里是内容这里是内容这里是内容这里是内容这里是内容这里是内容这里是内容这里是内容这里是内容这里是内容</div>
                                </div>
                            </div>
                            <div class="m_item">
                                <div class="i_pic">
                                    <a href="#">
                                        <img src="${ctx }/static/tmp/k3.jpg" />
                                    </a>
                                </div>
                                <div class="i_info">
                                    <div class="i_name"><a href="#">Barack Hussein Obama</a></div>
                                    <div class="i_txt">这里是内容这里是内容这里是内容这里是内容这里是内容这里是内容这里是内容这里是内容这里是内容这里是内容这里是内容</div>
                                </div>
                            </div>
                            <div class="m_item">
                                <div class="i_pic">
                                    <a href="#">
                                        <img src="${ctx }/static/tmp/k4.jpg" />
                                    </a>
                                </div>
                                <div class="i_info">
                                    <div class="i_name"><a href="#">Barack Hussein Obama</a></div>
                                    <div class="i_txt">这里是内容这里是内容这里是内容这里是内容这里是内容这里是内容这里是内容这里是内容这里是内容这里是内容这里是内容</div>
                                </div>
                            </div>
                        </div>
                    </div>

                </div>
            </div>



        </div>
    </div>


    <div class="J_cooperation mt20">
        <div class="c_title"><span>合作伙伴</span></div>
        <div class="c_inner">
            <img src="${ctx }/static/tmp/cooperation.png" />
        </div>
    </div>

	<jsp:include page="common/help.jsp"/>

	<jsp:include page="common/foot.jsp"/>

</body>
</html>

