<%@page import="com.cz.entity.Users"%>
<%@page import="com.cz.dao.impl.ScDaoImpl"%>
<%@page import="com.cz.dao.IScDao"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.cz.entity.Sp"%>
<%@page import="java.util.List"%>
<%@page import="com.cz.util.Page"%>
<%@page import="com.cz.dao.impl.SpDaoImpl"%>
<%@page import="com.cz.dao.ISpDao"%>
<%@page import="com.cz.dao.impl.SpXTypeDaoImpl"%>
<%@page import="com.cz.dao.ISpXTypeDao"%>
<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>
<% session.setAttribute("open",null);%>
<%@ include file="head.jsp"%>
<%

	ISpXTypeDao spXTypeDao=new SpXTypeDaoImpl();
	ISpDao spDao=new SpDaoImpl();
	
	boolean isok=false;
	String spxType=request.getParameter("spxtype");
	String spType=request.getParameter("sptype");
	String spxTypeName=request.getParameter("spxTypeName");
	int spxTypeId=0;
	int spTypeId=0;
	if(spxTypeName==null||spxType==null||spType==null||spxType.equals("")&&spType.equals("")||spxTypeName.equals("")){
%>
	<script type="text/javascript">
		location("index.jsp");
	</script>
<%
		return;
	}
	
	
	spxTypeId=Integer.parseInt(spxType);
	spTypeId=Integer.parseInt(spType);
	
	//清除浏览记录
	if(request.getParameter("qc")!=null){
		session.setAttribute("spids",null);
	}
	//浏览记录
	List<Integer> spids=new ArrayList<Integer>();
	if(session.getAttribute("spids")!=null){
		spids=(List<Integer>)session.getAttribute("spids");
	}
	List<Sp> sps=new ArrayList<Sp>();
	if(spids!=null){
		if(request.getParameter("gd")!=null){
			for(int b=spids.size()-1;b>=0;b--){
				sps.add(spDao.findxqsp(spids.get(b)));
			}
		}else if(spids.size()>5){
			for(int b=spids.size()-1;b>=spids.size()-5;b--){
				sps.add(spDao.findxqsp(spids.get(b)));
			}
		}else{
			for(int b=spids.size()-1;b>=0;b--){
				sps.add(spDao.findxqsp(spids.get(b)));
			}
		}
	}
	request.setAttribute("lljl", sps);
	
	
	//分页
	Page pg;
	if(session.getAttribute("pg")==null){
		pg=new Page();
		pg.setPageSize(12);
	}else{
		pg=(Page)session.getAttribute("pg");
		pg.setPageSize(12);
	}
	request.setAttribute("xgfl",spXTypeDao.findallxtype(spTypeId));
	request.setAttribute("rmsp",spDao.findSpBynumGetXType(spxTypeId));
	String jj=request.getParameter("jj");
	if(jj!=null&&!jj.equals("null")){
		if(jj.equals("全部")){
			pg.setTatalCount(spDao.findSpCountGetXtype(spxTypeId));
			request.setAttribute("zongsp",pg.getTatalCount());
			request.setAttribute("zongys",pg.getTotalPageCount());
		}else{
			isok=true;
			pg.setTatalCount(spDao.findSpCountGetjj(spxTypeId,jj));
			request.setAttribute("zongsp",pg.getTatalCount());
			request.setAttribute("zongys",pg.getTotalPageCount());
		}
	}else{
		pg.setTatalCount(spDao.findSpCountGetXtype(spxTypeId));
		request.setAttribute("zongsp",pg.getTatalCount());
		request.setAttribute("zongys",pg.getTotalPageCount());
	}
	if(request.getParameter("currPageNo")!=null){
		pg.setCurrPageNo(Integer.parseInt(request.getParameter("currPageNo")));
		session.setAttribute("pg",pg);
	}else{
		pg.setCurrPageNo(1);
	}
	if(jj!=null&&!jj.equals("null")){
		if(jj.equals("全部")){
			request.setAttribute("sps",spDao.findSpGetXType(spxTypeId,pg));
		}else{
			isok=true;
			request.setAttribute("sps",spDao.findSpGetJj(spxTypeId,jj,pg));
		}
	}else{
		request.setAttribute("sps",spDao.findSpGetXType(spxTypeId,pg));
	}
	String px=request.getParameter("px");
	if(px!=null&&!px.equals("null")){
		if(isok==false){
			if(px.equals("xl")){
				request.setAttribute("sps",spDao.findSpPxGetXl(spxTypeId, pg));
			}
			if(px.equals("money")){
				request.setAttribute("sps",spDao.findSpPxGetSpxMoney(spxTypeId,pg));
			}
			if(px.equals("plNum")){
				request.setAttribute("sps",spDao.findSpPxGetPlNum(spxTypeId,pg));
			}
			if(px.equals("date")){
				request.setAttribute("sps",spDao.findSpPxGetSptime(spxTypeId,pg));
			}
		}else{
			if(px.equals("xl")){
				request.setAttribute("sps",spDao.findSpjjPxGetXl(spxTypeId,jj, pg));
			}
			if(px.equals("money")){
				request.setAttribute("sps",spDao.findSpjjPxGetSpxMoney(spxTypeId,jj,pg));
			}
			if(px.equals("plNum")){
				request.setAttribute("sps",spDao.findSpjjPxGetPlNum(spxTypeId,jj,pg));
			}
			if(px.equals("date")){
				request.setAttribute("sps",spDao.findSpjjPxGetSptime(spxTypeId,jj,pg));
			}
		}
	}
	request.setAttribute("pg",pg); 
	
	//收藏
	IScDao s=new ScDaoImpl();
	//判断是否收藏
	Users u=(Users)session.getAttribute("uu");
	String sc=request.getParameter("sc");
	if(sc!=null){
		int spId=Integer.parseInt(request.getParameter("spId"));
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
<!--专题-->
<!--/#header-->
<div class="container">
	<!-- 内容部分开始 -->
	<!-- 列表页部分开始 -->
	<div class="row">
		<!-- 面包屑导航开始 -->
		<div class="col-lg-12">
			<ol class="breadcrumb bg-none">
				<li>
					<a href="#">首页</a>
				</li>
				<li>
					<a href="#">专题</a>
				</li>
				<li class="active">
					<%=spxTypeName%>
				</li>
			</ol>
		</div>
		<!-- 面包屑导航结束 -->
	</div>
	<div class="row">
		<!-- 左边栏开始 -->
		<div id="sidebar" class="col-lg-2">
			<!-- 相关分类模块 -->
			<div class="widget mb10">
				<h5 class="widget-tit pl10 fb">相关分类</h5>
				<div class="panel-group" id="accordion">
					<div class="panel">
						<div id="collapseOne" class="panel-collapse collapse in">
							<div class="panel-list">
								<ul>
									<c:forEach var="xg" items="${xgfl}">
										<li>
											<a href="list.jsp?spxtype=${xg.spxTypeId}&sptype=<%=spTypeId%>&spxTypeName=${xg.spxTypeName}">${xg.spxTypeName}</a>
										</li>
									</c:forEach>
								</ul>
							</div>
						</div>
					</div>
				</div>
			</div>
			<!-- 商品推荐 -->
			<div class="widget mb10">
				<h5 class="widget-tit pl10 fb">热买商品推荐</h5>
				<ul class="widget-list-3">
					<c:forEach var="sp" items="${rmsp}">
						<li>
							<a href="detail.jsp?spid=${sp.spId}&spxtypeid=${sp.spXTypeId}">
								<img class="center-block" alt="" src="image/${sp.spTp}" /></a>
							<% %>
							<div class="summary">
								<a href="detail.jsp?spid=${sp.spId}&spxtypeid=${sp.spXTypeId}">${sp.spName}</a>
							</div>
							<div class="price">
								<b class="f18">￥${sp.spxMoney}</b>
								<span class="f12 ml10 red-font"><i class="icon-lower mr10">直降</i><br>已优惠 ￥${Integer.parseInt(sp.spxMoney)-Integer.parseInt(sp.spyMoney)}</span>
							</div>
						</li>
					</c:forEach>
				</ul>
			</div>
			<!-- 浏览记录 -->
			<div class="widget mb10">
				<h5 class="widget-tit pl10 fb"><span class="pull-right f12 pr10 gray-font"><a href="list.jsp?qc=qc&spxtype=<%=spxTypeId%>&sptype=<%=spTypeId%>&spxTypeName=<%=spxTypeName%>&jj=<%=jj%>&px=<%=request.getParameter(" px ")%>">清除</a></span>浏览记录</h5>
				<ul class="widget-list-2">
					<c:forEach var="sp" items="${lljl}">
						<li>
							<div class="w-list-product">
								<a href="detail.jsp?spid=${sp.spId}&spxtypeid=${sp.spXTypeId}">
									<img class="pull-left" alt="${sp.spName}" src="image/${sp.spTp}" /></a>
								<div class="summary">
									<a href="detail.jsp?spid=${sp.spId}&spxtypeid=${sp.spXTypeId}">${sp.spName}</a>
								</div>
								<div class="price"><b>¥${sp.spxMoney}</b></div>
							</div>
						</li>
					</c:forEach>
					<span class="pull-right f12 pr10 gray-font"><a href="list.jsp?gd=gd&spxtype=<%=spxTypeId%>&sptype=<%=spTypeId%>&spxTypeName=<%=spxTypeName%>&jj=<%=jj%>&px=<%=request.getParameter(" px ")%>">更多记录</a>
				</ul>
			</div>
		</div>
		<!-- 左边栏结束 -->
		<!-- 内容区域开始 -->
		<div id="content" class="col-lg-10">
			<div class="item-filter mt10">
				<div class="list-item-title pl10 f14 tit-family "><b class="red-font f16">休闲鞋</b>---商品筛选</div>
				<div class="filter-list">
					<div class="list-body">
						<div class="pull-left filter-left">季节:</div>
						<div class="pull-right filter-right">
							<ul>
								<li>
									<a href="list.jsp?jj=全部&spxtype=<%=spxTypeId%>&sptype=<%=spTypeId%>&spxTypeName=<%=spxTypeName%>">全部</a>
								</li>
								<li>
									<a href="list.jsp?jj=春季&spxtype=<%=spxTypeId%>&sptype=<%=spTypeId%>&spxTypeName=<%=spxTypeName%>">春季</a>
								</li>
								<li>
									<a href="list.jsp?jj=夏季&spxtype=<%=spxTypeId%>&sptype=<%=spTypeId%>&spxTypeName=<%=spxTypeName%>">夏季</a>
								</li>
								<li>
									<a href="list.jsp?jj=秋季&spxtype=<%=spxTypeId%>&sptype=<%=spTypeId%>&spxTypeName=<%=spxTypeName%>">秋季</a>
								</li>
								<li>
									<a href="list.jsp?jj=冬季&spxtype=<%=spxTypeId%>&sptype=<%=spTypeId%>&spxTypeName=<%=spxTypeName%>">冬季</a>
								</li>
							</ul>
						</div>
						<div class="clearfix"></div>
					</div>
				</div>
			</div>
			<div class="item-pro-list mt10">
				<div class="list-item-title">
					<div class="sort-left pull-left pl10">
						<span>排序：</span>
						<a href="list.jsp?px=xl&spxtype=<%=spxTypeId%>&sptype=<%=spTypeId%>&spxTypeName=<%=spxTypeName%>&jj=<%=jj%>">销量 <span class="glyphicon glyphicon-arrow-down"></span></a>
						<a href="list.jsp?px=money&spxtype=<%=spxTypeId%>&sptype=<%=spTypeId%>&spxTypeName=<%=spxTypeName%>&jj=<%=jj%>">价格 <span class="glyphicon glyphicon-arrow-down"></span></a>
						<a href="list.jsp?px=plNum&spxtype=<%=spxTypeId%>&sptype=<%=spTypeId%>&spxTypeName=<%=spxTypeName%>&jj=<%=jj%>">评论数 <span class="glyphicon glyphicon-arrow-down"></span></a>
						<a href="list.jsp?px=date&spxtype=<%=spxTypeId%>&sptype=<%=spTypeId%>&spxTypeName=<%=spxTypeName%>&jj=<%=jj%>">上架时间 <span class="glyphicon glyphicon-arrow-down"></span></a>
					</div>
					<div class="sort-right pull-right" style="width: 350px;">
						<span><b class="red-font mr10">共${zongsp}件商品</b></span>
						<a href="list.jsp?currPageNo=1&spxtype=<%=spxTypeId%>&sptype=<%=spTypeId%>&spxTypeName=<%=spxTypeName%>&jj=<%=jj%>&px=<%=request.getParameter(" px ")%>" class="btn btn-default btn-xs">首页<i class="glyphicon glyphicon-chevron-left"></i></a>
						<a href="list.jsp?currPageNo=${pg.currPageNo-1}&spxtype=<%=spxTypeId%>&sptype=<%=spTypeId%>&spxTypeName=<%=spxTypeName%>&jj=<%=jj%>&px=<%=request.getParameter(" px ")%>" class="btn btn-default btn-xs">上一页<i class="glyphicon glyphicon-chevron-left"></i></a>
						<b class="red-font">${pg.currPageNo}/${zongys}</b>
						<a href="list.jsp?currPageNo=${pg.currPageNo+1}&spxtype=<%=spxTypeId%>&sptype=<%=spTypeId%>&spxTypeName=<%=spxTypeName%>&jj=<%=jj%>&px=<%=request.getParameter(" px ")%>" class="btn btn-default btn-xs">下一页<i class="glyphicon glyphicon-chevron-right"></i></a>
						<a href="list.jsp?currPageNo=${pg.totalPageCount}&spxtype=<%=spxTypeId%>&sptype=<%=spTypeId%>&spxTypeName=<%=spxTypeName%>&jj=<%=jj%>&px=<%=request.getParameter(" px ")%>" class="btn btn-default btn-xs">尾页<i class="glyphicon glyphicon-chevron-right"></i></a>
					</div>
				</div>
				<div class="clearfix"></div>
				<div class="pro-list-show">
					<ul>
						<c:forEach var="sp" items="${sps}">
							<li>
								<a href="detail.jsp?spid=${sp.spId}&spxtypeid=<%=spxTypeId%>">
									<img class="center-block" alt="" src="image/${sp.spTp}" />
								</a>
								<div class="summary">
									<a href="detail.jsp?spid=${sp.spId}&spxtypeid=<%=spxTypeId%>">${sp.spName}</a>
								</div>
								<div class="price"><span class="pull-right red-font">返${sp.jf}积分</span><b>￥${sp.spxMoney}</b></div>
								<div class="list-show-eva"><i class="icon-main icon-eva-6"></i>
									<a href="">已有${sp.plNum}人评价</a>
								</div>
								<a style="height:30px;" href="doinsertGWC?sid=${sp.spId}&spxtype=<%=spxTypeId%>&sptype=<%=spTypeId%>&spxTypeName=<%=request.getParameter("spxTypeName")%>&&jj=<%=jj%>&px=<%=request.getParameter("px")%>" >
									<button type="button" class="btn btn-default btn-xs">加入购物车</button>
								</a>
								<a style="height:30px;" href="list.jsp?spxtype=<%=spxTypeId%>&sptype=<%=spTypeId%>&spxTypeName=<%=spxTypeName%>&jj=<%=jj%>&px=<%=request.getParameter(" px ")%>&spId=${sp.spId}&sc=1" >
									<button type="button" class="btn btn-default btn-xs">收藏</button>
								</a>
							</li>
						</c:forEach>
					</ul>
				</div>
			</div>
		</div>
		<!-- 内容区域结束 -->
	</div>
	<!-- 列表页部分结束 -->
	<!-- 内容部分结束 -->
	<%@ include file="foot.jsp"%>