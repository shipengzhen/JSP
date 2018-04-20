package com.dao.impl;

import java.sql.ResultSet;
import java.sql.SQLException;

import com.dao.IPhoto;

/**
 * 图片表的数据实现类
 * @author HP
 *
 */
public class PhotoImpl extends BaseDao implements IPhoto {

	//返回最大值的数据---测试数据
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
	
	//插入一条数据,照片ID和用户ID
	@Override
	public int Create(int PID, String UID) {
		String sql="insert into photo values("+PID+",'"+UID+"')";
		int a=getExecuteUpdate(sql, null);
		return a;
	}

}
