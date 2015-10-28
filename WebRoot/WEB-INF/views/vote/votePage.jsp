<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<!DOCTYPE>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<%@ include file="../common/common.jsp"%>

<script type="text/javascript">

var globalPostId = '';
$(function(){
	
	//headerAddClass();
	
	$('a[name="doVote_href"]').bind('click',function(event){
		event.preventDefault();
		
		$.post(
	       	"${ctx }/vote/randomValidate",
	       	{randomCode:$('#randomCode').val()},
	       	function(json) {
	       		if(json.success){
	       			if($('#isVoteTime').val()=='false'){
	       				jc.alert('当前不是投票有效期，谢谢');
	       				return false;
	       			}
	       			var optionId = $('input:radio[name=currentTopic_radio]:checked').val();
	       			if(optionId == null || optionId == ''){
	       				jc.alert('请选择投票选项');
	       				return false;
	       			}
	       			$.ajax({
	       				type: "POST",
	       	           	url:"${ctx }/vote/doVote",
	       	        	data:{'voteTopic.id':$('#currentTopicId').val(),id:optionId},
	       	        	async: false,
	       	        	success:function(json) {
	       	           		if(json.success){
	       	           			jc.alert('投票成功', function(b){
	       	           				window.location.replace("${ctx }/vote/link?id="+$('#currentTopicId').val());
	       	           			});
	       	           		}else{
	       	           			if(json.code=='401'){
	       	           				jc.alert('请勿重复投票！')
	       	           			}else{
	       	           				jc.alert('失败');
	       	           			}
	       	           		}
	       	           	}    
	       			});	
	       		}else{
	       			if(json.code=='404'){
	       				jc.alert('验证码错误!');
		    			return false;
	       			}
	       		}
	       	}    
	    );
	});
	
	$('a[name="doPost_href"]').bind('click',function(event){
		event.preventDefault();
		
		if($.trim($('textarea[name=postContent]').val()) == ''){
			jc.alert('发表内容不能为空！');return false;
		}
		
		$.ajax({                                                 
	        type: "POST",                                     
	        url: "${ctx}/vote/doPost",
	        async: false,
	        data:{"voteTopic.id":$('#currentTopicId').val(),"postContent":$('textarea[name=postContent]').val()},
	        success: function(json){   
	          	if(json.success){
	          		jc.alert('回复成功', function(b){
	          			window.location.href="${ctx}/vote/index/list";
	          		});
	          	}else{
	          		if(json.code == "406"){jc.alert('抱歉，该投票停止评论！'); return false;}
	          		jc.alert('回复失败'); 
	          	}
	        }   
	   	});
	});
	
});

/*第一种形式 第二种形式 更换显示样式*/
function setTab(name, cursel, n) {
    for (var i = 1; i <= n; i++) {
        var menu = document.getElementById(name + i);
        var con = document.getElementById("con_" + name + "_" + i);
        menu.className = i == cursel ? "t_txt active" : "t_txt";
        con.style.display = i == cursel ? "block" : "none";
    }
}

function doPraise(obj,postId){
	$.post("${ctx }/vote/doPraise",
    	{id:postId},
    	function(json) {
       		if(json.success){
       			jc.alert('点赞成功', function(b){
	  				$(obj).children('span').text(json.message);
       			});
       		}else{
       			if(json.code=='405'){jc.alert('请先登录！');return false;}
       			if(json.code=='402'){jc.alert('请勿重复点赞！');return false;}
       			jc.alert('点赞失败');
       		}
       	}    
	);
}
function doReplayPraise(obj,replayId){
	$.post(
        "${ctx }/vote/doReplayPraise",
    	{id:replayId},
    	function(json) {
       		if(json.success){
       			jc.alert('点赞成功', function(b){
	  				$(obj).children('span').text(json.message);
       			});
       		}else{
       			if(json.code=='405'){ jc.alert('请先登录！');return false;}
       			if(json.code=='402'){ jc.alert('请勿重复点赞！');return false;}
       			jc.alert('点赞失败');
       		}
       	}    
	);
}

