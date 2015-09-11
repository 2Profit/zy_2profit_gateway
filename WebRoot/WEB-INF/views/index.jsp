<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<%@include file="common/common.jsp"%>


</head>

<body>
    <div data-ui="header" class="J_header index">
        <div class="h_inner">
            <div class="i_logo"><a href="javascript:void(0);">Logo</a></div>
            <div class="i_login">
                <!-- 没登录显示这个 -->
                <div class="l_not">
                    <div class="n_item">
                        <div class="i_default">
                            <a href="#">登录</a>
                        </div>
                    </div>
                    <div class="n_item">
                        <div class="i_default">
                            <a href="#">注册</a>
                        </div>
                    </div>
                </div>
                <!-- 登录了显示这个 -->
                
                <div class="l_login">
                    <div class="l_face">
                        <img width="60" height="60" src="../tmp/u1.png" />
                        <a href="#"><img src="../images/header_face.png" /></a>
                    </div>
                    <div class="l_info">
                        <div class="i_name">比尔盖茨</div>
                        <div class="i_logout"><a href="#">[退出]</a></div>
                    </div>
                </div>
                
            </div>
            <div class="i_nav">
                <div class="n_item">
                    <div class="i_default"><a href="#">首页</a></div>
                    <div class="i_menu"></div>
                </div>
                <div class="n_item">
                    <div class="i_default"><a href="#">金价行情</a></div>
                    <div class="i_menu"></div>
                </div>
                <div class="n_item">
                    <div class="i_default"><a href="#">财经日历</a></div>
                    <div class="i_menu"></div>
                </div>
                <div class="n_item">
                    <div class="i_default"><a href="#">为你选经销商</a></div>
                    <div class="i_menu"></div>
                </div>
                <div class="n_item">
                    <div class="i_default"><a href="#">社区</a></div>
                    <div class="i_menu"></div>
                </div>
                <div class="n_item">
                    <div class="i_default"><a href="#">活动</a></div>
                    <div class="i_menu"></div>
                </div>
            </div>
        </div>


    </div>

    <div data-ui="loginWrap" class="J_loginWrap">
        <div class="l_left">
            <div class="J_toolsBar">
                <div class="t_label">跟随顶尖交易员投资</div>
                <div class="ml10 t_button">
                    <a class="abtn green" href="#">立即注册</a>
                </div>
            </div>




        </div>
        <div class="l_right">
            <div class="J_toolsBar">
                <div class="t_text w180">
                    <label>
                        <input placeholder="手机号码/邮箱" type="text" />
                    </label>
                </div>
                <div class="ml10 t_text w180">
                    <label>
                        <input placeholder="密码" type="password" />
                    </label>
                </div>
                <div class="ml10 t_button">
                    <a class="abtn red" href="#">登录</a>
                </div>

                <div class="ml20 t_label">社交帐号登录</div>

                <div class="ml10 t_icon">
                    <a class="i_link i_sina" href="#"></a>
                    <a class="i_link i_qq" href="#"></a>
                    <a class="i_link i_wx" href="#"></a>
                </div>

            </div>




        </div>
    </div>

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
                    <div class="t_more"><a href="#">更多&nbsp;&gt;</a></div>
                </div>

                <div class="J_jjsList">
                    <div class="j_inner">
                        <div class="i_main">
                            <div class="m_item">
                                <div class="i_pic">
                                    <img width="54" height="54" src="../tmp/u1.png" />
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
                                        <div class="a_right">5分钟前</div>
                                    </div>
                                </div>
                            </div>
                            <div class="m_item">
                                <div class="i_pic">
                                    <img width="54" height="54" src="../tmp/u1.png" />
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
                                        <div class="a_right">5分钟前</div>
                                    </div>
                                </div>
                            </div>
                            <div class="m_item">
                                <div class="i_pic">
                                    <img width="54" height="54" src="../tmp/u1.png" />
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
                                        <div class="a_right">5分钟前</div>
                                    </div>
                                </div>
                            </div>
                            <div class="m_item">
                                <div class="i_pic">
                                    <img width="54" height="54" src="../tmp/u1.png" />
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
                                        <div class="a_right">5分钟前</div>
                                    </div>
                                </div>
                            </div>
                            <div class="m_item">
                                <div class="i_pic">
                                    <img width="54" height="54" src="../tmp/u1.png" />
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
                                        <div class="a_right">5分钟前</div>
                                    </div>
                                </div>
                            </div>
                            <div class="m_item">
                                <div class="i_pic">
                                    <img width="54" height="54" src="../tmp/u1.png" />
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
                                        <div class="a_right">5分钟前</div>
                                    </div>
                                </div>
                            </div>

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
                                    <img width="54" height="54" src="../tmp/u1.png" />
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
                                    <img width="54" height="54" src="../tmp/u1.png" />
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
                                    <img width="54" height="54" src="../tmp/u1.png" />
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
                                    <img width="54" height="54" src="../tmp/u1.png" />
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
                                    <img width="54" height="54" src="../tmp/u1.png" />
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
                                    <img width="54" height="54" src="../tmp/u1.png" />
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
                    <div class="t_more"><a href="#">更多资讯&nbsp;&gt;</a></div>
                </div>

                <div class="J_news mt20">
                    <div class="n_left">
                        <a href="#">
                            <img src="../tmp/k4.jpg" />
                        </a>
                    </div>
                    <div class="n_right">
                        <div class="r_title">
                            <a href="#">这是一个图片所写的东西</a>
                        </div>
                        <div class="r_info">
                            <div class="i_txt">这里是内容内容内容内容容内容内容这容内容内容内容这里是内容内容内容内容里是内容内容内容内容这里是内容内容内容内容</div>
                            <div class="i_time"><span>时间:</span>2015-08-09</div>
                        </div>

                    </div>
                </div>


                <div class="J_picHolder middle">
                    <div class="p_main clearfix">
                        <div class="m_item">
                            <div class="i_pic">
                                <a href="#">
                                    <img src="../tmp/k1.jpg" />
                                </a>
                                <div class="p_title">
                                    <div class="t_txt">
                                        <a href="#">这是一个图片所写的东西</a>
                                    </div>
                                </div>
                            </div>
                            <div class="i_info">
                                <div class="i_txt"><a href="#">这里是内容内容内容内容</a></div>
                                <div class="i_time"><span>时间:</span>2015-08-09</div>
                            </div>
                        </div>
                        <div class="m_item">
                            <div class="i_pic">
                                <a href="#">
                                    <img src="../tmp/k2.jpg" />
                                </a>
                                <div class="p_title">
                                    <div class="t_txt">
                                        <a href="#">这是一个图片所写的东西</a>
                                    </div>
                                </div>
                            </div>
                            <div class="i_info">
                                <div class="i_txt"><a href="#">这里是内容内容内容内容</a></div>
                                <div class="i_time"><span>时间:</span>2015-08-09</div>
                            </div>
                        </div>
                        <div class="m_item">
                            <div class="i_pic">
                                <a href="#">
                                    <img src="../tmp/k3.jpg" />
                                </a>
                                <div class="p_title">
                                    <div class="t_txt">
                                        <a href="#">这是一个图片所写的东西</a>
                                    </div>
                                </div>
                            </div>
                            <div class="i_info">
                                <div class="i_txt"><a href="#">这里是内容内容内容内容</a></div>
                                <div class="i_time"><span>时间:</span>2015-08-09</div>
                            </div>
                        </div>
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
                                        <img src="../tmp/k1.jpg" />
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
                                        <img src="../tmp/k2.jpg" />
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
                                        <img src="../tmp/k3.jpg" />
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
                                        <img src="../tmp/k4.jpg" />
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
            <img src="../tmp/cooperation.png" />
        </div>
    </div>

    <div data-ui="helper" class="J_helper">
        <div class="h_inner">
            <div class="i_item">
                <dl>
                    <dt>快速服务</dt>
                    <dd><a href="javascript:;">注册</a></dd>
                    <dd><a href="javascript:;">登录</a></dd>
                    <dd><a href="javascript:;">激活卡</a></dd>
                    <dd><a href="javascript:;">找回密码</a></dd>
                    <dd><a href="javascript:;">充值</a></dd>
                </dl>
            </div>
            <div class="i_item">
                <dl>
                    <dt>帮助中心</dt>
                    <dd><a href="javascript:;">免费体验</a></dd>
                    <dd><a href="javascript:;">报名课程</a></dd>
                    <dd><a href="javascript:;">充值</a></dd>
                    <dd><a href="javascript:;">支付方式</a></dd>
                    <dd><a href="javascript:;">使用指南</a></dd>
                </dl>
            </div>
            <div class="i_item">
                <dl>
                    <dt>关于我们</dt>
                    <dd><a href="javascript:;">了解我们</a></dd>
                    <dd><a href="javascript:;">联系方式</a></dd>
                    <dd><a href="javascript:;">会员协议</a></dd>
                    <dd><a href="javascript:;">加入我们</a></dd>
                    <dd><a href="javascript:;">意见反馈</a></dd>
                </dl>
            </div>
            <div class="i_item">
                <dl>
                    <dt>联系我们</dt>
                    <dd><a href="javascript:;">QQ空间</a></dd>
                    <dd><a href="javascript:;">新浪微博</a></dd>
                    <dd><a href="javascript:;">QQ群：8381212348</a></dd>
                    <dd><a href="javascript:;">QQ群：2991239393</a></dd>
                </dl>
            </div>
            <div class="i_item">
                <div class="t_code">
                    <img src="../images/gw_code.jpg" />
                    <p>（扫二维码关注我们）</p>
                </div>
            </div>
        </div>

    </div>

    <div data-ui="footer" class="J_footer">
        <div class="f_inner">
            <div class="i_copyright">
                <div class="c_left">
                </div>
                <div class="c_right">
                    <p>版权所有 广州e桶金有限公司 Copyright©2015 <a href="http://www.miitbeian.gov.cn/">粤ICP备150591231号-12</a></p>
                </div>
            </div>
            <div class="i_share"></div>
        </div>
    </div>

</body>
</html>

