<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>理财信息</title>
        <style type="text/css">
  	.licai{font-weight: bold;}
  </style>
  <script type="text/javascript" src="js/jquery-3.2.1.slim.min.js"></script>
  <script type="text/javascript">
  	function submit(){
  		var id=$("input[name=id]").val();
  		var risk=$("input[name=risk]").val();
  		var income=$("input[name=income]").val();
  		var saleStaring=$("input[name=saleStaring]").val();
  		var saleEnd=$("input[name=saleEnd]").val();
  		var end=$("input[name=end]").val();
  		var date=/^([0-9][0-9][0-9][0-9])-(0?[1-9]|1[0-2])-(0?[1-9]|[1-2][0-9]|3[0-1])$/m;//  /^/d{4}-/d{2}-/d{2}$/m
  		if(id==""||income==""||saleStaring==""||saleEnd==""||end==""){
  			alert("信息不能为空，请填写");
  			return false;
  		}
  		if(pj==0){
  			alert("请选择风险评价级别");
  			return false;
  		}
  		if(date.test(saleStaring)==false||date.test(saleEnd)==false||date.test(end)==false){
  			alert("日期格式不正确");
  			return false;
  		}
  		return true;
  	}
  	$(function (){
  		$("#tj").submit(function (){
  			return submit();
  		});
  	})
  </script>
    </head>
  <body>
    <form id="tj" action="InsertFinancingProductServlet" method="post">
    	<table>
    		<tr class="licai" rowspan="2" align="center">新增理财信息</tr>
    		<tr>
    			<td>产品代码：</td>
    			<td><input type="text" name="id"/></td>
    		</tr>
    		<tr>
    			<td>风险评级：</td>
    			<td>
    				<select class="pj" name="risk">
    					<option value=0>--请选择--</option>
    					<option value="1">R1</option>
    					<option value="2">R2</option>
    					<option value="3">R3</option>
    				</select>
    			</td>
    		</tr>
    		<tr>
    			<td>预期收益</td>
    			<td><input type="datetime" name="income"/></td>
    		</tr>
    		<tr>
    			<td>发售起始日</td>
    			<td><input type="datetime" name="saleStaring"/>yyyy-MM-dd格式</td>
    		</tr>
    		<tr>
    			<td>发售截止日</td>
    			<td><input type="datetime" name="saleEnd"/>yyyy-MM-dd格式</td>
    		</tr>
    		<tr>
    			<td>产品到期日</td>
    			<td><input type="text" name="end"/>yyyy-MM-dd格式</td>
    		</tr>
    		<tr >
    			<td clospan="2" align="center">
    				<input type="submit" value="保存"/>
	    			<input type="reset" value="重置"/>
	    			<input type="button" value="返回"/>
    			</td>
    		</tr>
    	</table>
    </form>
  </body>
</html>
