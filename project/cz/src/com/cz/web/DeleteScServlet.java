package com.cz.web;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.cz.dao.IScDao;
import com.cz.dao.impl.ScDaoImpl;

public class DeleteScServlet extends HttpServlet {

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
		IScDao scDao=new ScDaoImpl();
		String[] scId=request.getParameterValues("scId");
		if(scId==null){
			response.sendRedirect("collect.jsp");
			return;
		}
		for (String string : scId) {
			scDao.scDelete(Integer.parseInt(string));
		}
		response.sendRedirect("collect.jsp");
		out.flush();
		out.close();
	}

}
