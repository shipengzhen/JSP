package com.bdqn.memberinfomtion.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.bdqn.memberinfomtion.dao.IMemberinfoDao;
import com.bdqn.memberinfomtion.dao.impl.MembersinfoDaoImpl;

public class FindAllMembersinfoServlet extends HttpServlet {

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
		IMemberinfoDao memberinfoDao=new MembersinfoDaoImpl();
		request.setAttribute("membersinfos", memberinfoDao.findAllMembersinfo());
		request.getRequestDispatcher("membersinfo.jsp").forward(request,response);
		out.flush();
		out.close();
	}

}
