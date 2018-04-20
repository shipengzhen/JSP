<%@page import="java.util.ArrayList"%>
<%@page import="com.serenity.entity.Student"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Insert title here</title>
</head>
<body>
	<% List<Student> students = (ArrayList<Student>) request.getAttribute("students"); %>
	<table cellpadding="0" cellspacing="0" border="1px">
		<caption>学生信息列表</caption>
		<tr>
			<td>序号</td>
			<td>姓名</td>
			<td>年龄</td>
			<td>操作</td>
		</tr>
		
		<% for(int i = 0;i<students.size();i++){ %>
			<tr>
				<td><%=students.get(i).getsNo() %></td>
				<td><%=students.get(i).getsName() %></td>
				<td><%=students.get(i).getAge() %></td>
				<td>
					<a href="toModify.do?sno=<%=students.get(i).getsNo() %>">修改</a>|
					<a href="toDelete.do?sno=<%=students.get(i).getsNo() %>">删除</a>
				</td>
			</tr>
		<%} %>
	</table>
</body>
</html>