package com.dao;

import java.util.List;

import com.entity.CT;

/**
 * ���۱�ӿ�
 * @author  ��С��
 *
 */
public interface ICT {
	/**
	 * ��������
	 * @param ct
	 */
	int save(CT ct);
	/**
	 * ɾ������
	 * @param CTID
	 */
	int delete(String CTID);
	/**
	 * ��������ѯ��������(ͨ��CTID)
	 * @param CTID
	 * @return
	 */
	CT findCTID(String CTID);
	/**
	 * ��ѯȫ����������
	 * @return
	 */
	List<CT>findAll();
	/**
	 * ����һ�����ۣ�������Ӱ��������ͬʱ��ID�û���3����ֵ,
	 * @return
	 */
	public int CaCT(CT c);
	/**
	 * ��ѯx��ָ������ID���������ۣ������������㣩
	 * @param x ָ������
	 * @param PID ָ��ID
	 * @return
	 */
	public List<CT>RCTByPIDandCnum(int x,String PID);
	/**
	 * ��ѯx��ָ������ID��-���ۣ���ʱ�併�򣬼����������ۿ�ʼ������ģ�
	 * @param x ָ������
	 * @param PID ָ��ID
	 * @return
	 */
	public List<CT>RCTByPIDandCDate(int x,String PID);	
	
	
	/**
	 * Ϊָ�����۵���
	 * @param CTID
	 * @return
	 */
	public int UaCTZan(String CTID);
	
}
