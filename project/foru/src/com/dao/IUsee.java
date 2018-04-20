package com.dao;

import java.util.List;

import com.entity.Usee;

/**
 * �û���
 * @author  ��С��
 *
 */
public interface IUsee {
	
	
	
	/**
	 * --��ѯȫ���û�
	 * @return
	 */
	List<Usee>FindAll();
	/**
	 * ���ָ���û����������Ƿ��ܹ���¼�ɹ�,�ɹ�����1�����ɹ�����-1
	 * @param name�û���
	 * @param pwd����
	 * @return��¼���
	 */
	public int RLogin(String name,String pwd);
	
	/**
	 * ���ָ���û����������Ƿ��ܹ��Թ���Ա��ݵ�¼�ɹ�,�ɹ�����1�����ɹ�����-1
	 * @param name�û���
	 * @param pwd����
	 * @return��¼���
	 */
	public int RLoginByAdmin(String name,String pwd);
	
	
	/**
	 * ����ָ��ID�û�����ϸ��Ϣ
	 */
	public Usee RaUseeByUID(String UID);	
	/**
	 * ע��һλ�û�,�ɹ�����ID  ���� ���򷵻�-1
	 */
	public int CaUsee(Usee us);	
	/**
	 * �޸�һλ�û�����,������Ӱ������
	 */
	public int UaUsee(Usee us);
	/**
	 * ��ѯָ�������û������յȼ����򣨼��û��ľ���ֵ�������У�
	 */
	public List<Usee>RUsee(int x);	
	
	
	/**
	 * Ϊָ��ID�û�����ָ������,������Ӱ������
	 * @param ID
	 * @return
	 */
	public int UxUexp(String ID,int uexp);
	
	
	/**
	 * �����û��ǳƲ�ѯID
	 * @param UName
	 * @return
	 */
	public String RuidByUName(String UName);
	
}
