package com.bdqn.memberinfomtion.dao;

import java.util.List;

import com.bdqn.memberinfomtion.entity.Membersinfo;

/**
 * 会员信息接口
 * @author 施鹏振
 *
 */
public interface IMemberinfoDao {

	/**
	 * 查询所有的会员信息
	 * @return
	 */
	List<Membersinfo> findAllMembersinfo();
	
	/**
	 * 通过会员id查询会员
	 * @param mId
	 * @return
	 */
	Membersinfo getMIdFindMembersinfo(int mId);
	
	/**
	 * 修改会员信息
	 * @param membersinfo
	 * @return
	 */
	int updateMembersinfo(Membersinfo membersinfo);
}
