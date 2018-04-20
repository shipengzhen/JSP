package com.cz.dao.impl;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.cz.dao.BaseDao;
import com.cz.dao.IDdDao;
import com.cz.entity.Dd;
import com.cz.entity.Gwc;
import com.cz.entity.Sp;
import com.cz.util.Page;

public class DdDaoImpl extends BaseDao implements IDdDao {
	
		/**
		 * 支付页面
		 */
		List<Gwc> list= null;
		public List<Gwc> findDdzf(int uid) {
			list=new ArrayList<Gwc>();
			String sql="select * from Dd inner join Sp on Dd.spId=Sp.spId where  uid=? and ddType='待付款'";
			this.conn=this.getConnection();
			try {
				this.pre=conn.prepareStatement(sql);
				pre.setInt(1, uid);
				this.set=pre.executeQuery();
				while(set.next()){
					Gwc a=new Gwc();
					a.setDdid(set.getInt("ddId"));
					a.setSpName(set.getString("spName"));
					a.setSpid(set.getInt("spId"));
					a.setSpTp(set.getString("spTp"));
					a.setJf(set.getInt("jf"));
					a.setSpxMoney(set.getString("spxMoney"));
					a.setSpNum(set.getInt("spNum"));
					a.setSpxTypeid(set.getInt("spXTypeid"));
					list.add(a);		
				}
				
			} catch (SQLException e) {
				
				e.printStackTrace();
			}
			
			return list;
		}

		
		//记录总数	分页
		public int findnum(int uid,String type) {
			String sql="select Count(*) from Dd inner join Sp on Dd.spId =Sp.spId  where uid= ? and Dd.ddType=?";
			this.conn=this.getConnection();
			try {
				pre=conn.prepareStatement(sql);
				pre.setInt(1, uid);
				pre.setString(2, type);
				this.set=pre.executeQuery();
				if(set.next()){
					return set.getInt(1);
				}
			} catch (SQLException e) {
				
				e.printStackTrace();
			}
			return 0;
		}
			
		
		//
		/**
		 * 展示 我的购物车 状态 待付款
		 */
		
