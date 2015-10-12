<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />

	<%@ include file="../common/common.jsp"%>

</head>

<body>
    
    <%@ include file="../common/head.jsp" %>

	<!-- 主体内容 -->
    <div class="J_content bgfff mt20 hasShadow">
        <div class="J_title">
            <div class="t_txt has">通过手机号找回密码</div>
        </div>
        <div class="pt40">
            <div class="J_retrieve">
                <div class="r_inner">
                    <div class="i_header">
                        <div class="h_item active clearfix">
                            <div class="i_icon i1"></div>
                            <div class="i_txt">身份验证</div>
                        </div>
                        <div class="h_item clearfix">
                            <div class="i_icon i2"></div>
                            <div class="i_txt">重置密码</div>
                        </div>
                        <div class="h_item clearfix">
                            <div class="i_icon i3"></div>
                            <div class="i_txt">完成</div>
                        </div>

                    </div>


                </div>


            </div>
        </div>
        <div class="mt40">
            <div class="J_register pb40">
                <form action="http://www.qq.com">
                    <table class="r_table">
                        <tbody>
                            <tr class="tar">
                                <td>
                                    <div class="J_toolsBar">
                                        <div class="t_label">您的手机号：</div>
                                    </div>
                                </td>
                                <td class="t_phone" style="width: 370px;">
                                    <div class="J_toolsBar">
                                        <div class="t_text not">
                                            <label>
                                                <input disabled="disabled" name="phoneNumber" value="15******663" type="text"></label>
                                        </div>
                                        <div class="t_button"><a id="sendCode" class="abtn green" href="javascript:;">获取短信验证码</a></div>
                                    </div>
                                </td>
                                <td class="t_tips">
                                    <div class="t_error"><i class="icon">󰂳</i>会员名不能为空</div>
                                    <div class="t_success">
                                        <i class="icon">󰂲</i>
                                    </div>
                                </td>
                            </tr>
                            <tr class="tar">
                                <td>
                                    <div class="J_toolsBar">
                                        <div class="t_label"><b class="cDeepRed">*</b> 验证码：</div>
                                    </div>
                                </td>
                                <td>
                                    <div class="J_toolsBar">
                                        <div class="t_text">
                                            <label>
                                                <input type="text"></label>
                                        </div>
                                    </div>
                                </td>
                                <td class="t_tips">
                                    <div class="t_error"><i class="icon">󰂳</i>请输入验证码</div>
                                    <div class="t_success">
                                        <i class="icon">󰂲</i>
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <td></td>
                                <td>
                                    <div class="J_btnGroup mt40">
                                        <a class="abtn green" href="javascript:;">下一步</a>
                                    </div>
                                </td>
                                <td></td>
                            </tr>
                        </tbody>

                    </table>
                </form>
            </div>


        </div>
    </div>
    
    
	<%@ include file="../common/foot.jsp" %>

</body>
</html>
