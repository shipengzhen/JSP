package com.cz.web;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.cz.dao.IDdDao;
import com.cz.dao.impl.DdDaoImpl;

public class doGWCdelete extends HttpServlet {

	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		this.doPost(request, response);
	}
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		request.setCharacterEncoding("utf-8");
		
		int sid=(int)Integer.parseInt(request.getParameter("ddid"));
		
		IDdDao di=new DdDaoImpl();
	
		di.deletesp(sid);
		
		request.getRequestDispatcher("cart.jsp").forward(request, response);
	}

}
















