package com.cz.web;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.cz.dao.IDdDao;
import com.cz.dao.ISpDao;
import com.cz.dao.IUsersDao;
import com.cz.dao.impl.DdDaoImpl;
import com.cz.dao.impl.SpDaoImpl;
import com.cz.dao.impl.UsersDaoImpl;
import com.cz.entity.Users;

public class dozf extends HttpServlet {

	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		this.doPost(request, response);
	}
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {	
		response.setContentType("text/html;charset=UTF-8");
			request.setCharacterEncoding("utf-8");
			response.setCharacterEncoding("utf-8");
			HttpSession session =request.getSession();
			Users u=(Users)session.getAttribute("uu");
			ISpDao s=new SpDaoImpl();
			
			String name=request.getParameter("name");		//����
			String phone=request.getParameter("phone");    	//�绰
			String Address =request.getParameter("address");//��ַ
			double money =(double)Integer.parseInt(request.getParameter("money")); 	//���
			int jf=Integer.parseInt(request.getParameter("jf"));	//����
			IUsersDao user=new UsersDaoImpl();
			IDdDao d=new DdDaoImpl();
			PrintWriter out=response.getWriter();
			//�鿴���
			if(u.getuMoney()>=money){
				int zjf=u.getJf()+jf;
				double qian=u.getuMoney()-money;
				Users u1=new Users();
				u1.setuId(u.getuId());
				u1.setName(name);
				u1.setPhone(phone);
				u1.setAddress(Address);
				u1.setJf(zjf);
				u1.setuMoney(qian);
				
				boolean bl=user.updateusers(u1);	//�޸��û�����
				if(bl){
					d.updateDdds(u.getuId());	//�ɸ��� �ĳɴ���
					boolean b= s.updatespkc(u.getuId());	//������
					System.out.println(b);
					out.print("<script type='text/javascript'> alert('����ɹ���');location('index.jsp');</script>");
				}
			}else{
				//��Ҳ���
				out.print("<script type='text/javascript'> alert('��Ҳ�����');location('confirm.jsp');</script>");
			}
			
			
	}

}
