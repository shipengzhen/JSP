<%@page import="java.util.List"%>
<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title></title>
    <link href="assets/lib/bootstrap/css/bootstrap.css" rel="stylesheet" />
    <link href="assets/css/style.css" rel="stylesheet" />
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
	<!--登录-->
	<!--/#header-->
    <div class="container">
        <!-- 内容部分开始 -->
        <!-- 登录模块开始 -->
        <div class="row p30">
            <div class="col-lg-8">
                <!-- 左侧广告位 -->
                <img alt="" src="assets/img/advertise/login-ban.gif" />
            </div>
            <div class="col-lg-4">
                <!-- 登录表单开始 -->
                <form action="doLogin" method="post" role="form" class="login-form f14">
                    <div class="form-group">
                        <label for="username">邮箱/用户名/已验证手机</label>
                        <input name="name" type="text" class="form-control" id="username" placeholder="邮箱/用户名/已验证手机" />
                    </div>
                    <div class="form-group">
                        <label for="password">密码</label>
                        <input name="pwd" type="password" class="form-control" id="password" placeholder="密码" />
                    </div>
                    <div class="form-group">
                        <div class="input-group">
                        </div>
                    </div>
                    <div class="checkbox f12">
                        <span class="pull-right"><a href="findme.jsp">忘记密码？</a>&nbsp;<a href="register.jsp">免费注册</a></span>
                    </div>
                    <button type="submit" class="btn btn-danger btn-block f16">登 录</button>
                    <div class="f12 pt10">
                        合作登录：<i class="icon-main icon-cooper ml10"></i><a class="blue-font" href="">QQ账号</a>
                    </div>
                </form>
                <!-- 登录表单结束 -->
            </div>
        </div>
        <!-- 登录模块结束 -->
        <!-- 内容部分结束 -->
<%@ include file="foot.jsp"%>