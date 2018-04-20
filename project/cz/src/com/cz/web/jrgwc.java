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

public class jrgwc extends HttpServlet {

	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

			this.doPost(request, response);
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
			request.setCharacterEncoding("utf-8");
			
			
			HttpSession session =request.getSession();

			Users u=(Users)session.getAttribute("uu");
			
			if(u==null){
				response.sendRedirect("login.jsp");
				return;
			}
			int num=Integer.parseInt(request.getParameter("shuliang"));
			int spid=Integer.parseInt(request.getParameter("spid"));	//ÉÌÆ·id
			
			
			IDdDao d=new DdDaoImpl();
			boolean bl= d.insertSp(u.getuId(), spid, num, "´ý¸¶¿î");

			request.setAttribute("spid",spid);
			request.setAttribute("spXTypeId",request.getParameter("spxtypeid"));
			
			
			if(request.getParameter("b")!=null){
				request.getRequestDispatcher("detail.jsp").forward(request, response);
			}
			if(request.getParameter("a")!=null){
				request.getRequestDispatcher("confirm.jsp").forward(request, response);
			}
			
	}

}
