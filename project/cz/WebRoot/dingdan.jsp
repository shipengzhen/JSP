<%@page import="com.cz.util.Page"%>
<%@page import="com.cz.entity.Users"%>
<%@page import="com.cz.dao.impl.DdDaoImpl"%>
<%@page import="com.cz.dao.IDdDao"%>
<%@page import="com.cz.entity.Sp"%>
<%@page import="java.util.List"%>
<%@page import="com.cz.dao.impl.ScDaoImpl"%>
<%@page import="com.cz.dao.IScDao"%>
<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>
<%@ include file="uhead.jsp"%>
<%
	IDdDao ddDao=new DdDaoImpl();
	
	//加入购物车
	if(request.getParameter("dd")!=null){
	
			int spid=Integer.parseInt(request.getParameter("spid"));	//商品id
			Users u=(Users)session.getAttribute("uu");
			IDdDao d=new DdDaoImpl();
			boolean bl= d.insertSp(u.getuId(), spid, 1, "待付款");
	}
	//分页
	Page pg;
	if(session.getAttribute("pg")==null){
		pg=new Page();
		pg.setPageSize(6);
	}else{
		pg=(Page)session.getAttribute("pg");
		pg.setPageSize(6);
	}
	pg.setTatalCount(ddDao.findDdCount(uId));
	request.setAttribute("zys",pg.getTotalPageCount());
	String ddType=request.getParameter("ddType");
	request.setAttribute("ddType",ddType);
	request.setAttribute("dds",ddDao.findAllDd(uId, pg));
	if(ddType!=null){				
		if(!ddType.equals("all")){
			pg.setTatalCount(ddDao.findDdCount(uId, ddType));
			request.setAttribute("zys",pg.getTotalPageCount());
		}
	}
	if(request.getParameter("currPageNo")!=null){
		pg.setCurrPageNo(Integer.parseInt(request.getParameter("currPageNo")));
		session.setAttribute("pg",pg);
	}else{
		pg.setCurrPageNo(1);
	}
	request.setAttribute("pg",pg); 
	if(ddType!=null){
		if(ddType.equals("all")){
			request.setAttribute("dds",ddDao.findAllDd(uId, pg));
		}else{
			request.setAttribute("dds",ddDao.findTypeDds(uId, ddType, pg));
		}
	}else{
		request.setAttribute("dds",ddDao.findAllDd(uId, pg));
	}
%>
<style type="text/css">
	#ul2{
		width: 300px;
		margin: 20px auto;
		float: left;
		border: 1px #999 dashed;
	}
	#ul2 li{
		width: 100px;
		list-style: none;
		float: left;
		margin: 5px;
	}
