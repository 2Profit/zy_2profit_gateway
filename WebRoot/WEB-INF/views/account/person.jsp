<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />

	<%@ include file="../common/common.jsp"%>

</head>

<%@ include file="../common/nice-validator.jsp" %>

<script type="text/javascript" src="${ctx }/static/plugins/dmuploader/dmuploader.js"></script>

<script type="text/javascript">

$(function(){
	
	//set值
	$('#myForm input[name="sex"][value="${loginUser.sex}"]').click();
	$('#myForm select[name="nationality"]').val('${loginUser.nationality.id}').change();
	$('#myForm select[name="cardType"]').val('${loginUser.cardType}').change();
	
	$('#myForm').validator({
		isShowMsg : false,
		fields : {
			cnName : '中文姓名: length[~64, true]',
			enName : '英文姓名: length[~64, true]',
			card : '证件号码: length[~64]',
			mobile : '手机号码: required;mobile;',
			email : '电子邮箱: required;email;',
			address : '联系地址: length[~512, true]'
		},
		valid : function(form){
			$(form).ajaxSubmit({
				url : '${ctx}/main/ajax/save/person',
				async : false,
				success : function(result){
					if(result.success){
						alert('修改成功');
						window.location.reload();
					}else{
						alert(result.msg);
					}
				}
			});
		},
		invalid : function(form, errors){
			jc.alert(errors);
		}
	});
	
});

function myUpdatePerson(){
	$('#myForm').submit();
}

function uploadImg(_this, paramName){

	if($('#uploadImg').data('dmUploader')){
		$('#uploadImg').data('dmUploader', null);
	}
	//上传文件
	$('#uploadImg').dmUploader({
		url : '${ctx}/main/ajax/upload/img',
		extraData : {
			'paramName' : paramName
		},
		maxFileSize : 5*1024*1024,
		maxFiles : 1,
		extFilter : 'jpg;png;gif;bmp;tif',
		dataType : 'json',
		onBeforeUpload : function(){
			layer.load();
		},
		onComplete : function(){
			layer.closeAll('loading');
		},
		onUploadSuccess : function(id, result){
			if(result.success){
				//$('img[data-param-name="'+paramName+'"]').attr('src', ctx + result.data);
				window.location.reload();
			}else{
				jc.alert(result.msg);
			}
		},
		onFileSizeError : function(file){
			jc.alert('只能上传小于5M的图片');
		},
		onFileExtError : function(file){
			jc.alert('只支持上传pg\gif\bmp\png\tif格式图片');
		}
	});
	
	$('#uploadImg input[type="file"]').click();
}

