package com.cz.dao.impl;

import java.util.ArrayList;
import java.util.List;
import com.cz.dao.BaseDao;
import com.cz.dao.IPlDao;
import com.cz.entity.Pl;
import com.cz.util.Page;

public class PlDaoImpl extends BaseDao implements IPlDao {

	//通过商品Id查询评论人数
		public int findPlCount(int spId) {
			try {
				conn=getConnection();
				String sql="select uid from pl where spId=?";
				pre=conn.prepareStatement(sql);
				pre.setInt(1,spId);
				set=pre.executeQuery();
				int uId=0;
				int num=0;
				while (set.next()) {
					if(uId!=set.getInt("uid")){
						num++;
					}
					uId=set.getInt("uid");
				}
				return num;
			} catch (Exception e) {
				e.printStackTrace();
			}
			return 0;
		}
		
			//商品评价总数
			public int findCountPl(int spid) {
				try {
					String sql="select count (*) from pl where spid=?";
					this.conn=this.getConnection();
					this.pre=this.conn.prepareStatement(sql);
					this.pre.setInt(1, spid);
					this.set=this.pre.executeQuery();
					if(this.set.next()){
						return this.set.getInt(1);
					}
				} catch (Exception e) {
					e.printStackTrace();
				}
				return 0;
			}
			//商品全部评价
			public List<Pl> findPl(int spid,Page pg) {
				List<Pl> plList=new ArrayList<Pl>();
				String sql="select top "+pg.getPageSize()+" plId,plString,plTime,uName,uTx from Pl " +
						"inner join Users on Pl.uId=Users.uId where spId=? " +
						"and plId not in(select top "+(pg.getCurrPageNo()-1)*pg.getPageSize()+" plId from pl where spId=? order by plTime desc)" +
						" order by plTime desc";
				try {
					this.conn=this.getConnection();
					this.pre=this.conn.prepareStatement(sql);
					this.pre.setInt(1, spid);
					pre.setInt(2,spid);
					this.set=this.pre.executeQuery();				
					while(this.set.next()){
						Pl pl=new Pl();
						pl.setPlId(set.getInt("plId"));
						pl.setPlString(set.getString("plString"));
						pl.setPlTime(set.getDate("plTime"));					
						pl.setuName(set.getString("uName"));
						pl.setuTx(set.getString("uTx"));
						plList.add(pl);
					}
				} catch (Exception e) {
					e.printStackTrace();
				}
					return plList;
				}

			//查询各类型品论数
			public int findCountPlGetplType(int spid,String plType) {
				try {
					conn=getConnection();
					String sql="select count(*) from pl where spid=? and plType=? ";
					pre=conn.prepareStatement(sql);
					pre.setInt(1, spid);
					pre.setString(2,plType);
					set=pre.executeQuery();
					if(set.next()){
						return set.getInt(1);
					}
				} catch (Exception e) {
					e.printStackTrace();
				}
				return 0;
			}

			//查询各类型评论
			public List<Pl> findPlGetplType(int spid,String plType,Page pg) {
				List<Pl> hList=new ArrayList<Pl>();
				try {
					String sql="select top "+pg.getPageSize()+" plId,plString,plTime,uName,uTx from Pl " +
							"inner join Users on Pl.uId=Users.uId where spId=? and plType=? " +
							"and plId not in(select top "+(pg.getCurrPageNo()-1)*pg.getPageSize()+" plId from pl where spId=? and plType=? order by plTime desc)" +
							" order by plTime desc";
					conn=getConnection();
					pre=conn.prepareStatement(sql);
					pre.setInt(1, spid);
					pre.setString(2,plType);
					pre.setInt(3, spid);
					pre.setString(4,plType);
					set=pre.executeQuery();				
					while(set.next()){
						Pl pl=new Pl();
						pl.setPlId(set.getInt("plId"));
						pl.setPlString(set.getString("plString"));
						pl.setPlTime(set.getDate("plTime"));					
						pl.setuName(set.getString("uName"));
						pl.setuTx(set.getString("uTx"));
						hList.add(pl);
					}
				} catch (Exception e) {
					e.printStackTrace();
				}
					return hList;
			}

