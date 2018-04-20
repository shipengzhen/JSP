<%@page import="com.cz.entity.Users"%>
<%@page import="com.cz.dao.impl.DdDaoImpl"%>
<%@page import="com.cz.dao.IDdDao"%>
<%@page import="com.cz.dao.impl.UsersDaoImpl"%>
<%@page import="com.cz.dao.IUsersDao"%>
<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>
<%@include file="uhead.jsp"%>
<%
	IUsersDao usersDao=new UsersDaoImpl();
	request.setAttribute("users",usersDao.findU(uId));
	
	IDdDao ddDao=new DdDaoImpl();
	
%>
<script src="js/jquery-1.8.3.min.js" type="text/javascript" charset="utf-8"></script>
<script type="text/javascript">
	$(function() {
		$("#tx").click(
			function() {
				$("#xtx").click();
			}
		)
	})
	function tijiao() {
		suburl = "UpdateTxServlet";
		window.document.all["form1"].action = suburl;
		window.document.all["form1"].submit();
	}
</script>
<!-- 内容部分开始 -->
<div id="content" class="col-lg-10">
	<div class="meb-content">
		<form action="UpdateTxServlet" method="post" name="form1" enctype="multipart/form-data">
			<div class="meb-avatar pull-left">
				<img id="tx" alt="" src="utx/${users.uTx}" />
				<input id="xtx" style="display: none;" type="file" name="file" onchange="tijiao()" />
			</div>
		</form>
		<form action="UpdateXxServlet" method="post" name="form2">
			<div class="meb-infor pull-right">
				<div class="meb-infor-title mb10">
					<b class="orange-font f14">
						<input style="border: 0px;" type="text" name="uname" value="${users.uName}" />
					</b>
				</div>
				<div class="account-security mb10">
					账户安全：
					<b class="orange-font">
                	<c:choose>
                    	<c:when test="${empty users.phone}">低级</c:when>
                    	<c:otherwise>中级</c:otherwise>
                   	</c:choose>
                 </b>
					<i class="icon-main icon-phone-bright"></i>
					<c:choose>
						<c:when test="${empty users.phone}">
							手机号未绑定
							<a style="border: 1px #f1e390 solid;text-decoration: none;" href="updatemm.jsp">绑定</a>
						</c:when>
						<c:otherwise>
							${users.phone}
							<a style="border: 1px #f1e390 solid;text-decoration: none;" href="updatemm.jsp">更换</a>
						</c:otherwise>
					</c:choose>
					<i class="icon-main icon-regular-bright"></i>正常
				</div>
				<div class="information">
					<ul>
						<li class="information-tit">真实姓名：</li>
						<li class="information-show">
							<c:choose>
								<c:when test="${empty users.name}">
									未实名
									<a style="border: 1px #f1e390 solid;text-decoration: none;">去实名</a>
								</c:when>
								<c:otherwise>
									${users.name}
								</c:otherwise>
							</c:choose>
						</li>
						<li class="information-tit">性别：</li>
						<li class="information-show">
							<c:choose>
								<c:when test="${empty users.sex}">
									<input style="border: 0px;" type="text" name="sex" value="男" />
								</c:when>
								<c:otherwise>
									<input style="border: 0px;" type="text" name="sex" value="${users.sex}" />
								</c:otherwise>
							</c:choose>
						</li>
						<li class="information-tit">已完成：</li>
						<li class="information-show">
							<a href="">全部订单(
								<%=ddDao.findDdCount(uId) %>)</a>
							<a href="">已完成(
								<%=ddDao.findDdCount(uId,"已完成")%>)</a>
						</li>
						<li class="information-tit">待处理：</li>
						<li class="information-show">
							<a href="">待付款(
								<%=ddDao.findDdCount(uId,"待付款")%>)</a> &nbsp;
							<a href="">待发货(
								<%=ddDao.findDdCount(uId,"待发货")%>)</a> &nbsp;
							<a href="">待收货(
								<%=ddDao.findDdCount(uId,"待收货")%>)</a> &nbsp;
							<a href="">待评价(
								<%=ddDao.findDdCount(uId,"待评价")%>)</a> &nbsp;
						</li>
						<li class="information-tit">总积分：</li>
						<li class="information-show">
							<span class="pull-right">
                                		<a href="">积分规则</a>
                                	</span>
							<a href="">${users.jf}</a>
						</li>
						<li class="information-tit"><button type="submit">保存</button></li>
					</ul>
				</div>
			</div>
		</form>
		<div class="clearfix"></div>
	</div>
</div>
</div>
<!-- 内容部分结束 -->
<%@ include file="foot.jsp"%>