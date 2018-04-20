<%@page import="com.cz.dao.impl.DdDaoImpl"%>
<%@page import="com.cz.dao.IDdDao"%>
<%@page import="com.cz.util.Page"%>
<%@page import="com.cz.entity.Sp"%>
<%@page import="java.util.List"%>
<%@page import="com.cz.dao.impl.ScDaoImpl"%>
<%@page import="com.cz.dao.IScDao"%>
<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>
<%@ include file="uhead.jsp"%>
<%
	//查询全部的收藏商品
    IScDao scDao=new ScDaoImpl();
    //加入购物车
    if(request.getParameter("gwc")!=null){
    	int spid=Integer.parseInt(request.getParameter("spid"));
    		IDdDao dd=new DdDaoImpl();
    		//用户
    		Users user=(Users)session.getAttribute("uu");
    		dd.insertSp(user.getuId(),spid, 1, "待付款");
    }
    //分页
	Page pg;
	if(session.getAttribute("pg")==null){
		pg=new Page();
		pg.setPageSize(5);
	}else{
		pg=(Page)session.getAttribute("pg");
		pg.setPageSize(5);
	}
	pg.setTatalCount(scDao.scCount(uId));
	request.setAttribute("zongys",pg.getTotalPageCount());
	if(request.getParameter("currPageNo")!=null){
		pg.setCurrPageNo(Integer.parseInt(request.getParameter("currPageNo")));
		session.setAttribute("pg",pg);
	}else{
		pg.setCurrPageNo(1);
	}
	request.setAttribute("sps",scDao.scList(uId,pg));
	request.setAttribute("pg",pg);
%>
<style type="text/css">
	* {
		padding: 0px;
		margin: 0px;
	}
	
	#div1 a {
		text-decoration: none;
	}
	
	#ul1 {
		float: left;
		list-style: none;
		width: 900px;
	}
	
	#ul1 li {
		float: right;
		margin: 3px;
	}
	
	#ul2 {
		border: 1px #999 dashed;
		float: left;
		list-style: none;
	}
	
	#ul2 li {
		margin: 4px;
	}
</style>
<script type="text/javascript">
	function check() {
		var sz = document.getElementsByName("scId");
		for(var i = 0; i < sz.length; i++)
			sz[i].checked = document.getElementById("all").checked;
	}
</script>
<div id="content" class="col-lg-10">
	<form action="DeleteScServlet" method="post">
		<div id="div1">
			<ul id="ul1" Style=" background-color: #fffdf2">
				<h4>我的收藏</h4>
				<div class="sort-right pull-right" style="width: 200px;">
					<a href="collect.jsp?currPageNo=${pg.currPageNo-1}" class="btn btn-default btn-xs">上一页<i class="glyphicon glyphicon-chevron-left"></i></a>
					<b class="red-font">${pg.currPageNo}/${zongys}</b>
					<a href="collect.jsp?currPageNo=${pg.currPageNo+1}" class="btn btn-default btn-xs">下一页<i class="glyphicon glyphicon-chevron-right"></i></a>
				</div>
				<li>
					<input type="checkbox" id="all" onclick="check();" />全选
					<button type="submit"><a class="btn btn-default btn-xs">删除</a></button>
				</li>
			</ul>
			<c:forEach var="sp" items="${sps}">
				<ul id="ul2">
					<li><input type="checkbox" name="scId" value="${sp.scId}" /></li>
					<li>
						<a href="detail.jsp?spid=${sp.spId}&spxtypeid=${sp.spXTypeId}">
							<img src="image/${sp.spTp}" width=" 160px" height="200px" />
						</a>
					</li>
					<li>
						<a href="detail.jsp?spid=${sp.spId}&spxtypeid=${sp.spXTypeId}">${sp.spName}</a>
					</li>
					<li>${sp.spMs}</li>
					<li>￥${sp.spxMoney}</li>
					<li><button><a href="collect.jsp?spid=${sp.spId}&gwc=2">加入购物车</a></button></li>
					<li>
						<a href="DeleteScServlet?scId=${sp.scId}">删除</a>
					</li>
				</ul>
			</c:forEach>
		</div>
	</form>
</div>
<script type="text/javascript">
</script>
</div>
<!-- 内容部分结束 -->
<%@ include file="foot.jsp"%>