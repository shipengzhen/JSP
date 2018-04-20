<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>会议室预定</title>
        <script type="text/javascript" src="js/jquery-3.2.1.slim.min.js"></script>
        <script type="text/javascript">
    		$(function(){
    			$("form[name=form]").submit(function(){
    				var xy=/^\d{4}-\d{2}-\d{2}$/;
    				var date=$("input[name=meeting_order]").val();
    				if(xy.test(date)==false){
    					alert("格式不对！");
    					return false;
    				}
    				/*var meeting_order=document.getElementById("meeting_order");
    				if(meeting_order.validity.patternMismatch){
    					meeting_order.setCustomValidity("格式不对");
    				}*/
    				if($("input[name=advance_name]").val()==""){
    					alert("不能为空");
    					return false;
    				}
    				return true;
    			});
    		});
    	</script>
    </head>
    <body>
	    <form action="InsertMeetingServlet" method="post" name="form">	
			<table border="1" style="width: 300px;">
				<thead><!--表头-->
					<th colspan="2">会议室预定</th>
				</thead>
				<tr>
					<td>会议室:</td>
					<td>
						<select name="meeting_name">
							<option value="一号会议室">一号会议室</option>
							<option value="二号会议室">二号会议室</option>
							<option value="三号会议室">三号会议室</option>
						</select>
					</td>
				</tr>
				<tr>
					<td>申请人:</td>
					<td><input type="text" name="advance_name"/></td>
				</tr>
				<tr>
					<td>预定日期:</td>
					<td><input id="meeting_order" type="datetime" name="meeting_order" pattern="\d{4}-\d{2}-\d{2}"/></td>
				</tr>
				<tr>
					<td colspan="2" align="center">
						<button type="submit">申请</button>&nbsp;&nbsp;&nbsp;
						<button type="reset">重置</button>
					</td>
				</tr>
			</table>
		</form>
 	</body>
</html>