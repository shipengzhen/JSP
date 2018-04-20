package com.cz.web;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.cz.dao.IDdDao;
import com.cz.dao.IPlDao;
import com.cz.dao.impl.DdDaoImpl;
import com.cz.dao.impl.PlDaoImpl;
import com.cz.entity.Pl;
import com.cz.entity.Users;

public class dosppj extends HttpServlet {

	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

	}

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
			String pj=request.getParameter("ping");
			String str=request.getParameter("str");
			int ddid=Integer.parseInt(request.getParameter("ddid"));
			int spid=Integer.parseInt(request.getParameter("id"));
			HttpSession session=request.getSession();
			Users u=(Users)session.getAttribute("uu");
			
			Pl p=new Pl();
			p.setPlType(pj);
			p.setPlString(str);
			p.setSpid(spid);
			p.setUid(u.getuId());
			IPlDao pl=new PlDaoImpl();
			pl.insertpl(p);
			
			IDdDao dd=new DdDaoImpl();
			dd.updatetype(ddid);
			
			response.sendRedirect("dingdan.jsp");
			
	}

}
