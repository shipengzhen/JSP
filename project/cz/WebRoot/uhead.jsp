<%@page import="com.cz.entity.Users"%>
<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>
<%
	Users uu=(Users)session.getAttribute("uu");
	if(uu==null){
		response.sendRedirect("login.jsp");
		return;
	}
	int uId=uu.getuId();
%>
<% session.setAttribute("open",null);%>
<%@include file="head.jsp"%>
<div class="container">
        <!-- 内容部分开始 -->
        <div class="row">
            <!-- 左边栏 -->
            <h3 class="member-tit f16 fb tit-family">我的传智</h3>
            <div id="sidebar" class="col-lg-2">
                <div class="widget mb10">
                    <div class="panel-group" id="accordion">
                        <div class="panel">
                            <div class="panel-title">
                                <h5 class="fb pl10">
                                    <i class="pull-right m10 icon-main icon-up"></i>
                                    <a data-toggle="collapse" data-parent="#accordion" href="#collapse-1">相关分类</a>
                                </h5>
                            </div>
                            <div id="collapse-1" class="panel-collapse collapse in">
                                <div class="meb-left-list">
                                    <ul>
                                        <li><a href="dingdan.jsp">我的订单</a></li>
                                        <li><a href="cart.jsp">我的购物车</a></li>
                                        <li><a href="discuss.jsp">我的评价</a></li>
                                        <li><a href="collect.jsp">我的收藏</a></li>
                                    </ul>
                                </div>
                            </div>
                        </div>
                        <div class="panel">
                            <div class="panel-title">
                                <h5 class="fb pl10">
                                    <i class="pull-right m10 icon-main icon-down"></i>
                                    <a data-toggle="collapse" data-toggle="collapse" data-parent="#accordion" href="#collapse-2">账户中心</a>
                                </h5>
                            </div>
                            <div id="collapse-2" class="panel-collapse collapse in">
                                <div class="meb-left-list">
                                    <ul>
                                        <li><a href="member_center.jsp">个人信息</a></li>
                                        <li><a href="updatemm.jsp">修改密码</a></li>
                                        <li><a href="member_center.jsp">我的积分</a></li>
                                    </ul>
                                </div>
                            </div>
                        </div>
                       
                    </div>
                </div>
            </div>