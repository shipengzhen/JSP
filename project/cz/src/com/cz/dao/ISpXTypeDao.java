package com.cz.dao;

import java.util.List;

import com.cz.entity.SpXType;

/**
 * ��ƷС����
 * @author lizhen
 *
 */
public interface ISpXTypeDao {
	/**
	 * ����Ƽ�
	 * ��ѯȫ�� С����
	 * @return
	 */
	List<SpXType> findallxtype(int SptypeId);
}
