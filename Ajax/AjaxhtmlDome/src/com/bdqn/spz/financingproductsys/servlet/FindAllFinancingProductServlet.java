package com.bdqn.spz.financingproductsys.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.bdqn.spz.financingproductsys.dao.IFinancingProductDao;
import com.bdqn.spz.financingproductsys.dao.impl.FinancingProductDaoImpl;
import com.bdqn.spz.financingproductsys.entity.FinancingProduct;

@SuppressWarnings("serial")
public class FindAllFinancingProductServlet extends HttpServlet {

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
		IFinancingProductDao financingProductDao=new FinancingProductDaoImpl();
		String list=request.getParameter("list");
		if (list.equals("financingProducts")) {
			StringBuffer html=new StringBuffer();
			for (FinancingProduct financingProduct : financingProductDao.findAllFinancingProduct()) {
				html.append("<tr class='tr'>");
				html.append("<td>"+financingProduct.getId()+"</td>");
				html.append("<td>"+financingProduct.getRisk()+"</td>");
				html.append("<td>"+financingProduct.getIncome()+"</td>");
				html.append("<td>"+financingProduct.getSaleStaring()+"</td>");
				html.append("<td>"+financingProduct.getSaleEnd()+"</td>");
				html.append("<td>"+financingProduct.getEnd()+"</td>");
				html.append("</tr>");
			}
			out.print(html);
			//request.setAttribute("financingProducts",financingProductDao.findAllFinancingProduct());
			//request.getRequestDispatcher("index.jsp").forward(request, response);
		}
		out.flush();
		out.close();
	}

}
