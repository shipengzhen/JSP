package com.cz.dao;

import java.util.List;

import com.cz.entity.Sp;
import com.cz.util.Page;

public interface IScDao {

	/**
	 * �ղ�
	 * @param spid
	 * @param userid
	 * @return
	 */
	int scSp(int spid,int uid);
	
	
	/**
	 * ��ѯ�ղ���Ʒ
	 * @param userId
	 * @return
	 */
	List<Sp> scList(int uId,Page p);
	
	/**
	 * �ղ���Ʒ������
	 * @param uId
	 * @return
	 */
	int scCount(int uId);
	
	/**
	 * ɾ���ղ�
	 * @param scId
	 * @return
	 */
	int scDelete(int scId);
	/**
	 * �ж��Ƿ��ղ�
	 */
	boolean scpd(int spid,int uid);
}











