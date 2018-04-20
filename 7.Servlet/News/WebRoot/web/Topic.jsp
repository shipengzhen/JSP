<%@page import="com.bdqn.spz.news.entity.Topic"%>
<%@page import="com.bdqn.spz.news.dao.impl.TopicDaoImpl"%>
<%@page import="com.bdqn.spz.news.dao.ITopicDao"%>
<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>
<%
	if(session.getAttribute("admin")==null){
		request.getRequestDispatcher("web/login.jsp").forward(request,response);
	}
 %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>主题页面</title>
    </head>
    <body>
    	<ul>
			<%
				ITopicDao topicDao=new TopicDaoImpl();
				for(Topic topic:topicDao.findTopicAll()){
			%>
			<li>
	    		<label><%=topic.gettName()%></label>&nbsp;&nbsp;&nbsp;&nbsp;
	    		<a href="updateTopic.jsp?value1=<%=topic.gettId()%>&value2=<%=topic.gettName()%>">修改</a>&nbsp;&nbsp;&nbsp;&nbsp;
	    		<a href="../DeleteTopicServlet?value1=<%=topic.gettId()%>">删除</a>
    		</li>
			<%	
				} 
			%>
    	</ul>
 	</body>
</html>