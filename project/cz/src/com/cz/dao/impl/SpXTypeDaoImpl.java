package com.cz.dao.impl;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.cz.dao.BaseDao;
import com.cz.dao.ISpXTypeDao;
import com.cz.entity.SpXType;

public class SpXTypeDaoImpl extends BaseDao implements ISpXTypeDao {
	
	/**
	 * 查询商品小类型
	 */
	public List<SpXType> findallxtype(int SptypeId) {
		List<SpXType> list=new ArrayList<SpXType>();
		String sql="select * from SpXType where spTypeId=?";
		this.conn=this.getConnection();
		try {
			this.pre=conn.prepareStatement(sql);
			pre.setInt(1, SptypeId);
			this.set=pre.executeQuery();
			while(set.next()){
				SpXType se=new SpXType();
				se.setSpxTypeId(set.getInt(1));
				se.setSpTypeId(set.getInt(2));
				se.setSpxTypeName(set.getString(3));
				list.add(se);
			}
			
		} catch (SQLException e) {
			
			e.printStackTrace();
		}
		
		return list;
	}

}
