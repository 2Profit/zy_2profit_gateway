<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<!DOCTYPE>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<%@ include file="../common/common.jsp"%>

<script type="text/javascript">

$(function(){
	$('a[name="doVote_href"]').bind('click',function(event){
		event.preventDefault();
		var optionId = $('input:radio[name=currentTopic_radio]:checked').val();
		if(optionId == null || optionId == '')
			jc.alert('请选择投票选项');return false;
		$.ajax({                                                 
	        type: "POST",                                     
	        url: "${ctx}/vote/doVote",                                      
	        data:{"voteTopic.id":$('#currentTopicId').val(),"id":optionId},
	        dataType :"json",
	        success: function(data){   
	          	if(data.sucess){
	          		jc.alert('投票成功'); 
   		    		window.location.href="${ctx}/vote/index";
	          	}else{
	          		jc.alert('投票失败'); 
	          	}
	       }   
	   });
	});
	
	$('a[name="doPraise_href"]').bind('click',function(event){
		event.preventDefault();
		var postId = $(this).children('input').val();
		$.ajax({                                                 
	        type: "POST",                                     
	        url: "${ctx}/vote/doPraise",                                      
	        data:{"id":postId},
	        dataType :"json",
	        success: function(data){   
	          	if(data.sucess){
	          		jc.alert('点赞成功');
	          		$(this).empty();
	          		var html = "<input type='hidden' value='"+postId+"'>举报("+data.model.praiseCount+")";
	          		$(this).append(html);
	          	}else{
	          		jc.alert('点赞失败'); 
	          	}
	       }   
	   });
	});
	
	$('a[name="doReport_href"]').bind('click',function(event){
		event.preventDefault();
		var postId = $(this).children('input').val();
		$.ajax({                                                 
	        type: "POST",                                     
	        url: "${ctx}/vote/doReport",                                      
	        data:{"id":postId},
	        dataType :"json",
	        success: function(data){   
	          	if(data.sucess){
	          		jc.alert('举报成功'); 
	          		$(this).empty();
	          		var html = "<input type='hidden' value='"+postId+"'>举报("+data.model.reportCount+")";
	          		$(this).append(html);
	          	}else{
	          		jc.alert('举报失败'); 
	          	}
	        }   
	   });
	});
	
	$('a[name="doPost_href"]').bind('click',function(event){
		event.preventDefault();
		$.ajax({                                                 
	        type: "POST",                                     
	        url: "${ctx}/vote/doPost",                                      
	        data:{"voteTopic.id":$('#currentTopicId').val(),"postContent":$('textarea[name=postContent]').val()},
	        dataType :"json",
	        success: function(data){   
	          	if(data.sucess){
	          		jc.alert('回复成功');
	          		window.location.href="${ctx}/vote/index";
	          	}else{
	          		jc.alert('回复失败'); 
	          	}
	        }   
	   });
	});
	
});

