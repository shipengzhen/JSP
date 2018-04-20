<%@page import="com.meetingroom.entity.MeetingCroom"%>
<%@page import="java.util.List"%>
<%@page import="com.meetingroom.dao.impl.MeetingRoomDaoImpl"%>
<%@page import="com.meetingroom.dao.IMeetingRoomDao"%>
<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
IMeetingRoomDao meetingRoomDao=new MeetingRoomDaoImpl();
request.setAttribute("meetingCrooms", meetingRoomDao.selectAllCroom());
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>会议室使用情况</title>
        <script type="text/javascript" src="js/jquery-3.2.1.slim.min.js" charset="utf-8"></script>
        <script type="text/javascript">
			$(function(){
				$("tr:even").css("background","red");
			});
		</script>
    </head>
    <body>
    	<table border="1" style="width: 500px;">
			<thead><!--表头-->
				<th>预定编号</th>
				<th>会议室</th>
				<th>预定人</th>
				<th>日期</th>
			</thead>
			<c:forEach var="meetingCroom" items="${meetingCrooms}">
				<tr class="tr">
					<td>${meetingCroom.id}</td>
					<td>${meetingCroom.meeting_name}</td>
					<td>${meetingCroom.advance_name}</td>
					<td>${meetingCroom.meeting_order}</td>
				</tr>
			</c:forEach>
		</table>
		<p><a href="insertMeeting.jsp">预定会议室</a></p>
 	</body>
</html>