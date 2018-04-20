package com.cz.web;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.cz.dao.IDdDao;
import com.cz.dao.impl.DdDaoImpl;
import com.cz.entity.Users;

public class doinsertGWC extends HttpServlet {

	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		this.doPost(request, response);
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
			request.setCharacterEncoding("utf-8");
			HttpSession session=request.getSession();
			
			Users u=(Users)session.getAttribute("uu");
			if(u==null){
				response.sendRedirect("login.jsp");
				return;
			}
			String type=request.getParameter("type");
			
			int sid=Integer.parseInt(request.getParameter("sid"));
			IDdDao d=new DdDaoImpl();
			 boolean bl=d.insertSp(u.getuId(), sid, 1,"´ý¸¶¿î");
			 
			 System.out.print(bl);
			 
			 if(type!=null){
				 request.getRequestDispatcher("search.jsp").forward(request,response);
				 return;
			 }
			 
			request.getRequestDispatcher("list.jsp").forward(request,response);
	}

}
