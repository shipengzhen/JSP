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
         <script type="text/javascript" src="js/jquery-3.2.1.slim.min.js"></script>
		 <script type="text/javascript">
			$(function (){
		  		$("tr:even").css("background-color","#CCC");
		  	});
		  </script>
    </head>
    <body>
    	<form action="FindFinancingProductServlet" method="post">
	  		<div id="div1">
	  			产品代码<input type="text" name="id"/>
	  			风险评级<select name="risk">
	  					<option value="0">请选择</option>
	  					<option value="1">R1</option>
	  					<option value="2">R2</option>
	  					<option value="3">R3</option>	
	  				 </select>
	  			<input type="submit" value="查询"/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	  			<a href="insert.jsp">新增理财信息</a>
	  		</div>
	  		<table border="1px">
	  			<tr>
	  				<td>产品代码</td>
	  				<td>风险评级</td>
	  				<td>预期收益</td>
	  				<td>发售起始日</td>
	  				<td>发售截止日</td>
	  				<td>产品到期日</td>
	  			</tr>
	  			<c:forEach var="financingProduct" items="${financingProducts}">
	  				<tr>
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