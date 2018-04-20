<%@page import="com.dao.impl.FC"%>
<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>
<%@page import="java.util.*"%>
<%
	
	//用户对帖子--点赞and点踩--的处理页面
	//用户对帖子--点赞and点踩--的处理页面
	//用户对帖子--点赞and点踩--的处理页面
	
	
	//字符集格式
	request.setCharacterEncoding("UTF-8");
	String zc=request.getParameter("zc");//获取是要点赞还是点踩
	String pid=request.getParameter("pid");//获取要点赞的ID
	//拦截，不对空处理
	if(pid==null){
		out.print(0);
		return;
	}
	//如果是点赞
	if(zc.equals("zan")){
		//读取session的历史点赞对象
		List <String> zans=(List<String>)session.getAttribute("postzans");
		if(zans==null){
			zans=new ArrayList<String>();
		}
		
		//遍历检查是否已经点赞
		for(int i=0;i<zans.size();i++){
			if(pid.equals(zans.get(i))){
				out.print(-1);
				return;
			}
		}
		
		//开始为其点赞
		FC.getPostI().UaPostZan(pid);
		
		
		//返回结果,1为点赞成功
		zans.add(pid);//已经点赞
		session.setAttribute("postzans",zans);//给记录下来
		out.print(1);
	}
	
	//如果是踩
	if (zc.equals("cai")) {
	    //读取session的历史点踩对象
		List <String> cais=(List<String>)session.getAttribute("postcais");
		if(cais==null){
			cais=new ArrayList<String>();
		}
		
		//遍历检查是否已经点踩
		for(int i=0;i<cais.size();i++){
			if(pid.equals(cais.get(i))){
				out.print(-1);
				return;
			}
		}
		
		//开始为其点踩
		FC.getPostI().UaPostCai(pid);
		
		
		//返回结果,1为点踩成功
		cais.add(pid);//已经点踩
		session.setAttribute("postcais",cais);//给记录下来
		out.print(1);
	}
	
	
%>