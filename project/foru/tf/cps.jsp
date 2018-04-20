<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>
<%@include file="../clude/lanjie.jsp" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>一笑网-发表帖子</title>
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
        	*{ margin: 0px; padding: 0px; }
       		#tou li{ list-style: none; }
       		#tou a{ text-decoration: none; color: #000;}
       		#tou a:hove{color: yellow;}
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
       		
        	
        	
        	body{
        		
        	}
        	/*总盒子*/
        	#zong{
        		width:1002px;
        		border: 1px #CCC solid;
        		margin: auto;
        		background-color: #CCC;
        	}
        	
        	/*aa盒子,用户资料部分*/
        	#aa{
        		width: 1000px;
        		height: 70px;
        		border: 0px #000 solid;
        	}
        	
        	
        	/*cc盒子，主题部分*/
        	#cc{
        		width: 1000px;
        		border: 0px #000 solid;
        		overflow: hidden;
        		background-color: #FEFEFE;
        	}
        	
        	/***********帖子相关*************************************/
        	#c1{
        		width: 700px;
        		border: 0px #000 solid;
        		margin: 0px;
        		padding: 0px;
        		float: left;
        		padding-top:20px ;
        	}
        	
        	#c1 li{
        		border: 0px #000 solid;
        		margin: 20px 30px;
        		list-style-type: none;
        		font-size: 18px;
        		font-weight: bold;
        	}
        	/*标题*/
        	#hh{
        		width: 560px;
        		height: 35px;
        		font-size: 16px;
        		font-weight:500;
        		border: 1px #999 solid;
        		text-indent: 3em;
        		border-radius:5px;
        	}
        	
        	/*类型的下拉列表框*/
        	#type{
        		width: 100px;
        		height: 30px;
        		font-size: 16px;
        		border: 1px #999 solid;
        		margin: 0px -5px;
        		border-radius:5px;
        	}
        	/*过滤框*/
        	#guo{
        		width: 100px;
        		height: 30px;
        		font-size: 16px;
        		font-weight:500;
        		border: 1px #999 solid;
        		text-indent: 1em;
        		border-radius:5px;
        		margin: 0px 20px;
        		color: #999;
        	}
        	
        	/*正文*/
        	#zw{
        		float: left;
        	}
        	#xie{
        		float: left;
        		width: 560px;
        		height: 400px;
        		border: 1px #999 solid;
        		font-weight:400;
        		font-size: 17px;
        		line-height: 25px;
        		text-indent: 2em;
        		overflow:auto;
        		word-break: break-word;
        		background-color: #FFF;
        		border-radius:5px;
        	}
        	/*隐藏域，方便提交正文*/
        	#cang{
        		display: none;
        	}
        	
        	/*表单提交发表按钮*/
        	#tibtn{
        		width: 100px;
        		height: 40px;
        		font-size: 16px;
        		font-weight:500;
        		border: 1px #999 solid;
        		display: block;
        		border-radius:5px;
        		margin: 0px 20px 0px 85px;
        	}
        	/*剩余字数*/
        	#yufont{
        		
        	}
        	/*上传图片按钮*/
        	#sctu{
        		display: none;
        	}
        	#ft{
        		display: none;
        	}
        	#sc{
        		width: 100px;
        		height: 30px;
        		font-size: 16px;
        		border: 1px #999 solid;
        		border-radius:3px;
        		margin: 0px 20px;
        	}
        	
        	/*防止扁盒子*/
        	#qing{
        		clear: both;
        	}
        	
        	/*----------发帖须知---------------*/
        	#c2{
        		width: 270px;
        		float: right;
        		padding: 0px;
        		margin: 20px 20px 20px 0px;
        		border: 1px #000 solid;
        		border-radius:10px;
        		background-color: #DD3;
        		box-shadow: 2px 2px 2px #666;
        	}
        	
        	#c2 h1{
        		text-align: center;
        		margin: 20px auto;
        	}
        	
        	#c2 li{
        		list-style-type: none;
        		border: 0px #000 solid;
        		font-size: 16px;
        		line-height: 25px;
        		margin: 20px 20px;
        	}
        	
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
       			float: left; margin-top: 20px; margin-right: 30px;list-style-type:none ;
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
    			
        		
        		//类型的--下拉列表改变--时,是否加载选择图片按钮
        		$("#type").change(function bian(){
        			//获得选中的文本值
        			var s=$(this).find("option:selected").text();
        			//段子不需要上传图片
        			if(s=="段子"){
        				$("#ft").css("display","none");
        			}else{
        				$("#ft").css("display","inline");
        			}
        		});
        		$("#type").ready(function(){
        			$("#type").change();
        		})
        		
        		//用户点击--添加图片--按钮时
        		var yi=0;//记录是否异步,0-同步，1-异步
        		$("#sc").click(function(){
        			$("#sctu").click();
        		});
        		//此写法为了兼容IE和火狐
        		$("#sctu").change(function(){
        			//alert($(this).prop("value"))
        			//验证是否选择了图片
        			if($("#sctu").val()==""){
        				return;
        			}
        			//记录为异步
        			yi=1;
        			$("#form1").submit();
        			$("#sctu").val("");//清空选择的文件
        			
        		})
        		
        		
        		//过滤框
        		$("#cguo").click(function(){
        			//现身
        			$("#guo").css("display","inline");
        			$("#guo").val("过滤框");
        		})
        		$("#guo").blur(function(){
        			//隐身
        			$("#guo").css("display","none");
        			//如果为空
        			if($("#guo").val()==""||$("#guo").val()=="过滤框"){
        				$("#guo").val("过滤框");
        				return;
        			}
        			//写入
        			$("#xie").html($("#xie").html()+"<p>"+$("#guo").val()+"</p>")
        			$("#guo").val("过滤框");
        		})
        		$("#guo").focus(function(){
        			$("#guo").val("");
        		})
        		
        		
        		//监听表单
        		$("#form1").submit(function(){
        			
        			//异步
        			if(yi==1){
        				
	        			//获得表单序列化
	        			var form=this;
	        			var ff=new FormData(form);
	        			//var str=$(form).serialize();
	        			//异步提交
	        			$.ajax({
	        				type:"post",
	        				url:"do_cps_photo.jsp",
	        				data:ff,
	        				async:true,
	        				processData:false,
	        				contentType:false,
	        				error:function(e){
	        					alert("添加失败，服务器繁忙"+e);
	        				},
	        				success:function(result){
	        					//获得路径字符串
	        					var s=result.toString();
	        					//处理垃圾字符
	        					s=s.replace("&#10;","");
	        					s=s.trim();
	        					//-1代表上传图片发生异常
	        					if(s==-1){
	        						alert("添加失败，难道……姿势不对？");
	        						return;
	        					}
	        					//-2代表上传图片大小超过上限
	        					if(s==-2){
	        						alert("图片大小超上限，服务器不堪其辱！");
	        						return;
	        					}
	        					//添加到盒子
	        					$("#xie").html($("#xie").html()+"<p><img width='400' src='"+s+"'/></p>");
	        				}
	        			});
        			
        				yi=0;
        				return false;
        			}else{
        				//同步，开始提交帖子表单
        				$("#cang").val($("#xie").html());//获得正文的数据
        				return true;
        			}
        		})
        		
      			//实时监听字数
        		$("#xie").keydown(function(){
        			var s=$("#xie").html().length;
        			$("#yufont").html((5001-s));
        		})
        		
        		
        		//屏幕闪烁
