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
			$(function (){
				//隔行变色
		  		$("tr:even").css("background-color","#CCC");
		  		$("input[type=button]").click(function(){
		  			//1.创建XMLHttpRequest对象
			  		var xmlHttpRequest=null;
			  		if(window.XMLHttpRequest){//返回值为true时说明是新版本IE或其他浏览器
			  			alert("new");
			  			xmlHttpRequest=new XMLHttpRequest();
			  		}else{//返回值为false时说明是老版本IE浏览器(IE5和IE6)
			  			alert("old");
			  			xmlHttpRequest=new ActiveXObject("Microsoft.XMLHTTP");
			  		}
			  		//2.设置回掉函数
			  		xmlHttpRequest.onreadystatechange=function(){
			  			if(xmlHttpRequest.readyState==4&&xmlHttpRequest.status==200){
							var json=xmlHttpRequest.responseText;//服务器返回的字符串
							json=JSON.parse(json);//强转称json
							//遍历
		        			//删除节点
		        			$(".tr").remove();
		        			$(json).each(function(){
		        				$("#table").append(
		        					"<tr class='tr'>"
		        						+"<td>"+this.id+"</td>"
		        						+"<td>"+this.risk+"</td>"
		        						+"<td>"+this.income+"</td>"
		        						+"<td>"+this.saleStaring+"</td>"
		        						+"<td>"+this.saleEnd+"</td>"
		        						+"<td>"+this.end+"</td>"+
		        					"</tr>"
		        				);
        					});
        					//隔行变色
		  					$("tr:even").css("background-color","#CCC");
						}
			  		};
			  		//3.初始化xmlHttpRequest组件
			  		var id=document.getElementById("id").value;
			  		var risk=document.getElementById("risk").value;
			  		var url="FindFinancingProductServlet?id="+id+"&risk="+risk;//服务器端URL地址，name为用户名文本框获取的值
			  		xmlHttpRequest.open("get",url,true);//用get传递数据时，容易中文乱码或者出错，post不会
			  		xmlHttpRequest.setRequestHeader("Content-Type","application/x-www-from-urlencoded");
			  		//4.发送请求
			  		xmlHttpRequest.send(null);//get--null，post--可以指定一个值
			  		//--------------------------------------------------------------------------------
			  		//3.初始化xmlHttpRequest组件
			  		//var url="FindFinancingProductServlet";
			  		//xmlHttpRequest.open("post",url,true)
			  		//xmlHttpRequest.setRequestHeader("Content-Type","application/x-www-from-urlencoded");
			  		//4.发送请求
			  		//var data="id="+id+"&risk="+risk;
			  		//xmlHttpRequest.send(data);
			  		//--------------------------------------------------------------------------------
		  		});
  			});
		</script>
    </head>
    <body>
    	<form action="" method="post" name="form">
	  		<div id="div1">
	  			产品代码<input id="id" type="text" name="id"/>
	  			风险评级<select id="risk" name="risk">
	  					<option value="0">请选择</option>
	  					<option value="1">R1</option>
	  					<option value="2">R2</option>
	  					<option value="3">R3</option>	
	  				 </select>
	  			<input type="button" value="查询"/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
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