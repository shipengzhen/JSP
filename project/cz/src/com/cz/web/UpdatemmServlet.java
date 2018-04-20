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

public class UpdatemmServlet extends HttpServlet {

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
		String ymm=request.getParameter("ymm");
		String mm=request.getParameter("mm");
		String phone=request.getParameter("phone");
		if(ymm==null||mm==null||phone==null){
			response.sendRedirect("updatemm.jsp");
			return;
		}
		Users uu=(Users)session.getAttribute("uu");
		int uId=uu.getuId();
		IUsersDao usersDao=new UsersDaoImpl();
		if(!ymm.equals("")&&!mm.equals("")){
			if(usersDao.updatemmGetymm(mm,uId, ymm)>0){
				out.println("<script type='text/javascript'> alert('密码修改成功');location('member_center.jsp');</script>");
			}else {
				out.println("<script type='text/javascript'> alert('密码修改失败');location('updatemm.jsp');</script>");
			}
		}else if(!phone.equals("")&&!mm.equals("")){
			if(usersDao.updatemmGetphone(mm,uId, phone)>0){
				out.println("<script type='text/javascript'> alert('密码修改成功');location('member_center.jsp');</script>");
			}else {
				out.println("<script type='text/javascript'> alert('密码修改失败');location('updatemm.jsp');</script>");
			}
		}else if (!ymm.equals("")&&!phone.equals("")) {
			if(usersDao.updatephoneGetmm(phone,uId, ymm)>0){
				out.println("<script type='text/javascript'> alert('绑定成功');location('member_center.jsp');</script>");
			}else {
				out.println("<script type='text/javascript'> alert('绑定失败');location('updatemm.jsp');</script>");
			}
		}else{
			response.sendRedirect("updatemm.jsp");
		}
		out.flush();
		out.close();
	}

}
