package com.cz.dao.impl;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.cz.dao.BaseDao;
import com.cz.dao.ISpTypeDao;
import com.cz.entity.SpType;

public class SpTypeDaoImpl extends BaseDao implements ISpTypeDao {

	//所有商品类型
	public List<SpType> findAllStype() {
		List<SpType> spTypeList=new ArrayList<SpType>();
		String sql="select * from SpType";
		this.conn=this.getConnection();
		try {
			this.pre=conn.prepareStatement(sql);
			this.set=pre.executeQuery();
			while(set.next()){
				SpType se=new SpType();
				se.setSpTypeid(set.getInt(1));
				se.setSpTypeName(set.getString(2));
				spTypeList.add(se);
			}
			
		} catch (SQLException e) {
			
			e.printStackTrace();
		}
		
		return spTypeList;
	}

}
