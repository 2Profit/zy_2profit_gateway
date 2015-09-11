/**
 * 
 */

var PAGESIZE = 10;
var MSG_NO_DATA = '无查询结果';
var MSG_PARAM_WRONG = '参数有误';
//数据状态
var DELETE_STATUS_NAMES = {
		'0' : '正常',
		'1' : '删除'
};

var TEACHER_TYPE_CLA = 0;
var TEACHER_TYPE_TEA = 1;
var TEACHER_TYPES = {
		'0' : '班主任',
		'1' : '辅导老师'
};

var YES_NO = {
		'0' : '否',
		'1' : '是'
};

var LEVEL = {
		'0' : '很好',
		'1' : '较好',
		'2' : '一般',
		'3' : '较差'
};

var ABCD = {
		'A' : 'A 优秀',
		'B' : 'B 良好',
		'C' : 'C 及格',
		'D' : 'D 不及格',
};

var ARRANGEMENT_TYPE = {
		'coach' : '线下辅导',
		'test' : '线下测试'
};

var MEMBER_TYPE = {
		'0' : '普通会员',
		'1' : '在线会员',
		'2' : '综合班会员'
};

var SEX_ENUM = {
		'MALE' : '0',
		'FEMALE' : '1'
};

function getDeleteFlagTd(val){
	return '<td class="_delete_flag '+ (val == '1' ? 'delete_font_color' : '') +'" df="'+val+'">'+DELETE_STATUS_NAMES[val]+'</td>';
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
 * 地市联动
 * @param n		onChange的select的name
 * @param sName 注入值得select的name
 */
function myAreaChange(n, sName){
	var id = $('select[name="'+n+'"]').val();
	if(!id){
		id = $('select[_name="'+n+'"]').val();
	}
	var $select = $('select[name="'+sName+'"]');
	if(!$select || $select.length == 0){
		$select = $('select[_name="'+sName+'"]');
	}
	$select.html('');
	if(sName.indexOf('City') > -1){
		$select.append('<option value="">选择地市</option>');
	}else if(sName.indexOf('County') > -1){
		$select.append('<option value="">选择县区</option>');
	}
	if(id){
		$.ajax({
			url : ctx + '/common/ajax/findAreaByParent',
			method : 'post',
			data : {
				'parentId' : id
			},
			async : false,
			success : function(result){
				if(result.success){
					$.each(result.data, function(idx, obj){
						$select.append('<option value="'+obj.id+'">'+obj.name+'</option>');
					});
					if(sName == 'areaCity'){
						//myAreaChange('areaCity', 'areaCounty');
						$select.change();
					}
				}else{
					alert(result.msg);
				}
			}
		});
	}
	
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

//将数组值 标签包裹
function arrToStr(objs){
	var html = '';
	if(!objs || objs.length == 0){
		return '';
	}
	var arr = new Array();
	$.each(objs, function(idx, obj){
		arr.push('<p>' + obj + '</p>');
	});
	return arr.join('');
}

function checkAllClick(chk, name){
	$('input[name="'+name+'"]:checkbox').attr('checked', chk.checked);
	$('input[name="'+$(chk).attr('name')+'"]').attr('checked', chk.checked);
}

function initDailogArrange(time){
	
	if(!time){
		time = new Date().getTime();
	}

	$('#dialogForm input[name="id"]').val('');
	$('#dialogForm input[name="type"]').val('add');
	
	$('div.Jg_dialogSetClass label.ll_do_type').text('添加课程安排');
	
	$('#dialogForm div.ll_hide_show').show();
	
	$('#dialogForm input[name="classRoom"]').val('');
	
	var val = parseDate(time, 'yy-mm-dd hh:ii');
	$('#dialogForm input[name="startDate"]').val(val);
	$('#dialogForm input[name="endDate"]').val(val);
	if(val){
		val = val.substr(0, 10);
		$('div.Jg_dialogSetClass label.ll_title').text(parseDate(val, 'yy年m月d日 DD'));
	}
	$('#dialogForm input[name="memberId"]').each(function(idx, obj){
		$(obj).attr('checked', true);
	});
}

function initUpdateDailogArrange(id){
	$.ajax({
		url : ctx + '/compre/class/arrangement/ajax/find/arrange/one',
		data : {
			id : id
		},
		async : false,
		success : function(result){
			if(result.success){
				var obj = result.data;
				$('div.Jg_dialogSetClass label.ll_title').text(parseDate(obj.startDateD, 'yy年m月d日 DD'));
				
				$('div.Jg_dialogSetClass label.ll_do_type').text('修改课程安排');
				
				$('#dialogForm div.ll_hide_show').hide();
				
				$('#dialogForm input[name="id"]').val(obj.arrangementId);
				$('#dialogForm input[name="type"]').val('update');
				
				$('#dialogForm input[name="startDate"]').val(parseDate(obj.startDateD, 'yy-mm-dd hh:ii'));
				$('#dialogForm input[name="endDate"]').val(parseDate(obj.endDateD, 'yy-mm-dd hh:ii'));
				$('#dialogForm select[name="topCourseId"]').val(obj.topCourseId);
				$('#dialogForm input[name="teacherId"][value="'+obj.teacherId+'"]').click();
				$('#dialogForm input[name="arrangementType"][value="'+obj.arrangementType+'"]').click();
				$('#dialogForm input[name="classRoom"]').val(obj.classRoom);
				
				$('#dialogForm input[name="memberId"]').attr('checked', false);
				$('#dialogForm input[name="memberId"]').each(function(idx, m){
					var val = $(m).val();
					if(obj.memberIds && obj.memberIds.indexOf(val) > -1){
						$(m).click();
					}
				});
				
			}else{
				alert(result.msg);
			}
		}
	});
	
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

/*------排课显示-----------*/
function genArrangeTd(obj, removeAdd){
	var $td = $('<td>');
	if(obj.currentDay){
		$td.addClass('today');
	}else if(obj.date < currentTime){
		$td.addClass('overdue');
	}
	//
	if(obj.currentMonth){
		var html = '<div class="t_day">';
			html += '<div class="d_num">';
			html += '<div class="n_token"></div>';
			html += '<div class="n_txt">'+obj.dayOfMonth+'</div>';
			
			html += genArrangeDetails(obj.arrangementDTOs);
			
			html += '<div class="n_ctrl">';
			
			if(isArrange && !removeAdd){
				//添加
				if(obj.currentDay || obj.date>currentTime){
					html += '<a href="javascript:setClass('+obj.date+');"><i class="icon">󰅵</i>添加</a>';
				}
			}
			
			//查看
			if(obj.arrangementDTOs && obj.arrangementDTOs.length > 0){
				var idurl = '';
				$.each(obj.arrangementDTOs, function(idx, obj){
					idurl += '&id=' + obj.arrangementId;
				});
				html += '<a href="javascript:showClass('+obj.date+', \''+idurl+'\');"><i class="icon">󰃩</i>查看</a>';
			}
			
		html += '</div>';	
		html += '</div>';	
		html += '</div>';
	}
	$td.append(html);
	
	return $td;
}

function genArrangeDetails(arranges){
	var $div = $('<div class="n_info">');
	if(arranges){
		var i = 0;
		$.each(arranges, function(idx, obj){
			if(i > 2){
				return true;
			}
			$div.append('<div class="i_item">'+parseDateTohi(obj.startDateD)+'-'+parseDateTohi(obj.endDateD)+'</div>');
			i++;
		});
	}
    return $div.get(0).outerHTML;
}

/*--------学习任务--------------*/

function genTaskVideos(videos){
	if(!videos){
		return '';
	}
	var $div = $('<div>');
	$.each(videos, function(idx, v){
		var html = '<tr class="">';
			html += '<td>[课程]</td>';
			html += '<td class="t_line"><div class="l_icon"></div></td>';
			html += '<td class="tl">';
			html += '<a class="s_link" target="_blank" href="'+ctx+'/v/view?id='+v.id+'">'+v.name+' （点击查看）</a>';
			html += '</td>';
			html += '<td>'+v.gradeName+' | '+v.topCourseName+'</td>';
			html += '<td class="tl">时长：'+v.duration+'分钟</td>';
			html += '<td></td>';
			html += '</tr>';
		
		$div.append(html);
	});
	
	return $div.html();
}

function genTaskHomeworks(homeworks){
	if(!homeworks){
		return '';
	}
	var $div = $('<div>');
	$.each(homeworks, function(idx, hw){
		var html ='<tr class="">';
			html += '<td>[练习]</td>';
			html += '<td class="t_line"><div class="l_icon"></div></td>';
			html += ' <td class="tl"><a class="s_link" target="_blank" href="http://www.pinxuew.com/v/homework?homeworkid='+hw.id+'&homeworkType=suitang">'+hw.name+' （点击查看）</a></td>';
			html += '<td>'+hw.gradeName+' | '+hw.topCourseName+'</td>';
			html += '<td class="tl">共计：'+hw.exerciseNum+'个题目</td>';
			html += '<td></td>';
			html += '</tr>';
			
		$div.append(html);
	});
	
	return $div.html();
}

function genTaskTestPaper(testPapers){
	if(!testPapers){
		return '';
	}
	var $div = $('<div>');
	$.each(testPapers, function(idx, tp){
		var html ='<tr class="">';
		html += '<td>[随堂练]</td>';
		html += '<td class="t_line"><div class="l_icon"></div></td>';
		html += ' <td class="tl"><a class="s_link" target="_blank" href="javascript:void(0)">'+tp.name+' （点击查看）</a></td>';
		html += '<td>'+tp.gradeName+' | '+tp.topCourseName+'</td>';
		html += '<td class="tl">共计：'+tp.subjectNum+'个题目</td>';
		html += '<td></td>';
		html += '</tr>';
		
		$div.append(html);
	});
	
	return $div.html();
}

/**
 * 学习任务
 * @param $html
 * @param obj
 * @returns
 */
function genTaskModel($html, obj){
	
	$html.find('span[ll="orderNo"]').html(obj.orderNo);
	
	$html.find('span[ll="chapterName"]').html(obj.chapterName);
	
	var $after = $html.find('tr[ll="after"]');
	
	$after.after(genTaskTestPaper(obj.testPapers));
	
	$after.after(genTaskHomeworks(obj.homeworks));
	$after.after(genTaskVideos(obj.videos));
	
	$html.find('td[ll="learnDemand"]').html(obj.learnDemand);
	$html.find('td[ll="learnTarget"]').html(obj.learnTarget);
	
	if(obj.lectureFileName){
		var url = ctx + '/file/download?fileUrl=' + encodeURIComponent(obj.lectureFileUrl) + '&fileName=' + encodeURIComponent(obj.lectureFileName);
		$html.find('td[ll="lectureFile"]').html('<a class="s_link" target="_blank" href="'+ url +'">'+obj.lectureFileName+' （点击下载）</a>');
	}
	if(obj.answerFileName){
		var url = ctx + '/file/download?fileUrl=' + encodeURIComponent(obj.answerFileUrl) + '&fileName=' + encodeURIComponent(obj.answerFileName);
		$html.find('td[ll="answerFile"]').html('<a class="s_link" target="_blank" href="'+ url +'">'+obj.answerFileName+' （点击下载）</a>');
	}
	
	if(obj.details){
		var $learnDate = $html.find('td[ll="learnDate"]');
		$.each(obj.details, function(i, d){
			var $span = $('<span>').html(parseDate(d.startDate, 'yy年mm月dd日 hh:ii') + '-' + parseDate(d.endDate, 'hh:ii'));
			if(d.startDate <= currentTime){
				$span.addClass('c999');
			}
			$learnDate.prepend($span);
		});
	}
	
	$html.find('div[ll="teacherName"]').html(obj.teacherName);
	if(obj.teacherImgUrl){
		$html.find('img[ll="teacherImgUrl"]').attr('src', ctx + obj.teacherImgUrl);
	}
	
	return $html;
}


function imgErrorMember(img){
	var img_blank_member = ctx + '/static/images/study_boy.jpg';
	$(img).attr('src', img_blank_member);
}

function imgErrorTeacher(img){
	var img_blank_tea = ctx + '/static/images/teacher_boy.jpg';
	$(img).attr('src', img_blank_tea);
}


function genLessonTestScore(obj){
	var html = '<div class="plrb20 mt10 bgfff">';
		html += '<div class="Jg_subTitle">';
		html += '<div class="s_token"></div>';
		html += '<div class="s_txt">';
		html += '<span class="mr10">'+parseDate(obj.startDate, 'yy年mm月dd日 hh:ii')+'-'+parseDate(obj.endDate, 'hh:ii')+'</span>|';
		html += '<span class="mlr10">学员：'+obj.memberName+'</span>|';
		html += '<span class="mlr10">辅导老师：'+obj.teacherName+'</span>|';
		html += '<span class="mlr10">科目：'+obj.topCourseName+'</span>';
		html += '</div>';
		html += '<div class="s_more">';
		html += '<span class="mlr10">正确率：<b class="cOrange">'+obj.rightPercent+'</b> </span>|';
		html += '<span class="mlr10">正确题目：<b class="cGreen">'+obj.rightSubjectNum+'</b>道</span>|';
		html += '<span class="mlr10">错误题目：<b class="cRed">'+obj.wrongSubjectNum+'</b>道</span>';
		html += '</div>';
		html += '</div>';
	
	var testPapers = obj.testPapers;
	var detailMaps = obj.detailMaps;
	
	if(testPapers){
		$.each(testPapers, function(tpidx, tp){
			html += genTestPaper(tp, detailMaps[tp.testPaperId]);
		});
	}
	
	html += '<div class="Jg_classExercises">';
	html += '<table class="c_txt mt10" width="100%">';
	html += '<tbody>';
	html += '<tr>';
	html += '<td class="tc bgF9" style="width: 10%">答题总结反馈</td>';
	html += '<td class="p6">'+obj.msg+'</td>';
	html += '</tr>';
	html += '</tbody>';
	html += '</table>';
	html += '</div>';
	
	html += '<div class="Jg_btnGrounp mt10">';
	html += '<a class="b_btn sm green" href="javascript:baseDialogTestScore(\''+obj.lessonTestScoreId+'\');">修改</a>';
	html += '<a class="b_btn sm red" href="javascript:baseDeleteTestScore(\''+obj.lessonTestScoreId+'\');">删除</a>';
	html += '</div>';
	html += '</div>';
	
	return html;
}

var colNum = 15;

function genTestPaper(tp, detail){
	var html = '<div class="Jg_subTitle">';
		html += '<div class="s_txt"><span class="mr10">随堂练：</span><span>'+tp.testPaperName+'</span></div>';
		html += '</div>';
		html += '<div class="Jg_classExercises">';
		html += '<table class="c_list">';
	
	//tbody中题目信息
	if(detail && detail.length > 0){
		var length = detail.length;
		var rowNum = 0;
		if(length%colNum == 0){
			rowNum = length/colNum + 1;
		}else{
			rowNum = length/colNum;
		}
		for(var i=0;i<rowNum;i++){
			var startIdx = i*colNum;
			var endIdx = (i+1)*colNum;
			if(endIdx > length){
				endIdx = length;
			}
			html += genSubjectTbody(detail, startIdx, endIdx);
		}
	}
		
	html += '</table>';
	html += '</div>';
	
	return html;
}

function genSubjectTbody(detail, startIdx, endIdx){
	var html = '<tbody>';
	html += '<tr>';
	html += '<td class="bgF9 t_fix" style="width: 6%">编号</td>';
	for(var i=startIdx;i < endIdx;i++){
		html += '<td class="bgF9" style="width: 6%">'+detail[i].orderNo+'</td>';
	}
	html += '</tr>';
	html += '<tr>';
	html += '<td class="t_fix cGreen" style="width: 6%">正确答案</td>';
	for(var i=startIdx;i < endIdx;i++){
		html += '<td class="cGreen" style="width: 6%">'+detail[i].rightAnswer+'</td>';
	}
	html += '</tr>';
	html += '<tr>';
	html += '<td class="t_fix" style="width: 6%">学员作答</td>';
	for(var i=startIdx;i < endIdx;i++){
		var clsName = 'cRed';
		if(detail[i].isRight){
			clsName = 'cGreen';
		}
		html += '<td class="'+clsName+'" style="width: 6%">'+detail[i].answer+'</td>';
	}
	html += '</tr>';
	html += '</tbody>';
	return html;
}

function baseDialogTestScore(lessonTestScoreId){
	jc.dialog.get(ctx + "/compre/class/lessonTest/dialog/score/edit?lessonTestScoreId="+lessonTestScoreId,
			function(obj) {
				obj.show();
		}, "dialogTestScore");
}

function baseDeleteTestScore(lessonTestScoreId){
	jc.confirm('确定要删除随堂练成绩吗？', function(b){
		if(b){
			$.ajax({
				url : ctx + '/compre/class/lessonTest/ajax/delete',
				data : {
					'lessonTestScoreId' : lessonTestScoreId
				},
				type : 'post',
				async : false,
				success : function(result){
					if(result.success){
						jc.alert('删除成功！', function(){
							findLessonTestScore();
						});
					}else{
						jc.alert(result.msg);
					}
				}
			});
		}
	});
}

