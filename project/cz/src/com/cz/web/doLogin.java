package com.cz.web;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.cz.dao.IUsersDao;
import com.cz.dao.impl.UsersDaoImpl;
import com.cz.entity.Users;

public class doLogin extends HttpServlet {


	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		this.doPost(request, response);
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=UTF-8");
		response.setCharacterEncoding("UTF-8");
		PrintWriter out=response.getWriter();
		String name=request.getParameter("name");
		String pwd=request.getParameter("pwd");
		IUsersDao us=new UsersDaoImpl();
		Users uu=us.findbypwd(name, pwd);
		if(uu!=null){
			HttpSession session=request.getSession();
			session.setAttribute("uu",uu);
			//out.print("<script type='text/javascript'>location('index.jsp');</script>");//js
			out.print("<script type='text/javascript'>location.href='index.jsp';</script>");//jquery
		}else{
			out.print(
					"<script type='text/javascript'> " +
					"alert('用户名或密码错误'); " +
					"location.href='login.jsp'; "+
					"</script>");
		}
	}

}
