<%@page import="com.bdqn.spz.news.entity.Topic"%>
<%@page import="com.bdqn.spz.news.service.impl.TopicServiceImpl"%>
<%@page import="com.bdqn.spz.news.service.ITopicService"%>
<%@page import="com.bdqn.spz.news.util.Page"%>
<%@page import="com.bdqn.spz.news.service.impl.NewsServiceImpl"%>
<%@page import="com.bdqn.spz.news.service.INewsService"%>
<%@page import="com.bdqn.spz.news.entity.News"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	INewsService newsService=new NewsServiceImpl();
	ITopicService topicService=new TopicServiceImpl();
// 	if(session.getAttribute("admin")!=null){
// 		request.getRequestDispatcher("admin.jsp").forward(request, response);
// 	}
 %>
<!DOCTYPE html>
<html>

	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>新闻中国</title>
		<link href="CSS/main.css" rel="stylesheet" type="text/css" />
	</head>

	<body>
		<div id="header">
			<form action="LoginServlet" method="post" name="form1">
				<div id="top_login">
					<label> 登录名 </label>
					<input type="text" id="uname" value="" class="login_input" name="uname" />
					<label> 密&#160;&#160;码 </label>
					<input type="password" id="upwd" value="" class="login_input" name="upwd" />
					<input type="submit" class="login_sub" value="登录" onclick="login()" />
					<label id="error"> </label>
					<img src="Images/friend_logo.gif" alt="Google" id="friend_logo" />
				</div>
			</form>
			<div id="nav">
				<div id="logo"> <img src="Images/logo.jpg" alt="新闻中国" /> </div>
				<div id="a_b01"> <img src="Images/a_b01.gif" alt="" /> </div>
			</div>
		</div>
		<div id="container">
			<div class="sidebar">
				<h1> <img src="Images/title_1.gif" alt="国内新闻" /> </h1>
				<div class="side_list">
					<ul>
						<%
							for(String s: newsService.findNewsNameByTId(1)){
						%>
						<a href='#'>
							<p>
								<%=s%>
							</p>
						</a>
						<%
							}
						%>
					</ul>
				</div>
				<h1> <img src="Images/title_2.gif" alt="国际新闻" /> </h1>
				<div class="side_list">
					<ul>
						<%
							for(String s: newsService.findNewsNameByTId(2)){
						%>
						<a href='#'>
							<p>
								<%=s%>
							</p>
						</a>
						<%
							}
						%>
					</ul>
				</div>
				<h1> <img src="Images/title_3.gif" alt="娱乐新闻" /> </h1>
				<div class="side_list">
					<ul>
						<%
							for(String s: newsService.findNewsNameByTId(5)){
						%>
						<a href='#'>
							<p>
								<%=s%>
							</p>
						</a>
						<%
							}
						%>
					</ul>
				</div>
			</div>
			<div class="main">
				<div class="class_type"> <img src="Images/class_type.gif" alt="新闻中心" /> </div>
				<div class="content">
					<ul class="class_date">
						<li id='class_month'>
<%
							for(Topic topic:topicService.findTopicAll()){
%>
								<a href="login.jsp?value=<%=topic.gettId() %>"><%=topic.gettName()%></a>
<%
							}								
%>
						</li>
					</ul>
					<ul class="classlist">
					
						<%
							Page pg;
							if(session.getAttribute("Page")==null){
								pg=new Page(3,1);
							}else{
								pg=(Page)session.getAttribute("Page");
							}
							String dang=request.getParameter("value");
							int da;
							if(dang==null){
								da=1;
							}else{
								da=new Integer(dang);
							}
							
							String name=request.getParameter("name");
							if(name==null){
								name="1";
							}else{
								session.setAttribute("Page",pg);
							}
							int nid=Integer.parseInt(name);
							pg.setTotalCount(newsService.findNewsCountByTId(da));
							int zong=pg.getTotalPageCount();
							pg.setCurrPageNo(nid);
							for(News news:newsService.findNewsByTName(da,pg)){ 
						%>
								<li>
									<a href='newspages/news_add.html'><%=news.getnTitle()%></a>
									<span><%=news.getnCreateDate() %></span>
								</li>
						<%
							}
						%>
						<p align="right">
							<a href="login.jsp?name=1&value=<%=da%>">首页</a>
							<a href="login.jsp?name=<%=(nid-1)%>&value=<%=da%>">上一页</a>
							<label style="border:1px #000000 solid;"><%=pg.getCurrPageNo() %></label>/
							<label style="border:1px #000000 solid;"><%=zong %></label>
							<a href="login.jsp?name=<%=(nid+1)%>&value=<%=da%>">下一页</a>
							<a href="login.jsp?name=<%=zong%>&value=<%=da%>">尾页</a>
						</p>
					</ul>
				</div>
				<div class="picnews">
					<ul>
						<li>
							<a href="#"><img src="Images/Picture1.jpg" width="249" alt="" /> </a>
							<a href="#">幻想中穿越时空</a>
						</li>
						<li>
							<a href="#"><img src="Images/Picture2.jpg" width="249" alt="" /> </a>
							<a href="#">国庆多变的发型</a>
						</li>
						<li>
							<a href="#"><img src="Images/Picture3.jpg" width="249" alt="" /> </a>
							<a href="#">新技术照亮都市</a>
						</li>
						<li>
							<a href="#"><img src="Images/Picture4.jpg" width="249" alt="" /> </a>
							<a href="#">群星闪耀红地毯</a>
						</li>
					</ul>
				</div>
			</div>
		</div>
		<div id="friend">
			<h1 class="friend_t"> <img src="Images/friend_ico.gif" alt="合作伙伴" /> </h1>
			<div class="friend_list">
				<ul>
					<li>
						<a href="#">中国政府网</a>
					</li>
					<li>
						<a href="#">中国政府网</a>
					</li>
					<li>
						<a href="#">中国政府网</a>
					</li>
					<li>
						<a href="#">中国政府网</a>
					</li>
					<li>
						<a href="#">中国政府网</a>
					</li>
					<li>
						<a href="#">中国政府网</a>
					</li>
					<li>
						<a href="#">中国政府网</a>
					</li>
				</ul>
			</div>
		</div>
		<div id="footer">
			<p class=""> 24小时客户服务热线：010-68988888 &#160;&#160;&#160;&#160;
				<a href="#">常见问题解答</a> &#160;&#160;&#160;&#160; 新闻热线：010-627488888 <br /> 文明办网文明上网举报电话：010-627488888 &#160;&#160;&#160;&#160; 举报邮箱：
				<a href="#">jubao@jb-aptech.com.cn</a>
			</p>
			<p class="copyright"> Copyright &copy; 1999-2009 News China gov, All Right Reserver <br /> 新闻中国 版权所有 </p>
		</div>
	</body>

</html>