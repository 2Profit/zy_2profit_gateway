<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />

	<%@ include file="../common/common.jsp"%>

</head>

<%@ include file="../common/nice-validator.jsp" %>

<body>
    
    <%@ include file="../common/head.jsp" %>

	<div class="J_wrap">

        <%@ include file="../common/time.jsp" %>

        <div class="J_content mt20 bgfff bg1 hasShadow">
            
            <%@ include file="../common/menu.jsp" %>
            
            <div class="fr c_1000">

                <div class="J_title less">
                    <div class="t_txt">个人资料</div>
                    <div class="t_tips"></div>
                    <div class="t_more"></div>
                </div>
                <div class="plrb20">
                    <div class="J_miniTitle">
                        <div class="m_token"></div>
                        <div class="m_txt">修改资料</div>
                    </div>

                    <div class="J_userInfoList">

                        <table style="width: 100%">
                            <tbody>
                                <tr>
                                    <td style="width: 60px;" class="bgf9">
                                        <div class="J_toolsBar">
                                            <div class="t_label right">姓名(中)</div>
                                        </div>
                                    </td>
                                    <td colspan="2">
                                        <div class="J_toolsBar">
                                            <div class="ml10 t_text w100">
                                                <label>
                                                    <input value="justin bieber" type="text">
                                                </label>
                                            </div>
                                        </div>
                                    </td>
                                    <td class="bgf9">
                                        <div class="J_toolsBar">
                                            <div class="t_label right">姓名(英)</div>
                                        </div>
                                    </td>
                                    <td colspan="2">
                                        <div class="J_toolsBar">
                                            <div class="ml10 t_text w300">
                                                <label>
                                                    <input value="justin bieber" type="text">
                                                </label>
                                            </div>
                                        </div>
                                    </td>
                                    <td class="bgf9">
                                        <div class="J_toolsBar">
                                            <div class="t_label right">性别</div>
                                        </div>
                                    </td>
                                    <td>
                                        <div class="J_toolsBar">
                                            <div class="ml10 t_check">
                                                <label>
                                                    <input type="radio" />男</label>
                                            </div>
                                            <div class="ml10 t_check">
                                                <label>
                                                    <input type="radio" />女</label>
                                            </div>
                                        </div>
                                    </td>
                                    <td class="bgf9">
                                        <div class="J_toolsBar">
                                            <div class="t_label right">国籍</div>
                                        </div>
                                    </td>
                                    <td>
                                        <div class="J_toolsBar">
                                            <div class="ml10 t_select">
                                                <a href="javascript:;">香港</a>
                                                <select>
                                                    <option>香港</option>
                                                    <option>澳门</option>
                                                </select>
                                            </div>
                                        </div>
                                    </td>
                                </tr>

                                <tr>
                                    <td class="bgf9">
                                        <div class="J_toolsBar">
                                            <div class="t_label right">证件类型</div>
                                        </div>
                                    </td>
                                    <td colspan="2">
                                        <div class="J_toolsBar">
                                            <div class="ml10 t_select">
                                                <a href="javascript:;">身份证件号码</a>
                                                <select>
                                                    <option>身份证件号码</option>
                                                    <option>类型</option>
                                                </select>
                                            </div>
                                        </div>
                                    </td>
                                    <td class="bgf9">
                                        <div class="J_toolsBar">
                                            <div class="t_label right">证件号码</div>
                                        </div>
                                    </td>
                                    <td colspan="2">
                                        <div class="J_toolsBar">
                                            <div class="ml10 t_text w300">
                                                <label>
                                                    <input value="44010513121331213516213121" type="text">
                                                </label>
                                            </div>
                                        </div>
                                    </td>
                                    <td class="bgf9">
                                        <div class="J_toolsBar">
                                            <div class="t_label right">手机号码</div>
                                        </div>
                                    </td>
                                    <td colspan="3">
                                        <div class="J_toolsBar">
                                            <div class="ml10 t_text w180">
                                                <label>
                                                    <input value="13123156465" type="text">
                                                </label>
                                            </div>
                                        </div>
                                    </td>



                                </tr>

                                <tr>
                                    <td class="bgf9">
                                        <div class="J_toolsBar">
                                            <div class="t_label right">电子邮箱</div>
                                        </div>
                                    </td>
                                    <td colspan="9">
                                        <div class="J_toolsBar">
                                            <div class="ml10 t_text w300">
                                                <label>
                                                    <input value="13123156465@qq.com" type="text">
                                                </label>
                                            </div>
                                            <div class="t_label">（電子郵件可作為您以後的用戶名，用來管理您的帳戶、入金、更改資料以及接收資訊等，請確保資料的準確性並牢記您的電郵設置）</div>
                                        </div>
                                    </td>

                                </tr>

                                <tr>
                                    <td class="bgf9">
                                        <div class="J_toolsBar">
                                            <div class="t_label right">联系地址</div>
                                        </div>
                                    </td>
                                    <td colspan="9">
                                        <div class="J_toolsBar">
                                            <div class="ml10 t_text w830">
                                                <label>
                                                    <input value="上海市漕河泾开发区地铁站附近 上海腾讯大厦" type="text">
                                                </label>
                                            </div>
                                        </div>
                                    </td>
                                </tr>

                            </tbody>

                        </table>


                    </div>

                    <div class="mt20 J_btnGroup md">
                        <a class="sm abtn orange" href="#">确认修改</a>
                    </div>



                    <div class="J_miniTitle mt20">
                        <div class="m_token"></div>
                        <div class="m_txt">身份证</div>
                    </div>

                    <div class="J_picBox clearfix">
                        <div class="p_item">
                            <div class="i_inner">
                                <div class="i_mask">
                                    <div class="ml10 fl">身份证正面</div>
                                    <div class="fr"><a class="abtn orange" href="#">立即上传</a></div>
                                </div>
                                <div class="i_pic">
                                    <img src="${ctx }/static/images/J_null.png" />
                                </div>
                                <div class="i_status cDeepRed"><i class="icon">󰂸</i> 未上傳</div>
                            </div>
                        </div>
                        <div class="p_item">
                            <div class="i_inner">
                                <div class="i_mask">
                                    <div class="ml10 fl">身份证背面</div>
                                    <div class="fr"><a class="abtn orange" href="#">立即上传</a></div>
                                </div>
                                <div class="i_pic">
                                    <img src="${ctx }/static/tmp/sfz.jpg" />
                                </div>
                                <div class="i_status cOrange"><i class="icon">󰃄</i> 上傳未審核</div>
                            </div>
                        </div>
                    </div>


                    <div class="J_miniTitle mt20">
                        <div class="m_token"></div>
                        <div class="m_txt">地址證明</div>
                    </div>

                    <div class="J_picBox clearfix">
                        <div class="p_item">
                            <div class="i_inner">
                                <div class="i_mask">
                                    <div class="ml10 fl">地址證明</div>
                                    <div class="fr"><a class="abtn orange" href="#">立即上传</a></div>
                                </div>
                                <div class="i_pic">
                                    <img src="${ctx }/static/tmp/sfz.jpg" />
                                </div>
                                <div class="i_status cGreen"><i class="icon">󰅖</i> 审核通过</div>
                            </div>
                        </div>
                    </div>



                    <div class="J_miniTitle mt20">
                        <div class="m_token"></div>
                        <div class="m_txt">銀行證明</div>
                    </div>

                    <div class="J_picBox clearfix">
                        <div class="p_item">
                            <div class="i_inner">
                                <div class="i_mask">
                                    <div class="ml10 fl">銀行一證明</div>
                                    <div class="fr"><a class="abtn orange" href="#">立即上传</a></div>
                                </div>
                                <div class="i_pic">
                                    <img src="${ctx }/static/tmp/sfz.jpg" />
                                </div>
                                <div class="i_status cDeepRed"><i class="icon">󰅕</i> 审核失败</div>
                            </div>
                        </div>
                        <div class="p_item">
                            <div class="i_inner">
                                <div class="i_mask">
                                    <div class="ml10 fl">銀行二證明</div>
                                    <div class="fr"><a class="abtn orange" href="#">立即上传</a></div>
                                </div>
                                <div class="i_pic">
                                    <img src="${ctx }/static/tmp/sfz.jpg" />
                                </div>
                                <div class="i_status cDeepRed"><i class="icon">󰅕</i> 审核失败</div>
                            </div>
                        </div>
                        <div class="p_item">
                            <div class="i_inner">
                                <div class="i_mask">
                                    <div class="ml10 fl">銀行三證明</div>
                                    <div class="fr"><a class="abtn orange" href="#">立即上传</a></div>
                                </div>
                                <div class="i_pic">
                                    <img src="${ctx }/static/tmp/sfz.jpg" />
                                </div>
                                <div class="i_status cDeepRed"><i class="icon">󰅕</i> 审核失败</div>
                            </div>
                        </div>
                    </div>




                    <div class="J_miniTitle mt20">
                        <div class="m_token"></div>
                        <div class="m_txt">温馨提示 <span class="fz14">(身份證明與銀行證明審核通過後，方可取款。請閣下及時上載資料，以免影響閣下的取款。)</span></div>
                    </div>


                    <div class="lh30">
                        <table>
                            <tbody>
                                <tr>
                                    <td class="tar">身份证明：</td>
                                    <td class="c54">可使用居民身份證，護照等可作為有效身份證明使用。</td>
                                </tr>
                                <tr>
                                    <td class="tar">地址证明：</td>
                                    <td class="c54"></td>
                                </tr>
                                <tr>
                                    <td class="tar">银行证明：</td>
                                    <td class="c54">閣下收款的銀行卡必須為帳戶本人所有，銀行卡號亦須與帳戶登記時一致。</td>
                                </tr>
                                <tr>
                                    <td class="tar">图片格式：</td>
                                    <td class="c54">支援 jpg\gif\bmp\png\tif 格式，圖片大小需小於 5M。</td>
                                </tr>
                                <tr>
                                    <td class="tar">身份证明上传：</td>
                                    <td class="c54">可分別上載正反面(若有)或者將同一檔中的正反面上載到身份證正、反面到其中一個欄位皆可。</td>
                                </tr>
                                <tr>
                                    <td class="tar">银行证明上传：</td>
                                    <td class="c54">需上載銀行卡正面。</td>
                                </tr>

                            </tbody>
                        </table>
                    </div>

                </div>



            </div>
        </div>
    </div>

    
	<%@ include file="../common/help.jsp" %>
	<%@ include file="../common/foot.jsp" %>

</body>
</html>