		public List<Gwc> findGwc(int uid,String type,Page p) {
			this.conn=this.getConnection();
			list=new ArrayList<Gwc>();
			String sql="select top "+p.getPageSize() +" Dd.ddId,Sp.spTp,Sp.spName,Sp.jf,Sp.spxMoney,Dd.spNum,Sp.spId,Dd.uId,Sp.spXTypeid from Dd " +
					"inner join Sp on Dd.spId =Sp.spId  where uid= ? and Dd.ddType= ? and ddId  not in "+
					"( select top((?-1)*?) Dd.ddId  from Dd inner join Sp on Dd.spId =Sp.spId "+
					" where uid= ? and Dd.ddType=? )" ;
					
			try {
				this.pre= this.conn.prepareStatement(sql);
				pre.setInt(1, uid);
				pre.setString(2, type);
				pre.setInt(3, p.getCurrPageNo());
				pre.setInt(4, p.getPageSize());
				pre.setInt(5, uid);
				pre.setString(6, type);
				this.set=this.pre.executeQuery();
				while (set.next()) {
					Gwc s= new Gwc();
					s.setDdid(set.getInt(1));
					s.setSpTp(set.getString(2));
					s.setSpName(set.getString(3));
					s.setJf(set.getInt(4));
					s.setSpxMoney(set.getString(5));
					s.setSpNum(set.getInt(6));
					s.setSpid(set.getInt(7));
					s.setUid(set.getInt(8));
					s.setSpxTypeid(set.getInt(9));
					list.add(s);
				}
				
			} catch (Exception e) {
				e.printStackTrace();
			}	
			return list;
		}
		
		
		//删除订单
		public boolean deletesp(int ddid) {
			String sql="delete from Dd where ddid=? ";
			Object[]ui={ddid};
			if(exceUpdate(sql,ui)>0){
				return true;
			}
			return false;
		}	
		//订单数量
		public int findDdnum(int uid) {
			this.conn=this.getConnection();
			String sql="select Sum(spNum) from Dd where uid=? and ddType='待付款'";
			try {
				this.pre=this.conn.prepareStatement(sql);
				this.pre.setInt(1,uid);
				this.set=this.pre.executeQuery();
				if(set.next()){
					return set.getInt(1);
				}
				
			} catch (Exception e) {
				e.printStackTrace();
			}
			return 0;
		}
		//订单总加钱
		public int findumoney(int uid) {
			this.findDdmunid(uid);
			int i=0;
			int money=0;
			String sql="select sp.spxMoney ,Dd.ddId from Dd INNER JOIN Sp ON Sp.spId =Dd.spId WHERE Dd.uId=? AND ddType='待付款'";
			this.conn=this.getConnection();
			
			try {
		
				this.pre=conn.prepareStatement(sql);
				pre.setInt(1, uid);
				this.set=pre.executeQuery();
				while(set.next()){
					if(this.list.get(i).getDdid()==set.getInt("ddId")){
						money=money+list.get(i).getSpNum()*set.getInt("spxMoney");
					}
					i++;
				}
			} catch (SQLException e) {
				e.printStackTrace();
			}
			return money;
			
		}
		/**
		 * 总积分
		 */
		public int findzjf(int uid) {
			int i=0;
			int jf=0;
			String sql="select sp.jf ,Dd.ddId from Dd INNER JOIN Sp ON Sp.spId =Dd.spId WHERE Dd.uId=? AND ddType='待付款'";
			this.findDdmunid(uid);
			this.conn=this.getConnection();
			try {
				this.pre=conn.prepareStatement(sql);
				pre.setInt(1, uid);
				this.set=pre.executeQuery();
				while(set.next()){
					if(this.list.get(i).getDdid()==set.getInt("ddId")){
						jf=jf+list.get(i).getSpNum()*set.getInt("jf");
					}
					i++;
				}
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			return jf;
		}
		
		
		//用户订单价格
		public int findDdCount(int uId, String ddType) {
			try {
				conn=getConnection();
				String sql="select count(*) from Dd where uId=? and ddType=?";
				pre=conn.prepareStatement(sql);
				pre.setInt(1,uId);
				pre.setString(2,ddType);
				set=pre.executeQuery();
				while (set.next()) {
					return set.getInt(1);
				}
			} catch (Exception e) {
				e.printStackTrace();
			}
			return 0;
		}
		
		//查询最新订单
		public List<Sp> dingList() {
					List<Sp> ddList=new ArrayList<Sp>();
					String sql="select top(8) Sp.spId,spName,spMs,sptp,spXTypeId from Sp inner join Dd on Sp.spId=Dd.spId where ddType='待发货'  order by ddTime desc";
					try {
						this.conn=this.getConnection();
						this.pre=this.conn.prepareStatement(sql);
						this.set=this.pre.executeQuery();
						while(this.set.next()){
							Sp sp=new Sp();
							sp.setSpId(this.set.getInt(1));
							sp.setSpName(this.set.getString(2));
							sp.setSpMs(this.set.getString(3));
							sp.setSpTp(this.set.getString(4));
							sp.setSpXTypeId(set.getInt("spXTypeId"));
							ddList.add(sp);
						}
					} catch (Exception e) {
						e.printStackTrace();
					}
					return ddList;
				}
				
		//删除订单
		public boolean deleteDd(int spid) {
					String sql="delete from Dd where spId=?";
					try {
						Object []pats={spid};
						if(this.exceUpdate(sql, pats)>0){
							return true;
						}
					} catch (Exception e) {
						e.printStackTrace();
					}
					return false;
				}
		/**
		 * 加入购物车
		 */
		public boolean insertSp(int uid, int spid, int spnum,
						String type) {
						
						int k=findspbyuid(uid,spid);
						String sql="";
						if(k!=0){
							sql="update Dd set spNum=(select spNum from Dd where ddid=" +k+ ")+? where ddid="+k;
							Object[] rt={spnum};
							if(exceUpdate(sql,rt)>0){
								return true;
							}
						}else{
							sql="insert into Dd(uid,spId,spNum,ddType) values(?,?,?,?)";
							Object[] rt={uid,spid,spnum,type};
							if(exceUpdate(sql,rt)>0){
								return true;
							}
						}					
						return false;
					
		}

		//判断用户 购物车 有没有这个商品
		public int findspbyuid(int uid, int spid) {
			String sql="select ddid from Dd where uId=? and spId=? and ddType='待付款'";
			this.conn=this.getConnection();
			try {
				this.pre=conn.prepareStatement(sql);
				pre.setInt(1, uid);
				pre.setInt(2, spid);
				this.set=pre.executeQuery();
				if(set.next()){
					return set.getInt(1);
				}
				
			} catch (SQLException e) {
				e.printStackTrace();
			}
			
			return 0;
		}

		//修改数量商品
		public boolean updatespnum(int spnum,int ddid) {
			String sql="update Dd set spNum=? where ddId=?";
			Object[] num={spnum,ddid};
			if(this.exceUpdate(sql, num)>0){
				return true;
			}			
			return false;
		}
		/**
		 * 支付完成  --》 把待付款 改成 代收货
		 */
		public boolean updateDdds(int uid) {
			String sql="update Dd set ddType='待发货' where uId=?";
			Object[]nums={ uid};
			int a=this.exceUpdate(sql, nums);
			if(a>0){
				return true;
			}
			return false;
		}
		
		

		///
		/**
		 * 各类型订单
		 */
		public List<Dd> findTypeDds(int uId,String ddType,Page pg){
			List<Dd> dds=new ArrayList<Dd>();
			try {
				conn=getConnection();
				String sql="select top (?) ddId,spName,spMs,spxMoney,sp.spId,spXTypeid,spTp,ddType from Dd " +
						"inner join sp on Dd.spId=sp.spId " +
						"where uId=? and ddType=? and ddId not in(select top (?) ddId from Dd where uId=? and ddType=?)";
				pre=conn.prepareStatement(sql);
				pre.setInt(1,pg.getPageSize());
				pre.setInt(2,uId);
				pre.setString(3,ddType);
				pre.setInt(4,(pg.getCurrPageNo()-1)*pg.getPageSize());
				pre.setInt(5,uId);
				pre.setString(6,ddType);
				set=pre.executeQuery();
				while(set.next()){
					Dd dd=new Dd();
					dd.setDdId(set.getInt("ddId"));
					dd.setSpName(set.getString("spName"));
					dd.setSpMs(set.getString("spMs"));
					dd.setSpXMoney(set.getString("spxMoney"));
					dd.setSpid(set.getInt("spId"));
					dd.setSpXTypeId(set.getInt("spXTypeid"));
					dd.setSpTp(set.getString("spTp"));
					dd.setDdType(set.getString("ddType"));
					dds.add(dd);
				}
			} catch (Exception e) {
						e.printStackTrace();
			}
			return dds;
		}
		/**
		 * 订单数量 	用户id
		 */
		public int findDdCount(int uId) {
			try {
				conn=getConnection();
				String sql="select count(*) from Dd where uId=?";
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


		//查询订单中的商品
		public List<Dd> findAllDd(int uId,Page pg) {
			List<Dd> dds=new ArrayList<Dd>();
			try {
				conn=getConnection();
				String sql="select top (?) ddId,spName,spMs,spxMoney,sp.spId,spXTypeid,spTp,ddType from Dd " +
						"inner join sp on Dd.spId=sp.spId " +
						"where uId=? and ddId not in(select top (?) ddId from Dd where uId=?)";
				pre=conn.prepareStatement(sql);
				pre.setInt(1,pg.getPageSize());
				pre.setInt(2,uId);
				pre.setInt(3,(pg.getCurrPageNo()-1)*pg.getPageSize());
				pre.setInt(4,uId);
				set=pre.executeQuery();
				while(set.next()){
					Dd dd=new Dd();
					dd.setDdId(set.getInt("ddId"));
					dd.setSpName(set.getString("spName"));
					dd.setSpMs(set.getString("spMs"));
					dd.setSpXMoney(set.getString("spxMoney"));
					dd.setSpid(set.getInt("spId"));
					dd.setSpXTypeId(set.getInt("spXTypeid"));
					dd.setSpTp(set.getString("spTp"));
					dd.setDdType(set.getString("ddType"));
					dds.add(dd);
				}
			} catch (Exception e) {
						e.printStackTrace();
			}
			return dds;
		}

		/**
		 *  订单个数 和id
		 */
		public List<Gwc> findDdmunid(int uid) {
			list=new ArrayList<Gwc>();
			String sql="select * from Dd where uid=? and ddType='待付款' ";
			this.conn=this.getConnection();
			try {
				this.pre=conn.prepareStatement(sql);
				pre.setInt(1, uid);
				this.set=pre.executeQuery();
				while(set.next()){
					Gwc a=new Gwc();
					a.setDdid(set.getInt("ddid"));
					a.setSpid(set.getInt("spId"));
					a.setSpNum(set.getInt("spNum"));
					list.add(a);
				}
				
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
			return list;
		}
		/**
		 * 吧 订单改成 已完成
		 */

		public boolean updatetype(int ddid) {
			String sql="update Dd set ddType='已完成' where ddId=?";
			Object[]ob={ddid};
			int i=this.exceUpdate(sql, ob);
			if(i>0){
				return true;
			}
			return false;
		}
		
	
}









