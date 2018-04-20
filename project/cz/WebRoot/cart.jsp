<%@page import="com.cz.util.Page"%>
<%@page import="com.cz.entity.Users"%>
<%@page import="com.cz.entity.Gwc"%>
<%@page import="java.util.List"%>
<%@page import="com.cz.dao.impl.DdDaoImpl"%>
<%@page import="com.cz.dao.IDdDao"%>
<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<% session.setAttribute("open",null);%>
<%
	request.setCharacterEncoding("utf-8");
	
	Users u=(Users)session.getAttribute("uu");
	if(u==null){
		response.sendRedirect("login.jsp");
		return;
	}

	IDdDao m=new DdDaoImpl();
	Page p=new Page();
	//多个删除
	String [] splist=request.getParameterValues("sw");
	if(splist!=null){
		for(int i=0;i<splist.length;i++){
			m.deletesp(Integer.parseInt(splist[i]));
		}
	}
	
	//数量加减
	String bc=request.getParameter("u");
	if(bc!=null){
		
		int spnum=Integer.parseInt(request.getParameter("spnum"));
		int ddid=Integer.parseInt(request.getParameter("ddid"));
		if(bc.equals("1")){
			m.updatespnum(spnum+1, ddid);
		}else if(bc.equals("2")){
			if(spnum<=1){
				m.updatespnum(1, ddid);
			}else{
				m.updatespnum(spnum-1, ddid);
			}
		}
	}
	
	
	p.setPageSize(5);
	p.setTatalCount(m.findnum(u.getuId(),"待付款"));	//记录总数
	int k=p.getTotalPageCount();
	
	
	if(request.getParameter("shang")!=null){
	
		if(Integer.parseInt(request.getParameter("shang"))>=k){
			p.setCurrPageNo(k);
		}else{
			p.setCurrPageNo(Integer.parseInt(request.getParameter("shang")));
		}
	} 
	if(request.getParameter("shang")==null){
		p.setCurrPageNo(1);
	
	}
	
	List<Gwc> list= m.findGwc(u.getuId(), "待付款", p);
	
	if(list.size()==0){
		list=null;
	}
	request.setAttribute("p", p);
	request.setAttribute("list1",list);
	//用户用户 数量
	int num=m.findDdnum(u.getuId());
	//总价格
	int money=m.findumoney(u.getuId());
 %>
 
<%@ include file="head.jsp"%>
<script>
	function as(){
			var sz =document.getElementsByName("sw");
			for (var i=0;i<sz.length;i++) {
				sz[i].checked=document.getElementById("box1").checked;
			}
		}
