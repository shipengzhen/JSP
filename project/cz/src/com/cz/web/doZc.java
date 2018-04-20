package com.cz.web;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.cz.dao.IUsersDao;
import com.cz.dao.impl.UsersDaoImpl;

/**
 * ×¢²á
 * @author lizhen
 *
 */
public class doZc extends HttpServlet {

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
			
			if(us.insertUser(name, pwd)){
				out.print( "<script type='text/javascript'>alert('×¢²á³É¹¦');location('login.jsp');</script>");
			}else{
				out.print( "<script type='text/javascript'>alert('×¢²áÊ§°Ü');location('register.jsp');</script>");
			}
			
	}

}
