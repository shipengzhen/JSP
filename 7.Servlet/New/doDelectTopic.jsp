<%@page import="com.bdqn.spz.news.service.impl.TopicServiceImpl"%>
<%@page import="com.bdqn.spz.news.service.ITopicService"%>
<%@page import="com.bdqn.spz.news.service.impl.NewsServiceImpl"%>
<%@page import="com.bdqn.spz.news.service.INewsService"%>
<%@page import="com.bdqn.spz.news.entity.Topic"%>
<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>
<%
	if(session.getAttribute("admin")==null){
		response.sendRedirect("login.jsp");
	}
	
	request.setCharacterEncoding("UTF-8");
	int tid=Integer.parseInt(request.getParameter("value1"));
	
	INewsService newsService=new NewsServiceImpl();
	if(newsService.findNewsByTId(tid)){
%>
		<script type="text/javascript">
			alert("该主题下还有文章，不能删除!");
			location.href("Topic.jsp");
		</script>		
<%
		return;
	}
	
	ITopicService topicService=new TopicServiceImpl();
	if(topicService.deleteTopic(tid)>0){
%>
		<script type="text/javascript">
			alert("删除成功");
			location.href("Topic.jsp");
		</script>		
<%
	
	}else{
%>
		<script type="text/javascript">
			alert("删除失败");
			location.href("Topic.jsp");
		</script>
<%
	}
%>