<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>会员信息</title>
        <script type="text/javascript" src="js/jquery-3.2.1.slim.min.js"></script>
        <script type="text/javascript">
        	$(function(){
        		$("tr:even").css("background","red");
        	});
        </script>
    </head>
    <body>
    	<table border="1px" style="width: 500px">
    		<tr>
    			<th colspan="6">俱乐部会员信息</th>
    		</tr>
    		<tr>
    			<th>编号</th>
    			<th>姓名</th>
    			<th>性别</th>
    			<th>年龄</th>
    			<th>家庭住址</th>
    			<th>Email</th>
    		</tr>
    		<c:forEach var="membersinfo" items="${membersinfos}">
    			<tr>
	    			<td><a href="GetMIdFindMembersinfoServlet?mId=${membersinfo.mId}">${membersinfo.mId}</a></td>
	    			<td>${membersinfo.mName}</td>
	    			<td>${membersinfo.mGender}</td>
	    			<td>${membersinfo.mAge}</td>
	    			<td>${membersinfo.mAdderss}</td>
	    			<td>${membersinfo.mEmail}</td>
	    		</tr>
    		</c:forEach>
    	</table>
 	</body>
</html>