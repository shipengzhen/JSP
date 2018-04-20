<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Insert title here</title>
</head>
<body>
	<center>
		<form action="${pageContext.request.contextPath}/add.do" method="post">
			序号<input type="text" name="xh"><br>
			姓名<input type="text" name="xm"><br>
			年龄<input type="text" name="nl"><br>
			<button type="submit">添加</button>
		</form>
	</center>
</body>
</html>