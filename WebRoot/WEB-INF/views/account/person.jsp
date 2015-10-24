<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />

	<%@ include file="../common/common.jsp"%>

</head>

<%@ include file="../common/nice-validator.jsp" %>

<script type="text/javascript" src="${ctx }/static/plugins/dmuploader/dmuploader.min.js"></script>

<script type="text/javascript">

$(function(){
	
	//set值
	$('#myForm input[name="sex"][value="${member.sex}"]').click();
	$('#myForm select[name="nationalityId"]').val('${member.nationality.id}').change();
	$('#myForm select[name="cardType"]').val('${member.cardType}').change();
	
	//除了证件类型、证件号、姓名中英、手机号码 银行资料 不能改
	$('#myForm input').each(function(idx, obj){
		var name = $(obj).attr('name');
		if($(obj).val() && name != 'nickName' && name != 'address' && name != 'sex' && name != 'email'){
			$(obj).attr('disabled', 'disabled');
		}
	});
	
	if('${member.cardType}'){
		$('#myForm select[name="cardType"]').attr('disabled', 'disabled');
	}
	
	$('#myForm').validator({
		isShowMsg : false,
		rules : {
			nickName : [/^[0-9a-zA-Z\u0391-\uFFE5]{2,8}$/, '昵称长度2到8个字符，支持汉子、英文及数字'],
			card : [/[0-9a-zA-Z]+/, '证件号有误'],
			bankcard : [/^\d{16}|\d{19}$/, '银行账号有误']
		},
		fields : {
			cnName : '中文姓名: length[~64, true]',
			nickName : '昵称: nickName;',
			card : '证件号码: length[~64]',
			mobile : '手机号码: required;mobile;',
			email : '电子邮箱: email;',
			card : 'card',
			address : '联系地址: length[~512, true]',
			bankAccount : '银行名称: length[~64, true]',
			bankCardNum : '银行账号: bankcard',
			bankAddress : '账户持有人姓名: length[~512, true]'
		},
		valid : function(form){
			$(form).ajaxSubmit({
				url : '${ctx}/main/ajax/save/person',
				async : false,
				success : function(result){
					if(result.success){
						jc.alert('修改成功', function(){
							window.location.reload();
						});
					}else{
						jc.alert(result.msg);
					}
				}
			});
		},
		invalid : function(form, errors){
			jc.alert(errors);
		}
	});
	
	//上传文件
	$('#uploadImg').dmUploader({
		url : '${ctx}/main/ajax/upload/img',
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
				var paramName = $('#paramName').val();
				var title = '上传图片';
				if(paramName == 'imgIDCardA'){
					title = '上传身份证明';
				}else if(paramName == 'imgBankCard'){
					title = '上传银行证明';
				}
				var imgUrl = result.data;
				$('#imgDiv').find('img[data-param-name="img"]').attr('src', ctx + imgUrl);
				layer.open({
					type : 1,
					title : title,
					content : $('#imgDiv'),
					area : ['400px', '320px'],
					btn : ['确定', '取消'],
					yes: function(index, layero){
				        //保存
				        $.ajax({
				        	url : '${ctx}/main/ajax/save/upload_img',
				        	data : {
				        		imgUrl : imgUrl,
				        		paramName : paramName,
				        	},
				        	async : false,
				        	success : function(re){
				        		console.log(re);
				        		if(re.success){
				        			layer.alert('上传成功', function(){
				        				window.location.reload();
				        			});
				        		}else{
				        			jc.alert(re.msg);
				        		}
				        	}
				        });
				    },cancel: function(index){
				        
				    }
				});
				
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
	
});

function myUpdatePerson(){
	$('#myForm').submit();
}

function uploadImg(_this, paramName){
	
	$('#paramName').val(paramName);
	$('#uploadImg input[type="file"]').click();
}

function showUploadImg(title, imgUrl){
	$('#imgDiv').find('img[data-param-name="img"]').attr('src', ctx + imgUrl);
	layer.open({
		type : 1,
		shadeClose : true,
		title : title,
		content : $('#imgDiv'),
		area : ['400px', '300px'],
	});
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
                
                <form action="" id="myForm" method="post">
                    <div class="J_miniTitle">
                        <div class="m_token"></div>
                        <div class="m_txt">基本资料</div>
                    </div>

                    <div class="J_userInfoList">
						
                        <table style="width: 100%">
                            <tbody>
                                <tr>
                                    <td style="width: 80px;" class="bgf9">
                                        <div class="J_toolsBar">
                                            <div class="t_label right">姓名</div>
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
                                    <td class="bgf9" style="width: 80px;">
                                        <div class="J_toolsBar">
                                            <div class="t_label right">昵称</div>
                                        </div>
                                    </td>
                                    <td colspan="2">
                                        <div class="J_toolsBar">
                                            <div class="ml10 t_text w200">
                                                <label>
                                                    <input value="${member.nickName }" type="text" name="nickName">
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
                                            <div class="t_label right">国家/地区</div>
                                        </div>
                                    </td>
                                    <td>
                                        <div class="J_toolsBar">
                                            <div class="ml10 t_select">
                                                <a href="javascript:;">请选择</a>
                                                <select name="nationalityId">
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
                                            <div class="ml10 t_text w200">
                                                <label>
                                                    <input value="${card }" type="text" name="card">
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
                                                    <input value="${mobile }" disabled="disabled" type="text" name="mobile">
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
                                    <td style="width: 100px;" class="bgf9">
                                        <div class="J_toolsBar">
                                            <div class="t_label right">银行名称</div>
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
                                    <td style="width: 100px;" class="bgf9">
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
                                    <td style="width: 100px;" class="bgf9">
                                        <div class="J_toolsBar">
                                            <div class="t_label right">账户持有人姓名</div>
                                        </div>
                                    </td>
                                    <td colspan="9">
                                        <div class="J_toolsBar">
                                            <div class="ml10 t_text w300">
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
                        <a class="sm abtn orange" href="javascript:myUpdatePerson()">确认修改</a>
                    </div>

                    <div class="J_miniTitle mt20">
                        <div class="m_token"></div>
                        <div class="m_txt">资料上传</div>
                    </div>
					<div id="uploadImg" style="display: none;">
						<input type="hidden" id="paramName" value="">
						<input type="file" name="imgFile" multiple="multiple" style="opacity: .0;">
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
                                    <td>
                                    	<c:choose>
                                    		<c:when test="${empty member.imgIDCardStatus or member.imgIDCardStatus eq 0 }">
                                    			<span class="cOrange">未上传</span>
                                    		</c:when>
                                    		<c:when test="${member.imgIDCardStatus eq 1 }">
                                    			<span class="cGreen">待审核</span>
                                    		</c:when>
                                    		<c:when test="${member.imgIDCardStatus eq 3 }">
                                    			<span class="cOrange">审核未通过（请联系客服）</span>
                                    		</c:when>
                                    		<c:otherwise>
                                    			<span class="cGreen"><i class="icon">󰅖</i> 有效</span>
                                    		</c:otherwise>
                                    	</c:choose>
                                    	<c:choose>
                                    		<c:when test="${empty member.imgIDCardStatus or member.imgIDCardStatus eq 0 or member.imgIDCardStatus eq 3 }">
                                    			<a class="abtn orange" href="javascript:void(0)" onclick="uploadImg(this, 'imgIDCardA')">立即上传</a>
                                    		</c:when>
                                    		<c:when test="${not empty member.imgIDCardStatus and member.imgIDCardStatus ne 0 }">
                                    			<a class="abtn orange" href="javascript:void(0)" onclick="showUploadImg('身份证明', '${member.imgIDCardA}')">查看</a>
                                    		</c:when>
                                    	</c:choose>
                                    	
                                    </td>
                                </tr>
                                <tr>
                                    <td>银行证明</td>
                                    <td>
                                    	<c:choose>
                                    		<c:when test="${empty member.imgBackCardStatus or member.imgBackCardStatus eq 0 }">
                                    			<span class="cOrange">未上传</span>
                                    		</c:when>
                                    		<c:when test="${member.imgBackCardStatus eq 1 }">
                                    			<span class="cGreen">待审核</span>
                                    		</c:when>
                                    		<c:when test="${member.imgBackCardStatus eq 3 }">
                                    			<span class="cOrange">审核未通过（请联系客服）</span>
                                    		</c:when>
                                    		<c:otherwise>
                                    			<span class="cGreen"><i class="icon">󰅖</i> 有效</span>
                                    		</c:otherwise>
                                    	</c:choose>
                                    	<c:choose>
                                    		<c:when test="${empty member.imgBackCardStatus or member.imgBackCardStatus eq 0 or member.imgBackCardStatus eq 3 }">
                                    			<a class="abtn orange" href="javascript:void(0)" onclick="uploadImg(this, 'imgBankCard')">立即上传</a>
                                    		</c:when>
                                    		<c:when test="${not empty member.imgBackCardStatus and member.imgBackCardStatus ne 0 }">
                                    			<a class="abtn orange" href="javascript:void(0)" onclick="showUploadImg('银行证明', '${member.imgBankCard}')">查看</a>
                                    		</c:when>
                                    	</c:choose>
                                    </td>
                                </tr>

                            </tbody>
                        </table>
                    </div>



                    <div class="J_miniTitle mt20">
                        <div class="m_token"></div>
                        <div class="m_txt">温馨提示 <span class="fz14">(身份证明与银行证明上传审核通过后，方可返佣。请您及时上传资料，以免影响您的返佣。)</span></div>
                    </div>


                    <div class="lh30">
                        <table class="fz14">
                            <tbody>
                                <tr>
                                    <td class="tar">身份证明：</td>
                                    <td class="c54">可使用中国居民身份证可作为有效身份证明使用。</td>
                                </tr>
                                <tr>
                                    <td class="tar">银行证明：</td>
                                    <td class="c54">您收款的银行卡必须为帐户本人所有，银行卡号亦须与帐户登记时一致。</td>
                                </tr>
                                <tr>
                                    <td class="tar">图片格式：</td>
                                    <td class="c54">支援 jpg\gif\bmp\png\tif 格式，图片大小需小于 5M。</td>
                                </tr>
                                <tr>
                                    <td class="tar">身份证明上传：</td>
                                    <td class="c54">需上传身份证的正面。</td>
                                </tr>
                                <tr>
                                    <td class="tar">银行证明上传：</td>
                                    <td class="c54">需上传银行卡正面。</td>
                                </tr>

                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
            
            
        </div>
    </div>
	
	<div id="imgDiv" style="display: none;">
		<div class="J_picBox clearfix" style="margin-top: 10px;margin-left: 30px;">
			<div class="p_item">
                 <div class="i_inner">
                     <div class="i_pic">
                     	
                       	<img src="" data-param-name="img">
                     	
                     </div>
                 </div>
             </div>
		</div>
	</div>
    
	<%@ include file="../common/help.jsp" %>
	<%@ include file="../common/foot.jsp" %>

</body>
</html>