</script>

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

					<form action="${ctx }" id="myForm">
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
                                                    <input value="${loginUser.cnName }" type="text" name="cnName">
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
                                                    <input value="${loginUser.enName }" type="text" name="enName">
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
                                                    <input type="radio" name="sex" value="0"/>男</label>
                                            </div>
                                            <div class="ml10 t_check">
                                                <label>
                                                    <input type="radio" name="sex" value="1"/>女</label>
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
                                                <a href="javascript:;">&nbsp;&nbsp;&nbsp;&nbsp;</a>
                                                <select name="nationality">
                                                    <option value="">&nbsp;&nbsp;&nbsp;&nbsp;</option>
                                                    <c:forEach items="${nationalities }" var="nation">
                                                    	<option value="${nation.id }">${nation.name }</option>
                                                    </c:forEach>
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
                                                <a href="javascript:;">&nbsp;&nbsp;&nbsp;&nbsp;</a>
                                                <select name="cardType">
                                                	<option value="">&nbsp;&nbsp;&nbsp;&nbsp;</option>
                                                	<c:forEach items="${cardTypes }" var="ct">
                                                		<option value="${ct.key }">${ct.value }</option>
                                                	</c:forEach>
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
                                                    <input value="${loginUser.card }" type="text" name="card">
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
                                                    <input value="${loginUser.mobile }" type="text" name="mobile">
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
                                                    <input value="${loginUser.email }" type="text" name="email">
                                                </label>
                                            </div>
                                            <div class="t_label">（电子邮件可作为您以后的用户名，用来管理您的帐户、入金、更改资料以及接收资讯等，请确保资料的准确性并牢记您的电邮设置）</div>
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
                                                    <input value="${loginUser.address }" type="text" name="address">
                                                </label>
                                            </div>
                                        </div>
                                    </td>
                                </tr>

                            </tbody>

                        </table>


                    </div>

                    <div class="mt20 J_btnGroup md">
                        <a class="sm abtn orange" href="javascript:void(0);" onclick="myUpdatePerson()">确认修改</a>
                    </div>
					</form>

					
					<div id="uploadImg" style="display: none;">
						<input type="file" name="imgFile" multiple="multiple" style="opacity: .0;">
						<input type="hidden" name="paramName" value="" id="paramName">
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
                                    <div class="fr">
                                    	<a class="abtn orange" href="javascript:void(0)" onclick="uploadImg(this, 'imgIDCardA')">立即上传</a>
                                    </div>
                                </div>
                                <div class="i_pic">
                                	<c:choose>
                                		<c:when test="${not empty loginUser.imgIDCardA }">
                               				<img src="${ctx }${loginUser.imgIDCardA}" data-param-name="imgIDCardA"/>
                                		</c:when>
                                		<c:otherwise>
                                			<img src="${ctx }/static/images/J_null.png" data-param-name="imgIDCardA"/>
                                		</c:otherwise>
                                	</c:choose>
                                </div>
                               	<c:choose>
                               		<c:when test="${not empty loginUser.imgIDCardA }">
                              			<div class="i_status cDeepRed"><i class="icon">󰂸</i> 上传未审核</div>
                               		</c:when>
                               		<c:otherwise>
                               			<div class="i_status cDeepRed"><i class="icon">󰂸</i> 未上传</div>
                               		</c:otherwise>
                               	</c:choose>
                            </div>
                        </div>
                        <div class="p_item">
                            <div class="i_inner">
                                <div class="i_mask">
                                    <div class="ml10 fl">身份证背面</div>
                                    <div class="fr"><a class="abtn orange" href="javascript:void(0);" onclick="uploadImg(this, 'imgIDCardB')">立即上传</a></div>
                                </div>
                                <div class="i_pic">
                                	<c:choose>
                                		<c:when test="${not empty loginUser.imgIDCardB }">
                               				<img src="${ctx }${loginUser.imgIDCardB}" data-param-name="imgIDCardB"/>
                                		</c:when>
                                		<c:otherwise>
                                			<img src="${ctx }/static/images/J_null.png" data-param-name="imgIDCardB"/>
                                		</c:otherwise>
                                	</c:choose>
                                </div>
                               	<c:choose>
                               		<c:when test="${not empty loginUser.imgIDCardB }">
                              			<div class="i_status cOrange"><i class="icon">󰃄</i> 上传未审核</div>
                               		</c:when>
                               		<c:otherwise>
                               			<div class="i_status cDeepRed"><i class="icon">󰂸</i> 未上传</div>
                               		</c:otherwise>
                               	</c:choose>
                            </div>
                        </div>
                    </div>


                    <div class="J_miniTitle mt20">
                        <div class="m_token"></div>
                        <div class="m_txt">地址证明</div>
                    </div>

                    <div class="J_picBox clearfix">
                        <div class="p_item">
                            <div class="i_inner">
                                <div class="i_mask">
                                    <div class="ml10 fl">地址证明</div>
                                    <div class="fr"><a class="abtn orange" href="javascript:void(0);" onclick="uploadImg(this, 'imgAddress')">立即上传</a></div>
                                </div>
                                <div class="i_pic">
                                	<c:choose>
                                		<c:when test="${not empty loginUser.imgAddress }">
                               				<img src="${ctx }${loginUser.imgAddress}" data-param-name="imgAddress"/>
                                		</c:when>
                                		<c:otherwise>
                                			<img src="${ctx }/static/images/J_null.png" data-param-name="imgAddress"/>
                                		</c:otherwise>
                                	</c:choose>
                                </div>
                                <c:choose>
                               		<c:when test="${not empty loginUser.imgAddress }">
                              			<div class="i_status cOrange"><i class="icon">󰃄</i> 上传未审核</div>
                               		</c:when>
                               		<c:otherwise>
                               			<div class="i_status cDeepRed"><i class="icon">󰂸</i> 未上传</div>
                               		</c:otherwise>
                               	</c:choose>
                                <!-- <div class="i_status cGreen"><i class="icon">󰅖</i> 审核通过</div> -->
                            </div>
                        </div>
                    </div>

                    <div class="J_miniTitle mt20">
                        <div class="m_token"></div>
                        <div class="m_txt">银行证明</div>
                    </div>

                    <div class="J_picBox clearfix">
                        <div class="p_item">
                            <div class="i_inner">
                                <div class="i_mask">
                                    <div class="ml10 fl">银行一证明</div>
                                    <div class="fr"><a class="abtn orange" href="javascript:void(0);" onclick="uploadImg(this, 'imgBankCard1')">立即上传</a></div>
                                </div>
                                 <div class="i_pic">
                                	<c:choose>
                                		<c:when test="${not empty loginUser.imgBankCard1 }">
                               				<img src="${ctx }${loginUser.imgBankCard1}" data-param-name="imgBankCard1"/>
                                		</c:when>
                                		<c:otherwise>
                                			<img src="${ctx }/static/images/J_null.png" data-param-name="imgBankCard1"/>
                                		</c:otherwise>
                                	</c:choose>
                                </div>
                                <c:choose>
                               		<c:when test="${not empty loginUser.imgBankCard1 }">
                              			<div class="i_status cOrange"><i class="icon">󰃄</i> 上传未审核</div>
                               		</c:when>
                               		<c:otherwise>
                               			<div class="i_status cDeepRed"><i class="icon">󰂸</i> 未上传</div>
                               		</c:otherwise>
                               	</c:choose>
                            </div>
                        </div>
                        <div class="p_item">
                            <div class="i_inner">
                                <div class="i_mask">
                                    <div class="ml10 fl">银行二证明</div>
                                    <div class="fr"><a class="abtn orange" href="javascript:void(0);" onclick="uploadImg(this, 'imgBankCard2')">立即上传</a></div>
                                </div>
                                <div class="i_pic">
                                	<c:choose>
                                		<c:when test="${not empty loginUser.imgBankCard2 }">
                               				<img src="${ctx }${loginUser.imgBankCard2}" data-param-name="imgBankCard2"/>
                                		</c:when>
                                		<c:otherwise>
                                			<img src="${ctx }/static/images/J_null.png" data-param-name="imgBankCard2"/>
                                		</c:otherwise>
                                	</c:choose>
                                </div>
                                <c:choose>
                               		<c:when test="${not empty loginUser.imgBankCard2 }">
                              			<div class="i_status cOrange"><i class="icon">󰃄</i> 上传未审核</div>
                               		</c:when>
                               		<c:otherwise>
                               			<div class="i_status cDeepRed"><i class="icon">󰂸</i> 未上传</div>
                               		</c:otherwise>
                               	</c:choose>
                            </div>
                        </div>
                        <div class="p_item">
                            <div class="i_inner">
                                <div class="i_mask">
                                    <div class="ml10 fl">银行三证明</div>
                                    <div class="fr"><a class="abtn orange" href="javascript:void(0);" onclick="uploadImg(this, 'imgBankCard3')">立即上传</a></div>
                                </div>
                                <div class="i_pic">
                                	<c:choose>
                                		<c:when test="${not empty loginUser.imgBankCard3 }">
                               				<img src="${ctx }${loginUser.imgBankCard3}" data-param-name="imgBankCard3"/>
                                		</c:when>
                                		<c:otherwise>
                                			<img src="${ctx }/static/images/J_null.png" data-param-name="imgBankCard3"/>
                                		</c:otherwise>
                                	</c:choose>
                                </div>
                                <c:choose>
                               		<c:when test="${not empty loginUser.imgBankCard3 }">
                              			<div class="i_status cOrange"><i class="icon">󰃄</i> 上传未审核</div>
                               		</c:when>
                               		<c:otherwise>
                               			<div class="i_status cDeepRed"><i class="icon">󰂸</i> 未上传</div>
                               		</c:otherwise>
                               	</c:choose>
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
