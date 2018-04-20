<%@page import="com.cz.entity.Gwc"%>
<%@page import="java.util.List"%>
<%@page import="com.cz.util.Page"%>
<%@page import="com.cz.dao.impl.DdDaoImpl"%>
<%@page import="com.cz.dao.IDdDao"%>
<%@page import="com.cz.entity.Users"%>
<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>
<%@ include file="head.jsp"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
	Users u=(Users)session.getAttribute("uu");
	request.setAttribute("u", u);

	IDdDao m=new DdDaoImpl();
	Page p=new Page();
	List<Gwc> list= m.findDdzf(u.getuId());
	
	request.setAttribute("sp",list);
	
	//用户用户 数量
	int num=m.findDdnum(u.getuId());
	//积分
	int jf=m.findzjf(u.getuId());
	//总价格
	int money=m.findumoney(u.getuId());
	
 %>
	<!--结算-->
    <div class="container">
        <!-- 内容部分开始 -->
        <!-- 购物车开始 -->
        <form action="dozf" method="post">
	        <div class="row">
                <div class="cart-title f16 tit-family pl10 mt10">收货人信息</div>
                <div class="form-group">
				    <label for="name" Style="font-size:14px" class="col-sm-2 control-label">&nbsp;&nbsp;&nbsp;姓名</label>
				    <div class="col-sm-10">
				    	<input name="name" type="text" class="form-control" id="name" placeholder="${u.name }">
				    </div>
			  	</div>
				<div class="form-group">
				    <label for="mobile" Style="font-size:14px" class="col-sm-2 control-label">&nbsp;&nbsp;&nbsp;联系电话</label>
				    <div class="col-sm-10">
				    	<input name="phone" type="text" class="form-control" id="mobile" placeholder="${u.phone}">
				    </div>
				</div>
				<div class="form-group">
				    <label for="address" Style="font-size:14px" class="col-sm-2 control-label">&nbsp;&nbsp;&nbsp;地址</label>
				    <div class="col-sm-10">
				    	<input name="address" type="text" class="form-control" id="address" placeholder="${u.address}">
				    </div>
				</div>
	        </div>
            <div class="row">
                <div class="col-lg-12">
                    <div class="cart-title f16 tit-family pl10 mt10">商品清单</div>
                    <div class="cart-content">
                        <table width="100%" border="0">
                            <tbody>
                                <tr>
                                    <td width="45%" class="tr-title">商品名称</td>
                                    <td width="7%" class="tr-title">积分</td>
                                    <td width="13%" class="tr-title">金额</td>
                                    <td width="10%" class="tr-title">数量</td>
                                </tr>
                                <c:forEach var="f" items="${sp}" >
	                                <tr>
	                                    <td width="45%" class="tr-list">
	                                        <a href="">
	              
	                                            <img class="pull-left" alt="" src="image/${f.spTp }"></a>
	                                        <div class="summary blue-font"><a href="detail.jsp?spid=${f.spid }&spxtypeid=${f.spxTypeid}">${f.spName }</a></div>
	                                    </td>
	                                    <td width="7%" class="tr-list"><b>${f.jf*f.spNum}</b></td>
	                                    <td width="12%" class="tr-list"><b class="orange-font">￥${f.spxMoney*f.spNum}</b></td>
	                                    <td width="12%" class="tr-list">${f.spNum}</td>
	                                </tr>
	                                <tr>
                                </c:forEach>
                            </tbody>
                        </table>
                    </div>
                </div>
                <div class="col-lg-12 main-show mb10">
                    <div class="p10">
						<div class="show-right pull-right tr">
                            <div class="">共: <%=num%>件商品，获得: <%=jf %>  积分</div>
                            
                            <input name="jf" type="text" style="display: none;" value="<%=jf %>" /> 
                            <input name="money" type="text" style="display: none;" value="<%=money %>" /> 
                            
                        </div>
                        <div class="clearfix"></div>
                    </div>
                    <div class="total tr"><b>总计（含运费）：</b> <i class="orange-font f20 tit-family pr10">￥<%=money %></i></div>
                </div>
                <div class="pull-right">
                   <button type="submit" class="btn btn-danger btn-lg mr20">立即支付</button>
                </div>
            </div>
        </form>
        <!-- 购物车为空结束 -->
        <!-- 内容部分结束 -->
<%@ include file="foot.jsp"%>