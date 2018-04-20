<%@page import="com.bdqn.spz.messageboard.util.Page"%>
<%@page import="com.bdqn.spz.messageboard.service.impl.TBL_MessageServiceImpl"%>
<%@page import="com.bdqn.spz.messageboard.service.ITBL_MessageService"%>
<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
	Page pg;
	if(session.getAttribute("pg")==null){
		pg=new Page();
		pg.setPageSize(3);
	}else{
		pg=(Page)session.getAttribute("pg");
	}
	ITBL_MessageService messageService=new TBL_MessageServiceImpl();
	pg.setTatalCount(messageService.findCountMessage());
	request.setAttribute("totalPageCount",pg.getTotalPageCount());
	if(request.getParameter("value")!=null){
		pg.setCurrPageNo(Integer.parseInt(request.getParameter("value")));
		session.setAttribute("pg",pg);
	}
	request.setAttribute("pg",pg);
	request.setAttribute("tbl_MessagesList",messageService.findAllMessages(pg));
%>
<!DOCTYPE html>
<html>
	<head>
		<title>留言板</title>
		<link rel="stylesheet" type="text/css" href="css/style.css" />
		<link rel="stylesheet" type="text/css" href="style/btn.css" />
		<script type="text/javascript">
			function check() {
				var author = document.forms[0].author.value;
				var message = document.forms[0].message.value;
				var errorMsg = "";
				if(author == "" || author == "请输入您的名字") {
					errorMsg += "作者不能为空";
				}
				if(message == "") {
					errorMsg += "\n内容不能为空";
				}
				if(message.length > 500) {
					errorMsg += "\n内容长度不能大于500";
				}
				if(author.length > 20) {
					errorMsg += "\n作者名长度不能大于20";
				}
				if(errorMsg != "") {
					alert(errorMsg);
					return false;
				}
			}

			function checkName_mouseOut() {
				if(document.forms[0].author.value == '') {
					document.forms[0].author.value = '请输入您的名字';
					document.forms[0].author.className = 'gray input';
				}
			}

			function checkName_mouseOver() {
				if(document.forms[0].author.value == '请输入您的名字') {
					document.forms[0].author.value = '';
					document.forms[0].author.className = 'input';
				}
			}

			function turnPage(p) {
				var author = document.forms[0].author.value;
				var message = document.forms[0].message.value;
				window.location.href = "turnPage.jsp?page=" + p + "&author=" + author + "&message=" + message;
			}
		</script>
	</head>

	<body>
		<div align="center">
			<div>
				<h3>青鸟留言板</h3></div>&nbsp;
			<div>
			<c:forEach var="TBL_message" items="${tbl_MessagesList}">
				<div class="t c">
					<div class="t2" align="left">作者：&nbsp;${TBL_message.getAuthor()}</div>
					<div align="right">
					<div class="t1 tipad" align="left">${TBL_message.getMessage()}</div>
					<div class="gray" align="right">发表：${TBL_message.getPostTime()}</div>
				</div>
			</c:forEach>
			<div class="tipad" style="width:500px" align="right">
				<a href="message.jsp?value=${pg.getCurrPageNo()-1}">上一页</a>
				<label>${pg.getCurrPageNo()}</label>/<label>${totalPageCount}</label>
				<a href="message.jsp?value=${pg.getCurrPageNo()+1}">下一页</a>
			</div>

			<div style="width:500px" align="left">&nbsp;
				<form action="MessageServlet" method="post" onSubmit="return check()">
					<div>用 户 名</div>
					<div style="position:relative; left:50px; top:-18px">
						<input type="text" name="author" class="gray input" value="请输入名字" onMouseOver="return checkName_mouseOver()" onMouseOut="return checkName_mouseOut()" />
					</div>
					<div>留言信息</div>
					<div style="position:relative; left:50px; top:-18px">
						<textarea name="message" rows="5" cols="55"></textarea>
					</div>
					<div align="center" style="position:relative;left:-50px;width:500px">
					<input type="submit" value="提 交" class="btn" /></div>
				</form>
			</div>
		</div>
	</body>
</html>