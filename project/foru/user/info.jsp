<%@page import="java.util.List"%>
<%@page import="com.dao.IULV"%>
<%@page import="com.dao.impl.FC"%>
<%@page import="com.dao.IUsee"%>
<%@page import="com.entity.*"%>
<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>
<%
	
	request.setCharacterEncoding("UTF-8");
	
	//接口
	IULV iv=FC.getIULV();
	IUsee ue=FC.getUserI();
	
	//要显示的用户
	String xuid=request.getParameter("uid");
	if(xuid==null)return;
	Usee xu=ue.RaUseeByUID(xuid);
	if(xu==null)return;
	
	
	//发过的帖子
	List<Post>fps=FC.getPostI().RPostByUID(xuid, 100);
	
	//登录用户
	String uid=(String)session.getAttribute("uid");
	
	
 %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
         <script type="text/javascript" src="../js/jquery-1.8.3.min.js" ></script>
        <title>一笑网-个人详情</title>
       	<script type="text/javascript">
       		$(function(){
    			//导航栏文字
    			$("a[name=qita]").hover(
    				function(){
    					$(this).css("color","#ffff00");
    				},
    				function(){
    					$(this).css("color","azure");
    				}
    			)
    			$("#ben").css("color","#ffff00");
       		})
			
			//身体部分
			function checkName(){//提示信息（昵称不能为空）
				var nicheng=$("input[name=name]").val();
				if(nicheng==""){
					$(".ts1").html("昵称不能为空");
					return false;
				}
				$(".ts1").html("");
				return true;
			}
			function checkEmail(){//Email地址提示信息
				var email=$("input[name=email]").val();
				if(email.indexOf("@")==-1){
					$(".ts2").html("Email地址必须包含@符号");
					return false;
				}
				$(".ts2").html("");
				return true;
			}
			function checkPhone(){//手机号提示信息
				var phone=$("input[name=phone]").val();
				if(phone.length!=11){
					$(".ts3").html("联系手机必须是11位号码");
					return false;
				}
				$(".ts3").html("");
				return true;
			}
			$(function(){
				//当焦点离开时弹出
				$("input[name=name]").blur(checkName);
				$("input[name=email]").blur(checkEmail);
				$("input[name=phone]").blur(checkPhone);
			})
       	</script>
       	<style type="text/css">
       		
       		/*背景盒子*/
       		#back{
       			width: 100%;
       			height: 100%;
       			border: 1px #000 solid;
       			background-color: #DDD;
       			background-image: url(../img/bei3.jpg);
       			background-size: 100% 100%;
       			position: fixed;
       			z-index: -1;
       			margin-top: -100px;
       		}
       		
       		
       		
       		*{ margin: 0px; padding: 0px; }
       		/*主体*/
       		#div1{  height: auto; }
       		/*公共*/
       		li{ list-style: none; }
       		a{ text-decoration: none; color: #000;}
       		body{ }
       		#tou,#wei,#sx,.px1,#gc,#tj1,#guangg{
       			 box-shadow: 0 2px 2px 0 rgba(0,0,0,0.14),0 3px 1px -2px rgba(0,0,0,0.2),0 1px 5px 0 rgba(0,0,0,0.12);
       		}
       		/*头部*/
       		#tou{background-color: #39A261; width: 100%; height: 70px; position: fixed; top: 0px; }
       		#toun{ width: 1000px; margin: 0px auto;  }
       		#logo{ float: left; margin-right: 50px; margin-top: 8px;}
       		#dhl li{float: left; margin-top: 10px; margin-right: 20px; font-size:19px ; padding: 10px;}
       		#dhl a{ color:azure; }
       		
       			/*登录*/
       		#dl li{ float: right; padding-top: 10px;}
       		#dl .dl1 img{width: 45px; height: 45px; border-radius:50% ;margin-right: 5px;}
       		#dl .dl2{margin-top: 10px; margin-right: 30px; font-size: 18px;}
       		#dl a{ color: azure; }
       		#Ue:hover{ color: #ffff00; }
       		
       		/*身体*/
       		#shenti{ width: 1000px; margin: auto auto;  padding-top: 85px;}
       		/*左边*/
       		#left{ width: 68% ;float: left;}

       		
       		/*右边*/
       		#right{
       			width: 31%;  float: right;
       		}
       		
       		
       		/*尾部*/
       		#wei{  height: 100px;width: 100%; float: left; background-color:#e4e4e4; margin:-80px auto;
       																}
       		#wei1 li{ 
       			float: left; margin-top: 20px; margin-right: 30px;
       		}
       		#wei1 .we1{ margin-left: 340px; }
       		#wei1 .we2{ margin-left:260px ;}
       		#wei a{ font-size: 14px;}
			/*身体部分*/
			#img,#message{float:left;}
			/*最外一层div*/
			#No1{width:1000px;height:770px;margin:130px auto;background-color:#FFF;background-image:url(image/ys.png);}
			#message{/*身体的下部分*/
				width:998px;
				height:700px;
				border-top:1px solid #CCC;
				}
			.messages{/*个人资料列表（p标签），包含在.messages中*/
				line-height:60px;
				font-size:16px;
				color:#333;
				padding-left:10px;
			}
			/*个人资料列表（p标签），包含在.messages中*/
			.messages{line-height:60px;font-size:16px;color:#333;padding-left:20px;}
			/*放头像的位置*/
			.img{padding-left:40px;}
			/*鼠标悬浮，移开时的样式*/
			.xiugai{text-decoration:none;color:#333;}
			.xiugai:hover{text-decoration:underline;color:#39F;}
			/*放 “基本资料” 的p标签样式*/
			.falst{width:700px;height:38px;padding-top:15px;font-size:15px;color:#333;background-image:url(image/ys2.png);border-bottom:0.1px solid #CCC;}
			/*身体下部分1（浮动到了左边）*/
			#zhong{width:700px;border-right:0.2px solid #CCC;}
			/*详细资料部分1*/
			#ban{background-color:#FFF;height:575px;}
			#top,.img,.wen{float:left;}/*身体的头部（浮动样式）*/
			/*身体的头部*/
			#top{width:998px;height:180px;margin-top:-40px;margin-left:-20px;}
			/*身体头部右部分样式*/
			.wen{margin-left:20px;margin-top:10px;line-height:35px;}
			.touxian{/*经验值；金币值*/font-size:14px;color:#333;}
			.ff{float:left;margin-left:20px;line-height:30px;}
			/*身体下部分2（浮动到了左边）*/
			#left{float:right;width:299px;height:629px;margin-top:-700px;border-left:0.2px solid #CCC;}
			/*文字“发过的帖子”样式*/
			.tz{margin-bottom:-4px;margin-right:5px;}
			.gt{background-image:url(image/ys2.png);padding-left:10px;height:36px;padding-top:15px;}
			/*帖子消息*/
			.tie{font-size:15px;height:37px;padding-top:19px;padding-left:10px;}
			/*帖子文字样式*/
			.li{font-size:16px;color:#666;margin-left:7px;margin-top:9px;}
			/*超链接下划线样式*/
			.lj{text-decoration:none;}
			.lj:hover{text-decoration:underline;}
			
			#jt{
				 overflow: auto;
			}
			#left{
				overflow: auto;
			}
       	</style>
    </head>

	<div id="back"><!--背景盒子--></div>

    <body>
    	 	<!--图片(推荐和最新)-->
    	<!--
    		此页面至少包含以下功能：
    		
    		同shou.jsp
    		另每个帖子应该把图片展示出来
        -->
    	<div id="div1">
    		<!--头-->
    		<div id="tou">
    			<!--头部内容-->
    			<div id="toun">
	    			<!--logo-->
	    			<div id="logo">
	    				<a href="#"><img src="../img/shou/lo.png" width="120px" height="60px"/></a>
	    			</div>
	    			<!--导航栏-->
	    			<div id="dhl">
	    				<ul>
	    					<li><a name="qita" href="../type/shou.jsp">首页</a></li>
	    					<li><a name="qita" href="../type/re.jsp">热门</a></li>
	    					<li><a name="qita" href="../type/duan.jsp">段子</a></li>
	    					<li><a name="qita" href="../type/tu.jsp">图片</a></li>
	    					<li><a name="qita" href="../type/ba.jsp">八卦</a></li>
	    					<li><a name="qita" href="../type/top.jsp">排行榜</a></li>
	    					<li><a name="qita" href="../type/guanyu.jsp">关于</a></li>
	    				</ul>
	    			</div>
	    			<!--登录注册-->
	    			<div id="dl">
	    				<ul>
	    					<li class="dl2"><a title="退出登录" id="Ue" href="../login.jsp">退出</a></li>
	    				</ul>
	    			</div>
    			</div>
    		</div>
    		<div id="No1">
            	<div id="top">
                    <p class="img"><a href="#"><img width="150" height="150" src="../photo/<%=xu.getID() %>/tou.png"/></a></p>
                    <ul class="wen">
                    	<li class="gz">
                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        </li>
                        <li class="name"><%=xu.getUName() %></li>
                        <li class="touxian">
                        	<img width="20px" src="image/bj.png"/>积分：<%=xu.getUexp()%><br/>
                        </li>
                    </ul>
                </div>
                <div id="message">
                	<div id="zhong">
                    	<p class="falst">
                          	<img width="20px" src="image/zy.png"/>
                            <strong>基本资料</strong>
                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            
                            <%if(xuid.equals(uid)){%>
                           		<a class="xiugai" href="xiu.jsp?uid=<%=xu.getID()%>">修改</a>
                            <%}%>
                        </p>
                        <div id="ban">
                        	<p class="messages">账号：<%=xu.getID()%><span class="id"></span></p>
                            <p class="messages">昵称：<%=xu.getUName()%><span class="name"></span></p>
                            <p class="messages">性别：<%=xu.getSex()%><span class="sex"></span></p>
                            <p class="messages">个人头衔：<%=iv.RLV(xu.getUexp()).getLTitle() %><span class="shenfen"></span></p>
                            <p class="messages">个人邮箱：<%=xu.getUEmail()%><span class="email"></span></p>
                            <p class="messages">联系手机：<%=xu.getUPhone()%><span class="phone"></span></p>
                            <p class="messages">个性签名：<%=xu.getUxy()%><span class="jiaoyou"></span></p>
                        </div>
                    </div>
               </div>
               <div id="left">
                   <ul id="jt">
                        <li class="gt"><img class="tz" src="image/tb.png"/><span >发过的贴子</span></li>
                   		<%for(Post p:fps){ %>
                   			<li class="tie"><a style="color:#666;" class="lj"  href="../tf/rps.jsp?pid=<%=p.getPID()%>"><img width="6px" src="image/jh.png"/><span class="li"><%=p.getPhh() %></span></a></li>
                   		<%}%>
                   		
					</ul>
               	</div>
            </div>
        </div>
    			<!--尾部-->
	    		<div id="wei">
	    			<div id="wei1">
	    				<ul>
		        			<li class="we1"><a href="#">关注我们</a></li>
		        			<li><a href="#">联系我们</a></li>
		        			<li><a href="#">支持我们</a></li>
		        			<li><a href="#">问题反馈</a></li>
		        			<li class="we2"><a href="#">Copyright © 嘻嘻 All Rights Reserved. 京ICP备10027213号-32 免责声明</a></li>
		        		</ul>
		        			
	    			</div>
	    		</div>
           

    	</div>
 	</body>
</html>
