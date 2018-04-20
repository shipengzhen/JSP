<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="com.cz.entity.Users"%>
<%@page import="com.cz.dao.impl.ScDaoImpl"%>
<%@page import="com.cz.dao.IScDao"%>
<%@page import="com.cz.util.Page"%>
<%@page import="com.cz.dao.impl.SpDaoImpl"%>
<%@page import="com.cz.dao.ISpDao"%>
<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>
<%session.setAttribute("open",null);%>
<%@include file="head.jsp"%>
<%
	ISpDao spDao=new SpDaoImpl();
	//分页
	Page pg;
	if(session.getAttribute("pg")==null){
		pg=new Page();
		pg.setPageSize(12);
	}else{
		pg=(Page)session.getAttribute("pg");
		pg.setPageSize(12);
	}
	String q=request.getParameter("q");
	if(q!=null){
		pg.setTatalCount(spDao.findSpListCount(q));
		request.setAttribute("zongsp",pg.getTatalCount());
		request.setAttribute("zongys",pg.getTotalPageCount());
		request.setAttribute("sps",spDao.findSpLike(q,pg));
	}else{
%>
		<script type="text/javascript">
			location("index.jsp");
		</script>
<%
		return;
	}
	
	if(request.getParameter("currPageNo")!=null){
		pg.setCurrPageNo(Integer.parseInt(request.getParameter("currPageNo")));
		session.setAttribute("pg",pg);
	}else{
		pg.setCurrPageNo(1);
	}
	request.setAttribute("pg",pg);
	
	
	//收藏
	IScDao s=new ScDaoImpl();
	//判断是否收藏
	Users u=(Users)session.getAttribute("uu");
	String sc=request.getParameter("sc");
	if(sc!=null){
		int spId=Integer.parseInt(request.getParameter("sid"));
		if(u!=null){
			boolean bl=s.scpd(spId, u.getuId());
			if(bl){	
			%>
				<script type="text/javascript">
					$(function(){
						alert("该商品您已收藏");
						$("#scc").css("background-color", "#eb81b8");
					});	
				</script>
			<% 	
			}else{
				int kk=s.scSp(u.getuId(),spId);
				if(kk>0){
			%>
					<script type="text/javascript">
						$(function(){
							$("#scc").css("background-color", "#eb81b8");
						});	
					</script>
			<%		
				}
			}
		}else{
			%>
				<script type="text/javascript">
					$(function(){
						location("login.jsp");
					});	
				</script>
			<% 
			return;	
		}
	}
%>
<div class="item-pro-list mt10">
	<div class="list-item-title">
		<div class="sort-right pull-right" style="width: 500px;">
			<span><b class="red-font mr10">共${zongsp}件商品</b></span>
			<a href="search.jsp?list.jsp?currPageNo=1&q=<%=q%>" class="btn btn-default btn-xs">首页<i class="glyphicon glyphicon-chevron-left"></i></a>
			<a href="search.jsp?currPageNo=${pg.currPageNo-1}&q=<%=q%>" class="btn btn-default btn-xs">上一页<i class="glyphicon glyphicon-chevron-left"></i></a>
			<b class="red-font">${pg.currPageNo}/${zongys}</b>
			<a href="search.jsp?currPageNo=${pg.currPageNo+1}&q=<%=q%>" class="btn btn-default btn-xs">下一页<i class="glyphicon glyphicon-chevron-right"></i></a>
			<a href="search.jsp?currPageNo=${pg.totalPageCount}&q=<%=q%>" class="btn btn-default btn-xs">尾页<i class="glyphicon glyphicon-chevron-right"></i></a>
		</div>
	</div>
	<div class="pro-list-show" style="width: 1150px;margin: 20px auto;">
		<ul>
			<c:forEach var="sp" items="${sps}">
				<li>
					<a href="detail.jsp?spid=${sp.spId}&spxtypeid=${sp.spXTypeId}">
						<img class="center-block" alt="" src="image/${sp.spTp}" />
					</a>
					<div class="summary">
						<a href="detail.jsp?spid=${sp.spId}&spxtypeid=${sp.spXTypeId}">${sp.spName}</a>
					</div>
					<div class="price"><span class="pull-right red-font">返${sp.jf}积分</span><b>￥${sp.spxMoney}</b></div>
					<div class="list-show-eva"><i class="icon-main icon-eva-6"></i>
						<a href="">已有${sp.plNum}人评价</a>
					</div>
					<a style="height:30px;" href="doinsertGWC?sid=${sp.spId}&q=<%=q%>&type=3" >
						<button type="button" class="btn btn-default btn-xs">加入购物车</button>
					</a>
					<a style="height:30px;" href="search.jsp?sid=${sp.spId}&q=<%=q%>&type=3&sc=1" >
						<button type="button" class="btn btn-default btn-xs">收藏</button>
					</a>
				</li>
			</c:forEach>
		</ul>
	</div>
</div>
</div>
<%@include file="foot.jsp"%>