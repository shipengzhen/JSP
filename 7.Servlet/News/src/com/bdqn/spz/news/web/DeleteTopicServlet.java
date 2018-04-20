package com.bdqn.spz.news.web;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.bdqn.spz.news.dao.INewsDao;
import com.bdqn.spz.news.dao.ITopicDao;
import com.bdqn.spz.news.dao.impl.NewsDaoImpl;
import com.bdqn.spz.news.dao.impl.TopicDaoImpl;

public class DeleteTopicServlet extends HttpServlet {

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
			response.sendRedirect("login.jsp");
		}
		request.setCharacterEncoding("UTF-8");
		int tid=Integer.parseInt(request.getParameter("value1"));
		INewsDao newsDao=new NewsDaoImpl();
		if(newsDao.findNewsByTId(tid)){
			out.print("<script " +
					"type='text/javascript'>" +
					" alert('该主题下还有文章，不能删除!');" +
					"location.href('web/Topic.jsp');" +
					"</script>");	
			return;
		}
		
		ITopicDao topicDao=new TopicDaoImpl();
		if(topicDao.deleteTopic(tid)>0){
			out.print("<script " +
					"type='text/javascript'>" +
					" alert('删除成功！');" +
					"location.href('web/Topic.jsp');" +
					"</script>");
		}else{
			out.print("<script " +
					"type='text/javascript'>" +
					" alert('删除失败!');" +
					"location.href('web/Topic.jsp');" +
					"</script>");	
		}
		out.flush();
		out.close();
	}

}
