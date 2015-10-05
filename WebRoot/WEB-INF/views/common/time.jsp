<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@page import="java.util.GregorianCalendar"%>
<%@page import="java.util.TimeZone"%>
<%@page import="java.util.Calendar"%>
<%@ page language="java" pageEncoding="UTF-8"%>
<%@ include file="jstl.jsp" %>

<script src="${ctx }/static/plugins/jquery/jquery.MyDigitClock.js" type="text/javascript"></script>

<%
Date date = new Date();
SimpleDateFormat outputFormat = new SimpleDateFormat("yyyy/MM/dd HH:MM:ss");

outputFormat.setTimeZone(TimeZone.getTimeZone("Asia/Hong_Kong"));
String xgStr = outputFormat.format(date);

outputFormat.setTimeZone(TimeZone.getTimeZone("NZ"));
String xxlStr = outputFormat.format(date);

outputFormat.setTimeZone(TimeZone.getTimeZone("Japan"));
String rbStr = outputFormat.format(date);

outputFormat.setTimeZone(TimeZone.getTimeZone("ECT"));
String ygStr = outputFormat.format(date);

outputFormat.setTimeZone(TimeZone.getTimeZone("America/Los_Angeles"));
String mgStr = outputFormat.format(date);

%>

<script type="text/javascript">
$(function(){
	$('#clock-time-xg').MyDigitClock({time : '<%=xgStr %>'});
	$('#clock-time-xxl').MyDigitClock({time : '<%=xxlStr %>'});
	$('#clock-time-rb').MyDigitClock({time : '<%=rbStr %>'});
	$('#clock-time-yg').MyDigitClock({time : '<%=ygStr %>'});
	$('#clock-time-mg').MyDigitClock({time : '<%=mgStr %>'});
});

</script>

<div class="J_content mt20 bgfff hasShadow">
     <div class="J_time clearfix">
         <div class="t_item">
             <div class="i_icon">
                 <img height="24" src="${ctx }/static/images/flag_xg.png">
             </div>
             <div class="i_txt" id="clock-time-xg">00:00:00</div>
         </div>
         <div class="t_item">
             <div class="i_icon">
                 <img height="24" src="${ctx }/static/images/flag_xxl.png">
             </div>
             <div class="i_txt" id="clock-time-xxl">00:00:00</div>
         </div>
         <div class="t_item">
             <div class="i_icon">
                 <img height="24" src="${ctx }/static/images/flag_rb.png">
             </div>
             <div class="i_txt" id="clock-time-rb">00:00:00</div>
         </div>
         <div class="t_item">
             <div class="i_icon">
                 <img height="24" src="${ctx }/static/images/flag_yg.png">
             </div>
             <div class="i_txt" id="clock-time-yg">00:00:00</div>
         </div>
         <div class="t_item">
             <div class="i_icon">
                 <img height="24" src="${ctx }/static/images/flag_mg.png">
             </div>
             <div class="i_txt" id="clock-time-mg">00:00:00</div>
         </div>

     </div>
 </div>