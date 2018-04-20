package com.bdqn.spz.messageboard.web;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.bdqn.spz.messageboard.entity.TBL_Message;
import com.bdqn.spz.messageboard.service.ITBL_MessageService;
import com.bdqn.spz.messageboard.service.impl.TBL_MessageServiceImpl;

public class MessageServlet extends HttpServlet {

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
		String author=request.getParameter("author");
		String message=request.getParameter("message");
		Date date=new Date();
		SimpleDateFormat simpleDateFormat=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		ITBL_MessageService messageService=new TBL_MessageServiceImpl();
		TBL_Message tbl_Message=new TBL_Message(message,author,simpleDateFormat.format(date));
		if (messageService.insertMessages(tbl_Message)) {
			out.print("<script type='text/javascript'>"+
					"alert('¡Ù—‘≥…π¶£°');"+
					"location('message.jsp');"+
					"</script>");
		}
		out.flush();
		out.close();
	}

}
