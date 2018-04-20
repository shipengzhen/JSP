<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>会员信息</title>
        <script type="text/javascript" src="js/jquery-3.2.1.slim.min.js"></script>
        <script type="text/javascript">
        	$(function(){
        		$("form[name=form]").submit(function(){
        			if($("input[name=mName]").val()==""){
        				alert("不能为空");
        			};
        			if($("input[name=mAge]").val()==""){
        				alert("不能为空");
        			};
        		});
        	});
        </script>
    </head>
    <body>
    	<form action="UpdateMembersinfoServlet" method="post" name="form">
	    	<table border="1px" style="width:400px">
	    		<tr>
	    			<th colspan="2">会员信息</th>
	    		</tr>
	    		<tr>
	    			<th>姓名</th>
	    			<td>
	    				<input style="display: none;" type="text" value="${memberinfo.mId}" name="mId"/>
	    				<input type="text" value="${memberinfo.mName}" name="mName"/>
	    			</td>
	    		</tr>
	    		<tr>
	    			<th>性别</th>		
	    			<td>
	    				<c:choose>
		    				<c:when test="${memberinfo.mGender=='男'}">
		    					<input type="radio" value="男" checked="checked" name="mGender"/>男
		    					<input type="radio" value="女" name="mGender"/>女
		    				</c:when>
		    				<c:otherwise>
		    					<input type="radio" value="男" name="mGender"/>男
		    					<input type="radio" value="女" checked="checked" name="mGender"/>女
		    				</c:otherwise>
		    			</c:choose>
	    			</td>
	    		</tr>
	    		<tr>
	    			<th>年龄</th>
	    			<td><input type="text" value="${memberinfo.mAge}" name="mAge"/></td>
	    		</tr>
	    		<tr>
	    			<th>家庭住址</th>
	    			<td><input type="text" value="${memberinfo.mAdderss}" name="mAdderss"/></td>
	    		</tr>
	    		<tr>
	    			<th>Email</th>
	    			<td><input type="text" value="${memberinfo.mEmail}" name="mEmail"/></td>
	    		</tr>
	    		<tr>
	    			<td colspan="2">
	    				<button type="submit">修改</button>
	    				<button type="reset">重置</button>
	    			</td>
	    		</tr>
	    	</table>
	    </from>
 	</body>
</html>