<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>text</title>
        <script type="text/javascript" src="js/jquery-1.8.3.js"></script>
        <script type="text/javascript">
        	$(function(){
        		$("input[name=uname]").blur(function(){
        			var uname=$(this).val();
		        	if(uname==null||uname==""){
		        		alert("用户名不能为空");
		        	}else{
		        		$.ajax({
		        			type:"get",//发送请求的方式  值: get(默认),post
		        			dateType:"text",//指定返回的数据格式 值:xml,html,script,json,jsonp,text(默认)
		        			url:"CheckServlet",//要提交的URL路径
		        			data:"uname="+uname,//要发送到服务器的数据
		        			success:function(data){//响应成功后要执行的代码
		        				if(data=="false"){
		        					alert("用户名已存在");
		        				}else{
		        					alert("用户名可以使用");
		        				}
		        			},
		        			error:function(){//响应失败要执行的代码
		        				alert("响应失败");
		        			}
		        		});
		        	}
        		});
	        });
        </script>
    </head>
    <body>
    	请输入用户名<input type="text" name="uname"/>
 	</body>
</html>