<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>
<%
	if(session.getAttribute("admin")==null){
		response.sendRedirect("login.jsp");
	}
 %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>修改主题</title>
        <style type="text/css">
        	#div{
        		border: 1px red solid;
        		width: 300px;
        		margin: 100px auto;
        	}
        	#div1{
        		text-align: center;
        	}
        	#div div{
        		margin: 30px;
        	}
        </style>
    </head>
    <body>
    	<form action="DateNewsServlet" method="post">
    		<div id="div">
    			<div id="div1"><%=new String(request.getParameter("value2").getBytes("ISO-8859-1"),"UTF-8")%></div>
    			<div>
    				<input style="display: none;" type="text" name="ztold" id="" value=<%=request.getParameter("value1")%> />
    				修改主题 <input type="text" name="ztnew" id="" value="" />
    				</div>
    			<div>
    				<input type="submit" name="tj" id="" value="提交" />
    				<input type="reset" name="cz" id="" value="重置" />
    			</div>
    		</div>
    	</form>
 	</body>
</html>