<%@page import="com.cz.entity.Sp"%>
<%@page import="com.cz.entity.SpXType"%>
<%@page import="com.cz.dao.impl.SpDaoImpl"%>
<%@page import="com.cz.dao.ISpDao"%>
<%@page import="com.cz.dao.impl.SpXTypeDaoImpl"%>
<%@page import="com.cz.dao.ISpXTypeDao"%>
<%@page import="com.cz.entity.SpType"%>
<%@page import="java.util.List"%>
<%@page import="com.cz.dao.impl.SpTypeDaoImpl"%>
<%@page import="com.cz.dao.ISpTypeDao"%>
<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>
<% session.setAttribute("open","open");%>
<%@include file="head.jsp"%>
<%
	ISpDao sptime=new SpDaoImpl();
	request.setAttribute("time", sptime.findbytime());	//最新上架商品
	request.setAttribute("xiaol", sptime.findbynum());	//销量
	
	request.setAttribute("tj", sptime.findbyTj());		//推荐
	if(request.getParameter("uid")!=null){
		session.removeAttribute("uu");
	}
 %>
	<!--首页-->
	<div class="container">
        <!-- 内容部分开始 -->
        <!-- 第一行 轮播广告 开始 -->
        <div class="row first lazy">
            <div class="col-lg-2"></div>
            <div class="col-lg-8">
                <div id="focus_carousel" class="carousel slide" data-ride="carousel">
                    <ol class="carousel-indicators">
                        <li data-target="#focus_carousel" data-slide-to="0" class="active"></li>
                        <li data-target="#focus_carousel" data-slide-to="1" class=""></li>
                        <li data-target="#focus_carousel" data-slide-to="2" class=""></li>
                        <li data-target="#focus_carousel" data-slide-to="3" class=""></li>
                    </ol>
                    <div class="carousel-inner">
                        <div class="item active">
                            <img src="assets/img/advertise/focus-ban-3.jpg"  width="1000px" height="480px" />
                        </div>
                        <div class="item">
                            <img src="assets/img/advertise/focus-ban-5.jpg"  width="1000px" height="480px" />
                        </div>
                        <div class="item">
                            <img src="assets/img/advertise/focus-ban-6.jpg"  width="1000px" height="480px"/>
                        </div>
                        <div class="item">
                            <img src="assets/img/advertise/focus-ban-3.jpg" width="1000px" height="480px" />
                        </div>
                    </div>
                    <a class="left carousel-control" href="#focus_carousel" data-slide="prev"><span class="glyphicon glyphicon-chevron-left"></span></a>
                    <a class="right carousel-control" href="#focus_carousel" data-slide="next"><span class="glyphicon glyphicon-chevron-right"></span></a>
                </div>
            </div>
        </div>
        <!-- 第一行 轮播广告 结束 -->

 		<!--3个 促销模块开始 -->
        <div class="row mb10 lazy">
            <div class="col-lg-12">
                <ul class="nav-orange nav-justified" id="myTab">
                    <li class="active"><a href="#special" data-toggle="tab">人气商品</a></li>
                    <li><a href="#new" data-toggle="tab">新品上架</a></li>
                    <li><a href="#hot" data-toggle="tab">商品推荐</a></li>
                </ul>
                <div class="tab-content">
                	<!-- 销量厉害 -->
                    <div class="tab-pane active" id="special">
                        <ul class="listbar">
                           <c:forEach var="te1" items="${xiaol}">
	                            <li>
	                            	<a href="detail.jsp?spid=${te1.spId}&spxtypeid=${te1.spXTypeId}">
	                                	<img alt="" class="center-block" src="image/${te1.spTp}">
	                                </a>
	                                <div class="summary">
	                                	<a href="detail.jsp?spid=${te1.spId}&spxtypeid=${te1.spXTypeId}">${te1.spName }</a>
	                                </div>
	                                <div class="price mt5">抢购价：
	                                	<b>¥${te1.spxMoney }</b>
	                                	<i class="fr">送${te1.jf}积分</i>
	                                </div>
	                            </li>
                       		</c:forEach>
                        </ul>
                    </div>
                    <!-- 新品上架 -->
                    <div class="tab-pane" id="new">
                        <ul class="listbar">
                			<c:forEach var="te" items="${time}">
	                            <li>
	                            	<a href="detail.jsp?spid=${te.spId}&spxtypeid=${te.spXTypeId}">
	                                	<img alt="" class="center-block" src="image/${te.spTp}">
	                                </a>
	                                <div class="summary">
	                                	<a href="detail.jsp?spid=${te.spId}&spxtypeid=${te.spXTypeId}">${te.spName }</a>
	                                </div>
	                                <div class="price mt5">抢购价：
	                                	<b>¥${te.spxMoney }</b>
	                                	<i class="fr">送${te.jf}积分</i>
	                                </div>
	                            </li>
                       		 </c:forEach>
                        </ul>
                    </div>
                    <!-- - -->
                    <div class="tab-pane" id="hot">
                        <ul class="listbar">
                            <c:forEach var="te1" items="${tj}">
	                            <li>
	                            	<a href="detail.jsp?spid=${te1.spId}&spxtypeid=${te1.spXTypeId}">
	                                	<img alt="" class="center-block" src="image/${te1.spTp}">
	                                </a>
	                                <div class="summary">
	                                	<a href="detail.jsp?spid=${te1.spId}&spxtypeid=${te1.spXTypeId}">${te1.spName }</a>
	                                </div>
	                                <div class="price mt5">抢购价：
	                                	<b>¥${te1.spxMoney }</b>
	                                	<i class="fr">送${te1.jf}积分</i>
	                                </div>
	                            </li>
                       		</c:forEach>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
        <!-- 促销模块结束 -->
        
        
 		<!-- 夏季推荐-->
        <div class="row mb10 lazy">
            <div class="col-lg-2">
                <div class="floor-title floor-bb-1 floor-text"><i class="icon-main icon-floor-1 pull-left mt10"></i>夏季推荐</div>
                <div class="floor-show">
                    <img src="image/index/b8.png" width="190px"  height="370px"/>
                </div>
            </div>
            <div class="col-lg-10">
                <div class="floor-title floor-bb-1 tr f12"><a href="">更多&gt;&gt;</a></div>
                <div class="floor-product">
                	 <ul class="listbar-2">
                	<%
						 List<Sp> listxq=sptime.findxj("夏季");  
						 for(int i1=0;i1<listxq.size();i1++){
                	 %>
                        <li>
                        	<a href="detail.jsp?spid=<%=listxq.get(i1).getSpId()%>&spxtypeid=<%=listxq.get(i1).getSpXTypeId()%>">
                            <img alt="" class="center-block" src="image/<%=listxq.get(i1).getSpTp()%>"></a>
                            <div class="summary mt20">
                            	<a href="detail.jsp?spid=<%=listxq.get(i1).getSpId()%>&spxtypeid=<%=listxq.get(i1).getSpXTypeId()%>"><%=listxq.get(i1).getSpName() %></a>
                            </div>
                            <div class="price mt5">抢购价:
                            	<b>¥<%=listxq.get(i1).getSpxMoney()%></b>
                            	<i class="fr">送<%=listxq.get(i1).getJf()%>积分</i>
                            </div>
                        </li>
                      <%
                      	}
                      %>
                    </ul>
                </div>
            </div>
        </div>
        <%
        	//商品小小类型
        	ISpXTypeDao sp=new SpXTypeDaoImpl();
        	List<SpXType> lt1=null;
        	//对应的图片
        	ISpDao sp2=new SpDaoImpl();
        	List<Sp> str =null;
         %>
         
         
         
		<!--1 男士外套 -->
	        <div class="row mt10 lazy">
	            <div class="col-lg-2">
	                <div class="floor-title floor-bb-2 floor-text">
	                <i class="icon-main icon-floor-2 pull-left mt10"></i>男士外套
	            </div>
	            <div class="floor-brand">
	            
	            	  <ul class="brand-list">
                        <li><a href="">
                            <img src="assets/img/advertise/brand-1.jpg"></a></li>
                        <li><a href="">
                            <img src="assets/img/advertise/brand-1.jpg"></a></li>
                        <li><a href="">
                            <img src="assets/img/advertise/brand-1.jpg"></a></li>
                        <li><a href="">
                            <img src="assets/img/advertise/brand-1.jpg"></a></li>
                        <li><a href="">
                            <img src="assets/img/advertise/brand-1.jpg"></a></li>
                        <li><a href="">
                            <img src="assets/img/advertise/brand-1.jpg"></a></li>
                        <li><a href="">
                            <img src="assets/img/advertise/brand-1.jpg"></a></li>
                        <li><a href="">
                            <img src="assets/img/advertise/brand-1.jpg"></a></li>
                    </ul>
                
                    <a href="">
                        <img class="position" src="image/index/w3.png " width="180px"></a>
	            </div>
	        </div>
	        <div class="col-lg-8">
	        	<ul class="nav floor-tabs tabs-border-1 tab-bg-1" id="floor-fir-tab">
	            <% 
	            	lt1= sp.findallxtype(1);
	                for(int k=0;k<lt1.size()-lt1.size()+1;k++){ 
	            %>	
	                	<li class="active">
	                		<a href="#fol-fir-<%=k+1%>" data-toggle="tab"><%=lt1.get(k).getSpxTypeName()%></a>
	                	</li>
	            <%
	            	}
	                for(int k=1;k<lt1.size();k++){	
	            %>
	                	<li>
	                		<a href="#fol-fir-<%=k+1%>" data-toggle="tab"><%=lt1.get(k).getSpxTypeName() %>
	                		</a>
	                	</li>
	            <%
	            	}
	            %>
	           </ul>
	           		<div class="tab-content">
	                <%	
	                	for(int p=0;p<lt1.size()-lt1.size()+1;p++){	 
	                %>
	                    	<div class="tab-pane active" id="fol-fir-1">  
	                    		<ul class="listbar-3">                 	
	                <%					
	                     str=sp2.findsyxs(lt1.get(p).getSpTypeId(),lt1.get(p).getSpxTypeId());
		                    if(str.size()>0){
		                    	for(int f=0;f<str.size();f++){
	                %>	
		                    	<li>
		                    		<a href="detail.jsp?spid=<%=str.get(f).getSpId()%>&spxtypeid=<%=str.get(f).getSpXTypeId() %>">
		                               <img alt="" class="center-block" src="image/<%=str.get(f).getSpTp()%>">
		                            </a>
		                            <div class="summary mt5">
		                            	<a href="detail.jsp?spid=<%=str.get(f).getSpId()%>&spxtypeid=<%=str.get(f).getSpXTypeId() %>">
		                               		<%=str.get(f).getSpName()%>
		                            	</a>
		                            </div>
		                            <div class="price">
		                            	<b>¥<%=str.get(f).getSpxMoney()%></b>
		                            </div>
		                        </li>
	             	<%
		             			}
		                	}
	                %>
	          </ul>
	     </div>
	                <%
	                	}
	                %>
	                <%
	                	for(int p=1;p<lt1.size();p++){	 
	                 	str=sp2.findsyxs(lt1.get(p).getSpTypeId(),lt1.get(p).getSpxTypeId());
	                 %>
	                 	<div class="tab-pane" id="fol-fir-<%=p+1%>">
	                 		<ul class="listbar-3">
	                 <%
	                 	for(int f=0;f<str.size();f++){
	                 %>
	                 	<li>
	  						<a href="detail.jsp?spid=<%=str.get(f).getSpId()%>&spxtypeid=<%=str.get(f).getSpXTypeId() %>">
	                        	<img alt="" class="center-block" src="image/<%=str.get(f).getSpTp()%>">
	                        </a>
	                       	<div class="summary mt5">
	                       		<a href="detail.jsp?spid=<%=str.get(f).getSpId()%>&spxtypeid=<%=str.get(f).getSpXTypeId() %>">
	                        		<%=str.get(f).getSpName()%>
	                        	</a>
	                       	</div>
	                        <div class="price"><b>¥<%=str.get(f).getSpxMoney()%></b></div>
	                   </li>
	                 <%} %>
	                            </ul>
	                 		 </div>
	                 	<%}%>
	                </div>
	            </div>
	            <div class="col-lg-2">
	                <div class="floor-title floor-bb-2 tr f12"><a href="">更多&gt;&gt;</a></div>
	                <div class="floor-ad">
	                	
	                    <img src="image/index/zz4.png" width="195px" height="450px"/>
	                </div>
	            </div>
	        </div>
	        
	        
	        
		<!--2 男生内搭 -->
        <div class="row mt10 lazy">
            <div class="col-lg-2">
                <div class="floor-title floor-bb-3 floor-text"><i class="icon-main icon-floor-3 pull-left mt10"></i>男生内搭 </div>
                <div class="floor-brand">
                 <ul class="brand-list">
                        <li><a href="">
                            <img src="assets/img/advertise/brand-1.jpg"></a></li>
                        <li><a href="">
                            <img src="assets/img/advertise/brand-1.jpg"></a></li>
                        <li><a href="">
                            <img src="assets/img/advertise/brand-1.jpg"></a></li>
                        <li><a href="">
                            <img src="assets/img/advertise/brand-1.jpg"></a></li>
                        <li><a href="">
                            <img src="assets/img/advertise/brand-1.jpg"></a></li>
                        <li><a href="">
                            <img src="assets/img/advertise/brand-1.jpg"></a></li>
                        <li><a href="">
                            <img src="assets/img/advertise/brand-1.jpg"></a></li>
                        <li><a href="">
                            <img src="assets/img/advertise/brand-1.jpg"></a></li>
                    </ul>
                
                    <a href="">
                        <img class="position" src="image/index/w6.png " width="180px"></a>
                </div>
            </div>
            <div class="col-lg-8">
                <ul class="nav floor-tabs tabs-border-2 tab-bg-2" id="floor-sec-tab">
                 	 <% 
                		lt1= sp.findallxtype(2);
                		for(int k=0;k<lt1.size()-lt1.size()+1;k++){ %>	
                			 <li class="active"><a href="#fol-sec-<%=k+1%>" data-toggle="tab"><%=lt1.get(k).getSpxTypeName() %></a></li>
                	<%
                		}
                	%>
                	<%
                		for(int k=1;k<lt1.size();k++){	%>
                			 <li><a href="#fol-sec-<%=k+1%>" data-toggle="tab"><%=lt1.get(k).getSpxTypeName() %></a></li>
                	<%
                		}
                	%>
                </ul>
                <div class="tab-content">
                   <%	for(int p=0;p<lt1.size()-lt1.size()+1;p++){	 %>
                    	<div class="tab-pane active" id="fol-sec-1">  
                    		<ul class="listbar-3">                 	
                    		<%					
                        		str=sp2.findsyxs(lt1.get(p).getSpTypeId(),lt1.get(p).getSpxTypeId());
                        		if(str.size()>0){
                        			for(int f=0;f<str.size();f++){
                        	 %>	
	                        	<li>
	                        		<a href="detail.jsp?spid=<%=str.get(f).getSpId()%>&spxtypeid=<%=str.get(f).getSpXTypeId() %>">
	                                	<img alt="" class="center-block" src="image/<%=str.get(f).getSpTp()%>">
	                                </a>
	                                <div class="summary mt5">
	                                	<a href="detail.jsp?spid=<%=str.get(f).getSpId()%>&spxtypeid=<%=str.get(f).getSpXTypeId() %> %>">
	                                		<%=str.get(f).getSpName()%>						
	                                	</a>
	                                </div>
	                                <div class="price"><b>¥<%=str.get(f).getSpxMoney()%></b></div>
	                            </li>
                           
                        	<%
                        			}
                        	 	} 
                        	%>
                        	 </ul>
                    	</div>
                     <% 
                     	}
                     %>
                 	<%	for(int p=1;p<lt1.size();p++){	 
                 		str=sp2.findsyxs(lt1.get(p).getSpTypeId(),lt1.get(p).getSpxTypeId());	%>
                 		
                 		 <div class="tab-pane" id="fol-sec-<%=p+1%>">
                 		 	<ul class="listbar-3">
                 		 	<%for(int f=0;f<str.size();f++){	 %>
                 		 		<li>
                 		 			<a href="detail.jsp?spid=<%=str.get(f).getSpId()%>&spxtypeid=<%=str.get(f).getSpXTypeId() %>">
                                		<img alt="" class="center-block" src="image/<%=str.get(f).getSpTp()%>">
                                	</a>
                                <div class="summary mt5">
                                	<a href="detail.jsp?spid=<%=str.get(f).getSpId()%>&spxtypeid=<%=str.get(f).getSpXTypeId() %>">
                                		<%=str.get(f).getSpName()%>
                                	</a>
                                </div>
                                <div class="price"><b>¥<%=str.get(f).getSpxMoney()%></b></div>
                            	</li>
                             <%} %>
                            </ul>
                 		 </div>
                 	<%
                 		}
                 	%>
                </div>
            </div>
            <div class="col-lg-2">
                <div class="floor-title floor-bb-3 tr f12"><a href="">更多&gt;&gt;</a></div>
                <div class="floor-ad">
                
                    <img src="image/index/zz3.png" width="200px"  height="450px"/>
                </div>
            </div>
        </div>
        
        
        
		<!--3 男士裤装 -->
        <div class="row mt10 lazy">
            <div class="col-lg-2">
                <div class="floor-title floor-bb-4 floor-text"><i class="icon-main icon-floor-4 pull-left mt10"></i>男士裤装</div>
                <div class="floor-brand">
                      <ul class="brand-list">
                        <li><a href="">
                            <img src="assets/img/advertise/brand-1.jpg"></a></li>
                        <li><a href="">
                            <img src="assets/img/advertise/brand-1.jpg"></a></li>
                        <li><a href="">
                            <img src="assets/img/advertise/brand-1.jpg"></a></li>
                        <li><a href="">
                            <img src="assets/img/advertise/brand-1.jpg"></a></li>
                        <li><a href="">
                            <img src="assets/img/advertise/brand-1.jpg"></a></li>
                        <li><a href="">
                            <img src="assets/img/advertise/brand-1.jpg"></a></li>
                        <li><a href="">
                            <img src="assets/img/advertise/brand-1.jpg"></a></li>
                        <li><a href="">
                            <img src="assets/img/advertise/brand-1.jpg"></a></li>
                    </ul>
                
                    <a href="">
                        <img class="position" src="image/index/w7.png " width="180px"></a>
                </div>
            </div>
            <div class="col-lg-8">
                <ul class="nav floor-tabs tabs-border-3 tab-bg-3" id="floor-thi-tab">
                	<% 
                		lt1= sp.findallxtype(3);
                		for(int k=0;k<lt1.size()-lt1.size()+1;k++){ %>	
                			 <li class="active"><a href="#fol-thi-<%=k+1%>" data-toggle="tab"><%=lt1.get(k).getSpxTypeName()%></a></li>
                	<%}%>
                	<%
                		for(int k=1;k<lt1.size();k++){	%>
                			 <li><a href="#fol-thi-<%=k+1%>" data-toggle="tab"><%=lt1.get(k).getSpxTypeName() %></a></li>
                	<%
                		}
                	%>
                </ul>
                <div class="tab-content">
                    <%	for(int p=0;p<lt1.size()-lt1.size()+1;p++){	 %>
                    	<div class="tab-pane active" id="fol-thi-1">  
                    		<ul class="listbar-3">                 	
                    		<%					
                        		str=sp2.findsyxs(lt1.get(p).getSpTypeId(),lt1.get(p).getSpxTypeId());
                        	
                        		if(str.size()>0){
                        			for(int f=0;f<str.size();f++){
                        	 %>	
	                        	<li>
	                        		<a href="detail.jsp?spid=<%=str.get(f).getSpId()%>&spxtypeid=<%=str.get(f).getSpXTypeId() %>">
	                                	<img alt="" class="center-block" src="image/<%=str.get(f).getSpTp()%>">
	                                </a>
	                                <div class="summary mt5">
		                                <a href="detail.jsp?spid=<%=str.get(f).getSpId()%>&spxtypeid=<%=str.get(f).getSpXTypeId() %>">
		                                	<%=str.get(f).getSpName()%>
		                                </a>
	                                </div>
	                                <div class="price"><b>¥<%=str.get(f).getSpxMoney()%></b></div>
	                            </li>
                        	<%	}
                        	 } %>
                        	 </ul>
                    	</div>
                     <% }%>
                 	<%	for(int p=1;p<lt1.size();p++){	 
                 		str=sp2.findsyxs(lt1.get(p).getSpTypeId(),lt1.get(p).getSpxTypeId());	%>
                 		
                 		 <div class="tab-pane" id="fol-thi-<%=p+1%>">
                 		 	<ul class="listbar-3">
                 		 	<%for(int f=0;f<str.size();f++){	 %>
                 		 		<li>
                 		 			<a href="detail.jsp?spid=<%=str.get(f).getSpId()%>&spxtypeid=<%=str.get(f).getSpXTypeId() %>">
                                		<img alt="" class="center-block" src="image/<%=str.get(f).getSpTp()%>">
                                	</a>
                                <div class="summary mt5">
                                	<a href="detail.jsp?spid=<%=str.get(f).getSpId()%>spxtypeid=<%=str.get(f).getSpXTypeId() %>">
                                		<%=str.get(f).getSpName()%>
                                	</a>
                                </div>
                                <div class="price"><b>¥<%=str.get(f).getSpxMoney()%></b></div>
                            	</li>
                             <%} %>
                            </ul>
                 		 </div>
                 	<%}%>
                </div>
           </div>
            <div class="col-lg-2">
                <div class="floor-title floor-bb-4 tr f12"><a href="">更多&gt;&gt;</a></div>
                <div class="floor-ad">
           
                    <img src="image/index/zz2.png" width="195px" height="450px"/>

                </div>
            </div>
        </div>
        
        
        
		<!--4 特色男装 -->
		<div class="row mt10 lazy">
            <div class="col-lg-2">
                <div class="floor-title floor-bb-5 floor-text"><i class="icon-main icon-floor-5 pull-left mt10"></i>特色男装</div>
                <div class="floor-brand">
                    <ul class="brand-list"> </ul>
                      <ul class="brand-list">
                        <li><a href="">
                            <img src="assets/img/advertise/brand-1.jpg"></a></li>
                        <li><a href="">
                            <img src="assets/img/advertise/brand-1.jpg"></a></li>
                        <li><a href="">
                            <img src="assets/img/advertise/brand-1.jpg"></a></li>
                        <li><a href="">
                            <img src="assets/img/advertise/brand-1.jpg"></a></li>
                        <li><a href="">
                            <img src="assets/img/advertise/brand-1.jpg"></a></li>
                        <li><a href="">
                            <img src="assets/img/advertise/brand-1.jpg"></a></li>
                        <li><a href="">
                            <img src="assets/img/advertise/brand-1.jpg"></a></li>
                        <li><a href="">
                            <img src="assets/img/advertise/brand-1.jpg"></a></li>
                    </ul>
                
                    <a href="">
                        <img class="position" src="image/index/w8.png " width="180px"></a>
                </div>
            </div>
            <div class="col-lg-8">
                <ul class="nav floor-tabs tabs-border-4 tab-bg-4" id="floor-fou-tab">
                    <% 
                		lt1= sp.findallxtype(4);
                		for(int k=0;k<lt1.size()-lt1.size()+1;k++){ %>	
                			 <li class="active"><a href="#fol-fou-<%=k+1%>" data-toggle="tab"><%=lt1.get(k).getSpxTypeName() %></a></li>
                	<%}%>
                	<%
                		for(int k=1;k<lt1.size();k++){	%>
                			 <li><a href="#fol-fou-<%=k+1%>" data-toggle="tab"><%=lt1.get(k).getSpxTypeName() %></a></li>
                	<%}%>
                </ul>
                <div class="tab-content">  
                	<%	for(int p=0;p<lt1.size()-lt1.size()+1;p++){	 %>
                    	<div class="tab-pane active" id="fol-fou-1">  
                    		<ul class="listbar-3">                 	
                    		<%					
                        		str=sp2.findsyxs(lt1.get(p).getSpTypeId(),lt1.get(p).getSpxTypeId());
                       
                        		if(str.size()>0){
                        			for(int f=0;f<str.size();f++){
                        	 %>	
	                        	<li>
	                        		<a href="detail.jsp?spid=<%=str.get(f).getSpId()%>&spxtypeid=<%=str.get(f).getSpXTypeId() %>">
	                                	<img alt="" class="center-block" src="image/<%=str.get(f).getSpTp()%>">
	                                </a>
	                                <div class="summary mt5">
	                                	<a href="detail.jsp?spid=<%=str.get(f).getSpId()%>&spxtypeid=<%=str.get(f).getSpXTypeId() %>">
	                                		<%=str.get(f).getSpName()%>
	                                	</a>
	                                </div>
	                                <div class="price"><b>¥<%=str.get(f).getSpxMoney()%></b></div>
	                            </li>
                           
                        	<%	}
                        	 } %>
                        	 </ul>
                    	</div>
                     <% }%>
                 	<%	for(int p=1;p<lt1.size();p++){	 
                 		str=sp2.findsyxs(lt1.get(p).getSpTypeId(),lt1.get(p).getSpxTypeId());	%>
                 		
                 		 <div class="tab-pane" id="fol-fou-<%=p+1%>">
                 		 	<ul class="listbar-3">
                 		 	<%for(int f=0;f<str.size();f++){	 %>
                 		 		<li>
                 		 			<a href="detail.jsp?spid=<%=str.get(f).getSpId()%>&spxtypeid=<%=str.get(f).getSpXTypeId() %>">
                                		<img alt="" class="center-block" src="image/<%=str.get(f).getSpTp()%>">
                                	</a>
                                	<div class="summary mt5">
	                                	<a href="detail.jsp?spid=<%=str.get(f).getSpId()%>&spxtypeid=<%=str.get(f).getSpXTypeId() %>">
	                                		<%=str.get(f).getSpName()%>
	                                	</a>
                                	</div>
                                	<div class="price"><b>¥<%=str.get(f).getSpxMoney()%></b></div>
                            	</li>
                             <%} %>
                            </ul>
                 		 </div>
                 	<%}%>
                </div>
            </div>
            <div class="col-lg-2">
                <div class="floor-title floor-bb-5 tr f12"><a href="">更多&gt;&gt;</a></div>
                <div class="floor-ad">
                    
                    <img src="image/index/zz1.png" width="195px" height="450px"/>

                </div>
            </div>
        </div>
<%@ include file="foot.jsp"%>