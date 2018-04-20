package com.bdqn.spz.financingproductsys.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Date;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.bdqn.spz.financingproductsys.dao.IFinancingProductDao;
import com.bdqn.spz.financingproductsys.dao.impl.FinancingProductDaoImpl;
import com.bdqn.spz.financingproductsys.entity.FinancingProduct;

public class InsertFinancingProductServlet extends HttpServlet {

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
		String id=request.getParameter("id");
		int risk=Integer.parseInt(request.getParameter("risk"));
		String income=request.getParameter("income");
		String saleStaring=request.getParameter("saleStaring");
		String saleEnd=request.getParameter("saleEnd");
		String end=request.getParameter("end");
		IFinancingProductDao financingProductDao=new FinancingProductDaoImpl();
		FinancingProduct financingProduct=new FinancingProduct(id, risk, income,saleStaring,saleEnd,end);
		if(financingProductDao.insertFinancingProduct(financingProduct)>0){
			out.print("<script type='text/javascript'>alert('新增成功');location('index.jsp');</script>");
		}else{
			out.print("<script type='text/javascript'>alert('修改成功');location('insert.jsp');</script>");
		}
		out.flush();
		out.close();
	}

}
