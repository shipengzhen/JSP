<%@page import="java.util.ArrayList"%>
<%@page import="com.cz.util.Page"%>
<%@page import="com.cz.dao.impl.ScDaoImpl"%>
<%@page import="com.cz.dao.IScDao"%>
<%@page import="com.cz.dao.impl.PlDaoImpl"%>
<%@page import="com.cz.dao.IPlDao"%>
<%@page import="com.cz.dao.impl.DdDaoImpl"%>
<%@page import="com.cz.dao.IDdDao"%>
<%@page import="com.cz.entity.Sc"%>
<%@page import="com.cz.entity.Users"%>
<%@page import="java.util.List"%>
<%@page import="com.cz.entity.Pl"%>
<%@page import="com.cz.entity.Spimgae"%>
<%@page import="com.cz.entity.Sp"%>
<%@page import="com.cz.dao.impl.SpDaoImpl"%>
<%@page import="com.cz.dao.ISpDao"%>
<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>
<%
	session.setAttribute("open",null);
%>
<%@ include file="head.jsp"%>
<%

	IDdDao ddDao=new DdDaoImpl();
    //最新订单
    List<Sp> ddList=ddDao.dingList();
    IPlDao plDao=new PlDaoImpl();
    ISpDao spDao=new SpDaoImpl();
    IScDao scDao=new ScDaoImpl();
    
    String spid=request.getParameter("spid");
    String spXTypeid=request.getParameter("spxtypeid");
    
    if(spid==null||spXTypeid==null){
%>
		<script type="text/javascript">
			location("index.jsp");
		</script>
<%
		return;
    }
	int spId=Integer.parseInt(spid);
	int spXTypeId=Integer.parseInt(spXTypeid);
	
	//浏览记录
	List<Integer> spids=new ArrayList<Integer>();
	if(session.getAttribute("spids")!=null){
		spids=(List<Integer>)session.getAttribute("spids");
	}
	//删除重复
	for(int s=0;s<=spids.size()-1;s++){
		if(spId==spids.get(s)){
			spids.remove(s);
		}
	}
	//添加记录
	spids.add(spId);
	session.setAttribute("spids",spids);
	
    //商品详情页
	Sp sp=new Sp();
	sp.setSpId(spId);
	request.setAttribute("sp", spDao.findxqsp(sp.getSpId()));
	request.setAttribute("xlpx",spDao.findSpPxGetXl(spXTypeId));
	request.setAttribute("zhi",plDao.findPlCount(spId) );
	
	
	//收藏
	IScDao s=new ScDaoImpl();
	//判断是否收藏
	Users u=(Users)session.getAttribute("uu");
	String sc=request.getParameter("sc");
	boolean bl=false;
	if(u!=null){
		bl=s.scpd(spId, u.getuId());
		request.setAttribute("bl",bl);
		if(bl){	
		%>
			<script type="text/javascript">
				$(function(){
					$("#scc").css("background-color", "#eb81b8");
				});	
			</script>
		<% 	
		}
	}
	if(sc!=null){
		if(u!=null){
			bl=s.scpd(spId, u.getuId());
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
	//分页
	Page pg;
	if(session.getAttribute("pg")==null){
		pg=new Page();
		pg.setPageSize(3);
	}else{
		pg=(Page)session.getAttribute("pg");
		pg.setPageSize(3);
	}
	pg.setTatalCount(plDao.findCountPl(spId));
	request.setAttribute("zys",pg.getTotalPageCount());
	String plType=request.getParameter("plType");
	request.setAttribute("plType",plType);
	if(plType!=null){
		if(!plType.equals("all")){
			pg.setTatalCount(plDao.findCountPlGetplType(spId, plType));
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
	if(plType!=null){
		if(plType.equals("all")){
			request.setAttribute("pls",plDao.findPl(spId, pg));
		}else{
			request.setAttribute("pls",plDao.findPlGetplType(spId, plType, pg));
		}
	}else{
		request.setAttribute("pls",plDao.findPl(spId, pg));
	}
%>
<!--商品详情-->
<div class="container">
	<div class="row">
		<style type="text/css">
			.a {
				border: 1px solid #000000;
			}
		</style>
		<!-- 左边栏 -->
		<div id="sidebar" class="col-lg-2">
			<div class="widget mb10">
				<h5 class="widget-tit pl10 fb">销量排行榜</h5>
				<ul class="widget-list-2">
					<c:forEach var="v" begin="0" end="${xlpx.size()-1}">
						<li>
							<div class="w-list-product pr">
								<a href="detail.jsp?spid=${xlpx.get(v).spId}&spxtypeid=<%=spXTypeId%>">
									<i class="icon-main icon-red-rank ild pa">${v+1}</i>
									<img class="pull-left" alt="" src="image/${xlpx.get(v).spTp}" />
								</a>
								<div class="summary">
									<a href="detail.jsp?spid=${xlpx.get(v).spId}&spxtypeid=<%=spXTypeId%>">
										${xlpx.get(v).spName}
									</a>
								</div>
								<div class="price"><b>${xlpx.get(v).spxMoney}</b></div>
							</div>
						</li>
					</c:forEach>
				</ul>
			</div>
			<div class="widget mb10">
				<h5 class="widget-tit pl10 fb">看看别人买了什么</h5>
				<ul class="widget-list-2">
					<%for(Sp dlist:ddList){%>
					<li>
						<div class="w-list-product">
							<div class="pull-left other-welt">
								<div class="welt-style">最新订单</div>
								<a href="detail.jsp?spid=<%=dlist.getSpId()%>&spxtypeid=<%=dlist.getSpXTypeId()%>"><img src="image/<%=dlist.getSpTp()%>" /></a>
							</div>
							<div class="summary-20 ">
								<a href="detail.jsp?spid=<%=dlist.getSpId()%>&spxtypeid=<%=dlist.getSpXTypeId()%>">
									<%=dlist.getSpName() %>
								</a>
							</div>
							<div class="summary-20 red-font">
								<%=dlist.getSpMs() %>
							</div>
						</div>
					</li>
					<%} %>
				</ul>
			</div>
		</div>
		<!-- 右边内容 -->
		<script type="text/javascript">
			$(function() {
				$("#pj").click(function() { //商品评价
					$("#review-pinglun").css("display", "block");
					$("#intro").css("display", "none");
					$("#after").css("display", "none");
				});

				$("#js").click(function() { //商品介绍
					$("#intro").css("display", "block");
					$("#review-pinglun").css("display", "none");
					$("#after").css("display", "none");
				});

				$("#bz").click(function() { //售后保障
					$("#after").css("display", "block");
					$("#intro").css("display", "none");
					$("#review-pinglun").css("display", "none");
				});
			});

			//购买商品数量
			$(function() {
				$(".ui-icon1").click(function() {
					$("input[name=shuliang]").val(parseInt($("input[name=shuliang]").val()) + 1);
				});
				$(".ui-icon2").click(function() {
					$("input[name=shuliang]").val(parseInt($("input[name=shuliang]").val()) - 1);
					if(parseInt($("input[name=shuliang]").val()) < 1) {
						parseInt($("input[name=shuliang]").val(1));
					}
				});
			});

			//收藏商品
		</script>
		<div id="content" class="col-lg-10">
			<div class="item-meta">
				<h1 class="meta-tit">${sp.spName}</h1>
				<div class="meta-situ">
					<div class="meta-magnifier pull-left">
						<img src="image/${sp.spTp}" width="340px" height="380px" />

					</div>
					<div class="meta-show pull-right">
						<h2 class="meta-maintit">${sp.spName}</h2>
						<div class="meta-subtitle">${sp.spMs}</div>
						<div class="meta-reveal mb10">
							<ul>
								<li class="reveal-tit">商品编号：</li>
								<li class="reveal-sow">${sp.spBh}</li>
								<li class="reveal-tit">市场价：</li>
								<li class="reveal-sow rev-text-1">￥${sp.spyMoney}</li>
								<li class="reveal-tit">市场价：</li>
								<li class="reveal-sow rev-text-2">￥${sp.spxMoney}
									<b class="rev-text-3 ml10">返积分：${sp.jf}</b> <b class="rev-text-4 ml10"><a href="">什么积分？</a></b>
								</li>
								<li class="reveal-tit">服 务：</li>
								<li class="reveal-sow">由<b class="rev-text-3">传智</b>发货并提供帮助</li>
								<li class="reveal-tit">商品评分：</li>
								<li class="reveal-sow">
									<i class="icon-main icon-eva-5"></i> (已有${zhi}人评价)
								</li>
							</ul>
						</div>
						
						<form action="jrgwc" method="post">
						<div class="meta-btn">
							<div class="quantity mb10">购买数量：<span class="ui-spinner"><input readonly="readonly" type="text" value="1" name="shuliang" aria-valuenow="0" autocomplete="off"><a class="ui-spinner-button ui-spinner-up"><span class="ui-icon1">▲</span></a>
								<a class="ui-spinner-button ui-spinner-down"><span class="ui-icon2">▼</span></a>
								</span>(库存${sp.kc}件)</div>
							<div class="button-group">
								<input type="submit" name="a" class="btn btn-danger btn-lg mr20" value="立即购买"/>
								<input type="submit" name="b"   class="btn btn-addcart btn-lg mr20" value="加入购物车"/>
								<input type="text" name="spid" Style="display: none;" value="<%=spId%>"/>
								<input type="text" name="spxtypeid" Style="display: none;" value="<%=spXTypeId%>"/>
								<c:choose>	
									<c:when test="${bl}">
										<a>
											<button id="scc" type="button" class="btn btn-collect btn-lg">
												<i class="icon-main icon-like"></i>收藏
											</button>
										</a>
									</c:when>
									<c:otherwise>
										<a href="detail.jsp?spid=<%=spId%>&spxtypeid=<%=spXTypeId%>&sc=1">
											<button id="scc" type="button" class="btn btn-collect btn-lg">
												<i class="icon-main icon-like"></i>收藏
											</button>
										</a>
									</c:otherwise>
								</c:choose>
							</div>
						</div>
						</form>
					</div>
					<div class="clearfix"></div>
				</div>
			</div>

			<c:choose>
				<c:when test="${empty plType}">
					<div class="item-detail">
						<ul class="nav nav-tabs detail-tabs" id="detail-tabs">
							<li class="active">
								<a id="js" data-toggle="tab">商品介绍</a>
							</li>
							<li>
								<a id="pj" data-toggle="tab">商品评价</a>
							</li>
							<li>
								<a id="bz" data-toggle="tab">售后保障</a>
							</li>
						</ul>
					</div>
					<%--商品详情--%>
					<div style="" class="tab-pane active" id="intro">
		
						<%for(Spimgae ss: spDao.findxqImage(spId)){%>
						<p id="jieshao"><img src="image/<%=ss.getImageurl()%>" width="800px" height="500px" /></p>
						<%} %>
					</div>
					<%--商品评论--%>
					<div style="display: none;" class="review-show mt15  p15" id="review-pinglun">
				</c:when>
				<c:otherwise>
					<div class="item-detail">
						<ul class="nav nav-tabs detail-tabs" id="detail-tabs">
							<li>
								<a id="js" data-toggle="tab">商品介绍</a>
							</li>
							<li class="active">
								<a id="pj" data-toggle="tab">商品评价</a>
							</li>
							<li>
								<a id="bz" data-toggle="tab">售后保障</a>
							</li>
						</ul>
					</div>
					<%--商品详情--%>
					<div style="display: none;" class="tab-pane active" id="intro">
		
						<%for(Spimgae ss: spDao.findxqImage(spId)){%>
						<p id="jieshao"><img src="image/<%=ss.getImageurl()%>" width="800px" height="500px" /></p>
						<%} %>
					</div>
					<%--商品评论--%>
					<div class="review-show mt15  p15" id="review-pinglun">
				</c:otherwise>
			</c:choose>
			<c:choose>
				<c:when test="${plType=='好评'}">
					<ul class="nav nav-tabs review-tabs" id="review-tabs">
						<li>
							<a href="detail.jsp?plType=all&spid=<%=spId%>&spxtypeid=<%=spXTypeId%>">
								全部评论(<%=plDao.findCountPl(spId) %>)
							</a>
						</li>
						<li class="active">
							<a href="detail.jsp?plType=好评&spid=<%=spId%>&spxtypeid=<%=spXTypeId%>" >
								好评(<%=plDao.findCountPlGetplType(spId, "好评") %>)
							</a>
						</li>
						<li>
							<a href="detail.jsp?plType=中评&spid=<%=spId%>&spxtypeid=<%=spXTypeId%>">
								中评(<%=plDao.findCountPlGetplType(spId, "中评") %>)
							</a>
						</li>
						<li>
							<a href="detail.jsp?plType=差评&spid=<%=spId%>&spxtypeid=<%=spXTypeId%>">
								差评(<%=plDao.findCountPlGetplType(spId, "差评") %>)
							</a>
						</li>
					</ul>
				</c:when>
				<c:when test="${plType=='中评'}">
					<ul class="nav nav-tabs review-tabs" id="review-tabs">
						<li>
							<a href="detail.jsp?plType=all&spid=<%=spId%>&spxtypeid=<%=spXTypeId%>">
								全部评论(<%=plDao.findCountPl(spId) %>)
							</a>
						</li>
						<li>
							<a href="detail.jsp?plType=好评&spid=<%=spId%>&spxtypeid=<%=spXTypeId%>" >
								好评(<%=plDao.findCountPlGetplType(spId, "好评") %>)
							</a>
						</li>
						<li class="active">
							<a href="detail.jsp?plType=中评&spid=<%=spId%>&spxtypeid=<%=spXTypeId%>">
								中评(<%=plDao.findCountPlGetplType(spId, "中评") %>)
							</a>
						</li>
						<li>
							<a href="detail.jsp?plType=差评&spid=<%=spId%>&spxtypeid=<%=spXTypeId%>">
								差评(<%=plDao.findCountPlGetplType(spId, "差评") %>)
							</a>
						</li>
					</ul>
				</c:when>
				<c:when test="${plType=='差评'}">
					<ul class="nav nav-tabs review-tabs" id="review-tabs">
						<li>
							<a href="detail.jsp?plType=all&spid=<%=spId%>&spxtypeid=<%=spXTypeId%>">
								全部评论(<%=plDao.findCountPl(spId) %>)
							</a>
						</li>
						<li>
							<a href="detail.jsp?plType=好评&spid=<%=spId%>&spxtypeid=<%=spXTypeId%>" >
								好评(<%=plDao.findCountPlGetplType(spId, "好评") %>)
							</a>
						</li>
						<li>
							<a href="detail.jsp?plType=中评&spid=<%=spId%>&spxtypeid=<%=spXTypeId%>">
								中评(<%=plDao.findCountPlGetplType(spId, "中评") %>)
							</a>
						</li>
						<li class="active">
							<a href="detail.jsp?plType=差评&spid=<%=spId%>&spxtypeid=<%=spXTypeId%>">
								差评(<%=plDao.findCountPlGetplType(spId, "差评") %>)
							</a>
						</li>
					</ul>
				</c:when>
				<c:otherwise>
					<ul class="nav nav-tabs review-tabs" id="review-tabs">
						<li class="active">
							<a href="detail.jsp?plType=all&spid=<%=spId%>&spxtypeid=<%=spXTypeId%>">
								全部评论(<%=plDao.findCountPl(spId) %>)
							</a>
						</li>
						<li>
							<a href="detail.jsp?plType=好评&spid=<%=spId%>&spxtypeid=<%=spXTypeId%>" >
								好评(<%=plDao.findCountPlGetplType(spId, "好评") %>)
							</a>
						</li>
						<li>
							<a href="detail.jsp?plType=中评&spid=<%=spId%>&spxtypeid=<%=spXTypeId%>">
								中评(<%=plDao.findCountPlGetplType(spId, "中评") %>)
							</a>
						</li>
						<li>
							<a href="detail.jsp?plType=差评&spid=<%=spId%>&spxtypeid=<%=spXTypeId%>">
								差评(<%=plDao.findCountPlGetplType(spId, "差评") %>)
							</a>
						</li>
					</ul>
				</c:otherwise>
			</c:choose>
			<c:choose>
				<c:when test="${empty plType}">
					<div class="sort-right pull-right" style="width: 210px;">
						<a href="detail.jsp?currPageNo=${pg.currPageNo-1}&plType=all&spid=<%=spId%>&spxtypeid=<%=spXTypeId%>" class="btn btn-default btn-xs">上一页<i class="glyphicon glyphicon-chevron-left"></i></a>
						<b class="red-font">${pg.currPageNo}/${zys}</b>
						<a href="detail.jsp?currPageNo=${pg.currPageNo+1}&plType=all&spid=<%=spId%>&spxtypeid=<%=spXTypeId%>" class="btn btn-default btn-xs">下一页<i class="glyphicon glyphicon-chevron-right"></i></a>
					</div>
				</c:when>
				<c:otherwise>
					<div class="sort-right pull-right" style="width: 210px;">
						<a href="detail.jsp?currPageNo=${pg.currPageNo-1}&plType=${plType}&spid=<%=spId%>&spxtypeid=<%=spXTypeId%>" class="btn btn-default btn-xs">上一页<i class="glyphicon glyphicon-chevron-left"></i></a>
						<b class="red-font">${pg.currPageNo}/${zys}</b>
						<a href="detail.jsp?currPageNo=${pg.currPageNo+1}&plType=${plType}&spid=<%=spId%>&spxtypeid=<%=spXTypeId%>" class="btn btn-default btn-xs">下一页<i class="glyphicon glyphicon-chevron-right"></i></a>
					</div>
				</c:otherwise>
			</c:choose>
				<div id="div1" class="tab-content p15">
					<c:forEach var="pl" items="${pls}">
						<div class="tab-pane active" id="all-eva">
							<div class="rev-list">
								<div class="user">
									<div class="user-avatar">
										<a href="" target="_blank">
											<img alt="${pl.uName}" src="utx/${pl.uTx}" data-original="" style="display: inline;" />
										</a>
									</div>
									<div class="user-name">
										<a href="" target="_blank">${pl.uName}</a>
									</div>
								</div>
								<div class="rev-item">
									<div class="rev-top">
										<i class="rev-star icon-main icon-eva-5"></i>
										<span class="rev-date">${pl.plTime}</span>
									</div>
									<div class="rev-content">${pl.plString}</div>
								</div>
								<i class="corner icon-main icon-arrow"></i>
							</div>
						</div>
					</c:forEach>
				</div>
			</div>

			<%--售后保障--%>
			<div style="display: none; " class="item-after" id="after">
				<div class="p15">
					<p class="lh200">
						<b>服务承诺： </b>
						<br /> 传智商城向您保证所售商品均为正品行货，传智自营商品自带机打发票，与商品一起寄送。凭质保证书及传智商城发票，可享受全国联保服务（奢侈品、钟表除外；奢侈品、钟表由传智联系保修，享受法定三包售后服务），与您亲临商场选购的商品享受相同的质量保证。传智商城还为您提供具有竞争力的商品价格和运费政策，请您放心购买！
						<br />
						<br /> 注：因厂家会在没有任何提前通知的情况下更改产品包装、产地或者一些附件，本司不能确保客户收到的货物与商城图片、产地、附件说明完全一致。只能确保为原厂正货！并且保证与当时市场上同样主流新品一致。若本商城没有及时更新，请大家谅解！
					</p>
				</div>
			</div>
		</div>
		<!-- 详细页结束 -->
		<!-- 内容部分结束 -->
		<%@ include file="foot.jsp"%>  