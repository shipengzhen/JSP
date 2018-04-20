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
import com.bdqn.memberinfomtion.entity.Membersinfo;

public class UpdateMembersinfoServlet extends HttpServlet {

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
		int mId=Integer.parseInt(request.getParameter("mId"));//��Ա���
		String mName=request.getParameter("mName");//��Ա����
		String mGender=request.getParameter("mGender");//��Ա�Ա�
		int mAge=Integer.parseInt(request.getParameter("mAge"));//��Ա����
		String mAdderss=request.getParameter("mAdderss");//��ͥסַ
		String mEmail=request.getParameter("mEmail");//�����ʼ�
		IMemberinfoDao memberinfoDao=new MembersinfoDaoImpl();
		Membersinfo membersinfo=new Membersinfo(mId,mName,mGender,mAge,mAdderss,mEmail);
		if(memberinfoDao.updateMembersinfo(membersinfo)>0){
			out.print("<script type='text/javascript'>alert('�޸ĳɹ�');location('FindAllMembersinfoServlet ');</script>");
		}else{
			out.print("<script type='text/javascript'>alert('�޸�ʧ��');location('updateMembersinfo.jsp');</script>");
		}
		out.flush();
		out.close();
	}

}
