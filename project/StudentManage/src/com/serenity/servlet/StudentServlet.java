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
		
		//设置编码
		req.setCharacterEncoding("utf-8");
		resp.setContentType("text/html; charset=utf-8");
		
		//判断请求
		String queryString = req.getRequestURI();
		String contPath = req.getContextPath();
		String qusey = queryString.replace(contPath, "");
		
		//分流操作
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
	 * 删除数据
	 * @param req
	 * @param resp
	 * @throws IOException 
	 */
	private void toDelete(HttpServletRequest req, HttpServletResponse resp) throws IOException {
		int sno =Integer.parseInt(req.getParameter("sno"));
		
		StudentDao studentDao = new StudentDao();
		studentDao.delete(sno);
		
		//返回list.do
		resp.sendRedirect("list.do");
	}

	/**
	 * 执行修改操作
	 * @param req
	 * @param resp
	 * @throws IOException 
	 */
	private void modify(HttpServletRequest req, HttpServletResponse resp) throws IOException {
		//接收数据
		Integer sNo = Integer.parseInt(req.getParameter("xh"));
		String sName = req.getParameter("xm");
		Integer age = Integer.parseInt(req.getParameter("nl"));
		
		//将接收的数据存到stu对象
		Student stu = new Student();
		stu.setAge(age);
		stu.setsName(sName);
		stu.setsNo(sNo);
		
		//执行添加操作
		StudentDao studentDao = new StudentDao();
		studentDao.modify(stu);
		
		//返回list.do
		resp.sendRedirect("list.do");
	}

	/**
	 * 跳转到modify.jsp
	 * @param req
	 * @param resp
	 * @throws IOException 
	 * @throws ServletException 
	 */
	private void toModify(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		int sno = Integer.parseInt(req.getParameter("sno"));
		//查询学生信息
		StudentDao studentDao = new StudentDao();
		Student student = studentDao.findviewByid(sno);
		//将数据放到前台
		req.setAttribute("student", student);
		//返回页面并将数据传过去
		req.getRequestDispatcher("/modify.jsp").forward(req, resp);
	}

	/**
	 * 获取数据
	 * @param req
	 * @param resp
	 * @throws IOException 
	 * @throws ServletException 
	 */
	private void list(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		//获取学生集合数据
		StudentDao studentDao = new StudentDao();
		List<Student> students = studentDao.findAll();
		
		//将数据放到前台
		req.setAttribute("students", students);
		
		//返回list页面
		req.getRequestDispatcher("/list.jsp").forward(req, resp);
	}
	
	
	/**
	 * 添加数据
	 * @param req
	 * @param resp
	 * @throws IOException
	 */
	private void add(HttpServletRequest req, HttpServletResponse resp) throws IOException {

		//接收数据
		Integer sNo = Integer.parseInt(req.getParameter("xh"));
		String sName = req.getParameter("xm");
		Integer age = Integer.parseInt(req.getParameter("nl"));
		
		Student stu = new Student();
		stu.setAge(age);
		stu.setsName(sName);
		stu.setsNo(sNo);
		
		StudentDao studentDao = new StudentDao();
		studentDao.add(stu);
		
		//回跳到list.do
		resp.sendRedirect("list.do");
	}
}
