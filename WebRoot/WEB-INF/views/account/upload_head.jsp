<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />

<%@ include file="../common/common.jsp"%>

</head>

<%@ include file="../common/nice-validator.jsp"%>

<script type="text/javascript" src="${ctx }/static/plugins/dmuploader/dmuploader.min.js"></script>

<script type="text/javascript">

$(function(){
	
	//上传文件
	$('#uploadImg').dmUploader({
		url : '${ctx}/main/ajax/tmp/upload_head',
		maxFileSize : 5*1024*1024,
		maxFiles : 1,
		extFilter : 'jpg;png;gif;',
		dataType : 'json',
		onBeforeUpload : function(){
			layer.load();
		},
		onComplete : function(){
			layer.closeAll('loading');
		},
		onUploadSuccess : function(id, result){
			if(result.success){
				
				$('#headImg').attr('src', ctx + result.data);
				
				$('#headUrl').val(result.data);
				
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
	
	/* jc.ui.editFace.all(function (i,obj) {
        obj.over = function (obj) {
            console.log(obj);
        }
    }); */

	
});

function uploadImg(){
	$('#uploadImg input[type="file"]').click();
}

function savePic() {
	if(!$('#headUrl').val()){
		jc.alert('请上传头像');
		return false;
	}
	jc.ui.editFace.all(function(){
		var p = this.getPos();
		$('#coordinatexX').val(p.x);
		$('#coordinatexY').val(p.y);
		$('#width').val(p.w);
		$('#height').val(p.h);
	});
	
	layer.load();
	
	$('#headImageForm').ajaxSubmit({
		success:function(data){
			layer.closeAll('loading');
			if(data.success){
				jc.alert('修改成功', function(){
					window.location.reload();
				});
			}else{
				jc.alert(data.msg);
			}
		}
	});
}

</script>

<body>

	<%@ include file="../common/head.jsp"%>
		<div class="J_wrap">

	        <%@ include file="../common/time.jsp" %>
	
			<div class="J_content mt20 bgfff bg1 hasShadow">            
	            <%@ include file="../common/menu.jsp" %>
            
            	<div class="fr c_1000">

	                <div class="J_title less">
	                    <div class="t_txt">更改头像</div>
	                    <div class="t_tips"></div>
	                    <div class="t_more"></div>
	                </div>
	                <div class="plrb20">
	
						<form id="headImageForm"  action="${ctx }/main/ajax/save/head_img"  method="post">
							<input type="hidden" name="headUrl" id="headUrl" />
							<input type="hidden" name="coordinatexX" id="coordinatexX" />
							<input type="hidden" name="coordinatexY" id="coordinatexY" />
							<input type="hidden" name="width" id="width" />
							<input type="hidden" name="height" id="height" />
						</form>
								
						
	                    <div class="J_toolsBar mt20">
	                        <div class="t_button">
	                            <a class="abtn orange" href="javascript:uploadImg();">上传头像</a>
	                        </div>
	                        <div class="t_label ml20 fz14 c999">仅支持JPG、PNG、GIF图片文件格式，且文件小于5M</div>
	                    </div>
	
	                    <div data-ui="editFace" class="J_editFace mt20">
	                        <div class="e_top"></div>
	                        <div class="e_right"></div>
	                        <div class="e_bottom"></div>
	                        <div class="e_left"></div>
	                        <div class="e_drag">
	                            <img src="${ctx }/static/images/editFace_mask.png">
	                            <div class="d_resize">
	                                <i class="icon">󰆷</i>
	                            </div>
	                        </div>
							
							<div id="uploadImg" style="display: none;">
								<input type="file" name="imgFile" multiple="multiple" style="opacity: .0;">
							</div>
							
	                        <img id="headImg" class="e_face" src="${ctx }/static/tmp/face_01.jpg" style="width: 300px; height: 300px;">
	                    </div>
	                </div>
	
	                <div class="J_btnGroup mt20">
	                    <a href="javascript:savePic();" class="abtn orange">确认修改</a>
	                </div>
	
	            </div>
				
		</div>
    </div>

	<%@ include file="../common/help.jsp"%>
	<%@ include file="../common/foot.jsp"%>

</body>
</html>
