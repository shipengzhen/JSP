package com.dao;

import java.util.List;

import com.entity.Type;
/**
 * ��������ӿ�
 * @author  ��С��
 *
 */
public interface IType {
	/**
	 * ������������
	 * @param type
	 */
	void save(Type type);
	/**
	 * ɾ����������
	 * @param TID
	 */
	void delete(String TID);
	/**
	 * ��������ѯ���ӵķ���(ͨ��TID��ѯ)
	 * @param TID
	 * @return
	 */
	Type findTypeTID(String TID);
	/**
	 * ��ѯȫ����������
	 * @return
	 */
	List<Type>findAll();
}
