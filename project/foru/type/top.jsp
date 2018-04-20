<%@page import="com.dao.IUsee"%>
<%@page import="com.entity.Usee"%>
<%@page import="com.dao.IULV"%>
<%@page import="com.dao.impl.FC"%>
<%@page import="com.dao.IPost"%>
<%@page import="com.entity.Post" %>
<%@page import="java.util.*" %>
<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>
<%
	//读取用户信息
	//读取用户信息
	String UA=(String)session.getAttribute("uid");//用户身份，0-普通用户，1-管理员，-1游客
	if(UA==null)UA="-1";
	String uid=(String)session.getAttribute("uid");//用户ID
	
	//此处应该查询用户的详细资料
	IUsee iu=FC.getUserI();
	Usee user=null;
	if(uid!=null){
		user=iu.RaUseeByUID(uid);
	}
	
	//获取帖子表接口和等级计算表
	IPost ip=FC.getPostI();
	IULV iv=FC.getIULV();
	
	
	//段子、八卦、图片的推推推推推推推荐，下面推荐遍历去吧
	List<Post>ps_duan=ip.RPostByTIDandX("1",5);//随机5条段子
	List<Post>ps_ba=ip.RPostByTIDandX("3",5);//随机5条八卦
	
	//查询等级榜数据
	IUsee ie=FC.getUserI();
	List<Usee>ues=ie.RUsee(10);
	
	
	
	
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <script type="text/javascript" src="../js/jquery-1.8.3.js" ></script>
        <title>一笑网-排行榜</title>
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
    			//选择
    			$(".sx1").click(function(){
    				$(this).children("a").css("color","green");
    				$(".sx2").children("a").css("color","#000");
    				$("#dengj").css("display","block");
    				$("#fatie").css("display","none");
    			})
    			$(".sx2").click(function(){
    				$(this).children("a").css("color","green");
    				$(".sx1").children("a").css("color","#000");
    				$("#dengj").css("display","none");
    				$("#fatie").css("display","block");
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
       		
       		*{ margin: 0px; padding: 0px; }
       		/*主体*/
       		#div1{  height: auto; }
       		/*公共*/
       		li{ list-style: none; }
       		a{ text-decoration: none; color: #000;}
       		body{  }
       		#tou,#wei,#sx,.px1,#gc,#tj1,#guangg{
       			 box-shadow: 0 2px 2px 0 rgba(0,0,0,0.14),0 3px 1px -2px rgba(0,0,0,0.2),0 1px 5px 0 rgba(0,0,0,0.12);
       		}
       		/*头部*/
       		#tou{background-color: #39A261; width: 100%; height: 70px; position: fixed; top: 0px; }
       		#toun{ width: 1000px; margin: 0px auto;  }
       		#logo{ float: left; margin-right: 50px; margin-top: 10px;}
       		#dhl li{float: left; margin-top: 12px; margin-right: 20px; font-size:19px ; padding: 10px;}
       		#dhl a{ color:azure; }
       		
       			/*登录*/
       		#dl li{ float: right; padding-top: 10px;}
       		#dl .dl1 img{width: 45px; height: 45px; border-radius:50% ;margin-right: 5px;}
       		#dl .dl2{margin-top: 10px; margin-right: 30px; font-size: 18px;}
       		#dl a{ color: azure; }
       		
       		
       		/*身体*/
       		#shenti{ width: 1000px; margin: auto auto;  padding-top: 85px;}
       		/*左边*/
       		#left{ width: 68% ;float: left;}
       		/*分类*/
       		#sx{ background-color: #fff;  height: 38px; width: 100%; }
       		#sx li{ float:left ; font-size:17px ; padding: 7px 10px;}
       		/*#sx li:hover a{ color: green;}*/ 
       		#sx .sx1{ margin-left: 15px; }
       		.sx1 a{color:green; }
       		/*排序*/
       		/*等级头*/
       		#djtou{ height: 35px; width: 100%; background-color: #fff; margin-top: 10px;}
       		#djtou li{ float: left; line-height: 35px;}
       		.djtou1{ margin-left: 120px; font-size: 22px;}
       		.djtou2{ margin-left:400px ;font-size: 22px; }
       		.px1{  height: 60px; width: 100%;  background-color: #fff; border-top: 1px dashed green;
       		
       		}
       		img[name="toux"]{ width: 45px; height: 45px; border-radius: 50%;}
       		.px1 li{ float: left; margin-top: 8px; }
       		.px11{margin-left: 40px; }
       		.px12{ font-size:19px ; line-height: 50px; margin-left: 5px; width: 400px;}
       		.px13{  line-height: 50px;font-size:20px ;width: 90px; margin-left: 5px;}
       		.no{ font-size:31px ;  color: green; margin-left: 30px; width: 40px;}
       		.no1{ font-size:31px ;  color: green; width: 40px;  margin-left: 20px; margin-right: 10px;}
			/*发帖榜 */
       		#fatie{ display: none;}
       		
       		/*右边*/
       		#right{
       			width: 31%;  float: right;
       		}
       		/*火箭*/
       		#huojian{
       			background-color: #fff; background-image:url(../img/shou/5-1206019.jpg);
       			width: 50px;height: 50px;position: fixed;bottom: 0px; right: 200px;
				display: none;
       		}
       		/*发帖*/
       		#ft{
       			background-image: url(../img/shou/wenli.png);  background-position: -22px 0px; width: 100%;
       			  height: 76px; 
       		}
       		#ft li{ height: 68px; width: 300px; background-color:#39A261; float: left; margin-top: 4px; margin-left: 5px;}
       		#ft a{
       			font-size: 25px; color: #fff; line-height: 66px; margin-left: 100px;
       		}
       		/*个人资料  搜索*/
       		#gc{ height: 170px; margin-top: 10px; background-color: #fff; }
       		#gc{height: auto; padding-top: 20px;}
       		/*个人*/
       		img[name="tx"]{ width: 60px; height: 60px; border-radius:50% ; }
       		#xinxi{ height: 100px; }
       		#xinxi li{ float: left; }
       		.xinxi1{ margin-top: 10px; margin-left: 10px;  } 	/*头像*/
       		.xinxi2{font-size: 22px; margin-left: 5px; margin-top: 22px; width: 220px;height: 30px;}/*名字*/
       		.xinxi2 .naee{ color:red;float:left;line-height: 40px;}.xinxi2 .jibie{ color:blue;}
       		.xinxi3{ margin-left: 5px;margin-top: 3px; }  						/*发帖*/
       		.xinxi4{ width: 50px; margin-top: 4px; }      						 /*个数*/
       		.xinxi5{margin-top: 4px;  }
       		/*搜索*/
       		input[name="ss"]{									/*按钮*/
       			height: 30px; border: 3px solid coral; width: 200px; font-size: 18px;margin-left: 15px;
       			font-weight: 200px;
       		}
       		#sc{ height: 55px; }
       		#sc li{ float: left;  }
       		.sc2{ background-color:#39A261; height: 34px; margin-left:13px ; width: 55px; 
       			}
       		.sc2 a{color:#fff; margin-left: 11px; line-height: 33px; }
       		
       		/*文本推荐*/
       		.tj1{ height: 220px; background-color: #fff; margin-top: 10px;width: 100%;}
       		.tj11{ color:coral; font-size: 19px; }
       		.tj1 li{  margin-left: 23px; width: 270px;height: 23px; overflow:hidden;  float: left;
       			margin-top: 10px;line-height: 23px;	 }
       		.tj1 li a:hover{text-decoration: underline;}
       		/*图片*/
       		.dat{ height: 251px; width: 100%; margin-top: 10px; background-color: #fff; }
       		.dat li{
       			 float: left; margin-top: 10px;
       			 }
       		#tuj1{ color:coral; font-size: 19px; width: 200px; margin-left: 21px;  }
       		.tuj2{margin-left: 19px;  }
       		.tuj3{margin-left: 10px;}
       		/*广告*/
       		#guangg{	margin-top: 10px; background-color: #fff; width=310px; height=240px; 
       		}
       		#guangg img{ float: left; }
       		
       		
       		/*尾部*/
       		#wei{  height: 100px; float: left; background-color:#fff; margin-top: 50px;
       																}
       		#wei1 li{ 
       			float: left; margin-top: 20px; margin-right: 30px;
       		}
       		
       		#wei1 .we1{ margin-left: 340px; }
       		#wei1 .we2{ margin-left:260px ;}
       		#wei a{ font-size: 14px;}
       	</style>
    </head>

	<div id="back"><!--背景盒子--></div>

    <body>
    	<!--排行榜(等级榜，发帖榜)-->
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
	    					<li><a name="qita"  href="shou.jsp">首页</a></li>
	    					<li><a name="qita" href="re.jsp">热门</a></li>
	    					<li><a name="qita" href="duan.jsp">段子</a></li>
	    					<li><a name="qita" href="tu.jsp">图片</a></li>
	    					<li><a name="qita" href="ba.jsp">八卦</a></li>
	    					<li><a  id="ben" name="qita"  href="top.jsp">排行榜</a></li>
	    					<li><a  name="qita" href="guanyu.jsp">关于</a></li>
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
    			<!--左-->
    			<div id="left">
    				<!--类型-->
    				<div id="sx">
    					<ul>
    						<li class="sx1"><a href="#">等级榜</a></li>
    						<li style="display: none;" class="sx2"><a href="#">发帖榜</a></li>
    					</ul>
    				</div>
    				
    				<!--排序-->
    				<div id="px">
    					<!--等级-->
    					<div id="dengj">
								<div id="djtou">
									<ul>
										<li class="djtou1">用户</li>
										<li class="djtou2">等级</li>
									</ul>
								</div>
								
								<%int i=0; %>
								<%for(Usee u:ues){ %>
								
		    						<div class="px1">
			    						<ul>
			    							<li class="no"><%=++i%></li>
			    							<li class="px11"><a href="../user/info.jsp?uid=<%=u.getID()%>"><img name="toux" src="../photo/<%=u.getID() %>/tou.png"/></a></li>
			    							<li class="px12"><a href="../user/info.jsp?uid=<%=u.getID()%>"><%=u.getUName()%></a></li>
			    							<li class="px13"><%=iv.RLV(u.getUexp()).getLTitle()%></li>
			    							
			    						</ul>
									</div>
								<%} %>
    					</div>
    					<!--发帖-->
    					<div id="fatie">
								<div id="djtou">
									<ul>
										<li class="djtou1">用户</li>
										<li class="djtou2">发帖</li>
									</ul>
								</div>
								<div class="px1">
		    						<ul>
		    							<li class="no">1</li>
		    							<li class="px11"><a href="#"><img name="toux" src="../img/shou/100404.png"/></a></li>
		    							<li class="px12"><a href="#">afasd</a></li>
		    							<li class="px13">16</li>
		    						</ul>
								</div>
	    						<div class="px1">
		    						<ul>
		    							<li class="no">2</li>
		    							<li class="px11"><a href="#"><img name="toux" src="../img/shou/100404.png"/></a></li>
		    							<li class="px12"><a href="#">拉啊啊拉</a></li>
		    							<li class="px13">16</li>
		    							
		    						</ul>
								</div>
								<div class="px1">
		    						<ul>
		    							<li class="no">3</li>
		    							<li class="px11"><a href="#"><img name="toux" src="../img/shou/100404.png"/></a></li>
		    							<li class="px12"><a href="#">fsasd</a></li>
		    							<li class="px13">16</li>
		    							
		    						</ul>
								</div>
								<div class="px1">
		    						<ul>
		    							<li class="no">4</li>
		    							<li class="px11"><a href="#"><img name="toux" src="../img/shou/100404.png"/></a></li>
		    							<li class="px12"><a href="#">wrqsd</a></li>
		    							<li class="px13">16</li>
		    						</ul>
								</div>
								<div class="px1">
		    						<ul>
		    							<li class="no">5</li>
		    							<li class="px11"><a href="#"><img name="toux" src="../img/shou/100404.png"/></a></li>
		    							<li class="px12"><a href="#">wewee</a></li>
		    							<li class="px13">16</li>
		    						</ul>
								</div>
								<div class="px1">
		    						<ul>
		    							<li class="no">6</li>
		    							<li class="px11"><a href="#"><img name="toux" src="../img/shou/100404.png"/></a></li>
		    							<li class="px12"><a href="#">ffff</a></li>
		    							<li class="px13">16</li>
		    						</ul>
								</div>
								<div class="px1">
		    						<ul>
		    							<li class="no">7</li>
		    							<li class="px11"><a href="#"><img name="toux" src="../img/shou/100404.png"/></a></li>
		    							<li class="px12"><a href="#">aaaa</a></li>
		    							<li class="px13">16</li>
		    						</ul>
								</div>
								<div class="px1">
		    						<ul>
		    							<li class="no">8</li>
		    							<li class="px11"><a href="#"><img name="toux" src="../img/shou/100404.png"/></a></li>
		    							<li class="px12"><a href="#">asfsafsdsd</a></li>
		    							<li class="px13">热</li>
		    						</ul>
								</div>
								<div class="px1">
		    						<ul>
		    							<li class="no">9</li>
		    							<li class="px11"><a href="#"><img name="toux" src="../img/shou/100404.png"/></a></li>
		    							<li class="px12"><a href="#">wrwsa</a></li>
		    							<li class="px13">我</li>
		    						</ul>
								</div>
								<div class="px1">
		    						<ul>
		    							<li class="no1">10</li>
		    							<li class="px11"><a href="#"><img name="toux" src="../img/shou/100404.png"/></a></li>
		    							<li class="px12"><a href="#">safasf</a></li>
		    							<li class="px13">阿斯顿</li>
		    						</ul>
								</div>
								
    					</div>
    					
    				</div>	
    				
    			</div>

    			<!--右-->
    			<div id="right">
    				<!--我要发帖-->
    				<div id="ft">
    					<ul>
    						<li><a href="../tf/cps.jsp">我要发帖</a></li>
    					</ul>
    				</div>
    				
    				
    				<!--段子推荐-->
    				<div class="tj1">
    					<ul>
    						<li class="tj11">段子推荐</li>
    						<%for(Post p:ps_duan){%>
    							<li><a href="../tf/rps.jsp?pid=<%=p.getPID()%>"><%=p.getPhh()%></a></li>
    						<%}%>
    					</ul>
    				</div>
    				<!--八卦推荐-->
    				<div class="tj1">
    					<ul>
    						<li class="tj11">文章推荐</li>
    						<%for(Post p:ps_ba){%>
    							<li><a href="../tf/rps.jsp?pid=<%=p.getPID()%>"><%=p.getPhh()%></a></li>
    						<%}%>
    					</ul>
    				</div>
    				
<!--    				
    				<!--广告-1->
    				<div id="guangg">
    					<a href="wwww.jingdong.com" target="_blank"><img src="../img/shou/48e5479f751d38db2715b638b125fda7.jpg"width="310px" height="240px" /></a>
    				</div>
    				<!--火箭-1->
    				<div id="huojian">
                 		&nbsp;
                 	</div>-->
                 	
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
    		
    					<!--
            	作者：李振
            	时间：2017-06-11
            	描述：完
            -->
           

    	</div>
 	</body>
</html>