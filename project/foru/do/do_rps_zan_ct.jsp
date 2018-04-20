<%@page import="com.dao.impl.FC"%>
<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>
<%@page import="java.util.*"%>
<%
	
	//用户对评论点赞的处理页面
	//用户对评论点赞的处理页面---------CT
	//用户对评论点赞的处理页面
	
	
	//字符集格式
	request.setCharacterEncoding("UTF-8");
	String ctid=request.getParameter("ctid");//获取要点赞的ID
	//拦截，不对空处理
	if(ctid==null){
		out.print(0);
		return;
	}
	
	//读取session的历史点赞对象
	List <String> zans=(List<String>)session.getAttribute("ctzans");
	if(zans==null){
		zans=new ArrayList<String>();
	}
	
	//遍历检查是否已经点赞
	for(int i=0;i<zans.size();i++){
		if(ctid.equals(zans.get(i))){
			out.print(-1);
			return;
		}
	}
	
	//开始为其点赞
	int a=FC.getICT().UaCTZan(ctid);
	System.out.println(a);
	
	//返回结果,1为点赞成功
	zans.add(ctid);//已经点赞
	session.setAttribute("ctzans",zans);//给记录下来
	out.print(1);
	
	
%>