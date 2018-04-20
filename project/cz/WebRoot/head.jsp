<%@page import="com.cz.dao.impl.SpTypeDaoImpl"%>
<%@page import="com.cz.dao.ISpTypeDao"%>
<%@page import="com.cz.dao.impl.SpXTypeDaoImpl"%>
<%@page import="com.cz.dao.ISpXTypeDao"%>
<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
	request.setAttribute("open",session.getAttribute("open"));
	//商品大类型
	response.setCharacterEncoding("utf-8");
	request.setCharacterEncoding("utf-8");
	ISpTypeDao ie=new SpTypeDaoImpl();
	request.setAttribute("dlists", ie.findAllStype());
	int i=0;
	if(request.getParameter("uId")!=null){
		session.setAttribute("uu",null);
	}
%>
<script src="js/jquery-1.8.3.min.js" type="text/javascript" charset="utf-8"></script>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title></title>
    <link href="assets/lib/bootstrap/css/bootstrap.css" rel="stylesheet" />
    <link href="assets/css/style.css" rel="stylesheet" />
</head>
<body>
	<div id="sitebar">
        <div class="container">
            <div class="row h30 lh30 f12">
                <div class="col-lg-6">
                    <a href="javascript:;" class="bootmark" rel="nofollow"><i class="icon-main icon-collect mt8 mr5"></i>收藏传智</a>
                    <span class="bar-link">
                        <c:choose>
                        	<c:when test="${empty uu}">
                        		<span>您好,欢迎您光临传智网!</span>
                        		<a id="dsds" href="login.jsp">登录</a>
                        		<a id="ds" href="register.jsp">注册</a>
                        	</c:when>
                        	<c:otherwise>
                        		<span>您好${uu.uName},欢迎您光临传智网!</span>
                        		 <a id="ds1" href="index.jsp?uId=${uu.uId}">退出登录</a>
                        	</c:otherwise>
                        </c:choose>
                    </span>
                </div>
                <div class="col-lg-6">
                    <ul class="pull-right bar-link">
                        <li><a href="dingdan.jsp">我的订单</a> | </li>
                        <li><a href="http://wpa.qq.com/msgrd?v=3&amp;uin=27102514&amp;site=qq&amp;menu=yes">客服服务</a> | </li>
                        <li><a href="#">网站导航</a> |&nbsp;&nbsp;&nbsp;&nbsp;</li>
                        <li class="tel-num"><i class="icon-main icon-tel mt8 mr5"></i>8888-888-888</li>
                    </ul>
                </div>
            </div>
        </div>
    </div>
    <!--/#sitebar-->
    <div id="header">
        <div class="container">
            <div class="row search">
                <div class="col-lg-4">
                    <h1 class="logo"><a href="index.jsp">
                        <img src="assets/img/logo/logo.png" alt="传智" /></a><img src="assets/img/logo/logo-text.png" alt="让每个人都满意！" /></h1>
                </div>
                <div class="col-lg-5">
                    <form action="search.jsp" method="get">
                        <label for="txt_search" class="hidden">搜索传智 分类/品牌/商品</label>
                        <input id="txt_search" type="text" name="q" accesskey="s" autocomplete="off" autofocus="true" x-webkit-speech="" x-webkit-grammar="builtin:translate" class="s-combobox-input" role="combobox" aria-haspopup="true" title="请输入搜索文字" aria-label="请输入搜索文字">
                        <button id="btn_search" type="submit">搜索</button>
                    </form>
                </div>
                <div class="col-lg-3">
                    <div id="my_account" class="btn-group mt30 ml50 ">
                        <button type="button" class="btn btn-radius-none btn-default dropdown-toggle f12">
                        	<a href="member_center.jsp">我的账户</a>
                        </button>
                    </div>
                    <div id="mini_cart" class="btn-group mt30 ml15">
                        <a  href="cart.jsp" style="border: 1px red solid;" class="btn btn-radius-none btn-default dropdown-toggle f12">
                            <i class="icon-main icon-cart ilb"></i>我的购物车
                        </a>
                    </div>
                </div>
            </div>
            <div class="navbar navbar-red" role="navigation">
                <div class="navbar-header">
                    <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
                        <span class="sr-only">Toggle navigation</span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                    </button>
                    	<c:choose>
                        	<c:when test="${empty open}">
                        		<div id="menu" class="dropdown hover-toggle">
                        	</c:when>
                        	<c:otherwise>
                        		 <div id="menu" class="dropdown open">
                        	</c:otherwise>
                    	</c:choose>
                        <a class="navbar-brand dropdown-toggle" href="#">全部商品分类 <b class="caret"></b></a>
                        <div class="clearfix"></div>
          <!--导航栏 开始-->
          				<ul id="categories" class="dropdown-menu">
          				<c:forEach var="dlist" items="${dlists}">
                            <li>
            <!--1.1 第一  -->    <a href=""}><i Style=" line-height: 40px; font-size: 14px;"><b>${dlist.spTypeName}</b></i></a>
            					<%
            						i++;
            						//小类型
									ISpXTypeDao spx=new SpXTypeDaoImpl();
									request.setAttribute("xlists", spx.findallxtype(i));
            					 %>
                                <ul class="sub-item">
                                	<c:forEach var="xlist" items="${xlists}">
	                                    <li class="aff">
	           <!-- 1.2 -->            		<a href="list.jsp?sptype=${dlist.spTypeid}&spxtype=${xlist.spxTypeId }&spxTypeName=${xlist.spxTypeName }">${xlist.spxTypeName }</a>
	                                    </li>
                                    </c:forEach>
                               </ul>
               <!-- 结束 --> 
                            </li>
                        </c:forEach>
                        </ul>
                    </div>
                </div>
                <div class="navbar-collapse collapse">
                    <ul class="nav navbar-nav f14">
                        <li><a href="index.jsp">首页</a></li>
                        <li><a>专题</a></li>
                    </ul>
                </div>
            </div>
        </div>
    </div>
    <!--/#header-->
    