</style>
<div id="content" class="col-lg-10">
	<c:choose>
			<c:when test="${ddType=='待付款'}">
				<ul class="nav nav-tabs review-tabs" id="review-tabs">
					<li>
						<a href="dingdan.jsp?ddType=all">
							全部订单(<%=ddDao.findDdCount(uId)%>)
						</a>
					</li>
					<li class="active">
						<a href="dingdan.jsp?ddType=待付款">
							待付款(<%=ddDao.findDdCount(uId,"待付款")%>)
						</a>
					</li>
					<li>
						<a href="dingdan.jsp?ddType=待发货">
							待发货(<%=ddDao.findDdCount(uId,"待发货")%>)
						</a>
					</li>
					<li>
						<a href="dingdan.jsp?ddType=待收货">
							待收货(<%=ddDao.findDdCount(uId,"待收货")%>)
						</a>
					</li>
					<li>
						<a href="dingdan.jsp?ddType=待评价">
							待评价(<%=ddDao.findDdCount(uId,"待评价")%>)
						</a>
					</li>
					<li>
						<a href="dingdan.jsp?ddType=已完成">
							已完成(<%=ddDao.findDdCount(uId,"已完成")%>)
						</a>
					</li>
				</ul>
			</c:when>
			<c:when test="${ddType=='待发货'}">
				<ul class="nav nav-tabs review-tabs" id="review-tabs">
					<li>
						<a href="dingdan.jsp?ddType=all">
							全部订单(<%=ddDao.findDdCount(uId)%>)
						</a>
					</li>
					<li>
						<a href="dingdan.jsp?ddType=待付款">
							待付款(<%=ddDao.findDdCount(uId,"待付款")%>)
						</a>
					</li>
					<li class="active">
						<a href="dingdan.jsp?ddType=待发货">
							待发货(<%=ddDao.findDdCount(uId,"待发货")%>)
						</a>
					</li>
					<li>
						<a href="dingdan.jsp?ddType=待收货">
							待收货(<%=ddDao.findDdCount(uId,"待收货")%>)
						</a>
					</li>
					<li>
						<a href="dingdan.jsp?ddType=待评价">
							待评价(<%=ddDao.findDdCount(uId,"待评价")%>)
						</a>
					</li>
					<li>
						<a href="dingdan.jsp?ddType=已完成">
							已完成(<%=ddDao.findDdCount(uId,"已完成")%>)
						</a>
					</li>
				</ul>
			</c:when>
			<c:when test="${ddType=='待收货'}">
				<ul class="nav nav-tabs review-tabs" id="review-tabs">
					<li>
						<a href="dingdan.jsp?ddType=all">
							全部订单(<%=ddDao.findDdCount(uId)%>)
						</a>
					</li>
					<li>
						<a href="dingdan.jsp?ddType=待付款">
							待付款(<%=ddDao.findDdCount(uId,"待付款")%>)
						</a>
					</li>
					<li>
						<a href="dingdan.jsp?ddType=待发货">
							待发货(<%=ddDao.findDdCount(uId,"待发货")%>)
						</a>
					</li>
					<li class="active">
						<a href="dingdan.jsp?ddType=待收货">
							待收货(<%=ddDao.findDdCount(uId,"待收货")%>)
						</a>
					</li>
					<li>
						<a href="dingdan.jsp?ddType=待评价">
							待评价(<%=ddDao.findDdCount(uId,"待评价")%>)
						</a>
					</li>
					<li>
						<a href="dingdan.jsp?ddType=已完成">
							已完成(<%=ddDao.findDdCount(uId,"已完成")%>)
						</a>
					</li>
				</ul>
			</c:when>
			<c:when test="${ddType=='待评价'}">
				<ul class="nav nav-tabs review-tabs" id="review-tabs">
					<li>
						<a href="dingdan.jsp?ddType=all">
							全部订单(<%=ddDao.findDdCount(uId)%>)
						</a>
					</li>
					<li>
						<a href="dingdan.jsp?ddType=待付款">
							待付款(<%=ddDao.findDdCount(uId,"待付款")%>)
						</a>
					</li>
					<li>
						<a href="dingdan.jsp?ddType=待发货">
							待发货(<%=ddDao.findDdCount(uId,"待发货")%>)
						</a>
					</li>
					<li>
						<a href="dingdan.jsp?ddType=待收货">
							待收货(<%=ddDao.findDdCount(uId,"待收货")%>)
						</a>
					</li>
					<li class="active">
						<a href="dingdan.jsp?ddType=待评价">
							待评价(<%=ddDao.findDdCount(uId,"待评价")%>)
						</a>
					</li>
					<li>
						<a href="dingdan.jsp?ddType=已完成">
							已完成(<%=ddDao.findDdCount(uId,"已完成")%>)
						</a>
					</li>
				</ul>
			</c:when>
			<c:when test="${ddType=='已完成'}">
				<ul class="nav nav-tabs review-tabs" id="review-tabs">
					<li>
						<a href="dingdan.jsp?ddType=all">
							全部订单(<%=ddDao.findDdCount(uId)%>)
						</a>
					</li>
					<li>
						<a href="dingdan.jsp?ddType=待付款">
							待付款(<%=ddDao.findDdCount(uId,"待付款")%>)
						</a>
					</li>
					<li>
						<a href="dingdan.jsp?ddType=待发货">
							待发货(<%=ddDao.findDdCount(uId,"待发货")%>)
						</a>
					</li>
					<li>
						<a href="dingdan.jsp?ddType=待收货">
							待收货(<%=ddDao.findDdCount(uId,"待收货")%>)
						</a>
					</li>
					<li>
						<a href="dingdan.jsp?ddType=待评价">
							待评价(<%=ddDao.findDdCount(uId,"待评价")%>)
						</a>
					</li>
					<li class="active">
						<a href="dingdan.jsp?ddType=已完成">
							已完成(<%=ddDao.findDdCount(uId,"已完成")%>)
						</a>
					</li>
				</ul>
			</c:when>
			<c:otherwise>
				<ul class="nav nav-tabs review-tabs" id="review-tabs">
					<li class="active">
						<a href="dingdan.jsp?ddType=all">
							全部订单(<%=ddDao.findDdCount(uId)%>)
						</a>
					</li>
					<li>
						<a href="dingdan.jsp?ddType=待付款">
							待付款(<%=ddDao.findDdCount(uId,"待付款")%>)
						</a>
					</li>
					<li>
						<a href="dingdan.jsp?ddType=待发货">
							待发货(<%=ddDao.findDdCount(uId,"待发货")%>)
						</a>
					</li>
					<li>
						<a href="dingdan.jsp?ddType=待收货">
							待收货(<%=ddDao.findDdCount(uId,"待收货")%>)
						</a>
					</li>
					<li>
						<a href="dingdan.jsp?ddType=待评价">
							待评价(<%=ddDao.findDdCount(uId,"待评价")%>)
						</a>
					</li>
					<li>
						<a href="dingdan.jsp?ddType=已完成">
							已完成(<%=ddDao.findDdCount(uId,"已完成")%>)
						</a>
					</li>
				</ul>
			</c:otherwise>
		</c:choose>
		<c:choose>
			<c:when test="${empty ddType}">
				<div class="sort-right pull-right" style="width: 200px;">
					<a href="dingdan.jsp?currPageNo=${pg.currPageNo-1}&ddType=all" class="btn btn-default btn-xs">上一页<i class="glyphicon glyphicon-chevron-left"></i></a>
					<b class="red-font">${pg.currPageNo}/${zys}</b>
					<a href="dingdan.jsp?currPageNo=${pg.currPageNo+1}&ddType=all" class="btn btn-default btn-xs">下一页<i class="glyphicon glyphicon-chevron-right"></i></a>
				</div>
			</c:when>
			<c:otherwise>
				<div class="sort-right pull-right" style="width: 200px;">
					<a href="dingdan.jsp?currPageNo=${pg.currPageNo-1}&ddType=${ddType}" class="btn btn-default btn-xs">上一页<i class="glyphicon glyphicon-chevron-left"></i></a>
					<b class="red-font">${pg.currPageNo}/${zys}</b>
					<a href="dingdan.jsp?currPageNo=${pg.currPageNo+1}&ddType=${ddType}" class="btn btn-default btn-xs">下一页<i class="glyphicon glyphicon-chevron-right"></i></a>
				</div>
			</c:otherwise>
		</c:choose>
	<div style="float: left;">
		<c:forEach var="dd" items="${dds}">
			<ul id="ul2">
				<li>
					<a href="detail.jsp?spid=${dd.spid}&spxtypeid=${dd.spXTypeId}">
						<img src="image/${dd.spTp}" width=" 100px" height="140px" />
					</a>
				</li>
				<li>
					<a href="detail.jsp?spid=${dd.spid}&spxtypeid=${dd.spXTypeId}">${dd.spName}</a>
				</li>
				<li>${dd.spMs}</li>
				<li>￥${dd.spXMoney}</li>
				<c:choose>
					<c:when test="${dd.ddType=='待评价'}">
						<li><button><a href="pingjia.jsp?spid=${dd.spid}&ddid=${dd.ddId}">去评价</a></button></li>
					</c:when>
					<c:when test="${dd.ddType=='待付款'}">
						<li><button><a href="cart.jsp">去付款</a></button></li>
					</c:when>
					<c:when test="${dd.ddType=='待发货'}">
						<li><button><a href="">催催卖家</a></button></li>
					</c:when>
					<c:when test="${dd.ddType=='待收货'}">
						<li><button><a href="">查看物流</a></button></li>
					</c:when>
					<c:otherwise>
						<li><button><a href="dingdan.jsp?spid=${dd.spid }&dd=s">加入购物车</a></button></li>
					</c:otherwise>
				</c:choose>
			</ul>
		</c:forEach>
	</div>
</div>
<%@ include file="foot.jsp"%>