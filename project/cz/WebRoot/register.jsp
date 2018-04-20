<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title></title>
    <link href="assets/lib/bootstrap/css/bootstrap.css" rel="stylesheet" />
    <link href="assets/css/style.css" rel="stylesheet" />
    <script src="js/jquery-1.8.3.min.js" type="text/javascript" charset="utf-8"></script>
    <script type="text/javascript">
    	$(function(){
    		var bo1=false;
    		var bo2=false;
    		var bo3=false;
     		$("#username").blur(function(){
    			var name=$("#username").val();
    			if(name.length<3){
    				$("#a1").html("用户名不能小于三位");
    				$("#a1").css("display","block");
    				bo1=false;
    				
    			}else if(name.length>9){
    				$("#a1").html("用户名不能大于九位");
    				$("#a1").css("display","block");
    				bo1=false;
    			}else{
    				$("#a1").css("display","none");
    				bo1=true;
    			}
    		})
    		var pwd1="";
    		$("#password").blur(function(){
    			pwd1=$("#password").val();
    			if(pwd1.length<6){
    				$("#a2").html("密码不能小于六位");
    				$("#a2").css("display","block");
    				bo2=false;
    			}else{
    				$("#a2").css("display","none");
    				bo2=true;
    			}
    		})
    		$("#confirm").blur(function(){
    			var pwd2=$("#confirm").val();
    			if(pwd2!=pwd1){
    				$("#a3").html("两次密码不一致");
    				$("#a3").css("display","block");
    				bo3=false;
    			}else{
    				$("#a3").css("display","none");
    				bo3=true;
    			}
    		})
    		$("form").submit(function(){
    			if(bo1&&bo2&&bo3){
    				return true;
    			}
					return false;
			})
    		
    	})
    </script>
    <style type="text/css">
    	
    </style>
</head>
<body>
	<div id="header">
        <div class="container">
            <div class="row search">
                <div class="col-lg-4">
                    <h1 class="logo"><a href="index.jsp">
                        <img src="assets/img/logo/logo.png" alt="传智" /></a><img src="assets/img/logo/logo-text.png" alt="让每个人都满意！" /></h1>
                </div>
            </div>
        </div>
    </div>
	<!--注册-->
	<!--/#header-->
    <div class="container">
        <!-- 内容部分开始 -->
        <!-- 注册模块开始 -->
        <div class="row p30">
            <div class="col-lg-8">
                <!-- 左侧广告位 -->
                <img alt="" src="assets/img/advertise/login-ban.gif" />
            </div>
            <div class="col-lg-4">
                <!-- 注册表单开始 -->
                <form action="doZc" method="post" role="form" class="login-form f14">
                    <div class="form-group">
                        <label for="username">用户名</label>
                        <input name="name" type="text" class="form-control" id="username" placeholder="用户名/已验证手机">               
                         <span id="a1" Style="color:red; font-size:12px; display: none">  用户名不能小于三位数</span>
                    </div>
                    <div class="form-group">
                        <label for="password">密码</label>
                        <input name="pwd"  type="password" class="form-control" id="password" placeholder="密码">
                         <span id="a2" Style="color:red; font-size:12px; display: none">用户名不能小于三位数</span>
                    </div>
                    <div class="form-group">
                        <label for="confirm">确认密码</label>
                        <input type="password" class="form-control" id="confirm" placeholder="确认密码">
                         <span id="a3" Style="color:red; font-size:12px; display: none">用户名不能小于三位数</span>
                    </div>
                    <div class="form-group">
                       <!--  <label for="vcode">验证码</label>--> 
                        <div class="input-group">
                           	<!--  <input type="text" class="form-control" id="vcode" placeholder="验证码"> -->
                            <span class="input-group-addon" style="padding:0 2px;cursor:pointer">
                               <!--   <img id="vcode_img" src="/handler/verify.ashx" data-src="/handler/verify.ashx" width="100" height="32" alt="验证码" title="点击切换验证码">-->
                            </span>
                        </div>
                    </div>
                    <div class="checkbox f12">
                        <label>
                            <input type="checkbox">
                            我已阅读并同意 &nbsp;<span class="blue-font"><a href="">《传智用户注册协议》</a></span>
                        </label>
                    </div>
                    <button id="sub"  type="submit" class="btn btn-danger btn-block f16">立即注册</button>
                </form>
                <!-- 注册表单结束 -->
            </div>
        </div>
        <!-- 注册模块结束 -->
        <!-- 内容部分结束 -->
<%@ include file="foot.jsp"%>