			//查询用户的评论数
			public int findPlCountGetuId(int uId) {
				try {
					conn=getConnection();
					String sql="select count(*) from pl where uId=?";
					pre=conn.prepareStatement(sql);
					pre.setInt(1,uId);
					set=pre.executeQuery();
					while (set.next()) {
						return set.getInt(1);
					}
				} catch (Exception e) {
					e.printStackTrace();
				}
				return 0;
			}

			//查询用户各类型的评论数
			public int findPlCountGetuIdType(int uId, String plType) {
				try {
					conn=getConnection();
					String sql="select count(*) from pl where uId=? and plType=?";
					pre=conn.prepareStatement(sql);
					pre.setInt(1,uId);
					pre.setString(2,plType);
					set=pre.executeQuery();
					while (set.next()) {
						return set.getInt(1);
					}
				} catch (Exception e) {
					e.printStackTrace();
				}
				return 0;
			}

			//查询用户全部的评论
			public List<Pl> findAllPlGetuId(int uId,Page pg) {
				List<Pl> pls=new ArrayList<Pl>();
				try {
					conn=getConnection();
					String sql="select top "+pg.getPageSize()+" plId,plString,plTime,spName,spTp,sp.spId,spxtypeId from pl " +
							"inner join sp on sp.spId=pl.spId " +
							"where uId=? and plId not in(select top "+(pg.getCurrPageNo()-1)*pg.getPageSize()+" plId from pl where uId=? order by plTime desc)" +
									" order by plTime desc";
					pre=conn.prepareStatement(sql);
					pre.setInt(1,uId);
					pre.setInt(2,uId);
					set=pre.executeQuery();
					while (set.next()) {
						Pl pl=new Pl();
						pl.setPlId(set.getInt("plId"));
						pl.setPlString(set.getString("plString"));
						pl.setPlTime(set.getDate("plTime"));
						pl.setSpName(set.getString("spName"));
						pl.setSpTp(set.getString("spTp"));
						pl.setSpid(set.getInt("spId"));
						pl.setSpXTypeId(set.getInt("spxtypeId"));
						pls.add(pl);
					}
				} catch (Exception e) {
					e.printStackTrace();
				}
				return pls;
			}

			//查询用户各类型的评论
			public List<Pl> findTypePlGetuId(int uId, String plType,Page pg) {
				List<Pl> pls=new ArrayList<Pl>();
				try {
					conn=getConnection();
					String sql="select top "+pg.getPageSize()+" plId,plString,plTime,spName,spTp,sp.spId,spxtypeId from pl " +
							"inner join sp on sp.spId=pl.spId " +
							"where uId=? and plType=? " +
							"and plId not in(select top "+(pg.getCurrPageNo()-1)*pg.getPageSize()+" plId from pl where uId=? and plType=? order by plTime desc)" +
									" order by plTime desc";
					pre=conn.prepareStatement(sql);
					pre.setInt(1,uId);
					pre.setString(2,plType);
					pre.setInt(3,uId);
					pre.setString(4,plType);
					set=pre.executeQuery();
					while (set.next()) {
						Pl pl=new Pl();
						pl.setPlId(set.getInt("plId"));
						pl.setPlString(set.getString("plString"));
						pl.setPlTime(set.getDate("plTime"));
						pl.setSpName(set.getString("spName"));
						pl.setSpTp(set.getString("spTp"));
						pl.setSpid(set.getInt("spId"));
						pl.setSpXTypeId(set.getInt("spxtypeId"));
						pls.add(pl);
					}
				} catch (Exception e) {
					e.printStackTrace();
				}
				return pls;
			}
			/**
			 * 添加评论 
			 */
			public boolean insertpl(Pl p) {
				String sql="insert into Pl values(?,default,?,?,? )";
				Object[]nu={p.getPlString(),p.getPlType(),p.getSpid(),p.getUid() };
				int s=this.exceUpdate(sql, nu);
				if(s>0){
					return true;
				}
				return false;
			}
			
			
			
			
			
			
			
			
			
			
			
			
			
}
