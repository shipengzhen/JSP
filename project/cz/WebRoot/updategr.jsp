<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>
<%@ include file="uhead.jsp"%>
	<!--用户信息-->
	<!--/#header-->
	<style type="text/css">
		#content{min-height: 600px;}
		#No1{margin-left:50px; width:830px; min-height: 500px;color: white;}
		#tops{ margin-left:270px;height: 160px;width: 230px;margin-top: 30px;}
		#he{border-top:0.2px solid #CCC;height: 45px;margin-bottom: 20px;}
		#No2{background-color: #fffdf2;}
		.dz{border:0.2px solid #000000 ;border-radius: 3%;width:400px;height:100px;margin-left: 70px;background-color: white;margin-top: -20px;}
		.zl{font-size: 14px;margin-bottom: 30px;margin-left: 20px;color:#666}
		.z1{width:230px;border-radius: 3%;height: 28px;}
		.xin{font-size: 16px;color: #666;margin-left: 20px;margin-top: 10px; margin-bottom: 0px;height: 27px;}
		.zi{font-size: 14px;margin-left: 20px; color: #999;margin-bottom: 2px;}
		.img{border-radius: 50%;height: 150px;width: 150px;background-color: #FFF;}
		.colo{background-color: #ef694f;height: 10px;margin-bottom: 0px;}
		.colo2{background-color: #FFF;height: 20px;border-bottom: 0.2px solid #CCC;border-top: 0.2px solid #CCC;}
		.jf{float: right;margin-top: -30px;margin-right: 45px; color:#666;font-weight: 300;}
	</style>
            <div id="content" class="col-lg-10">
                <div id="No1">
                    <form action="" method="post">
                    	<div id=No2>
	                    	<div id="he">
	                    		<p class="xin">个人信息&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="#" class="zi">保存</a></p>
	                    		<p class="colo"></p>
	                    		<p class="colo2"></p>
	                    	</div>
	                    	
	                    	<div id="bottom">
	                    		<dl id="tops">
                    				<dd class="img"></dd>
                    				<dt class="jf"><img src="assets/img/advertise/jf.png" width="20px"/>积分<span class="jfzhi"></span></dt>
                    			</dl>
	                    		<p class="zl">用户名： <input type="text" class="z1" placeholder="用户名"/></p>
	                    		<p class="zl">真实姓名：<input type="text" class="z1"/></p>
	                    		<p class="zl">性别：<input type="radio" checked="checked" name="sex" value="男"/>男
	                    						  &nbsp;&nbsp;&nbsp;&nbsp;
	                    						  <input type="radio" name="sex" value="女"/>女
	                    		</p>
	                    		<p class="zl">联系电话：<input type="text" class="z1" placeholder="联系电话"/></p>
	                    		<p class="zl">收货地址：<p class="dz"></p></p>
	                    	</div>
	                    </div>
                    </form>
                </div>
            </div>
        </div>
        <!-- 内容部分结束 -->
<%@ include file="foot.jsp"%>
