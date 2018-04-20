<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:if test="${empty financingProducts}">
	<script type="text/javascript">
		location("FindAllFinancingProductServlet");
	</script>
</c:if>
<!DOCTYPE html>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>理财信息</title>
		<script type="text/javascript" src="js/jquery-1.8.3.js"></script>
		<script type="text/javascript">
			$(function() {
				//隔行变色
				$("tr:even").css("background-color", "#CCC");
				$("input[type=button]").click(function() {
					var id = $("input[name=id]").val();
					var risk = $("select[name=risk]").val();
					$.ajax({
						type: "post", //发送请求的方式  值: get(默认),post
						dateType: "json", //指定返回的数据格式 值:xml,html,script,json,jsonp,text(默认)
						url: "FindFinancingProductServlet", //要提交的URL路径
						data: "id=" + id + "&risk=" + risk, //要发送到服务器的数据
						success: function(json) { //响应成功后要执行的代码
							json = JSON.parse(json); //强转称json
							//alert(typeof(json));//返回对象的类型
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
							//for(var i=0;i<json.length;i++){
							//	alert(json[i].id);
							//}
							//json=json.get(0);//强转称document(js对象)
							//for ( var j in json) {
							//	alert(j.id);
							//}
							//隔行变色
							$("tr:even").css("background-color", "#CCC");
						},
						error: function(e, ee, eee) { //响应失败要执行的代码
							alert("失败");
							alert(eee);
						},
						complete: function() { //响应失败成功都执行的代码
							alert("111");
						}
					});
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
				<c:forEach var="financingProduct" items="${financingProducts}">
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