<%@page import="java.nio.file.Files"%>
<%@page import="java.io.File"%>
<%@page import="com.dao.IUsee"%>
<%@page import="com.dao.impl.FC"%>
<%@page import="com.entity.Usee"%>
<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>
<%

	//1，登录、2，管理员登录，-1、注册
	
	//字符集格式
	request.setCharacterEncoding("UTF-8");
	
	//
	String way=request.getParameter("way");
	String name=request.getParameter("name");
	String pwd=request.getParameter("pwd");
	
	
	
	
	//用户接口
	IUsee ue=FC.getUserI();
	
	//普通用户登录
	if(way.equals("0")){
		int a=ue.RLogin(name, pwd);
		if(a>0){
			String uid=ue.RuidByUName(name);//算出用户ID
			//写入身份状态和用户ID
			session.setAttribute("UA","0");
			session.setAttribute("uid",uid);
			out.print(1);//成功
			return;
		}else{
			out.print(-1);//失败
			return;
		}
	}
	
	//管理员登录
	if(way.equals("1")){
		int a=ue.RLoginByAdmin(name, pwd);
		if(a>0){
			String uid=ue.RuidByUName(name);//算出用户ID
			//写入身份状态和用户ID
			session.setAttribute("UA","1");
			session.setAttribute("uid",uid);
			out.print(1);//成功
			return;
		}else{
			out.print(-1);//失败
			return;
		}
	}
	
	
	//注册，，-1
	if(way.equals("9")){
		
		Usee u=new Usee();
		u.setUName(name);
		u.setPwd(pwd);
		
		int uid=ue.CaUsee(u);
		
		
		if(uid>-1){
			
			//写入身份状态和用户ID
			//session.setAttribute("UA","0");
			//session.setAttribute("uid",uid);
			
			//此处应该用IO为其创建空间并指定头像
			try{
				    
				//创建云空间
				File fe=new File("webapps/forum/photo/"+uid+"/");//根目录居然在此？费解！！！
				//System.out.println(fe.getAbsolutePath());
				fe.mkdirs();
				
				//复制头像
				int no=(int)(Math.random()*25)+1;
				File ftou=new File("webapps/forum/photo/tou/"+no+".jpeg");
				File fuser=new File("webapps/forum/photo/"+uid+"/tou.png");
				Files.copy(ftou.toPath(),fuser.toPath());//复制
				
				
			}catch (Exception e) {
			    System.out.print(e.getMessage());
			}
			
			
			//截止---------------
			
			out.print(uid);//成功
			return;
		}else{
			out.print(-1);//失败
			return;
		}
	}
	
	
	
	
	
	
%>