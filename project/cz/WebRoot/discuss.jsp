-<%@page import="com.cz.util.Page"%>
<%@page import="com.cz.dao.impl.PlDaoImpl"%>
<%@page import="com.cz.dao.IPlDao"%>
<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>
<%@include file="uhead.jsp"%>
<%
	IPlDao plDao=new PlDaoImpl();
	//分页
	Page pg;
	if(session.getAttribute("pg")==null){
		pg=new Page();
		pg.setPageSize(3);
	}else{
		pg=(Page)session.getAttribute("pg");
		pg.setPageSize(3);
	}
	pg.setTatalCount(plDao.findPlCountGetuId(uId));
	request.setAttribute("zys",pg.getTotalPageCount());
	String plType=request.getParameter("plType");
	request.setAttribute("plType",plType);
	if(plType!=null){
		if(!plType.equals("all")){
			pg.setTatalCount(plDao.findPlCountGetuIdType(uId, plType));
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
			request.setAttribute("pls",plDao.findAllPlGetuId(uId, pg));
		}else{
			request.setAttribute("pls",plDao.findTypePlGetuId(uId, plType, pg));
		}
	}else{
		request.setAttribute("pls",plDao.findAllPlGetuId(uId, pg));
	}
%>
<div id="content" class="col-lg-10">
	<c:choose>
		<c:when test="${plType=='好评'}">
			<ul class="nav nav-tabs review-tabs" id="review-tabs">
				<li>
					<a href="discuss.jsp?plType=all">
						全部评论(<%=plDao.findPlCountGetuId(uId)%>)
					</a>
				</li>
				<li class="active">
					<a href="discuss.jsp?plType=好评" >
						好评(<%=plDao.findPlCountGetuIdType(uId,"好评") %>)
					</a>
				</li>
				<li>
					<a href="discuss.jsp?plType=中评">
						中评(<%=plDao.findPlCountGetuIdType(uId,"中评") %>)
					</a>
				</li>
				<li>
					<a href="discuss.jsp?plType=差评">
						差评(<%=plDao.findPlCountGetuIdType(uId,"差评") %>)
					</a>
				</li>
			</ul>
		</c:when>
		<c:when test="${plType=='中评'}">
			<ul class="nav nav-tabs review-tabs" id="review-tabs">
				<li>
					<a href="discuss.jsp?plType=all">
						全部评论(<%=plDao.findPlCountGetuId(uId)%>)
					</a>
				</li>
				<li>
					<a href="discuss.jsp?plType=好评" >
						好评(<%=plDao.findPlCountGetuIdType(uId,"好评") %>)
					</a>
				</li>
				<li class="active">
					<a href="discuss.jsp?plType=中评">
						中评(<%=plDao.findPlCountGetuIdType(uId,"中评") %>)
					</a>
				</li>
				<li>
					<a href="discuss.jsp?plType=差评">
						差评(<%=plDao.findPlCountGetuIdType(uId,"差评") %>)
					</a>
				</li>
			</ul>
		</c:when>
		<c:when test="${plType=='差评'}">
			<ul class="nav nav-tabs review-tabs" id="review-tabs">
				<li>
					<a href="discuss.jsp?plType=all">
						全部评论(<%=plDao.findPlCountGetuId(uId)%>)
					</a>
				</li>
				<li>
					<a href="discuss.jsp?plType=好评" >
						好评(<%=plDao.findPlCountGetuIdType(uId,"好评") %>)
					</a>
				</li>
				<li>
					<a href="discuss.jsp?plType=中评">
						中评(<%=plDao.findPlCountGetuIdType(uId,"中评") %>)
					</a>
				</li>
				<li class="active">
					<a href="discuss.jsp?plType=差评">
						差评(<%=plDao.findPlCountGetuIdType(uId,"差评") %>)
					</a>
				</li>
			</ul>
		</c:when>
		<c:otherwise>
			<ul class="nav nav-tabs review-tabs" id="review-tabs">
				<li class="active">
					<a href="discuss.jsp?plType=all">
						全部评论(<%=plDao.findPlCountGetuId(uId)%>)
					</a>
				</li>
				<li>
					<a href="discuss.jsp?plType=好评" >
						好评(<%=plDao.findPlCountGetuIdType(uId,"好评") %>)
					</a>
				</li>
				<li>
					<a href="discuss.jsp?plType=中评">
						中评(<%=plDao.findPlCountGetuIdType(uId,"中评") %>)
					</a>
				</li>
				<li>
					<a href="discuss.jsp?plType=差评">
						差评(<%=plDao.findPlCountGetuIdType(uId,"差评") %>)
					</a>
				</li>
			</ul>
		</c:otherwise>
	</c:choose>
	<c:choose>
			<c:when test="${empty plType}">
				<div class="sort-right pull-right" style="width: 210px;">
					<a href="discuss.jsp?currPageNo=${pg.currPageNo-1}&plType=all" class="btn btn-default btn-xs">上一页<i class="glyphicon glyphicon-chevron-left"></i></a>
					<b class="red-font">${pg.currPageNo}/${zys}</b>
					<a href="discuss.jsp?currPageNo=${pg.currPageNo+1}&plType=all" class="btn btn-default btn-xs">下一页<i class="glyphicon glyphicon-chevron-right"></i></a>
				</div>
			</c:when>
			<c:otherwise>
				<div class="sort-right pull-right" style="width: 210px;">
					<a href="discuss.jsp?currPageNo=${pg.currPageNo-1}&plType=${plType}" class="btn btn-default btn-xs">上一页<i class="glyphicon glyphicon-chevron-left"></i></a>
					<b class="red-font">${pg.currPageNo}/${zys}</b>
					<a href="discuss.jsp?currPageNo=${pg.currPageNo+1}&plType=${plType}" class="btn btn-default btn-xs">下一页<i class="glyphicon glyphicon-chevron-right"></i></a>
				</div>
			</c:otherwise>
		</c:choose>
	<div id="div1" class="tab-content p15">
		<c:forEach var="pl" items="${pls}">
			<div class="tab-pane active" id="all-eva">
				<div class="rev-list">
					<div class="user">
						<div class="user-avatar">
							<a href="detail.jsp?spid=${pl.spid}&spxtypeid=${pl.spXTypeId}">
								<img alt="${pl.spName}" src="image/${pl.spTp}" data-original="" style="display: inline;" />
							</a>
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
<%@include file="foot.jsp"%>