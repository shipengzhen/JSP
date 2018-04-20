<%@page import="com.bdqn.spz.news.entity.Topic"%>
<%@page import="com.bdqn.spz.news.service.impl.TopicServiceImpl"%>
<%@page import="com.bdqn.spz.news.service.ITopicService"%>
<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>新增新闻</title>
        <style type="text/css">
        	#div{
        		background: #0C7EB2;
        		border: 1px #000000 solid;
        		margin:20px auto ;
        		width: 500px;
        	}
        	#div div{
        		margin: 20px 0px;
        	}
        </style>
    </head>
    <body>
    	<form action="doInsertNews.jsp" enctype="multipart/form-data" method="post" name="form1">
    		<div id="div">
    			<div><h1>添加新闻</h1></div>
    			<div>
    				<label>主题</label>
    				<select name="zt">
<%
						ITopicService topicService=new TopicServiceImpl();
						for(Topic topic:topicService.findTopicAll()){
%>
							<option><%=topic.gettName()%></option>
<% 
						}
%>
    				</select>
    			</div>
    			<div>
    				<label>标题</label>
    				<input type="text" name="bt" value="" />
    			</div>
    			<div>
    				<label>作者</label>
    				<input type="text" name="zz" value="" />
    			</div>
    			<div>
    				<label>摘要</label>
    				
    				<textarea name="zy"></textarea>
    			</div>
    			<div>
    				<label>内容</label>
    				<textarea name="nr"></textarea>
    			</div>
    			<div>
    				<label>上传图片</label>
    				<input type="file" name="file" value="" />
    			</div>
    			<div>
    				<input type="submit" value="提交" name="tj"/>
    				<input type="reset" value="重置" name="cz"/>
    			</div>
    		</div>
    	</form>
 	</body>
</html>