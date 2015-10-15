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
	$('#myForm input[name="sex"][value="${member.sex}"]').click();
	$('#myForm select[name="nationalityId"]').val('${member.nationality.id}').change();
	$('#myForm select[name="cardType"]').val('${member.cardType}').change();
	
	//除了证件类型、证件号、姓名中英、手机号码 银行资料 不能改
	$('#myForm input').each(function(idx, obj){
		if($(obj).val()){
			$(obj).attr('disabled', 'disabled');
		}
	});
	
	if('${member.cardType}'){
		$('#myForm select[name="cardType"]').attr('disabled', 'disabled');
	}
	
	$('#myForm').validator({
		isShowMsg : false,
		fields : {
			cnName : '中文姓名: length[~64, true]',
			enName : '英文姓名: length[~64, true]',
			card : '证件号码: length[~64]',
			mobile : '手机号码: required;mobile;',
			email : '电子邮箱: required;email;',
			address : '联系地址: length[~512, true]',
			bankAccount : '银行账户: length[~64, true]',
			bankCardNum : '银行账号: length[~64, true]',
			bankAddress : '银行地址: length[~512, true]'
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
                
                <form action="">
                    <div class="J_miniTitle">
                        <div class="m_token"></div>
                        <div class="m_txt">基本资料</div>
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
                                                    <input value="${member.cnName }" type="text" name="cnName">
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
                                                    <input value="${member.enName }" type="text" name="enName">
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
                                                    <input type="radio" name="sex" value="0"/>男
                                                </label>
                                            </div>
                                            <div class="ml10 t_check">
                                                <label>
                                                    <input type="radio" name="sex" value="1"/>女
                                                </label>
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
                                                <a href="javascript:;">请选择</a>
                                                <select name="nationalitieId">
                                                	<option value="">请选择</option>
                                                	<c:forEach items="${nationalities }" var="n">
                                                		<option value="${n.id }">${n.name }</option>
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
                                                <a href="javascript:;">请选择</a>
                                                <select name="cardType">
                                                	<option value="">请选择</option>
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
                                                    <input value="${member.cardNo }" type="text" name="cardNo">
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
                                                    <input value="${member.mobile }" disabled="disabled" type="text" name="mobile">
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
                                                    <input value="${member.email }" type="text" name="email">
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
                                                    <input value="${member.address }" type="text" name="address">
                                                </label>
                                            </div>
                                        </div>
                                    </td>
                                </tr>
								
                            </tbody>

                        </table>

                    </div>

					<div class="J_miniTitle">
                        <div class="m_token"></div>
                        <div class="m_txt">银行资料</div>
                    </div>

					<div class="J_userInfoList">
						
						<table style="width: 100%">
                            <tbody>
                                <tr>
                                    <td style="width: 60px;" class="bgf9">
                                        <div class="J_toolsBar">
                                            <div class="t_label right">银行账户</div>
                                        </div>
                                    </td>
                                    <td colspan="4">
                                        <div class="J_toolsBar">
                                            <div class="ml10 t_text w300">
                                                <label>
                                                    <input value="${member.memBankInfo.bankAccount }" type="text" name="bankAccount">
                                                </label>
                                            </div>
                                        </div>
                                    </td>
                                    <td style="width: 60px;" class="bgf9">
                                        <div class="J_toolsBar">
                                            <div class="t_label right">银行账号</div>
                                        </div>
                                    </td>
                                    <td colspan="4">
                                        <div class="J_toolsBar">
                                            <div class="ml10 t_text w300">
                                                <label>
                                                    <input value="${member.memBankInfo.bankCardNum }" type="text" name="bankCardNum">
                                                </label>
                                            </div>
                                        </div>
                                    </td>
                                </tr>
								
								<tr>
                                    <td style="width: 60px;" class="bgf9">
                                        <div class="J_toolsBar">
                                            <div class="t_label right">银行地址</div>
                                        </div>
                                    </td>
                                    <td colspan="9">
                                        <div class="J_toolsBar">
                                            <div class="ml10 t_text w830">
                                                <label>
                                                    <input value="${member.memBankInfo.bankAddress }" type="text" name="bankAddress">
                                                </label>
                                            </div>
                                        </div>
                                    </td>
                                </tr>
								
                            </tbody>

                        </table>
						
					</div>
					</form>
					
                    <div class="mt20 J_btnGroup md">
                        <a class="sm abtn orange" href="#">确认修改</a>
                    </div>




                    <div class="J_miniTitle mt20">
                        <div class="m_token"></div>
                        <div class="m_txt">资料上传</div>
                    </div>

                    <div class="J_table mt10">
                        <table>
                            <thead>
                                <tr>
                                    <td>证件名称</td>
                                    <td>状态</td>
                                </tr>
                            </thead>
                            <tbody>
                                <tr>
                                    <td style="width:120px;">身份证明</td>
                                    <td><span class="cOrange">未上传</span><span class="ml10 cGreen">(联系客服上传)</span></td>
                                </tr>
                                <tr>
                                    <td>地址证明</td>
                                    <td><span class="cGreen"><i class="icon">󰅖</i> 已上传</span></td>
                                </tr>
                                <tr>
                                    <td>银行证明</td>
                                    <td><span class="cOrange">未上传</span><span class="ml10 cGreen">(联系客服上传)</span></td>
                                </tr>

                            </tbody>
                        </table>
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
