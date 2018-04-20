<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>
<%
	//session必须失效
	session.invalidate();
%>
<!DOCTYPE html>
<html>

	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>一笑网-注册</title>
		<style type="text/css">
			html {
				border: 0px #000 solid;
				margin: 0px;
				padding: 0px;
				width: auto;
				height: 95%;
				background-image: url(img/zhu.jpg);
				background-size: 100% 110%;
			}
			
			#zong {
				border: 0px #000 solid;
				border-radius: 5px;
				width: 400px;
				margin: auto;
				overflow: hidden;
				margin-top: 200px;
				padding: 0px 50px;
				background: rgba(255, 255, 255, 0.4);
			}
			
			#zong div {
				float: left;
			}
			
			.shu {
				clear: left;
				height: 50px;
			}
			
			.shu input {
				width: 200px;
				height: 30px;
				border-radius: 3px;
				border: 1px #666 solid;
			}
			
			.cuo {
				line-height: 40px;
			}
			
			#ti {
				width: 100px;
				margin-left: 0px;
				background-image: url(img/zhuce.jpg);
				background-size: 100% 100%;
				border-radius: 5px;
			}
			/*警告和正确*/
			
			.t1 {
				color: red;
			}
			
			.t2 {
				color: green;
			}
		</style>
		<script type="text/javascript" src="js/jquery-1.8.3.js"></script>
		<script type="text/javascript">
			$(function() {

				//名字失去焦点
				$("#name").blur(function cha1() {

					var s = $(this).val();
					if(s.length < 2 || s.length > 30) {
						$(this).parent().next().addClass("t1").removeClass("t2").html("名字长度为2-30位");
						z1 = false;
						return false;
					}
					$(this).parent().next().addClass("t2").removeClass("t1").html("");
					z1 = true;
					return true;
				})

				//密码失去焦点
				$("#pwd").blur(function cha2() {

					var s = $(this).val();
					if(s.length < 6 || s.length > 16) {
						$(this).parent().next().addClass("t1").removeClass("t2").html("密码长度为6-16位");
						z2 = false;
						return false;
					}
					$(this).parent().next().addClass("t2").removeClass("t1").html("");
					z2 = true;
					return true;
				})

				//确认密码失去焦点
				$("#pwd2").blur(function cha2() {

					var pwd2 = $(this).val();
					var pwd = $("#pwd").val();
					if(pwd2 != pwd) {
						$(this).parent().next().addClass("t1").removeClass("t2").html("两次密码不一致");
						z3 = false;
						return false;
					}
					$(this).parent().next().addClass("t2").removeClass("t1").html("");
					z3 = true;
					return true;
				})

				var z1 = false;
				var z2 = false;
				var z3 = false;
				//普通用户登录
				$("#zhu").submit(function() {
					//强行验证
					$("#name").blur();
					$("#pwd").blur();
					$("#pwd2").blur();
					if(z1 == false || z2 == false || z3 == false) {
						return false;
					}

					var name = $("#name").val();
					var pwd = $("#pwd").val();

					//用户注册	
					$.ajax({
						type: "post",
						url: "do_user.jsp",
						data: "way=9&name=" + name + "&pwd=" + pwd,
						async: false,
						success: function(result) {
							if(result.trim() != "-1") {
								//注册成功
								alert("注册成功！您的一笑网ID号为：" + result.trim());
								location.href = "login.jsp";
								//location.href="type/shou.jsp";
							} else {
								$("#error").html("注册失败，换一个昵称试试");
							}
						}
					});

					return false;
				})
			})
		</script>
	</head>

	<body>
		<div id="zong">
			<form id="zhu" action="do_user.jsp" method="post">
				<h1 id="yixiao">一笑网</h1>
				<div class="shu"><input type="text" name="name" id="name" value="" placeholder="昵称" /></div>
				<div class="cuo"></div>
				<div class="shu"><input type="password" name="pwd" id="pwd" value="" placeholder="密码" /></div>
				<div class="cuo"></div>
				<div class="shu"><input type="password" name="pwd2" id="pwd2" value="" placeholder="确认密码" /></div>
				<div class="cuo"></div>
				<div class="shu"><input id="ti" type="submit" value="" /></div>
				<div id="error" class="cuo" style="color: red;"></div>
				<div class="cuo">&nbsp;&nbsp;
					<a href="login.jsp">去登录</a>
				</div>
			</form>
		</div>
	</body>
</html>