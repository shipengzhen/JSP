<%@page import="com.serenity.entity.Student"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Insert title here</title>
</head>
<body>
	<% Student student = (Student)request.getAttribute("student"); %>
	<center>
		<form action="${pageContext.request.contextPath }/modify.do" method="post">
			学号:<%=student.getsNo() %> <input type="hidden" name = "xh" value="<%=student.getsNo() %>"><br>
			姓名:<input name="xm" value="<%=student.getsName() %>"><br>
			年龄:<input name="nl" value="<%=student.getAge() %>"><br>
			<button type="submit">保存</button>
		</form>
		
	</center>
</body>
</html>