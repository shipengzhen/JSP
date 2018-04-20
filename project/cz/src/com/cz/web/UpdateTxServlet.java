package com.cz.web;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.cz.entity.Users;
import com.cz.util.FileUpload;

public class UpdateTxServlet extends HttpServlet {

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
		HttpSession session=request.getSession();
		Users uu=(Users)session.getAttribute("uu");
		if(uu==null){
			response.sendRedirect("login.jsp");
			return;
		}
		FileUpload.upload(request,"file","/utx",uu.getuId());
		response.sendRedirect("member_center.jsp");
		out.flush();
		out.close();
	}
}
