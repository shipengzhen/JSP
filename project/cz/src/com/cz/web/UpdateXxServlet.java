package com.cz.web;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.cz.dao.IUsersDao;
import com.cz.dao.impl.UsersDaoImpl;
import com.cz.entity.Users;

public class UpdateXxServlet extends HttpServlet {

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
		String sex=request.getParameter("sex");
		Users uu=(Users)session.getAttribute("uu");
		if(uname==null||sex==null||uname.equals("")||(!sex.equals("ÄÐ")&&!sex.equals("Å®"))){
			response.sendRedirect("member_center.jsp");
			return;
		}
		IUsersDao usersDao=new UsersDaoImpl();
		usersDao.updateUXx(uu.getuId(),uname,sex);
		response.sendRedirect("member_center.jsp");
		out.flush();
		out.close();
	}

}
