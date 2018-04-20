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
	//字符格式
	request.setCharacterEncoding("UTF-8");
	
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
	
	//分页的数据
	String dan=request.getParameter("dan");
	if(dan==null){
		dan="1";
	}
	int dang=new Integer(dan);//当前页
	int dx=10;//页大小
	int zong=ip.RPostCount("3");//指定ID的总条数,3--八卦
	int zy=zong%dx==0?zong/dx:zong/dx+1;//总页数
	//上下
	int dshang=dang-1;
	if(dshang<1)dshang=1;
	int dxia=dang+1;
	if(dxia>zy)dxia=zy;
	
	
	
	//获取筛选信息,1位推荐(随10)，2为全部(时间倒序)
	String shai=request.getParameter("shai");
	if(shai==null)shai="1";
	//获得帖子
	List<Post>ps=new ArrayList<Post>();
	if(shai.equals("1")){
		ps=ip.RPostByTIDandX("3",10);
	}
	if(shai.equals("2")){
		ps=ip.RPostByFenTID(dx,dang,"3");
	}
	
	
	//段子、八卦、图片的推推推推推推推荐，下面推荐遍历去吧
	List<Post>ps_duan=ip.RPostByTIDandX("1",5);//随机5条段子
	List<Post>ps_ba=ip.RPostByTIDandX("3",5);//随机5条八卦
	
	
	
	
	
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <script type="text/javascript" src="../js/jquery-1.8.3.js" ></script>
        <title>一笑网-八卦</title>
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
    				/*火箭*/
        		$(window).scroll(function(){
        			
					if($(this).scrollTop()>300){
						$("#huojian").css("display","block");
					}else{
						$("#huojian").css("display","none");
					}
				})
        		$("#huojian").click(function(){
        			
        				$(window).scrollTop(0);
        			
        		})
    			
    			
    			//用户对帖子点赞or点踩
        		$(".z1").click(function(){
        			//获取评论的ID
        			var pid=$(this).attr("pid");
        			if(pid==undefined)return;
        			//记录对象
        			var th=$(this);
        			//开始处理
        			$.ajax({
        				type:"post",
        				url:"../tf/do_rps_zan_post.jsp",
        				data:"zc=zan&pid="+pid,
        				success:function(result){
        					//已经点过
        					if(result.trim()=="-1"){
        						alert("再赞Ta会骄傲的");
        						$(th).next().css("color","red");
        					}
        					//开始点
        					if(result.trim()=="1"){
        						var z=parseInt($(th).next().text())+1;
        						$(th).next().text(z);
        						$(th).next().css("color","red");
        					}
        				},
        				error:function(){
        					alert("姿势错了！")
        				}
        			})
        		})
        		
        		
        			
    			
    			//用户对点踩cai-cai-cai-cai-cai
        		$(".z3").click(function(){
        			//获取评论的ID
        			var pid=$(this).attr("pid");
        			if(pid==undefined)return;
        			//记录对象
        			var th=$(this);
        			//开始处理
        			$.ajax({
        				type:"post",
        				url:"../tf/do_rps_zan_post.jsp",
        				data:"zc=cai&pid="+pid,
        				success:function(result){
        					//已经点过
        					if(result.trim()=="-1"){
        						alert("再踩Ta会伤心的");
        						$(th).next().css("color","red");
        					}
        					//开始点
        					if(result.trim()=="1"){
        						var z=parseInt($(th).next().text())+1;
        						$(th).next().text(z);
        						$(th).next().css("color","red");
        					}
        				},
        				error:function(){
        					alert("姿势错了！")
        				}
        			})
        		})
        		
        		
    			
    		
    			//搜索框
    			$(".sc2 a").click(function(){
    				
    				$("#formsou").submit();
    				
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
       			/*筛选*/
       		#left1{ height: 38px; background-color: #fff; margin-bottom: 10px;}
       		#left1 li{ float:left ; font-size:17px ; padding: 7px 10px;}
       		#left1 li:hover a{ color: green;} 
       		.lt1{ margin-left: 15px; }
      		/*帖子*/
      		/*消息资料*/
       		.touxiang{border-radius: 50%; margin-left: 15px;}/*头像*/
       		.x1{ height: auto; max-height: 1000px; background-color: #fff ; background-image: url(../img/shou/wenli.png); 
       			background-repeat:repeat-x; background-position-x:-25px; margin-bottom: 10px;  }
       		.x11{height: 60px;  padding-top: 15px; }
       		.x11 li{ float: left; }
       		.time{ margin-left: 10px; margin-top: 20px;}
       		.name{ margin-left: 10px; margin-top: 20px; font-size:20px ;font-weight: 700;}
       		.name a{color:red}.jibie a{color: blue;}
       		.jibie{ margin-left: 5px; margin-top: 21px; border: 1px #00F solid;font-size: 10px;padding: 2px;border-radius: 3px;}
       		/*标题*/
       		.neirong{ margin-left:30px; margin-right: 30px;}
       		a[name="biaoti"]{ font-size:25px; }
       		.neirong .bt{ margin-bottom: 15px;}
       		.neirong .wen{ font-size: 18px; line-height: 27px;  max-height: 780px;overflow: hidden;text-indent: 2em;}
       		/*点赞*/
       		.zan{
       			 margin-top: 35px; border-top: 1px solid #E0E2E2;	}
       		.zan ul{ height:60px ;}
       		.zan li{ float: left;  width: 30px; margin-top: 16px;	}
       		.zan .z1{ margin-left: 30px;}
       		.zan .z2{ line-height: 28px;}
       		.zan .z3{margin-top: 20px; }
       		.zan .z4{line-height: 28px;}
       		.zan .z5{margin-top: 20px; }
       		.zan .z6{line-height: 28px;}
       		/*分页*/
       		#fy{
       			height: 60px; background-color: #e4e4e4; margin-top: 15px; 
       		}
       		#fy ul{ margin-left: 200px; }
       		#fy li{ background-color: #fff;
       			float: left;   padding: 10px; margin-top: 8px;margin-right: 5px;
       		}
       		#fy .fy1:hover{  background-color: #39a261;}
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
       		#wei{  height: 100px; float: left; background-color:#e4e4e4; margin-top: 50px;
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
	    					<li><a name="qita" href="shou.jsp">首页</a></li>
	    					<li><a name="qita" href="re.jsp">热门</a></li>
	    					<li><a name="qita" href="duan.jsp">段子</a></li>
	    					<li><a name="qita" href="tu.jsp">图片</a></li>
	    					<li><a id="ben"   href="ba.jsp">八卦</a></li>
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
    			<!--左-->
    			<div id="left">
    				
    				<!--筛选-->
    				<div id="left1">
    					<ul>
    						<li class="lt1"><a href="ba.jsp?shai=1">推荐</a></li>
    						<li><a href="ba.jsp?shai=2">全部</a></li>
    					</ul>
    				</div>
    				
    				
    				<!-- 请开始帖子的遍历 -->
    					<%for(Post p:ps){ %>
    						<div class="x1">
						        <div class="x11">
						        	<ul class="xin1">
						        		<!--头像-->
							        	<li><a href="../user/info.jsp?uid=<%=p.getUID()%>"><img class="touxiang" src="../photo/<%=p.getUID() %>/tou.png" width="55px" height="55px" /></a></li>	
						        		<li class="name"><a href="../user/info.jsp?uid=<%=p.getUID()%>"><%=p.getUName()%></a></li>
						        		<li class="jibie"><a><%=iv.RLV(new Integer(p.getUexp())).getLTitle() %></a></li>
						        		<li class="time"><%=p.getPDate()%></li>
						        	</ul>
						        </div>
					      	  	<div class="neirong">
					        		<ul>
						        		<!--标题-->
						        		<li class="bt"><a name="biaoti" href="../tf/rps.jsp?pid=<%=p.getPID()%>"><%=p.getPhh() %></a></li>
						        		<!--内容-->
						        		<li class="wen">
											<%=p.getText() %>
						        		</li>
					        		</ul>
				        		</div>
					        	<div class="zan">
					        		<ul>
					        			<li class="z1" pid="<%=p.getPID()%>"><img src="../img/shou/ding.png"/></li>
					        			<li class="z2"><%=p.getPZan()%></li>
					        			<li class="z3" pid="<%=p.getPID()%>"><img src="../img/shou/cai.png"/></li>
					        			<li class="z4"><%=p.getPCai()%></li>
					        			<li class="z5" pid="<%=p.getPID()%>"><a name="biaoti" href="../tf/rps.jsp?pid=<%=p.getPID()%>"><img src="../img/shou/liu.png"/></a></li>
					        			<li class="z6"><%=p.getPRead()%></li>
					        		</ul>
					        	</div>
				       		 </div>
				       		 
    				
    					<% } %>
    				<!-- 表演结束 -->
    				
    				
		       		 
    				<!--再来一波or分页-->
    				<%if(shai.equals("1")){%>
    					<div id="fy">
				             <ul>
					             <li class="fy1"><a href="ba.jsp?shai=1&dan=<%=1%>">再来一波</a></li>
				             </ul>
	                	 </div>
    				<%}else if(shai.equals("2")){%>
	    				<div id="fy">
				             <ul>
					             <li class="fy1"><a href="ba.jsp?shai=2&dan=<%=1%>">首页</a></li>
					             <li class="fy1"><a href="ba.jsp?shai=2&dan=<%=dshang%>">上一页</a></li>
					             <li><a href="#"><%=dang%>/<%=zy%></a></li>
					             <li class="fy1"><a href="ba.jsp?shai=2&dan=<%=dxia%>">下一页</a></li>
					             <li class="fy1"><a href="ba.jsp?shai=2&dan=<%=zy%>">末页</a></li>
				             </ul>
	                	 </div>
	                <%}%>
	                
	                
    			</div>
    			<!--右-->
    			<div id="right">
    				<!--我要发帖-->
    				<div id="ft">
    					<ul>
    						<li><a href="../tf/cps.jsp">我要发帖</a></li>
    					</ul>
    				</div>
    				<!--个人信息  搜索-->
    				<div id="gc">
    					
    					<!--个人信息 -->
    					<div id="xinxi">
    						<ul>
    							<%if(user==null){%>
    								<li class="xinxi1"><a href="../login.jsp"><img name="tx" src="../img/shou/youke.jpg"/></a></li>
	    							<li class="xinxi2"><a class="naee" href="../login.jsp">未登录</a></li>
    							<%}else{%>
	    							<li class="xinxi1"><a href="../user/info.jsp?uid=<%=user.getID()%>"><img name="tx" src="../photo/<%=uid%>/tou.png"/></a></li>
	    							<li class="xinxi2"><a class="naee" href="../user/info.jsp?uid=<%=user.getID()%>"><%=user.getUName()%></a><a class="jibie" href="#"><%=iv.RLV(new Integer(user.getUexp())).getLTitle() %></a></li>
	    						<%}%>
    						</ul>
	    				</div>
	    				
	    				<div id="sc">
	    					<ul>
	    						 
	    						<form id="formsou" action="../type/sou.jsp" method="post">
	    							<li class="sc1"><input type="text" name="ss"></li>
	    						 	<li class="sc2"><a href="#">确定</a></li>
	    							<input type="submit" value="提交" style="display: none;"/>
	    						</form>
	    						 
	    					</ul>
    					</div>
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
    				
    				<div class="dat">
							<ul>
								<li id="tuj1">图片推荐:</li>
								<li class="tuj2"><a href="../tf/rps.jsp?pid=1074"><img src="../photo/10000/4.gif" width="130px" height="80px"/></a></li>
								<li class="tuj2"><a href="../tf/rps.jsp?pid=1104"><img src="../photo/10005/39.gif" width="130px" height="80px"/></a></li>
								<li class="tuj2"><a href="../tf/rps.jsp?pid=1089"><img src="../photo/10003/24.gif" width="130px" height="80px"/></a></li>
								<li class="tuj2"><a href="../tf/rps.jsp?pid=1078"><img src="../photo/10001/13.gif" width="130px" height="80px"/></a></li>
							</ul>
					</div>
    				<!--广告-->
    				<div id="guangg">
    					<a href="http://www.jd.com" target="_blank"><img src="../img/shou/48e5479f751d38db2715b638b125fda7.jpg"width="310px" height="240px" /></a>
    				</div>
    				
    				<!--火箭-->
    				<div id="huojian">
                 		&nbsp;
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
    		
    					<!--
            	作者：李振
            	时间：2017-06-11
            	描述：完
            -->
           

    	</div>
 	</body>
</html>