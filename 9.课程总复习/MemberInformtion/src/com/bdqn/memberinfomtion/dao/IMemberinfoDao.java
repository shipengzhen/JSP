package com.bdqn.memberinfomtion.dao;

import java.util.List;

import com.bdqn.memberinfomtion.entity.Membersinfo;

/**
 * ��Ա��Ϣ�ӿ�
 * @author ʩ����
 *
 */
public interface IMemberinfoDao {

	/**
	 * ��ѯ���еĻ�Ա��Ϣ
	 * @return
	 */
	List<Membersinfo> findAllMembersinfo();
	
	/**
	 * ͨ����Աid��ѯ��Ա
	 * @param mId
	 * @return
	 */
	Membersinfo getMIdFindMembersinfo(int mId);
	
	/**
	 * �޸Ļ�Ա��Ϣ
	 * @param membersinfo
	 * @return
	 */
	int updateMembersinfo(Membersinfo membersinfo);
}
