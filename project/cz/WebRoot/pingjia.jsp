<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>
<%@ include file="uhead.jsp"%>
<%
	int spid=Integer.parseInt(request.getParameter("spid"));
	int ddid=Integer.parseInt(request.getParameter("ddid"));

	System.out.print(spid);
 %>
	<!--结算-->
	<style type="text/css">
		*{margin: 0px; padding: 0px;}
		#No1{min-height: 350px;width: 700px;margin-left: 250px;}
		#ping{border-bottom: 2px solid #ef694f;padding-bottom: 20px;}
		.neirong{border: 1px solid #000000;height: 180px;width:400px;}
		.top{height: 33.5px;}
		.zi{font-size: 14px; background-color: #ef694f;width: 75px;height: 30px;padding-left: 10px; padding-top: 6px; margin-bottom: 0px;color: white;}
		.colr{height: 2px; background-color: #ef694f;}
		.pingjia{font-size: 13px;margin-left: 10px;padding: 5px;}
		.fabiao{margin-left: 360px;margin-top: 40px; height: 30px; width: 70px;}
	</style>
    <div id="No1">
        <!-- 内容部分开始 -->
        <div class="top">
        	<p class="zi">宝贝评价</p>
        	<p class="colr"></p>
        </div>
        <div id="ping">
        	<form action="dosppj" method="post">
        		<div class="pingjia">
        			<input type="radio" name="ping" value="好评"/>好评
	        		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	        		<input type="radio" name="ping" value="中评"/>中评
	        		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        			<input type="radio" name="ping" value="差评"/>差评
        		</div>
        		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        		<textarea name="str" style="width:400px;height:200px"></textarea><br/>
        		<input name="id" type="text" Style="display: none;" value="<%=spid %>">
        		<input name="ddid" type="text" Style="display: none;" value="<%=ddid %>">
        		<input type="submit" value="发表" class="fabiao"/>
        	</form>
        </div>
        <!-- 内容部分结束 -->
    </div>
<%@ include file="foot.jsp"%>