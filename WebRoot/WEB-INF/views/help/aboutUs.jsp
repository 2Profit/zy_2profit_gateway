<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<!DOCTYPE>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<%@ include file="../common/common.jsp"%>

    <script type="text/javascript">

        /*第一种形式 第二种形式 更换显示样式*/
        function setTab(name, cursel, n) {
            for (var i = 1; i <= n; i++) {
                var menu = document.getElementById(name + i);
                var con = document.getElementById("con_" + name + "_" + i);
                menu.className = i == cursel ? "t_item active" : "t_item";
                con.style.display = i == cursel ? "block" : "none";
            }
        }
    </script>
</head>
<body>

	<%@ include file="../common/head.jsp" %>

    <div data-ui="indexMask" class="J_indexMask mini"></div>

    <div>
        <div class="J_content bgfff">

            <div class="J_aboutMe">
                <div class="a_tab">

                    <div class="t_main">
                        <div id="con_one_1" style="display: block;" class="m_item">

                            <div class="a_textArea">
                                <p>&nbsp;</p>
                                <h3 class="cOrange">我们的使命?</h3>
                                <p class="lh30">至盈网致力于为用户提供全面的贵金属产品对比服务，并能最大程度协助用戶省时、省钱并省心地找到最心仪的产品，力求为用戶带来更多盈利的机会。</p>
                                
                                <h3 class="cOrange">我们做什么?</h3>

                                <p class="lh30">我们让用户可以十分便捷地获得最新的投资产品信息，帮助你暸解不同经纪商之间的差异。用户除了通过自定义的详细对比表格来了解您感兴趣的产品及服务外，还可以阅读我们丰富的投资信息、交易信号、多元化的专题文章。至盈网致力为您提供最公正最全面的信息，让您可以选择真正符合您个人需求的产品及服务</p>
                                
                                <h3 class="cOrange">我们如何帮你?</h3>

                                <p class="lh30">随着市场的不断变化，投资者需要寻找一个能提供透明、准确、便捷的金融资讯平台。至盈网能向您提供一系列关于金汇市场的详细信息，让您隨時可以通過我們這個一站式的平台，掌握最新金汇产品资讯、經紀商的對比、完善的投資者教育、互動交流的社区以及高质素的交易信號，一同走向「至盈」之路。</p>

                                <h3 class="cOrange">免費提供多元化资讯</h3>


                                <p class="lh30">立即關注我們的微信號，以獲得更多投資資訊</p>


                                <div>
                                    <img src="${ctx }/static/images/gw_code.jpg" />

                                </div>

                                <div class="mt40">
                                    <img style="width:100%;" src="${ctx }/static/images/follow_me.jpg" />
                                </div>

                            </div>
                        </div>
                    </div>


                </div>

            </div>

        </div>
    </div>

	<div class="J_follow mt20">
		<div class="f_txt">
			<div class="t_center">
				为何选择<span>至盈网</span>？
			</div>
		</div>
		<div class="f_pic">
			<img src="${ctx }/static/images/follow.png">
		</div>

	</div>

	<%@ include file="../common/help.jsp" %>
	<%@ include file="../common/foot.jsp" %>

</body>
</html>