//      		var i=0;
//      		setInterval(function show(){
//      			i++;s
//      			if(i%2==0){
//      				$("body").css("background-color","#000");
//      				$("#cc").css("background-color","#F00");
//      				$("#c2").css("background-color","#0F0");
//      			}else{
//      				$("body").css("background-color","#FFF");
//      				$("#cc").css("background-color","#00F");
//      				$("#c2").css("background-color","#F0F");
//      			}
//      		},100)
        		
        		//点我啊
        		$("#ti").click(function(){
        			alert($("#xie").html());
        			alert($("#xie").html().length);
        			$("#xie").html($("#xie").text());
        		});
        		
        		
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
    					<li><a name="qita"  href="../type/shou.jsp">首页</a></li>
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
    		
    		<div id="aa">
    			用户资料盒子
    		</div>
    		
    		<div id="cc">
    			
    			<ul id="c1">
	    			<form id="form1" action="do_cps.jsp" method="post" enctype="multipart/form-data">
	    				<!--------标题----------->
	    				<li>标题：<input type="text" name="hh" id="hh" value="" /></li>
	    				
	    				<!--------类型选择----------->
	    				<li>类型：
	    					<select id="type" name="type">
	    						<option value="1">段子</option>
	    						<option value="2">图片</option>
	    						<option value="3">八卦</option>
	    					</select>
	    					<span id="ft">
	    						<input type="button" name="sc" id="sc" value="添加图片" />
	    						<input type="file" accept="image,.jpg,.png,.jpeg,.gif"  name="sctu" id="sctu" value="" />
	    					</span>
	    					<input type="text" name="guo" id="guo" value="过滤框" style="display: none;"/>
	    				</li>
	    				
	    				<!--------正文----------->
	    				<li>
	    					<span id="zw">正文：</span>
	    					<div id="xie" name="xie" contenteditable="true"><p>&nbsp;</p></div>
	    					<input type="text" name="cang" id="cang" value="" />
	    					<div id="qing"></div>
	    				</li>
	    				
	    				<!--------提交表单----------->
	    				<input id="tibtn" type="submit" value="发表"/>
	    				<br /><input type="button" name="ti" id="ti" value="点我" style="display: none;"/>
    				</form>
    			</ul>
    			
    			<!--发帖须知等-->
    			<ul id="c2">
    				<h1>发帖须知</h1>
    				<li>1、上传图片不要超过3M，否则不会通过</li>
    				<li>2、帖子正文不接受有排版信息的文字（如：从word等文字排版软件拷贝的内容），带有排版信息的帖子会发表失败</li>
    				<li>3、禁止发表涉及政治、色情、暴力、广告等违法违规内容</li>
    				<li>4、帖子字数上限5000字，您目前还能输入<span id="yufont">5000</span>字</li>
    				<li>5、高质量帖子可以使用户获得十个积分，提升用户在社区的等级</li>
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