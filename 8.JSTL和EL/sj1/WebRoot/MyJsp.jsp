<%@page import="com.bdqn.spz.sj1.entity.User"%>
<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>用EL展示问卷信息</title>
    </head>
    <body>
   <%
		request.setCharacterEncoding("UTF-8");
		//使用语言 
		String[] languages = request.getParameterValues("language");
		request.setAttribute("languages", request.getParameterValues("language"));
     %>
  		您填写的内容是：<br>
    	昵称：${param.userName }<br>
    	所在城市：${param.city }<br>
    	使用的开发语言有：
	<%
	    for (int i = 0; i < languages.length; i++) {
	        if (i > 0) {
	            out.print("、"); 
	        }
	        request.setAttribute("i", i);   //将索引放到请求域中
	%>
	       ${paramValues.language[i]}
    <%  
	    }
	%>
	<p>
		使用的开发语言有：<br>
		<c:forEach var="language" varStatus="index" items="${languages}" begin="" end="5" step="1">
			${language}&nbsp;${index}<br>
		</c:forEach>
	</p>
	
	
	
	
	<p>
		<c:if test="true">111</c:if>
		
		<c:choose>
			<c:when test="false">111</c:when>
			<c:otherwise>222</c:otherwise>
		</c:choose>
	</p>
	
	
	
	
	
	
	<p>
		<c:set var="name" value="呵呵"></c:set>
		${name}
		
		<%
					User user=new User();
					request.setAttribute("user", user);
					request.setAttribute("username", user.getName());
		%>
		<c:set target="${user}" property="name" value="${username}"></c:set>
		${user.name}
		
	</p>
	
	
		<p>${"<a href='http://www.baidu.com'>百度</a>"}</p>
    	<p><c:out escapeXml="Y" value="<a href='http://www.baidu.com'>百度</a>"></c:out></p>
    	<p><c:out value="<a href='http://www.baidu.com'>百度</a>"></c:out></p>
    	
    	<p>
	    	赋值之前：<c:out value="${use}" default="noUserName"></c:out>
	    	赋值：<c:set var="use" value="xixi" scope="page"></c:set>
	    	赋值之后： <c:out value="${use}" default="noUserName"></c:out>
	    	删除:<c:remove var="use" scope="page"></c:remove>
	    	删除之后：<c:out value="${use}" default="noUserName"></c:out>
	    </p>
    	
  </body>
</html>