function showDialog() {
    jc.dialog.get("../dialog/回复评论弹窗.html", function (obj) {
        obj.show();

    }, "token_21")
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


</script>

</head>

<%@ include file="../common/nice-validator.jsp" %>

<body>

	<%@ include file="../common/head.jsp" %>

    <div class="J_wrap">

       <%@ include file="../common/timeZone.jsp" %>

        <div class="J_content mt20 bgfff bg1 hasShadow">
            
            <%@ include file="../common/leftMenu.jsp" %>
            
            <div class="fr c_1000">

                <div class="J_title less">
                    <div class="t_txt">投票</div>
                    <div class="t_tips"></div>
                    <div class="t_more"></div>
                </div>
                <div class="plrb20">
                    <div class="clearfix">
                        <div class="fl w50p">

                            <div class="plr10">

                                <div class="J_miniTitle">
                                    <div class="m_token"></div>
                                    <div class="m_txt">本期投票</div>
                                </div>

                                <div class="J_vote">
                                    <div class="v_title">${currentTopic.titleContent}<input type='hidden' id='currentTopicId' value='${currentTopic.id}'></div>
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
                                    <div class="m_txt">下期投票</div>
                                </div>

                                <div class="J_vote next">
                                    <div class="v_title">你想下一期投票的題目是?</div>
                                    <div class="v_content">
                                        <div class="c_item">
                                            <a href="javascript:">
                                                <label>
                                                    <input disabled="disabled" type="radio" />你認為美元何時加息</label></a>
                                        </div>
                                        <div class="c_item">
                                            <a href="javascript:">
                                                <label>
                                                    <input disabled="disabled" type="radio" />你是否認為A股已見底</label></a>
                                        </div>
                                        <div class="c_item">
                                            <a href="javascript:">
                                                <label>
                                                    <input disabled="disabled" type="radio" />你認為中央救市已有成效</label></a>
                                        </div>

                                    </div>
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
                                    <input placeholder="验证码" type="text">
                                </label>
                            </div>
                            <div class="ml10 t_code">
                                <a href="#">
                                    <img src="${ctx }/static/tmp/code.png" />
                                </a>
                            </div>
                            <div class="ml10 t_button">
                                <a class="abtn orange" href='' name="doVote_href">我要投票</a>
                            </div>
                        </div>

                    </div>



                </div>

                <div class="J_title less">
                    <div class="t_txt">我要回应</div>
                    <div class="t_tips"></div>
                    <div class="t_more"></div>
                </div>

                <div class="pau">
                    <div data-ui="commentsList" class="J_commentsList">
                    	<c:forEach items="${currentTopic.posts }" var="post">
                    		<div class="c_item">
	                    		<div class="i_left">
	                                <div class="l_img">
	                                    <img src="${ctx }/static/tmp/face_08.jpg">
	                                </div>
	                                <div class="l_hg"></div>
	                            </div>
	                            <div class="i_right">
	                            	<div class="r_info clearfix">
                                    <div class="fl">${post.publisher.userName } 时间: <fmt:formatDate value="${post.createDate}" pattern="yyyy-MM-dd"/></div>
                                    <div class="fr">
                                        <a class="i_replyBtn" href='' name="doPraise_href"><i class="icon"></i><input type='hidden' value="${post.id }">赞(${post.praiseCount})</a>
                                        <span>| </span>
                                        <a class="i_replyBtn" href='' name="doReplay_href"><input type='hidden' value="${post.id }">回复</a>
                                        <span>| </span>
                                        <a class="i_replyBtn" href='' name="doReport_href"><input type='hidden' value="${post.id }">举报(${post.reportCount })</a>
                                    </div>
                                    <div class="r_content">${post.postContent }</div>
                                    <div class="r_reply">
                                    	<c:forEach items="${post.postReplays }" var="replay">
	                                    	<div class="c_item">
		                                    	<div class="i_left">
		                                            <div class="l_img">
		                                                <img src="${ctx }/static/tmp/face_06.jpg">
		                                            </div>
		                                            <div class="l_hg"></div>
		                                        </div>
	                                            <div class="i_right">
		                                            <div class="r_info">${replay.replayer.userName } 回复 ${post.publisher.userName } 
		                                            		时间: <fmt:formatDate value="${replay.createDate}" pattern="yyyy-MM-dd"/></div>
		                                            <div class="r_content">${replay.replayContent }</div>
		                                        </div>
		                                    </div>
		                            	</c:forEach>
                                    </div>
                                </div>
                    		</div>
                    	</c:forEach>
                    </div>

                    <div data-ui="reply" class="J_reply">
                        <div data-ui="title" class="J_title">
                            <div class="t_txt">我要发表</div>
                        </div>
                        
                       	<c:choose>
                       		<c:when test="${not empty sessionScope.login_user }">
                       			<div class="r_textarea"><textarea class="t_textarea" name="postContent" onkeyup="countWords()"></textarea></div>
                       		</c:when>
                       		<c:otherwise>
                       			<div class="t_tips">请先 <a class="abtn green" href="${ctx }/login">登录</a> | <a class="abtn green" href="${ctx }/register">注册</a></div>
                       		</c:otherwise>
                       	</c:choose>

                        <div class="J_toolsBar">
                            <div class="fr">
                                <div class="t_label plr10">还可以输入<span class="l_range cOrange" id='countWords_span'>255</span>字</div>
                                <div class="ml10 t_button">
                                    <c:if test="${empty sessionScope.login_user }">
                                    	<a class="b_submit abtn gray" href="javascript:;">回复</a>
                                    </c:if>
                                    <c:if test="${not empty sessionScope.login_user }">
                                    	<a class="b_submit abtn orange" href="" name='doPost_href'>回复</a>
                                	</c:if>
                                </div>
                            </div>
                        </div>

                    </div>
                </div>

                <div class="J_title less">
                    <div class="t_txt">更多投票</div>
                    <div class="t_tips"></div>
                    <div class="t_more"></div>
                </div>

                <div class="J_voteList">
                    <table>
                        <tbody>
							<c:forEach items="${topics }" var="topic">
		                    	<tr>
		                            <td style="width:100px;" class="vat tac c999"><fmt:formatDate value="${topic.startDate}" pattern="yyyy-MM-dd"/></td>
		                            <td><a class="alink black hover" href="#">${topic.titleContent}<span><i class="icon"></i> 166</span></a></td>
		                        </tr>
		                   	</c:forEach>                        
                        </tbody>
                    </table>
                </div>


            </div>
        </div>
    </div>

	<%@ include file="../common/help.jsp" %>
	<%@ include file="../common/foot.jsp" %>

</body>
</html>
