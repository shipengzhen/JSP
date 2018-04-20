<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>问卷调查</title>
    </head>
    <body>
    	<form id="regFrm" action="MyJsp.jsp" method="post">
        	<table>
	            <tr>
	                <td>昵称:</td>
	                <td><input id="userName" name="userName" type="text"></td>
	            </tr>
	            <tr>
	                <td>所在城市:</td>
	               <td><input id="city" name="city" type="text"></td>
	            </tr>
	            <tr>
	                <td>您使用的开发语言:</td>
	                <td>
	                    <input name="language" type="checkbox" value="Java">Java
	                    <input name="language" type="checkbox" value="C">C
	                    <input name="language" type="checkbox" value="C++">C++
	                    <input name="language" type="checkbox" value="PHP">PHP
	                    <input name="language" type="checkbox" value="ASP">ASP
	                </td>
	            </tr>
	            <tr>
	                <td colspan="2">
	                    <input type="submit" value="提交">
	                </td>
	            </tr>
        	</table>
    	</form>
 	</body>
</html>