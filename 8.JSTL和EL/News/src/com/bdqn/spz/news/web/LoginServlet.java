package com.bdqn.spz.news.web;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.bdqn.spz.news.dao.IUserDao;
import com.bdqn.spz.news.dao.impl.UserDaoImpl;
import com.bdqn.spz.news.entity.User;

public class LoginServlet extends HttpServlet {

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
		String uname=request.getParameter("uname");
		String upwd=request.getParameter("upwd");
		IUserDao usersDao=new UserDaoImpl();
		User users=new User(uname,upwd);
		if(usersDao.login(users)!=null){
			session.setAttribute("admin",uname);
			request.getRequestDispatcher("admin.jsp").forward(request,response);
		}else{
			/*response.sendRedirect("login.jsp");*/
			request.getRequestDispatcher("login.jsp").forward(request,response);
		}
		out.flush();
		out.close();
	}

}
