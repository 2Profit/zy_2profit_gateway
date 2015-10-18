<%@ page pageEncoding="UTF-8"%>

<%@include file="jstl.jsp" %>

<c:set var="loginUser" value="${sessionScope.login_user}"/>
<c:set var="loginUserFullName" value="${sessionScope.login_user_full_name}"/>

<jsp:useBean id="now" class="java.util.Date"/>

<link rel="shortcut icon" href="${ctx }/static/favicon/favicon.ico" />

<!-- 设计：黄健聪 | 重构：黄健聪 | 创建：2015/05/09 | 更新：2015/05/10 | -->

<title>至盈网</title>

<link href="${ctx }/static/css/desktop.css" rel="stylesheet" />
<link href="${ctx }/static/css/jquery-ui.min.css" rel="stylesheet" />
<link href="${ctx }/static/css/jquery-ui-silder.css" rel="stylesheet" />

<script src="${ctx }/static/js/jquery-1.8.3.min.js" type="text/javascript"></script>
<script src="${ctx }/static/js/jquery-ui.min.js" type="text/javascript"></script>
<script src="${ctx }/static/js/jquery-ui-slider.js" type="text/javascript"></script>
<script src="${ctx }/static/js/common.js" type="text/javascript"></script>
<script src="${ctx }/static/js/uiExtend.js" type="text/javascript"></script>
<script src="${ctx }/static/plugins/jquery/jquery.form.js"></script>
<script src="${ctx }/static/plugins/jquery/jquery.formatDateTime.js"></script>
<script src="${ctx }/static/plugins/base.js"></script>
<script type="text/javascript" src="${ctx }/static/plugins/My97DatePicker/WdatePicker.js"></script>
<script type="text/javascript" src="${ctx }/static/plugins/layer/layer.js"></script>

<script type="text/javascript">
var ctx = '${ctx}';
</script>

<!--[if IE 6 ]><script type="text/javascript">window.location.href="${ctx }/static/IE6/index.htm"</script><![endif]-->
<!--[if lt IE 9 ]><script type="text/javascript" src="${ctx }/static/js/json2.min.js"></script><![endif]-->

