package com.dao.impl;

import java.sql.ResultSet;
import java.sql.SQLException;

import com.dao.IPhoto;

/**
 * ͼƬ�������ʵ����
 * @author HP
 *
 */
public class PhotoImpl extends BaseDao implements IPhoto {

	//�������ֵ������---��������
	@Override
	public int Max() {
		String sql="select max(PHID) from photo";
		ResultSet rs=getExecuteQuery(sql, null);
		try {
			if(rs.next()){
				return rs.getInt(1);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return 0;
	}
	
	//����һ������,��ƬID���û�ID
	@Override
	public int Create(int PID, String UID) {
		String sql="insert into photo values("+PID+",'"+UID+"')";
		int a=getExecuteUpdate(sql, null);
		return a;
	}

}
