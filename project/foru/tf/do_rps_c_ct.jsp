<%@page import="com.dao.impl.FC"%>
<%@page import="com.entity.CT"%>
<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>
<%
	//用户发表评论处理页面----已经完工
	
	
	request.setCharacterEncoding("UTF-8");
	
	//检查是否已经登录
	String _uid=(String)session.getAttribute("uid");
	if(_uid==null){
		//not login，gun go login
		out.print("-2");
		return;
	}
	
	String ctext=request.getParameter("ctext");//评论内容
	String pid=request.getParameter("pid");//要评论的帖子
	String uid=(String)session.getAttribute("uid");//评论者ID
	
	//开始评论
	CT c=new CT();
	
	
	c.setText(ctext);//评论内容
	c.setPID(Integer.parseInt(pid));//评论的ID
	c.setUID(Integer.parseInt(uid));//评论者ID
	
	if(FC.getICT().CaCT(c)>0){
		FC.getUserI().UxUexp(uid, 3);//为此用户+3积分
		out.print("1");//1代表评论成功
		return;
	}
	out.print("-1");//-1代表评论失败
	
%>