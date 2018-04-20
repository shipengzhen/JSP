<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>
<%@ include file="uhead.jsp"%>
<style type="text/css">
	#detail-tabs {
		width: 600px;
		margin: 10px auto;
		font-size: 12px;
		background: #efefef;
	}
	#detail-tabs li {
		width: 200px;
	}
	#ul{
		width: 400px;
		margin: 50px auto;
	}
	#ul li{
		list-style: none;
		margin: 20px;
		display: block;
	}
</style>
<script src="js/jquery-1.8.3.min.js" type="text/javascript" charset="utf-8"></script>
<script type="text/javascript">
	$(function() {
		$("#li1").click(
			function() {
				$("#li1").css("background", "#df2d2d").next().css("background", "#efefef").next().css("background", "#efefef");
				$("#li4").css("display","block").next().css("display","none");
				$("#li6").css("display","block");
				$("#li7").css("display","block");
			}
		);
		$("#li2").click(
			function() {
				$("#li1").css("background", "#efefef").next().css("background", "#df2d2d").next().css("background", "#efefef");
				$("#li4").css("display","none").next().css("display","block");
				$("#li6").css("display","block");
				$("#li7").css("display","block")
			}
		);
		$("#li3").click(
			function() {
				$("#li1").css("background", "#efefef").next().css("background", "#efefef").next().css("background", "#df2d2d");
				$("#li4").css("display","block");
				$("#li5").css("display","block");
				$("#li6").css("display","none");
				$("#li7").css("display","none");
			}
		);
	});
</script>
<div style="width: 800px;" id="content" class="col-lg-10">
	<form action="UpdatemmServlet" method="post">
		<div class="meb-content">
			<ul class="nav nav-tabs detail-tab" id="detail-tabs">
				<li style="background: #df2d2d;" id="li1">
					<a>原密码验证</a>
				</li>
				<li id="li2">
					<a>手机号验证</a>
				</li>
				<li id="li3"><a>绑定/更改手机号</a><li>
			</ul>
			<ul id="ul">
				<li id="li4">
					请输入原密码：
					<input type="text"  name="ymm"/>
					</li>
				<li style="display: none;" id="li5">
					请输入手机号：
					<input type="text" name="phone"/>
				</li>
				<li id="li6">
					请输入新密码：
					<input type="text" name="mm"/>
				</li>
				<li id="li7">
					请确认密码：&nbsp;&nbsp;&nbsp;
					<input type="text" name="mm"/>
				</li>
				<li>
					&emsp;&emsp;
					<button type="submit">确认</button>
					&emsp;&emsp;&emsp;&emsp;
					<button type="reset">重置</button>
				</li>
			</ul>
		</div>
	</form>
</div>
</div>
<%@ include file="foot.jsp"%>