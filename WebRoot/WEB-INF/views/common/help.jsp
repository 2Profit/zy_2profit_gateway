<%@ page language="java" pageEncoding="UTF-8"%>
<%@ include file="jstl.jsp" %>

<c:set var="ctx" value="${pageContext.request.contextPath}"/>

<div data-ui="helper" class="J_helper">
    <div class="h_inner">
            <div class="i_item">
                <dl>
                    <dt>至盈服务</dt>
                    <dd><a href="${ctx }/bk/list">经纪商搜索引擎</a></dd>
                    <dd><a href="${ctx }/register">注册</a></dd>
                    <dd><a href="${ctx }/login">登录</a></dd>
                    <dd><a href="${ctx }/findpwd/select">忘记密码</a></dd>
                </dl>
            </div>
            <div class="i_item">
                <dl>
                    <dt>资讯中心</dt>
                    <dd><a href="javascript:;">市场行情</a></dd>
                    <dd><a href="javascript:;">财经新闻</a></dd>
                    <dd><a href="javascript:;">财经日历</a></dd>
                </dl>
            </div>
            <div class="i_item">
                <dl>
                    <dt>了解更多</dt>
                    <dd><a href="${ctx }/help/moreInfo?id=4">常见问题</a></dd>
                    <dd><a href="${ctx }/help/moreInfo?id=3">社区守则</a></dd>
                    <dd><a href="${ctx }/help/moreInfo?id=2">免责条款</a></dd>
                    <dd><a href="${ctx }/help/moreInfo?id=1">隐私政策</a></dd>
                </dl>
            </div>
            <div class="i_item">
                <dl>
                    <dt>关于我们</dt>
                    <dd><a href="${ctx }/help/aboutUs?id=5">至盈简介</a></dd>
                    <dd><a href="${ctx }/help/joinUs?id=6">加入我们</a></dd>
                    <dd><a href="${ctx }/help/joinUs?id=7">联系我们</a></dd>
                </dl>
            </div>
            <div class="i_item">
                <div class="t_code">
                    <img src="${ctx }/static/images/gw_code.jpg">
                    <p>（扫二维码关注我们）</p>
                </div>
            </div>
      </div>
      
</div>