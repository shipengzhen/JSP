package com.serenity.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import oracle.net.aso.s;

import com.serenity.dao.StudentDao;
import com.serenity.entity.Student;

public class StudentServlet extends HttpServlet{
	
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		
		//���ñ���
		req.setCharacterEncoding("utf-8");
		resp.setContentType("text/html; charset=utf-8");
		
		//�ж�����
		String queryString = req.getRequestURI();
		String contPath = req.getContextPath();
		String qusey = queryString.replace(contPath, "");
		
		//��������
		if(qusey.equals("/add.do")){
			add(req,resp);
		}else if (qusey.equals("/list.do")) {
			list(req,resp);
		}else if (qusey.equals("/toModify.do")){
			toModify(req,resp);
		}else if(qusey.equals("/modify.do")){
			modify(req,resp);
		}else if(qusey.equals("/toDelete.do")){
			toDelete(req,resp);
		}
	}
	
	/**
	 * ɾ������
	 * @param req
	 * @param resp
	 * @throws IOException 
	 */
	private void toDelete(HttpServletRequest req, HttpServletResponse resp) throws IOException {
		int sno =Integer.parseInt(req.getParameter("sno"));
		
		StudentDao studentDao = new StudentDao();
		studentDao.delete(sno);
		
		//����list.do
		resp.sendRedirect("list.do");
	}

	/**
	 * ִ���޸Ĳ���
	 * @param req
	 * @param resp
	 * @throws IOException 
	 */
	private void modify(HttpServletRequest req, HttpServletResponse resp) throws IOException {
		//��������
		Integer sNo = Integer.parseInt(req.getParameter("xh"));
		String sName = req.getParameter("xm");
		Integer age = Integer.parseInt(req.getParameter("nl"));
		
		//�����յ����ݴ浽stu����
		Student stu = new Student();
		stu.setAge(age);
		stu.setsName(sName);
		stu.setsNo(sNo);
		
		//ִ����Ӳ���
		StudentDao studentDao = new StudentDao();
		studentDao.modify(stu);
		
		//����list.do
		resp.sendRedirect("list.do");
	}

	/**
	 * ��ת��modify.jsp
	 * @param req
	 * @param resp
	 * @throws IOException 
	 * @throws ServletException 
	 */
	private void toModify(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		int sno = Integer.parseInt(req.getParameter("sno"));
		//��ѯѧ����Ϣ
		StudentDao studentDao = new StudentDao();
		Student student = studentDao.findviewByid(sno);
		//�����ݷŵ�ǰ̨
		req.setAttribute("student", student);
		//����ҳ�沢�����ݴ���ȥ
		req.getRequestDispatcher("/modify.jsp").forward(req, resp);
	}

	/**
	 * ��ȡ����
	 * @param req
	 * @param resp
	 * @throws IOException 
	 * @throws ServletException 
	 */
	private void list(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		//��ȡѧ����������
		StudentDao studentDao = new StudentDao();
		List<Student> students = studentDao.findAll();
		
		//�����ݷŵ�ǰ̨
		req.setAttribute("students", students);
		
		//����listҳ��
		req.getRequestDispatcher("/list.jsp").forward(req, resp);
	}
	
	
	/**
	 * �������
	 * @param req
	 * @param resp
	 * @throws IOException
	 */
	private void add(HttpServletRequest req, HttpServletResponse resp) throws IOException {

		//��������
		Integer sNo = Integer.parseInt(req.getParameter("xh"));
		String sName = req.getParameter("xm");
		Integer age = Integer.parseInt(req.getParameter("nl"));
		
		Student stu = new Student();
		stu.setAge(age);
		stu.setsName(sName);
		stu.setsNo(sNo);
		
		StudentDao studentDao = new StudentDao();
		studentDao.add(stu);
		
		//������list.do
		resp.sendRedirect("list.do");
	}
}
