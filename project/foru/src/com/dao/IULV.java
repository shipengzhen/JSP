package com.dao;

import java.util.List;

import com.entity.ULV;
/**
 * �û��ȼ���
 * @author  ��С��
 *
 */
public interface IULV {
	/**
	 * �����û��ĵȼ�
	 * @param ulv
	 */
	void save(ULV ulv);
	/**
	 * ��ѯ�û��ȼ�(ͨ��)
	 * @param lv
	 * @return
	 */
	ULV findULV(int lv);
	/**
	 * ��ѯȫ��
	 * @return
	 */
	List<ULV>findAll();
	
	public ULV RLV(int uexp);
	
}
