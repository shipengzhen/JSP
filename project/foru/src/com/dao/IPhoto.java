package com.dao;

/**
 * ͼƬ�������
 * @author HP
 *
 */
public interface IPhoto {
	/**
	 * �������ֵ������
	 * @return
	 */
	public int Max();
	
	
	
	/**
	 * ����һ������,��ƬID���û�ID
	 * @param PID
	 * @param UID
	 * @return
	 */
	public int Create(int PID,String UID);
	
	
	
}
