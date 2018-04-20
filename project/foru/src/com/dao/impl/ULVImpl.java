package com.dao.impl;

import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.dao.IULV;
import com.entity.ULV;

/**
 * 用户等级接口实现类
 * @author 包小栋
 *
 */
public class ULVImpl extends BaseDao implements IULV {

	@Override
	/**
	 * 新增用户等级
	 */
	public void save(ULV ulv) {
		String sql="insert into ULv(EXP,LTitle)values(?,?)";
		Object[]object={ulv.getExp(),ulv.getLTitle()};
		this.getExecuteUpdate(sql, object);
	}
	/**
	 * 查询用户等级通过等级编号
	 */
	@Override
	public ULV findULV(int lv) {
		ULV ulv=null;
		this.conn=this.getConn();
		String sql="select LV,EXP,LTitle from Ulv where LV=?";
		try {
			this.pst=this.conn.prepareStatement(sql);
			this.pst.setInt(1, lv);
			this.set=this.pst.executeQuery();
			if(set.next())
			{
				ulv=new ULV();
				ulv.setExp(set.getInt(1));
				ulv.setLTitle(set.getString(2));
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return ulv;
	}
	/**
	 * 查询全部的用户等级
	 */
	@Override
	public List<ULV> findAll() {
		List<ULV>list=new ArrayList<ULV>();
		this.conn=this.getConn();
		String sql="select LV,EXP,LTitle from Ulv";
		try {
			this.pst=this.conn.prepareStatement(sql);
			this.set=this.pst.executeQuery();
			while(set.next())
			{
				ULV ulv=new ULV();
				ulv.setExp(set.getInt(1));
				ulv.setLTitle(set.getString(2));
				list.add(ulv);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}
	/**
	 *声明静态集合储蓄等级表数据
	 */
	public static List<ULV>LVS;
	//根据用户经验返回等级
	public ULV RLV(int uexp)
	{
		//判断集合是否为空
		if(LVS==null)
		{
			//查询数据
			LVS=new ArrayList<ULV>();
			String sql="select * from ULv";
			ResultSet rs=getExecuteQuery(sql, null);
			try {
				while(rs.next())
				{
					ULV ulvs=new ULV();
					ulvs.setLV(rs.getString(1));
					ulvs.setExp(rs.getInt(2));
					ulvs.setLTitle(rs.getString(3));
					LVS.add(ulvs);
				}
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		//获得等级
		String lv="1";
		for (ULV u: LVS) {
			if(uexp>u.getExp()){
				lv=u.getLV();
			}
		}
		for (ULV u: LVS) {
			if(lv.equals(u.getLV())){
				return u;
			}
		}
		return null;
	}
}
