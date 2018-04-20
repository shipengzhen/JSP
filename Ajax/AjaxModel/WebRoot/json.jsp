<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSON</title>
        <script type="text/javascript" src="js/jquery-1.8.3.js"></script>
        <script type="text/javascript">
        	//对象
        		var stu={"name":"spz"};
        	//数组
        		var names=["spz","lisi","zhangsan"];
        	//对象数组
        		var stus=[{name:"spz"},{name:"lisi"},{name:"zhangsan"}];
        	$(function(){
        		var name=stu.name;
        		//解析对象
        		$("#1").html(stu.name);
        		//解析数组
        		alert(names[1]);//通过下标获取
        		//遍历对象数组
        		$(names).each(function(){
        			$("#2").html(this.toString());
        		});
        		//解析对象数组
        		alert(stus[1].name);//通过下标获取
        		//遍历对象数组
        		$(stus).each(function(){
        			$("#3").html(this.name);
        		});
        	});
		</script>
		<style type="text/css">
			h2 {
				border:1px red solid;
			}
		</style>
    </head>
    <body>
    	<h2 id="1"></h2>
    	<h2 id="2"></h2>
    	<h2 id="3"></h2>
 	</body>
</html>