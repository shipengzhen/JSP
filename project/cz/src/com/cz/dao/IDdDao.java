package com.cz.dao;

import java.util.List;

import com.cz.entity.Dd;
import com.cz.entity.Gwc;
import com.cz.entity.Sp;
import com.cz.util.Page;

public interface IDdDao {
	/**
	 * �޸�����
	 */
	boolean updatespnum(int spnum,int ddid);


	
	/**
	 * ���빺�ﳵ  ������ �û�id  ��������Ʒid
	 */
	boolean insertSp(int uid, int spid,int spnum,String type); 

	
	
	/**
	 * ��ѯ �ҵĹ��ﳵ  ������     �û�id  
	 * �������  -- ��Ʒ�� �Ͷ�����
	 */
	List<Gwc> findGwc(int uid,String type,Page p);
	
	/**
	 * ��¼����
	 */
	int findnum(int uid,String type);
	
	
	/**
	 * ɾ��		����id
	 */
	boolean deletesp(int ddid);
	
	/**
	 * ��ѯ�û�������
	 */
	int findDdCount(int uId);
	
	/**
	 * ��ѯ�û�������Ӧ��������
	 */
	int findDdCount(int uId,String ddType);
	
	/**
	 * �������� 	�û�id
	 */
	int findDdnum(int uid);
	/**
	 *  �û������۸�
	 */
	int findumoney(int uid);
	
	/**
	 * ��ѯ���¶���
	 */
	List<Sp> dingList();

	
	/**
	 * ɾ������
	 */
	boolean deleteDd(int spid);
	
	/**
	 * �ж� �û���û�������Ʒ
	 */
	int findspbyuid(int uid, int spid);
	/**
	 * ֧��ҳ�� -- �������ﳵ
	 */
	List<Gwc> findDdzf(int uid);
	/**
	 * �ܻ���
	 */
	int findzjf(int uid);
	/**
	 * ֧�����  --�� �Ѵ����� �ĳ� ���ջ�
	 */
	boolean updateDdds(int uid);

	
	/**
	 * ��ѯ�����е���Ʒ
	 */
	List<Dd> findTypeDds(int uId,String ddType,Page pg);
	
	List<Dd> findAllDd(int uId,Page pg);
	
	
	/**
	 * ��ѯ���� ����id���� ��
	 */
	List<Gwc> findDdmunid(int uid);
	/**
	 * �Ѵ����� �ĳ� �����
	 */
	boolean updatetype(int ddid);
}

















