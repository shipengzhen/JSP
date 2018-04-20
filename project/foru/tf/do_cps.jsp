<%@page import="com.dao.impl.FC"%>
<%@page import="com.dao.IPost"%>
<%@page import="com.entity.Post"%>
<%@page import="javax.servlet.jsp.tagext.TryCatchFinally"%>
<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>
<%@page import="java.util.*,java.io.*"%>
<%@page import="org.apache.commons.fileupload.*" %>
<%@page import="org.apache.commons.fileupload.servlet.ServletFileUpload" %>
<%@page import="org.apache.commons.fileupload.disk.DiskFileItemFactory" %>
<%
	//已完工
	//-----用户--发表帖子----处理页面-------------------
	
	
	String uid=(String)session.getAttribute("uid");
	
	
	
	//1、声明变量
	String hh="";//标题
	String tid="1";//类型ID
	String zw="";//正文
	String UID=(String)session.getAttribute("UID");//用户ID
	
	
	//2、字符集格式
	request.setCharacterEncoding("UTF-8");
	
	//3、检查请求信息中的内容类型是不是Multipart
	boolean tf=ServletFileUpload.isMultipartContent(request);
	
	//4、上传文件的存储路径（服务器文件系统的绝对路劲）
	String lu=request.getSession().getServletContext().getRealPath("photo/10001/");
	//out.print(lu);
	
	if(tf){
		
		//5、创建FileItemFactory工厂对象对象
		FileItemFactory factory=new DiskFileItemFactory();
		//6、通过工厂对象实例化一个ServletFileUpload
		ServletFileUpload upload=new ServletFileUpload(factory);
		
		try{
			//7、调方法，获得表单中的所有input对象
			List<FileItem>fts=upload.parseRequest(request);
			//--out.print("集合长度"+fts.size());
			//8、遍历
			for (FileItem ft:fts) {
				//普通子弹
			    if(ft.isFormField()){
			    	
//			    	out.println("<br/>名字："+ft.getFieldName());
//			    	out.println("值:"+ft.getString("UTF-8"));
			    	
			    	//获取标题
			    	if(ft.getFieldName().equals("hh")){
			    		hh=ft.getString("UTF-8");
			    	}
			    	
			    	//获取类型ID
			    	if(ft.getFieldName().equals("type")){
			    		tid=ft.getString("UTF-8");
			    	}
			    	
			    	//获取帖子正文
			    	if(ft.getFieldName().equals("cang")){
			    		zw=ft.getString("UTF-8");
			    	}
			    	
			    	
			    }else{
			    	//放任此段代码将引出异常
//			    	//文件字段
//			    	
//			    	//此文件的文件名
//			    	String fn=ft.getName();
//			    	
//			    	//开始创建客户端瘤
//			    	File f=new File(fn);
//			    	//服务器瘤
//			    	File sf=new File(lu,fn);
//			    	
//			    	//开始写入服务器
//			    	ft.write(sf);
//			    	
//			    	//回复客户端回调函数的路径
//			    	out.print("../photo/10001/"+fn);
			    	
			    }
			    
			}
			
			
		}catch(Exception ee){
			String ss=ee.getMessage();
			out.print("<br/>打击异常！-------"+ss);
		}
		
		
	}
	
	
	
	//发表成功
	if(zw.length()<=5000){
		if(hh.trim().equals(""))hh="无名";//防止无链接可击
		//请转发或者重定向到指定页面
		Post p=new Post();
		p.setPhh(hh);//标题
		p.setText(zw);//正文
		p.setUID(new Integer(uid));//发表人ID
		p.setTID(new Integer(tid));//类型ID
		p.setPRead(0);//阅读量
		p.setPZan(0);//赞
		p.setPCai(0);//踩
		
		IPost it=FC.getPostI();//帖子接口
		int fa=it.CaPost(p);//返回其帖子ID号，失败返-1
		
		if(fa!=-1){
			//发表成功
			FC.getUserI().UxUexp(uid, 10);//为此用户+10积分
			response.sendRedirect("rps.jsp?pid="+fa);//重定向到--rps.jsp
			return;
		}
	}else{
		//发表失败
		//此页面回应发表失败
	}
	

%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <script type="text/javascript" src="../js/jquery-1.8.3.js" ></script>
        <script type="text/javascript">
        	$(function(){
        		//计时返回
        		var s=51;
        		setInterval(function(){
        			s--;
        			$("#s").html(s);
        			if (s<=0) {
        				history.back();//IE
        			}
        			if (s<0) {
        				location.href="cps.jsp";//火狐
        			}
        		},1000);
        		
        		$("#fan").click(function(){
        			history.back();//IE
        		})
        		
        	})
        </script>
    </head>
    <body>
    	<h3>帖子发表失败，<span id="s">5</span>秒后返回修改帖子<a id="fan" href="#">点此立即返回</a></h3>
    	<h2>可能原因：</h2>
    	<h4>1、服务器繁忙</h4>
    	<h4>2、您没有严格遵循发帖要求</h4>
 	</body>
</html>