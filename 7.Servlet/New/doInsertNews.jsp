<%@page import="java.io.File"%>
<%@page import="java.util.Iterator"%>
<%@page import="org.apache.commons.fileupload.FileItem"%>
<%@page import="java.util.List"%>
<%@page import="org.apache.commons.fileupload.disk.DiskFileItemFactory"%>
<%@page import="org.apache.commons.fileupload.FileItemFactory"%>
<%@page import="org.apache.commons.fileupload.servlet.ServletFileUpload"%>
<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	String uploadFile=request.getSession().getServletContext().getRealPath("upload");
	//判断请求信息中的内容是否是multipart类型，如果是则进行处理
	boolean isMultipart=ServletFileUpload.isMultipartContent(request);
	if(isMultipart){
		//下面我们需要获得所有的表单元素，在这里所有的表单元素都是一个FileItems
		//的对象，获得所有表单元素的方法是ServletFileUpload的非静态方法，
		//所以需要ServletFileUpload的对象，但是创建该对象需要FileItemFactory工厂
		//对象，但是这个工厂对象是一个接口，它的实现类是DiskFileItemFactory
		FileItemFactory factory=new DiskFileItemFactory();
		ServletFileUpload upload=new ServletFileUpload(factory);
		//有了ServletFileUpload对象就可以调用遍历每一个表单元素即FileItem接口
		//返回list集合
		List<FileItem> items=upload.parseRequest(request);
		for(FileItem item:items ){
			if(item.isFormField()){//是文本
				//获得表单元素的name属性值
				String fileName=item.getFieldName();
				if(fileName.equals("zz")){
					out.println(item.getString("UTF-8")+"上传了文件");
				}
			}else{//是文件
				//获得上传的文件名
				String fileName=item.getName();//F:\katong.jpg
				if(fileName!=null&&!fileName.equals("")){
					File fullFile=new File(fileName);
					//服务器的绝对路径+katong.jpg
					File saveFile=new File(uploadFile,fullFile.getName());
					try{
						item.write(saveFile);
						out.println(fullFile.getName()+"上传完成");
					}catch(Exception e){
						e.printStackTrace();
					}
				}
			}
		}
	}		
%>