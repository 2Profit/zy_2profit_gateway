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
                                <h3 class="cOrange">你想和我们至盈团队一起工作吗?</h3>
                                <p class="lh30">驰骋于梦想之都，书写理想仕途。</p>
                                <p class="lh30">在这个我们为你提供的舞台，每个人都是主角，在这里，你可获得：</p>

                                <p class="lh30">1.优秀的发展平台与广阔的晋升通道，实现自我价值。</p>
                                <p class="lh30">2.一群充满激情与梦想的朋友。</p>
                                <p class="lh30">3.专业的技能培训并参与创作决策，真正发挥创意、学以致用，为日后平铺青云路</p>
                                <p class="lh30">4.与行业顶尖人才共事的机会，</p>
                                <p>5.轻松和谐的工作气氛、人性化的管理制度，让你至获宾至如归的幸福感（我们提供家庭式的生活设施、节日礼品、每月定期集体活动、每月员工生日PARTY等）</p>


                                <h3 class="cOrange">现在的职位空缺包括:</h3>

                                <div class="J_toolsBar">
                                    <div class="t_button ml10">
                                        <a class="abtn orange" href="#">软件研发工程师</a>
                                    </div>
                                    <div class="t_button ml10">
                                        <a class="abtn orange" href="#">市场调研及推广专员</a>
                                    </div>
                                    <div class="t_button ml10">
                                        <a class="abtn orange" href="#">网络编辑</a>
                                    </div>
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
