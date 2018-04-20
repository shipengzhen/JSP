package com.meetingroom.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.meetingroom.dao.IMeetingRoomDao;
import com.meetingroom.dao.impl.MeetingRoomDaoImpl;

@SuppressWarnings("serial")
public class InsertMeetingServlet extends HttpServlet {

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
		String meeting_name=request.getParameter("meeting_name");
		String meeting_order=request.getParameter("meeting_order");
		String advance_name=request.getParameter("advance_name");
		IMeetingRoomDao meetingRoomDao=new MeetingRoomDaoImpl();
		if (meetingRoomDao.insertCroom(meeting_name, meeting_order, advance_name)>0) {
			out.print("<script type='text/javascript'>alert('新增成功');location('index.jsp');</script>");
		}else{
			out.print("<script type='text/javascript'>alert('新增失败');location('insertMeeting.jsp');</script>");
		}
		out.flush();
		out.close();
	}

}
