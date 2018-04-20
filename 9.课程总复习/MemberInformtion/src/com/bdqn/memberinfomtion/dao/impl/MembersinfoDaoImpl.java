package com.bdqn.memberinfomtion.dao.impl;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import com.bdqn.memberinfomtion.dao.BaseDao;
import com.bdqn.memberinfomtion.dao.IMemberinfoDao;
import com.bdqn.memberinfomtion.entity.Membersinfo;
/**
 * ��Ա��Ϣʵ����
 * @author ʩ����
 *
 */
public class MembersinfoDaoImpl extends BaseDao implements IMemberinfoDao {

	/**
	 * ��ѯȫ����Ա��Ϣ
	 */
	@Override
	public List<Membersinfo> findAllMembersinfo() {
		List<Membersinfo> membersinfos=new ArrayList<Membersinfo>();
		try {
			String sql="select * from Membersinfo";
			for (Object membersinfo :getList(Class.forName("com.bdqn.memberinfomtion.entity.Membersinfo"), sql)) {
				membersinfos.add((Membersinfo) membersinfo);
			}
//			while (resultSet.next()) {
//				Membersinfo membersinfo=new Membersinfo(resultSet.getInt("mId"),resultSet.getString("mName"),resultSet.getString("mGender"),resultSet.getInt("mAge"),resultSet.getString("mAdderss"),resultSet.getString("mEmail"));
//				membersinfos.add(membersinfo);
//			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return membersinfos;
	}

	/**
	 * ͨ����Աid��ѯ��Ա
	 */
	@Override
	public Membersinfo getMIdFindMembersinfo(int mId) {
		try {
			connection=getConnection();
			String sql="select * from Membersinfo where mId=?";
			return (Membersinfo)getObject(Membersinfo.class,sql,mId);
//			while (resultSet.next()) {
//				membersinfo=new Membersinfo(resultSet.getInt("mId"),resultSet.getString("mName"),resultSet.getString("mGender"),resultSet.getInt("mAge"),resultSet.getString("mAdderss"),resultSet.getString("mEmail"));
//				return membersinfo;
//			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}

	/**
	 * �޸Ļ�Ա��Ϣ
	 */
	@Override
	public int updateMembersinfo(Membersinfo membersinfo) {
		try {
			String sql="update Membersinfo set mName=?,mGender=?,mAge=?,mAdderss=?,mEmail=? where mId=?";
			Object[] objects={membersinfo.getmName(),membersinfo.getmGender(),membersinfo.getmAge(),membersinfo.getmAdderss(),membersinfo.getmEmail(),membersinfo.getmId()};
			return exUpdate(sql, objects);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return 0;
	}

}
