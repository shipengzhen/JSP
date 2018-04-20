<%@page import="com.dao.impl.FC"%>
<%@page import="com.entity.Usee"%>
<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>
<%
	
	request.setCharacterEncoding("UTF-8");
	
	String name=request.getParameter("name");//名字
	String pwd=request.getParameter("pwd");//密码
	String sex=request.getParameter("sex1");//性别
	String email=request.getParameter("email");//邮箱
	String phone=request.getParameter("phone");//手机
	String xy=request.getParameter("jy");//个星签名
	
//	out.print("<br/>"+name);
//	out.print("<br/>"+pwd);
//	out.print("<br/>"+sex);
//	out.print("<br/>"+email);
//	out.print("<br/>"+phone);
//	out.print("<br/>"+xy);
	
	
	String uid=(String)session.getAttribute("uid");
	//开始修改
	Usee u=new Usee();
	u.setUName(name);
	u.setPwd(pwd);
	u.setSex(sex);
	u.setUEmail(email);
	u.setUPhone(phone);
	u.setUxy(xy);
	u.setID(uid);
	
	int a=FC.getUserI().UaUsee(u);
	//重定向
	if(a>0){
		response.sendRedirect("info.jsp?uid="+uid);
		return;
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
        		var s=5;
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
    	<h3>资料修改失败，<span id="s">5</span>秒后返回修改<a id="fan" href="#">点此立即返回</a></h3>
    	<h2>可能原因：</h2>
    	<h4>1、服务器繁忙</h4>
    	<h4>2、您没有严格遵循修改资料要求</h4>
 	</body>
</html>