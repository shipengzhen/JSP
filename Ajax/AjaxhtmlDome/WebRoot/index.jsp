<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>

	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>理财信息</title>
		<script type="text/javascript" src="js/jquery-1.8.3.js"></script>
		<script type="text/javascript">
			$(function() {
				var url = "FindAllFinancingProductServlet?list=financingProducts";
				var data = "html";
				$.get(url, data, function(html) {
					$("#table").append(html);
					//隔行变色
					$("tr:even").css("background-color", "#CCC");
				});
			});
			$("input[type=button]").click(function() {
				var id = $("input[name=id]").val();
				var risk = $("select[name=risk]").val();
				var url = "FindFinancingProductServlet?id=" + id + "&risk=" + risk; //服务器端URL地址，name为用户名文本框获取的值
				//$.get(url[,data][,success][,dataType]);
				//$.post(url[,data][,success][,dataType]);
				//$.getJSON(url[,data][,success][,dataType]);默认返回JSON
				$.getJSON(url, function(json) {
					//json=JSON.parse(json);//强转称json
					//遍历
					//删除节点
					$(".tr").remove();
					$(json).each(function() {
						$("#table").append(
							"<tr class='tr'>" +
							"<td>" + this.id + "</td>" +
							"<td>" + this.risk + "</td>" +
							"<td>" + this.income + "</td>" +
							"<td>" + this.saleStaring + "</td>" +
							"<td>" + this.saleEnd + "</td>" +
							"<td>" + this.end + "</td>" +
							"</tr>"
						);
					});
					//隔行变色
					$("tr:even").css("background-color", "#CCC");
				});
			});
		</script>
	</head>

	<body>
		<form action="" method="post" name="form">
			<div id="div1">
				产品代码<input type="text" name="id" /> 风险评级
				<select name="risk">
					<option value="0">请选择</option>
					<option value="1">R1</option>
					<option value="2">R2</option>
					<option value="3">R3</option>
				</select>
				<input type="button" value="查询" />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				<a href="insert.jsp">新增理财信息</a>
			</div>
			<table id="table" border="1px">
				<tr>
					<td>产品代码</td>
					<td>风险评级</td>
					<td>预期收益</td>
					<td>发售起始日</td>
					<td>发售截止日</td>
					<td>产品到期日</td>
				</tr>
				<c:forEach var="financingProduct" items="${requestScope.financingProducts}">
					<tr class="tr">
						<td>${financingProduct.id}</td>
						<td>${financingProduct.risk }</td>
						<td>${financingProduct.income }</td>
						<td>${financingProduct.saleStaring }</td>
						<td>${financingProduct.saleEnd }</td>
						<td>${financingProduct.end }</td>
					</tr>
				</c:forEach>
			</table>
		</form>
	</body>

</html>