package com.cz.dao;

import java.util.ArrayList;
import java.util.List;

import com.cz.entity.Pl;
import com.cz.entity.Sp;
import com.cz.util.Page;

/**
 * ���۽ӿ�
 * @author ʩ����
 *
 */
public interface IPlDao {
	/**
	 * ͨ����ƷId��ѯ��������
	 * @param spId
	 * @return
	 */
	int findPlCount(int spId);
	
	/**
	 * ��Ʒ��������
	 * @param spid
	 * @return
	 */
	 int findCountPl(int spid);
	/**
	 * ��Ʒȫ������
	 * @param spid
	 * @return
	 */
	 List<Pl> findPl(int spid,Page pg);

	/**
	 * ��ѯ������Ʒ����
	 * @param spid
	 * @param plType
	 * @return
	 */
	 int findCountPlGetplType(int spid,String plType);

	/**
	 * ��ѯ��Ʒ������Ʒ��
	 * @param spid
	 * @param plType
	 * @return
	 */
	 List<Pl> findPlGetplType(int spid,String plType,Page pg);
	
	 /**
	  * ��ѯ�û���������
	  * @param uId
	  * @return
	  */
	 int findPlCountGetuId(int uId);
	 
	 /**
	  * ��ѯ�û������͵�������
	  * @param uId
	  * @param Type
	  * @return
	  */
	 int findPlCountGetuIdType(int uId,String plType);
	 
	 /**
	  * ��ѯ�û�ȫ��������
	  * @param uId
	  * @return
	  */
	 List<Pl> findAllPlGetuId(int uId,Page pg);
	 
	 /**
	  * ��ѯ�û������͵�����
	  * @param uId
	  * @param plType
	  * @return
	  */
	 List<Pl> findTypePlGetuId(int uId,String plType,Page pg);
	 /**
	  * �������
	  */
	 boolean insertpl(Pl p);
	 
	 
	 
	 
	 
	 
	 
	 
	 
	 
	 
	 
	 
	 
	 
	 
	 
	 
	 
	 
	 
	 
	 
	 
}
