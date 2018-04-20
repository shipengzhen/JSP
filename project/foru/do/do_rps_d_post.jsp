<%@page import="com.dao.impl.FC"%>
<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>
<%
	//删除一个帖子
	
	request.setCharacterEncoding("UTF-8");
	
	String pid=request.getParameter("pid");//要删的帖子ID
	String UA=(String)session.getAttribute("UA");//身份
	String uid=(String)session.getAttribute("uid");//用户ID
	String puid=request.getParameter("puid");//帖子的UID
	
	//判断身份是否合法
	if(UA=="1"||(uid+"").equals(puid)){
		
		int a=FC.getPostI().DaPost(Integer.parseInt(pid));
		if(a>0){
			out.print(1);//删除成功
		}else{
			out.print(-1);//失败
		}
	}else{
		out.print(-1);//-1失败
	}
	
%>