</script>

	<!--购物车-->
	<div class="container">
        <!-- 内容部分开始 -->
                  	
        <c:if test="${!empty list1 }">
        <!-- 购物车开始 -->

        <div class="row">
        <form action="cart.jsp" method="get">
            <div class="col-lg-12">
                <div class="cart-title f16 tit-family pl10 mt10">我的购物车</div>
                <div class="cart-content">
                    <table width="100%">
                        <tbody>
                            <tr>
                                <td width="5%" class="tr-title">
                                    <form>
                                        <div class="checkbox">
                                            <label>
                                                <input onclick="as()" id="box1" type="checkbox" />全选</label>
                                        </div>
                                    </form>
                                </td>
                                <td width="45%" class="tr-title">商品名称</td>
                                <td width="7%" class="tr-title">积分</td>
                                <td width="12%" class="tr-title">金额</td>
                               
                                <td width="12%" class="tr-title">数量</td>
                                <td width="8%" class="tr-title">操作</td>
                            </tr>
			<!--购物车 展示 开始 -->
						
						<c:forEach var="Gwclist" items="${ list1}">	
                            <tr>
                                <td width="5%" class="tr-list">
                                    
                                        <div class="checkbox">
                                            <label>
                                                <input name="sw" id="box2" type="checkbox" value="${ Gwclist.ddid}" /></label>
                                        </div>
                                   
                                </td>
                                <td width="45%" class="tr-list">
                                    <a href="#?spid=${Gwclist.spid }">
                                        <img class="pull-left" alt="" src="image/${Gwclist.spTp }" /></a>
                                    <div class="summary blue-font"><a href="detail.jsp?spid=${Gwclist.spid }&spxtypeid=${Gwclist.spxTypeid}">${Gwclist.spName }</a></div>
                                </td>
                                <td width="7%" class="tr-list"><b>${Gwclist.jf*Gwclist.spNum }</b></td>
                                <td width="12%" class="tr-list"><b class="orange-font">￥ ${Gwclist.spxMoney *Gwclist.spNum } </b></td>
                                <td width="12%" class="tr-list">
                                    <span class="ui-spinner"> 
                                        <input  type="text" value="${Gwclist.spNum }"  readonly="readonly" aria-valuenow="0" autocomplete="off"/>
                                        <a href="cart.jsp?ddid=${Gwclist.ddid }&u=1&spnum=${Gwclist.spNum }" class="ui-spinner-button ui-spinner-up" tabindex="-1"><span   class="ui-icon">▲</span></a>
                                        <a href="cart.jsp?ddid=${Gwclist.ddid }&u=2&spnum=${Gwclist.spNum }" class="ui-spinner-button ui-spinner-down" tabindex="-1"><span   class="ui-icon">▼</span></a>
                                    </span>  
                                </td>
                                <td width="8%" class="tr-list bule-font"><a href="doGWCdelete?ddid=${Gwclist.ddid }&shang=<%=p.getCurrPageNo()%>">删除</a></td>
                            </tr>
                        </c:forEach>	
                        
                         <!-- 结束 -->
                        </tbody>
                    </table>
                    <!-- 分页 -->
                   	
                    <div class="sort-right pull-right">
                    		<br/>
                    		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    		
                            <a href="cart.jsp?shang=${ p.currPageNo-1 }"><button type="button" class="btn btn-default btn-xs"><i class="glyphicon glyphicon-chevron-left"></i>
                           		 上一页
                            </button></a>
                            <b class="red-font">${p.currPageNo }</b>/${p.totalPageCount }
                            
                            <a href="cart.jsp?shang=${ p.currPageNo+1 }"><button type="button" class="btn btn-default btn-xs"><i class="glyphicon glyphicon-chevron-right"></i>
                            	下一页
                            </button></a>
                        	
                        </div>
                   
                   
                   	<!-- 结束 -->
                </div>
                <br/>
            </div>
            <div class="col-lg-12 main-show mb10">
                <div class="p10">
                    <div class="show-left pull-left">
                      
                       <input type="submit" value="删除选中的商品"> 
                    </div>
            </form>
                    <%
                    	//IDdDao ddan=new DdDaoImpl();
                    	//int k=ddan.findDdnum(u.getuId());
                     %>
                    <div class="show-right pull-right tr">
                        <div class=""><b class="orange-font"></b>件商品 总计：<%=num%></div>
                    </div>
                    <div class="clearfix"></div>
                </div>
                <div class="total tr"><b>总计（不含运费）：</b> <i class="orange-font f20 tit-family pr10">￥<%=money %></i></div>
            </div>
            <div class="pull-right">
                <a href="index.jsp"><button type="button" class="btn btn-addcart btn-lg mr20">继续购物</button></a>
                <a href="confirm.jsp"><button type="button" class="btn btn-danger btn-lg mr20">去结算</button></a>
            </div>
        </div>
        </c:if>
        <!-- 购物车结束 -->
        <c:if test="${empty list1 }">
        <!-- 购物车为空开始 -->
        
                             	
        <div class="row">
            <div class="col-lg-12">
                <div class="cart-title f16 tit-family pl10 mt10">我的购物车</div>
                <div class="cart-content p30">
                    <div class="pull-left empty-img"><img alt="" src="assets/img/empty-cart.jpg" /></div>
                    <div class="pull-right empty-text tit-family">
                      		  您的购物车中还没有商品，您现在可以<br />
                        <b class="f14">马上去 <i><a href="index.jsp">挑选商品</a></i>， 或者查查 <i><a href="dingdan.jsp">我的订单</a></i></b>
                    </div>
                    <div class="clearfix"></div>
                </div>
            </div>
      	  </div>
        </c:if>
    </div>

    
        <!-- 购物车为空结束 -->
        <!-- 内容部分结束 -->
<%@ include file="foot.jsp"%>