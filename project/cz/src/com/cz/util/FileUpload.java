package com.cz.util;

import java.io.File;
import java.io.UnsupportedEncodingException;
import java.util.List;

import javax.servlet.http.*;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileItemFactory;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

import com.cz.dao.IUsersDao;
import com.cz.dao.impl.UsersDaoImpl;

public class FileUpload extends HttpServlet{

	
	/**
	 * �޸��û�ͷ��
	 * @param request
	 * @param name
	 * @param wjj
	 * @param uId
	 * @return
	 */
	public static boolean upload(HttpServletRequest request,String name,String wjj,int uId){
		try {
			request.setCharacterEncoding("utf-8");
			String uploadFile=request.getSession().getServletContext().getRealPath(wjj);
			//�ж�������Ϣ�е������Ƿ���multipart���ͣ����������д���
			boolean isMultipart=ServletFileUpload.isMultipartContent(request);
			if(isMultipart){
				//����������Ҫ������еı�Ԫ�أ����������еı�Ԫ�ض���һ��FileItems
				//�Ķ��󣬻�����б�Ԫ�صķ�����ServletFileUpload�ķǾ�̬������
				//������ҪServletFileUpload�Ķ��󣬵��Ǵ����ö�����ҪFileItemFactory����
				//���󣬵����������������һ���ӿڣ�����ʵ������DiskFileItemFactory
				FileItemFactory factory=new DiskFileItemFactory();
				ServletFileUpload upload=new ServletFileUpload(factory);
				//����ServletFileUpload����Ϳ��Ե��ñ���ÿһ����Ԫ�ؼ�FileItem�ӿ�
				//����list����
				List<FileItem> items = upload.parseRequest(request);
				for (FileItem item : items) {
					//����Ԫ���ַ�Ϊ�ı����ļ�������֮ǰ��Ҫ���ж�������������
					//�����Ҫ����FileItem��isFormFieId����. ���ı�����true�����򷵻�false
					if(item.isFormField()){//���ı�
						//��ñ�Ԫ�ص�name����ֵ
						String fileName=item.getFieldName();
					}else{//���ļ�
						//����ϴ����ļ���
						String fileName=item.getName();//F:\katong.jpg
						String Name=item.getFieldName();
						if(fileName!=null&&!fileName.equals("")&&Name.equals(name)){
							File fullFile=new File(fileName);
							//�������ľ���·��+katong.jpg
							String fName=fullFile.getName();
							IUsersDao usersDao=new UsersDaoImpl();
							usersDao.updateUTx(uId,fName);
							File saveFile=new File(uploadFile,fName);
							item.write(saveFile);
							return true;
						}
					}
				}
			}	
		} catch (UnsupportedEncodingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (FileUploadException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}	
		return false;
	}
}
