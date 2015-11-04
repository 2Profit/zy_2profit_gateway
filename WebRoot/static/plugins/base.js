/**
 * 
 */

var PAGESIZE = 10;

function myLoginSubmit(url){
	var $form = $('#loginForm');
	var username = $.trim($form.find('input[name="username"]').val());
	var pwd = $.trim($form.find('input[name="pwd"]').val());
	if(!username){
		jc.alert('请输入手机号码或邮箱', function(){
			$form.find('input[name="username"]').focus();
		});
		
		return;
	}
	if(!pwd){
		jc.alert('请输入密码', function(){
			$form.find('input[name="pwd"]').focus();
		});
		
		return;
	}
	
	$form.ajaxSubmit({
		url : ctx + '/dologin',
		type : 'post',
		async : false,
		success : function(result){
			if(result.success){
				if(url){
					window.location.href = ctx + url;
				}else{
					window.location.reload();
				}
				
			}else{
				jc.alert(result.msg);
			}
		}
	});
	
}

/**
 * 格式化日期
 * @param d 值 有可能是Date类型
 * @param f	格式 yy-mm-dd hh:ii:ss
 * @returns
 */
function parseDate(d, f){
	if(!d){
		return '';
	}
	if(!f){
		f = 'yy-mm-dd';
	}
	if(f instanceof Date){
		return $.formatDateTime(f, d);
	}else if(typeof(d) == 'string'){
		if(d.indexOf('-') > -1){
			d = d.replace(/-/g,   "/");
		}
		return $.formatDateTime(f, new Date(d));
	}else if(typeof(d) == "number"){
		var date = new Date();
		date.setTime(d);
		return $.formatDateTime(f, new Date(date));
	}
}

function parseDateTime(d){
	return parseDate(d, 'yy-mm-dd hh:ii:ss');
}

function parseDateToMinus(d){
	return parseDate(d, 'yy-mm-dd hh:ii');
}

function parseDateTohi(d){
	return parseDate(d, 'hh:ii');
}

/**
 * 
 * @param form
 * @returns {Object}
 */
function getFormData(form){
	var data = new Object();
	var names = new Array();
	var s = '';
	$.each($(form).find('input,select'), function(idx, obj){
		var n = $(obj).attr('name');
		if(n && s.indexOf(n) == -1){
			names.push(n);
			s += n + ',';
		}
	});
	
	//取值
	$.each(names, function(idx, n){
		var els = $(form).find('input[name="'+n+'"],select[name="'+n+'"]');
		if(els.length == 1){
			var type = $(els[0]).attr('type');
			if(type == 'checkbox' || type == 'radio'){
				if($(els[0]).attr('checked')){
					data[n] = $(els[0]).val(); 
				}
			}else{
				data[n] = $(els[0]).val();
			}
		}else if(els.length > 1){
			data[n] = new Array();
			
			$.each(els, function(idx, el){
				var type = $(el).attr('type');
				if(type && (type == 'checkbox' || type == 'radio')){
					if($(el).attr('checked')){
						data[n].push($(el).val());
					}
				}else{
					var v = $(el).val();
					if(v){
						data[n].push(v);
					}
				}
			});
			
		}
	});
	
	return data;
}

function proVal(val){
	if(val == 0){
		return val;
	}
	if(!val){
		return '';
	}
	if(val == 'null'){
		return '';
	}
	if(val == undefined){
		return '';
	}
	if(val == 'undefined'){
		return '';
	}
	return val;
}

function setOdd(tbody){
	$(tbody).find('tr:odd').addClass('odd');
}

//刷新
function myRefresh(){
	var $pd = $('#pageDiv');
	if($pd && $pd.length > 0){
		if($pd.data('pagination')){
			$pd.pagination($pd.pagination('getSelectedPageNum'));
		}
	}
}


/**
 * 显示没有数据提示
 * @param llId
 * @param msg
 * @param url
 * @param btn
 */
function showNoDataMsg(llId, msg, url, btn){
	var $dataDiv = $('#' + llId);
	$dataDiv.hide();
	var $msgDiv = $('div[ll_id="'+llId+'"]');
	if($msgDiv && $msgDiv.length > 0){
		$msgDiv.show();
	}else{
		if(!btn){
			btn = '去添加';
		}
		var html = '<div class="Jg_null" ll_id="'+llId+'">';
			html += '<div class="n_title">'+msg+'</div>';
			if(url){
				html += '<div class="n_link">';
				html += '<a class="abtn orange" href="'+url+'">'+btn+'</a>';
	            html += '</div>';	
			}
            html += '</div>';
        $dataDiv.after(html);
	}
}

/**
 * 隐藏没有数据提示
 * @param llId
 */
function hideNoDataMsg(llId){
	var $dataDiv = $('#' + llId);
	$dataDiv.show();
	var $msgDiv = $('div[ll_id="'+llId+'"]');
	if($msgDiv && $msgDiv.length > 0){
		$msgDiv.hide();
	}
}

/**
 * 全选按钮
 * @param chk
 * @param name
 */
function checkAllClick(chk, name){
	$('input[name="'+name+'"]:checkbox').attr('checked', chk.checked);
	$('input[name="'+$(chk).attr('name')+'"]').attr('checked', chk.checked);
}

function headerAddClass(){
	//$('#headrDiv').addClass('index');
}
