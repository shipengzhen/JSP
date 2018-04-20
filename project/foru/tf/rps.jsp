<%@page import="java.util.*"%>
<%@page import="com.entity.*"%>
<%@page import="com.dao.*"%>
<%@page import="com.dao.impl.FC"%>
<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>
<%
	//字符集格式
	request.setCharacterEncoding("UTF-8");
	
	
	//读取用户信息
	String UA=(String)session.getAttribute("UA");//用户身份，0-普通用户，1-管理员，-1游客
	if(UA==null)UA="-1";
	String uid=(String)session.getAttribute("uid");//用户ID
	
	//此处应该查询用户的详细资料
	IUsee iu=FC.getUserI();
	Usee user=null;
	if(uid!=null){
		user=iu.RaUseeByUID(uid);
	}
	
	
	
	
	
	String pid=request.getParameter("pid");//此页面要展示的帖子ID
	if(pid==null)pid="1001";
	FC.getPostI().UaPostRead(pid);//增加一个阅读量
	//String hh=(String)session.getAttribute("hh");
	//String zw=(String)session.getAttribute("zw");
	
	//获取帖子表接口和等级计算表
	IPost ip=FC.getPostI();
	IULV iv=FC.getIULV();
	
	//此页面之---帖子
	Post pt=ip.RaPost(pid);
	
	//此页面的评论，---下面推荐遍历去吧
	ICT it=FC.getICT();
	List<CT>cts_re=it.RCTByPIDandCnum(5,pid);//5个热门
	List<CT>cts_all=it.RCTByPIDandCDate(100, pid);//100个全部
	
	
	
	
	
	//段子、八卦、图片的推推推推推推推荐，下面推荐遍历去吧
	List<Post>ps_duan=ip.RPostByTIDandX("1",10);//随机10条段子
	List<Post>ps_ba=ip.RPostByTIDandX("3",10);//随机10条八卦
	
	
	
	
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>一笑网-<%=pt.getPhh()%></title>
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
       		
       		
        	/*李振UI设计的头*/
        	#tou *{ margin: 0px; padding: 0px; }
        	body{ margin: 0px; padding: 0px;}
       		#tou li{ list-style: none; }
       		#tou a{ text-decoration: none; color: #000;}
       		#tou a:hove{color: yellow;}
        	/*头部*/
       		#tou{background-color: #39A261; width: 100%; height: 70px; position: fixed; top: 0px;z-index: 1; }
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
       		
        	
        	
        	body{
        		
        	}
        	
        	/*总盒子*/
        	#zong{
        		width:1002px;
        		border: 1px #CCC solid;
        		margin: auto;
        		background-color: #F6F6F6;
        	}
        	
        	/*aa盒子,用户资料部分*/
        	#aa{
        		width: 1000px;
        		height: 50px;
        		border: 1px #000 solid;
        	}
        	
        	/*cc盒子，主题部分*/
        	#cc{
        		width: 1000px;
        		min-height: 500px;
        		border: 0px #000 solid;
        		overflow: hidden;
        	}
        	
        	/*综合素质*/
        	#c1,.c24,#c3{
        		border-radius:5px;
        	}
        	#c1,.c24 li{
        		background-color: #FFF;
        	}
        	
        	/*c1,文章盒子*/
        	#c1{
        		float: left;
        		width:660px ;
        		border: 1px #CCC solid;
        		padding: 0px;
        		margin: 20px;
        		margin-top:50px ;
        		list-style: none;
        	}
        	
        	/*标题*/
        	#c1 #hh{
        		border-bottom: 2px #000 solid;
        		text-align:center;
        		line-height: 40px;
        		margin: 20px 20px;
        		margin-top:40px ;
        	}
        	/*用户信息*/
        	#c1 #user{
        		border: 0px #000 solid;
        		margin: -10px 20px;
        		font-size: 20px;
        		line-height: 50px;
        	}
        	#c1 #user img{
        		float: left;
        		border: 1px #000 solid;
        		border-radius:50px;
        	}
        	#c1 #user span{
        		float: right;
        		font-size: 16px;
        	}
        	#c1 #user a{
        		text-decoration: none;
        	}
        	.jibie a{color: blue;}
        	.jibie{
        		position: relative;top:-2px;margin-top:10px;border: 1px #00F solid;font-size: 10px;padding: 2px;border-radius: 3px;
        		z-index: 0;
        	}
        	
        	/*正文*/
        	#c1 #zw{
        		text-indent: 2em;
        		font-size: 17px;
        		line-height: 35px;
        		margin: 20px 20px;
        		overflow: hidden;
        		border-bottom: 1px #999 solid;
        	}
        	#c1 #zw img{
        		width: 550px;
        		margin: 0px;
        	}
        	
        	/*帖子的赞or踩*/
        	#c1 #zc{
        		width: 300px;
        		margin: auto;
        	}
        	#c1 .pzan,#c1 .pcai{
        		width: 100px;
        		height: 30px;
        		margin: 5px;
        		border: 1px #BBB solid;
        		background-color: #FFF;
        		border-radius:3px;
        	}
        	
        	
        	/*c2,热门评论，c4最新评论*/
        	.c24{
        		float: left;
        		padding: 0px;
        		margin: 10px 0px;
        		width:700px ;
        		border: 0px #000 solid;
        		list-style: none;
        	}
        	.c24 h1{
        		margin: 20px 20px;
        	}
        	
        	.c24 li{
        		font-size: 16px;
        		margin: 20px;
        		border: 1px #CCC solid;
        		border-radius:3px;
        	}
        	/*评论者信息*/
        	.c24 h4{
        		margin: 10px;
        		margin-bottom:0px ;
        		padding: 0px;
        		border: 0px #000 solid;
        	}
        	/*用户信息*/
        	.c24 h4 img{
        		border: 1px #000 solid;
        		border-radius:50px;
        	}
        	.c24 h4 span{
        		float: right;
        		line-height: 50px;
        		font-size: 16px;
        		font-weight: 400;
        		color: #666;
        	}
        	.c24 h4 .pne{
        		text-decoration: none;
        		color: red;
        	}
        	/*评论内容*/
        	.c24 li div{
        		line-height: 30px;
        		text-indent: 2em;
        		margin: 10px 10px;
        		border: 0px #000 solid;
        		border-bottom: 1px #999 solid;
        	}
        	/*点赞按钮等*/
        	.c24 .zan,.c24 .hui{
        		width: 100px;
        		height: 30px;
        		margin: 5px;
        		border: 1px #CCC solid;
        		background-color: #FFF;
        		border-radius:3px;
        	}
        	
        	/*c3,我要发表评论*/
        	#c3{
        		float: left;
        		border: 0px #F00 solid;
        		overflow: hidden;
        		width: 700px;
        		height: 270px;
        		margin: 0px;
        	}
        	#ct{
        		width: 655px;
        		height: 190px;
        		margin: 20px;
        		margin-bottom: 10px;
        		font-size: 16px;
        		line-height: 25px;
        	}
        	#fbct{
        		width: 100px;
        		height: 30px;
        		margin: 0px 20px;
        		border: 1px #000 solid;
        		border-radius:3px;
        	}
        	
        	
        	
        	/*----------------------------尝试嵌入-----------------------*/
        	#c5{
        		margin-top: 50px;
        		width: 290px;
        		height: 1000px;
        		border: 0px #999 solid;
        		float:right;
        		border-radius:3px;
        	}
        	
        	#c5 ul{
        		border: 1px #999 solid;
        		border-radius:3px;
        		background-color: #FFF;
        		margin: 0px 0px 20px 0px;
        		padding: 0px;
        		
        	}
        	
        	#c5 ul h2{
        		color: #C66;
        		margin: 20px;
        	}
        	
        	#c5 ul li{
        		list-style-type: none;
        		height: 35px;
        		line-height: 20px;
        		overflow: hidden;
        		font-size: 17px;
        		margin: 0px 10px;
        		overflow: hidden;
        	}
        	#c5 a{color:#600;text-decoration: none;}
        	#c5 a:hover{color: red;text-decoration:underline}
        	
        	/*ff盒子，版权部分*/
        	#ff{
        		width: 1000px;
        		height: 100px;
        		border: 0px #000 solid;
        		clear: both;
        	}
        	
        	
        	
       		/*尾部*/
       		#wei{  height: 100px; float: left; background-color:#e4e4e4; margin-top: 0px;
       																}
       		#wei1 li{ 
       			float: left; margin-top: 10px; margin-right: 30px;list-style-type:none ;
       		}
       		#wei1 .we1{ margin-left: 340px; }
       		#wei1 .we2{ margin-left:260px ;}
       		#wei a{ font-size: 14px;}
        	
        	
        </style>
        
        <script type="text/javascript" src="../js/jquery-1.8.3.js" ></script>
        <script type="text/javascript">
        	
        	$(document).ready(function(){
        		
        		//导航栏文字
    			$("a[name=qita]").hover(
    				function(){
    					$(this).css("color","#ffff00");
    				},
    				function(){
    					$(this).css("color","azure");
    				}
    			)
    			
    			
        		//评论框的焦点
        		$("#ct").blur();
        		$("#ct").focus(function(){
        			if($("#ct").html()=="参与评论"){
        				$("#ct").html("");
        			}
        		})
        		$("#ct").blur(function(){
        			if($("#ct").html()==""){
        				$("#ct").html("参与评论");
        			}
        		})
        		
        		//用户发表评论
        		$("#form1").submit(function(){
        			
        			var ctext=$("#ct").val();//该死的火狐兼容性，我记住你了！！！
        			var pid="<%=pid%>";//载入此帖子ID
        			
        			$.ajax({
        				type:"post",
        				url:"do_rps_c_ct.jsp",
        				data:"pid="+pid+"&ctext="+ctext,
        				success:function(result){
        					//评论失败
        					if(result.trim()=="-1"){
        						alert("评论失败，姿势不对");
        					}
        					//评论成功，刷新页面
        					if(result.trim()=="1"){
        						location.href=location.href;
        					}
        					if(result.trim()=="-2"){
        						//回去登录吧
        						var t=confirm("登录后即可与大家一起互动，现在就去登录？")
        						if(t==false)return;
        						location.href="../login.jsp";
        						
        					}
        				}
        			});
        			
        			return false;
        		})
        		
        		
        		//用户对评论点赞
        		$(".zan").click(function(){
        			//获取评论的ID
        			var ctid=$(this).attr("ctid");
        			if(ctid==undefined)return;
        			//记录对象
        			var th=$(this);
        			//开始处理
        			$.ajax({
        				type:"post",
        				url:"do_rps_zan_ct.jsp",
        				data:"ctid="+ctid,
        				success:function(result){
        					//已经点过
        					if(result.trim()=="-1"){
        						alert("纵然爱Ta千百字，奈何只能赞一次");
        						$(th).children().css("color","red");
        					}
        					//开始点
        					if(result.trim()=="1"){
        						var z=parseInt($(th).children().text())+1;
        						$(th).children().text(z);
        						$(th).children().css("color","red");
        					}
        				}
        			});
        		})
        		
        		//用户对帖子点赞
        		$(".pzan").click(function(){
        			//获取评论的ID
        			var pid=$(this).attr("pid");
        			if(pid==undefined)return;
        			//记录对象
        			var th=$(this);
        			//开始处理
        			$.ajax({
        				type:"post",
        				url:"do_rps_zan_post.jsp",
        				data:"zc=zan&pid="+pid,
        				success:function(result){
        					//已经点过
        					if(result.trim()=="-1"){
        						alert("再赞Ta会骄傲的");
        						$(th).children().css("color","red");
        					}
        					//开始点
        					if(result.trim()=="1"){
        						var z=parseInt($(th).children().text())+1;
        						$(th).children().text(z);
        						$(th).children().css("color","red");
        					}
        				},
        				error:function(){
        					alert("姿势错了！")
        				}
        			})
        		})
        		
        		
        		//用户对帖子点踩
        		$(".pcai").click(function(){
        			//获取评论的ID
        			var pid=$(this).attr("pid");
        			if(pid==undefined)return;
        			//记录对象
        			var th=$(this);
        			//开始处理
        			$.ajax({
        				type:"post",
        				url:"do_rps_zan_post.jsp",
        				data:"zc=cai&pid="+pid,
        				success:function(result){
        					//已经点过
        					if(result.trim()=="-1"){
        						alert("再踩Ta会伤心的/(ㄒoㄒ)/~~");
        						$(th).children().css("color","red");
        					}
        					//开始点
        					if(result.trim()=="1"){
        						var z=parseInt($(th).children().text())+1;
        						$(th).children().text(z);
        						$(th).children().css("color","red");
        					}
        				}
        			})
        		})
        		
        		
        		//回复某人
        		$(".hui").click(function(){
        			//获得对象名字数据
        			var ctname=$(this).parent().children().children(".pne").text();
        			location.href="#ct";
        			$("#ct").text("回复@"+ctname+"\n");
        			$("#ct").val("回复@"+ctname+"\n");//该死的火狐兼容性
        			$(window).scrollTop($(window).scrollTop()-500);
        			$("#ct").focus();
        		})
        		
        		
        		
        		//用户删除这条帖子
        		$("#dthis").click(function(){
        			
        			//给他一次后悔的机会
        			var t=confirm("您确定不是手滑点到了删除？")
        			if(t==false)return;
        			
        			var pid="<%=pt.getPID()%>";
        			var puid="<%=pt.getUID()%>"
        			
        			$.ajax({
        				type:"post",
        				url:"do_rps_d_post.jsp?pid="+pid+"&puid="+puid,
        				async:true,
        				success:function(result){
        					//已经点过
        					if(result.trim()=="-1"){
        						alert("删除疑似失败！");
        					}
        					//开始点
        					if(result.trim()=="1"){
        						alert("删除成功！")
        						history.go(-2);//回退,搞不懂为何要回退2级
        					}
        				}
        			});
        			
        			
        			
        		})
        		
        		
        		
        		//根据类型ID决定是否隐藏图片，段子绝对不可以显示图片
        		
        		
        		
        		
        		
        	})
        	
        	
        </script>
    </head>

	<div id="back"><!--背景盒子--></div>

    
    <body>
    	
    	
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
    	
    	
    	
    	<div id="zong">
    		<div id="aa">aa盒子用户资料</div>
    		<div id="cc">
    			
    			
    			
    			<!--尝试---嵌入---失败----->
    			<div id="c5">
    				
    				
    				<!--段子推荐-->
					<ul class="c5duan">
						<h2>段子推荐</h2>
						<%for(Post p:ps_duan){%>
							<li><a href="../tf/rps.jsp?pid=<%=p.getPID()%>"><%=p.getPhh()%></a></li>
						<%}%>
					</ul>
					
    				<!--八卦推荐-->
					<ul class="c5ba">
						<h2>文章推荐</h2>
						<%for(Post p:ps_ba){%>
							<li><a href="../tf/rps.jsp?pid=<%=p.getPID()%>"><%=p.getPhh()%></a></li>
						<%}%>
					</ul>
    				
    				
    				
    				
    				
    				
    				
    			</div>
    			
    			
    			
    			
    			<!--c1,为文章而生-->
    			<ul id="c1">
    				<h1 id="hh"><%=pt.getPhh()%></h1>
    				<!--用户信息-->
    				<li id="user">
    					<a href="../user/info.jsp?uid=<%=pt.getUID() %>"><img width="50" height="50" src="../photo/<%=pt.getUID() %>/tou.png" style="vertical-align:middle;"/></a>
    					<a href="../user/info.jsp?uid=<%=pt.getUID() %>"><%=pt.getUName()%></a>
    					<spann class="jibie"><a><%=iv.RLV(new Integer(pt.getUexp())).getLTitle() %></a></spann>
    					<span>时间：<%=pt.getPDate() %></span>
    					
    				</li>
    				<li id="zw">
    					<%=pt.getText()%><br/>
    				</li>
    					<% if(UA=="1"||(pt.getUID()+"").equals(uid)){%>
    						<li id="dthis" ><a href="#" style="color: blue;margin-left: 20px;">删</a></li>
    					<%}%>
    				<li id="zc">
    					<button class="pzan" pid="<%=pt.getPID() %>">点赞(<span><%=pt.getPZan()%></span>)</button>
    					VS
    					<button class="pcai" pid="<%=pt.getPID() %>">踩Ta(<span><%=pt.getPCai()%></span>)</button>
    				</li>
    			</ul>
    			
    			
    			<!--到底放哪？？？我要崩溃了！！！-------------->
    			<!--c3我要发表评论-->
    			<div id="c3">
    				<form id="form1" action="#" method="post">
    					<textarea id="ct" name="ct" rows="7" cols="75">参与评论</textarea>
    					<br /><input id="fbct" type="submit" value="发表"/>
    				</form>
    			</div>
    			<!--到底放哪？？？我要崩溃了！！！-------------->
    			
    			
    			<!--c2,热门评论-->
    			<ul id="c2" class="c24">
    				
    				<h1>热门评论</h1>
    				
    				<%for(CT c:cts_re){ %>
	    				<li>
	    					<h4>
		    					<a href="../user/info.jsp?uid=<%=c.getUID()%>"><img width="50" height="50" src="../photo/<%=c.getUID()%>/tou.png" style="vertical-align:middle;"/></a>
		    					<a class="pne" href="../user/info.jsp?uid=<%=c.getUID()%>"><%=c.getUName() %></a>
		    					<spann class="jibie"><a><%=iv.RLV(new Integer(pt.getUexp())).getLTitle() %></a></spann>
		    					<span>时间：<%=c.getCDate() %></span>
	    					</h4>
	    					<div>
	    						<%=c.getText() %>
	    					</div>
	    					<button class="zan" ctid="<%=c.getCID()%>">点赞(<span><%=c.getCnum() %></span>)</button>
	    					<button class="hui">回复</button>
	    				</li>
    				<%}%>
    				
    			</ul>
    			
    			
    			<!--c4,最新评论-->
    			<ul id="c4" class="c24">
    				
    				<h1>最新评论</h1>
    				
    				<%for(CT c:cts_all){ %>
	    				<li>
	    					<h4>
		    					<a href="../user/info.jsp?uid=<%=c.getUID()%>"><img width="50" height="50" src="../photo/<%=c.getUID()%>/tou.png" style="vertical-align:middle;"/></a>
		    					<a class="pne"  href="../user/info.jsp?uid=<%=c.getUID()%>"><%=c.getUName() %></a>
		    					<spann class="jibie"><a><%=iv.RLV(new Integer(pt.getUexp())).getLTitle() %></a></spann>
		    					<span>时间：<%=c.getCDate() %></span>
	    					</h4>
	    					<div>
	    						<%=c.getText() %>
	    					</div>
	    					<button class="zan" ctid="<%=c.getCID()%>">点赞(<span><%=c.getCnum() %></span>)</button>
	    					<button class="hui">回复</button>
	    				</li>
    				<%}%>
    				
    			</ul>
    			
    			
    			
    			
    			
    			
    			
    		</div>
    		<div id="ff">
    			
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