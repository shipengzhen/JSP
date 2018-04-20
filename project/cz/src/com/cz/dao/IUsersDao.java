package com.cz.dao;

import java.util.List;

import com.cz.entity.Users;

/**
 * �û�
 * @author lizhen
 *
 */
public interface IUsersDao {
	/**
	 * ע��
	 */
	boolean insertUser(String name, String pwd);
	
	/**
	 * ��¼
	 */
	Users findbypwd(String name,String pwd);
	
	/**
	 * ͨ���û�Id��ѯ������Ϣ
	 * @param uId
	 * @return
	 */
	Users findU(int uId);
	
	/**
	 * �޸��û�ͷ��
	 * @param uId
	 * @param uTx
	 * @return
	 */
	int updateUTx(int uId,String uTx);
	/**
	 * �޸��û��û������Ա�
	 * @param uId
	 * @param uName
	 * @param Sex
	 * @return
	 */
	int updateUXx(int uId,String uName,String Sex);
	
	/**
	 * ͨ��ԭ�����޸�����
	 * @param uId
	 * @param ymm
	 * @return
	 */
	int updatemmGetymm(String mm,int uId, String ymm);
	
	/**
	 * ͨ���ֻ����޸�����
	 * @param uId
	 * @param phone
	 * @return
	 */
	int updatemmGetphone(String mm,int uId,String phone);
	
	/**
	 * ͨ�������޸��ֻ���
	 * @param uId
	 * @param phone
	 * @return
	 */
	int updatephoneGetmm(String phone,int uId,String mm);
	/**
	 * �޸��û�����  -- ���ﳵ ---����
	 */
	boolean updateusers(Users u);

	
	
	
	
	
	
	
	
	
	
	
	
}