function doReport(obj,postId){
	$.post(
       	"${ctx }/vote/doReport",
    	{id:postId},
    	function(json) {
       		if(json.success){
       			jc.alert('举报成功', function(b){
       				$(obj).text("举报("+json.message+")");
       			});
       		}else{
       			if(json.code=='405'){ jc.alert('请先登录！');return false;}
       			if(json.code=='403'){ jc.alert('请勿重复举报！');return false;}
       			jc.alert('举报失败');
       		}
       	}    
	);
}
function doReplayReport(obj,replayId){
	$.post(
       	"${ctx }/vote/doReplayReport",
    	{id:replayId},
    	function(json) {
       		if(json.success){
       			jc.alert('举报成功', function(b){
       				$(obj).text("举报("+json.message+")");
       			});
       		}else{
       			if(json.code=='405'){ jc.alert('请先登录！');return false;}
       			if(json.code=='403'){ jc.alert('请勿重复举报！');return false;}
       			jc.alert('举报失败');
       		}
       	}    
	);
}


function showDialog(postId) {
	
	globalPostId = postId;
	
    jc.dialog.get("${ctx}/vote/replayDialog", function (obj) {
        obj.show();
    }, "token_21");
}

function postReplay(){
	if($('#randomCode2').val() == ''){
		jc.alert('请输入验证码！');return false;
	}
	$.post(
       	"${ctx }/vote/randomValidate",
       	{randomCode:$('#randomCode2').val()},
       	function(json) {
       		if(json.success){
       			if($('#replayContent').val() ==''){
       				jc.alert('回复内容不能为空！');return false;
       			}
       			$.post("${ctx}/vote/doReplay",
   					{'voteTopic.id':$('#currentTopicId').val(),'voteTopicPost.id':globalPostId,
   						'replayContent':$('#replayContent').val()},
   					function(json){
   						if(json.success){
   							window.location.href="${ctx}/vote/link?id="+$('#currentTopicId').val();
   						}else{
   							if(json.code == '405'){
   								jc.alert('请登录后再回复！');return false;
   							}
   							jc.alert('回复失败');
   						}
   					}
   				);       			
       		}else{
       			jc.alert('验证码错误！');return false;
       		}
       	}
	);
}

function countWords(){
	var numb = 255 - parseInt($('textarea[name=postContent]').val().length);
	if(numb<0){
		var subStr = $('textarea[name=postContent]').val().substr(0,255);
		$('textarea[name=postContent]').val(subStr);
		return;
	}
	$('#countWords_span').text(numb);
}

function refresh() {
    $("#imageCode").attr("src","${ctx}/imageServlet?"+Math.random());
}
function refresh2() {
    $("#imageCode2").attr("src","${ctx}/imageServlet?"+Math.random());
}

</script>

</head>

<%@ include file="../common/nice-validator.jsp" %>

