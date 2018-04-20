package com.bdqn.spz.news.web;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.bdqn.spz.news.dao.ITopicDao;
import com.bdqn.spz.news.dao.impl.TopicDaoImpl;
import com.bdqn.spz.news.entity.Topic;

public class UpdateNews extends HttpServlet {

	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		doPost(request, response);
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=UTF-8");
		response.setCharacterEncoding("UTF-8");
		PrintWriter out = response.getWriter();
		HttpSession session = request.getSession();
		if(session.getAttribute("admin")==null){
			response.sendRedirect("web/login.jsp");
		}
		request.setCharacterEncoding("UTF-8");
		Topic topic=new Topic(Integer.parseInt(request.getParameter("ztold")),request.getParameter("ztnew"));
		ITopicDao topicDao=new TopicDaoImpl();
		if(topicDao.upDateN(topic)>0){
			out.print("<script" +
					" type='text/javascript'> alert('修改成功！');" +
					"location.href('web/Topic.jsp');"+
					"</script>");
		}else{
			out.print("<script" +
					" type='text/javascript'> alert('修改失败！');" +
					"location.href('web/Topic.jsp');"+
					"</script>");	
		}
		out.flush();
		out.close();
	}
}
