<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <script type="text/javascript" src="../js/jquery-1.8.3.js" ></script>
        <title>一笑网-关于</title>
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
    			
    			$("a[name=lx]").click(function(){
    				$("#gy").css("display","none");
    				$("#lx").css("display","block");
    				$(".left1").css("background-color","#FAFAFA");
    				$(".left2").css("background-color","#999");
    			})
    			$("a[name=gy]").click(function(){
    				$("#lx").css("display","none");
    				$("#gy").css("display","block");
    				$(".left1").css("background-color","#999");
    				$(".left2").css("background-color","#FAFAFA");
    			})
 
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
       		}
       		
       		*{ margin: 0px; padding: 0px; display:; }
       		/*主体*/
       		#div1{  height: auto;}
       		/*公共*/
       		li{ list-style: none; }
       		a{ text-decoration: none; color: #000;}
       		body{  }
       		#tou,#wei,#sx,.px1,#gc,#tj1,#guangg,#right,#left{
       			 box-shadow: 0 2px 2px 0 rgba(0,0,0,0.14),0 3px 1px -2px rgba(0,0,0,0.2),0 1px 5px 0 rgba(0,0,0,0.12);
       		}
       		/*头部*/
       		#tou{background-color: #39A261; width: 100%; height: 70px; position: fixed; top: 0px; }
       		#toun{ width: 1000px; margin: 0px auto;  }
       		#logo{ float: left; margin-right: 50px; margin-top: 10px;}
       		#dhl li{float: left; margin-top: 12px; margin-right: 20px; font-size:19px ; padding: 10px;}
       		#dhl a{ color:azure; }
       		/*登录*/
       		#dl li{ font-size:19px; float: right; margin-top: 10px;padding: 10px; margin-right: 30px;  }
       		#dl a{ color: azure; }
       		
       		/*身体*/
       		#shenti{ width: 1000px; margin: auto auto;  padding-top: 85px;}
       		/*网站介绍*/
       		
       		
       		#left{ width: 23.7%; background-color: #999;  float: left; height: 550px; }
       		
       		#left li a{ font-size: 17px;  }
       		#left li{ text-indent: 2em; padding-top:8px ; padding-bottom:8px ;}
       		.left1{ margin-top: 30px; background-color:#FAFAFA;}
       		#lx ul{ margin-top: 20px; margin-left:  40px;}
       		#lx li{ margin-top: 10px; }
       		
       		#right{ width: 76%; background-color:#FAFAFA;  float: left; height: 550px;   }
       		#gy{display: none; }
       		#gy li{ width: 550px; line-height: 40px;margin-top: 10px;}
       		#gy ul{margin-top: 20px; margin-left: 40px;  }
       		
       		/*尾部*/
       		#wei{  height: 100px; float: left; background-color:#CCC; margin-top: 30px;													}
       		#wei1 li{ 
       			float: left; margin-top: 20px; margin-right: 30px;
       		}
       		#wei1 .we1{ margin-left: 300px; }
       		#wei1 .we2{ margin-left:200px ;}
       	</style>
    </head>

	<div id="back"><!--背景盒子--></div>

    <body>
    	 	<!--图片(推荐和最新)-->
    	<!--
    		关于页
    	
	    	网站介绍
	    	团队介绍
	    	网站规划
	    	联系方式等
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
	    					<li><a  name="qita"  href="shou.jsp">首页</a></li>
	    					<li><a name="qita" href="re.jsp">热门</a></li>
	    					<li><a name="qita" href="duan.jsp">段子</a></li>
	    					<li><a name="qita" href="tu.jsp">图片</a></li>
	    					<li><a name="qita" href="ba.jsp">八卦</a></li>
	    					<li><a name="qita" href="top.jsp">排行榜</a></li>
	    					<li><a name="qita" href="guanyu.jsp">关于</a></li>
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

    		<!--身体-->
    		<div id="shenti">
    			<div id="js">
    				<div id="left">
    					<ul>
    						<li class="left1"><a href="#" name="lx">联系我们</a></li>
    						<li class="left2"><a href="#" name="gy">关于网站</a></li>
    					</ul>
    				</div>
    				<div id="right">
    					<div id="lx">
    						<ul>
	    						<li>QQ&nbsp;:&nbsp;2393584716</li>
	    						<li>QQ群:&nbsp;611051452</li>
	    						<li>网站:&nbsp;www.yixiao1.com</li>
	    						<li>版本：V1.0</li>
    						</ul>
    					</div>
    					<div id="gy">
    						<ul>
    							<li>
    								论坛网站曾是大家网上信息交流的平台，在论坛网站上，我们交流话题。展示自我，结交朋友，
		    						但是笔者发现，经过几年互联网的高速发展，论坛类网站高速的商业化，逐渐变得臃肿不堪一个
		    						网页几乎超过50%的部分全为广告，而用户所需的有效信息却愈来愈少，这样的网站使大家逐渐丧失继续预览的
		    						欲望，为了解决这种问题，我们本着简约、清新的原则设计了“一笑网”论坛，本网站定位
		    						搞笑话题页面零广告为大家传递快乐。
    							</li>
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
    	</div>
 	</body>
</html>