<body>
	<%@ include file="../common/head.jsp" %>
	
    <div class="bgfff">
        <div class="J_content">
            <div class="plrb20">
                <div class="clearfix">
                    <div class="fl w50p">
                        <div class="plr10">
                            <div class="J_miniTitle">
                                <div class="m_token"></div>
                                <div class="m_txt">本期投票</div>
                                <input id="isVoteTime" type="hidden" value="${currentTopic.isVoteTime }">
                            </div>
                            <div class="J_vote">
                                <div class="v_title">${currentTopic.titleContent}
                                 	<input type='hidden' id='currentTopicId' value='${currentTopic.id}'>
                                 </div>
                                 <div class="v_content">
                                 	<c:forEach items="${currentTopic.options }" var="option">
                                 		<div class="c_item">
                                         <a href="javascript:">
                                         	 <label><input type="radio" name="currentTopic_radio" value="${option.id }"/>${option.optionContent }</label></a>
                                     	</div>
                                 	</c:forEach>
                                 </div>
                            </div>
                        </div>
                    </div>
                    
                    <div class="fr w50p">
						<div class="plr10">
                            <div class="J_miniTitle">
                                <div class="m_token"></div>
                                <div class="m_txt">过往投票</div>
                            </div>
                            <div class="J_vote next">
                               	<c:forEach items="${historyTopics }" var="historyTopic">
                                    <div class="v_title">
                                 		<div class="t_left"><a class="alink black hover" href="${ctx }/vote/link?id=${historyTopic.id}"">${historyTopic.titleContent }<span><i class="icon">󰁦</i>${historyTopic.voteCount }</span></a></div>
                             	    	<div class="t_right"><fmt:formatDate value="${historyTopic.startDate}" pattern="yyyy-MM-dd HH:mm:ss"/></div>
                             		</div>                          	
                               	</c:forEach>
                            </div>
                        </div>
                	</div>
                </div>


                <div class="J_miniTitle mt10">
                    <div class="m_token"></div>
                    <div class="m_txt">本期投票结果（<span class="cOrange">${currentTopic.voteCount}</span>人参与）</div>
                </div>

                <div class="J_voteSuccess">
					<c:forEach items="${currentTopic.options }" var="option">
                   		<div class="v_item">
                   			<div class="i_left">${option.optionContent }</div>
							<div class="i_right">
                    			<c:choose>
                    				<c:when test="${currentTopic.voteCount == null || currentTopic.voteCount == 0 }">
										<div style="width:0%; background-color: #ee6a53;" class="r_bar">
                               				<div class="b_txt">0%</div>
                               			</div>                    					
                    				</c:when>
                    				<c:otherwise>
                               			<div style="width:<fmt:formatNumber type='number' value='${option.voteCount*100/currentTopic.voteCount}' maxFractionDigits='0'/>%; background-color: #ee6a53;" class="r_bar">
                               				<div class="b_txt"><fmt:formatNumber type="number" value="${option.voteCount*100/currentTopic.voteCount}" maxFractionDigits="0"/>%</div>
                               			</div>
                               		</c:otherwise>
                    			</c:choose>
                    		</div>                    			
                   		</div>
                   	</c:forEach>                    
                </div>

                <div class="J_toolsBar">
                    <div class="fr">
                        <div class="t_text mini">
                            <label>
                                <input placeholder="验证码" type="text" id="randomCode">
                            </label>
                        </div>
                        <div class="ml10 t_code">
                            <a href="javascript:refresh();">
                                <img id="imageCode" src="${ctx }/imageServlet"/>
                            </a>
                        </div>
                        <div class="ml10 t_button">
                            <a class="abtn orange" href='' name="doVote_href">我要投票</a>
                        </div>
                    </div>
                </div>
            </div>

            <div class="J_tab">
                <div id="one1" onclick="setTab('one',1,2)" class="t_txt active">全部评论（${currentTopic.postCount}）</div>
                <div id="one2" onclick="setTab('one',2,2)" class="t_txt">我的回复（${currentUserPostNumb}）</div>
            </div>

            <div class="pau">
            <form action="" name="form" id="form" method="post" theme="simple">
                <div id="con_one_1">
                    <div data-ui="commentsList" class="J_commentsList">
                    	<c:forEach items="${page.list }" var="post">
	                        <div class="c_item">
	                            <div class="i_left">
	                                <div class="l_img">
	                                    <img src="${ctx }/static/tmp/face_08.jpg">
	                                </div>
	                                <div class="l_hg"></div>
	                            </div>
	                            
	                            <div class="i_right">
	                                <div class="r_info clearfix">
	                                    <div class="fl">
	                                    	<div class="i_now">${post.floorNumb }楼</div> ${fn:substring(post.publisher.mobile, 0, 3)}****${fn:substring(post.publisher.mobile, 8, 11)} 时间: 
	                                    		<fmt:formatDate value="${post.createDate}" pattern="yyyy-MM-dd HH:mm:ss"/>
	                                    </div>
										<div class="fr">
	                                        <a class="i_replyBtn" href="javascript:;" onclick="doPraise(this,'${post.id }')">
	                                        	<i class="icon">󰄼</i>赞(<span>${post.praiseCount}</span>)</a>
	                                        <span>| </span>
	                                        <a class="i_replyBtn" href="javascript:showDialog('${post.id }');">回复</a>
	                                        <span>| </span>
	                                        <a class="i_replyBtn" href="javascript:;" onclick="doReport(this,'${post.id }')">举报(${post.reportCount })</a>
	                                    </div>	                                    
	                                </div>
	                                <div class="r_content">${post.postContent }</div>
	
	                                <div class="r_reply">
	                                	<c:forEach items="${post.postReplays }" var="replay">
											<div class="c_item">
		                                        <div class="i_left">
		                                            <div class="l_img">
		                                                <img src="${ctx }/static/tmp/face_04.jpg">
		                                            </div>
		                                            <div class="l_hg"></div>
		                                        </div>
		                                        <div class="i_right">
		                                            <div class="r_info">${fn:substring(replay.replayer.mobile, 0, 3)}****${fn:substring(replay.replayer.mobile, 8, 11)} 
		                                            		回复 ${fn:substring(post.publisher.mobile, 0, 3)}****${fn:substring(post.publisher.mobile, 8, 11)}
		                                            		时间: <fmt:formatDate value="${replay.createDate}" pattern="yyyy-MM-dd HH:mm:ss"/></div>
	                                                <div class="fr">
	                                                    <a class="i_replyBtn" href="javascript:;" onclick="doReplayPraise(this,'${replay.id }')">
	                                                    	<i class="icon">󰄼</i>赞(<span>${replay.praiseCount}</span>) </a>
	                                                    <span>| </span>
	                                                    <a class="i_replyBtn" href="javascript:;" onclick="doReplayReport(this,'${replay.id }')">举报(${replay.reportCount })</a>
	                                                </div>
	                                                <div class="r_content">${replay.replayContent }</div>		                                            
		                                        </div>
		                                    </div>
	                                	</c:forEach>
	                                </div>
	                            </div>
	                        </div>
	                	</c:forEach>
                    </div>
                    <div class="j_page">
                    	<br>
	                	<tr><td colspan="50" style="text-align:center;"><%@ include file="../common/pager.jsp"%></td></tr>
	                </div>
                </div>

                <div id="con_one_2" style="display:none;">    
                    <div data-ui="commentsList" class="J_commentsList">
						<c:forEach items="${currentUserPosts }" var="post">
						    <div class="c_item">
	                            <div class="i_left">
	                                <div class="l_img">
	                                    <img src="${ctx }/static/tmp/face_03.jpg">
	                                </div>
	                                <div class="l_hg"></div>
	                            </div>
	                            <div class="i_right">
	                                <div class="r_info clearfix">
	                                    <div class="fl">${fn:substring(post.publisher.mobile, 0, 3)}****${fn:substring(post.publisher.mobile, 8, 11)}  
	                                    		时间: <fmt:formatDate value="${post.createDate}" pattern="yyyy-MM-dd HH:mm:ss"/></div>
	                                </div>
	                                <div class="r_content">${post.postContent }</div>
	                            </div>
	                        </div>
						</c:forEach>
                    </div>
                </div>
			</form>

                <div data-ui="reply" class="J_reply">
                    <div data-ui="title" class="J_title">
                        <div class="t_txt">我要发表</div>
                    </div>
                   
               		<div class="r_textarea">
               			<textarea class="t_textarea" name="postContent" onkeyup="countWords()"></textarea>
               			<c:if test="${memberLogin == null }">
               				<div class="t_tips">请先 <a class="abtn green" href="${ctx }/login">登录</a> | <a class="abtn green" href="${ctx }/register">注册</a></div>
               			</c:if>
               		</div>

                    <div class="J_toolsBar">
                        <div class="fr">
                            <div class="t_label plr10">还可以输入<span class="l_range cOrange" id='countWords_span'>255</span>字</div>
                            <div class="ml10 t_button">
	                            <c:choose>
		                    		<c:when test="${memberLogin == null }">
		                    			<a class="b_submit abtn gray" href="javascript:;">回复</a>
		                    		</c:when>
		                    		<c:otherwise>
		                    			<a class="b_submit abtn orange" href="" name='doPost_href'>回复</a>
		                    		</c:otherwise>
		                    	</c:choose>                            
                            </div>
                        </div>
                    </div>

                </div>
                
            </div>
        </div>
    </div>
	    
	<%@ include file="../common/help.jsp" %>
	<%@ include file="../common/foot.jsp" %>

</body>
</html>
