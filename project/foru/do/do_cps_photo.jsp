<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>
<%@page import="java.util.*,java.io.*"%>
<%
	//-----用户选择上传图片的处理页面-------------------
	//-----用户选择上传图片的处理页面-------------------
	//-----用户选择上传图片的处理页面-------------------
	
	//2、字符集格式
	request.setCharacterEncoding("UTF-8");
	String uid=(String)session.getAttribute("uid");//读取用户ID
	//验证ID是否存在
	if(uid==null){
		uid="10001";
	}
	
	//3、检查请求信息中的内容类型是不是Multipart
	boolean tf=ServletFileUpload.isMultipartContent(request);
	
	//4、上传文件的存储路径（服务器文件系统的绝对路劲），根据用户UID
	String lu=request.getSession().getServletContext().getRealPath("photo/"+uid+"/");
	//out.print(lu);
	
	if(tf){
		
		//5、创建FileItemFactory工厂对象对象
		FileItemFactory factory=new DiskFileItemFactory();
		//6、通过工厂对象实例化一个ServletFileUpload
		ServletFileUpload upload=new ServletFileUpload(factory);
		
		try{
			//7、调方法，获得表单中的所有input对象
			List<FileItem>fts=upload.parseRequest(request);
			//--out.print("集合长度"+fts.size());
			//8、遍历
			for (FileItem ft:fts) {
				//普通子弹
			    if(ft.isFormField()){
			    	//--out.println("<br/>名字："+ft.getFieldName());
			    	//--out.println("<br/>值:"+ft.getString("UTF-8"));
			    }else{
			    	//文件字段
			    	long dx=ft.getSize();//文件大小
			    	if(dx>3000*1000){
			    		out.print("-2");//返回-2，文件超上限
			    		return;
			    	}
			    	
			    	//photo接口
			    	IPhoto ip=FC.getIPhoto();
			    	int pid=ip.Max()+1;//服务器图片ID所到达的高度+1
			    	int set=ip.Create(pid, uid);//写入此条记录
			    	
			    	String fn=ft.getName();//此文件的文件名+扩展名
			    	String ext=fn.substring(fn.lastIndexOf(".")+1);//取扩展名
			    	
			    	//服务器瘤，参数2为服务器上的最终文件名
			    	File sf=new File(lu,pid+"."+ext);
			    	
			    	//开始写入服务器,将ft指向的标签写入sf瘤指向的地址
			    	ft.write(sf);
			    	
			    	//回复客户端回调函数的路径
			    	out.print("../photo/"+uid+"/"+pid+"."+ext);
			    	
			    	
			    }
			    
			}
			
			
		}catch(Exception ee){
			String ss=ee.getMessage();
			out.print("-1");//服务器内部错误
		}
		
		
	}
	
	
	
%>