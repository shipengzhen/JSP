package com.cz.dao.impl;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.cz.dao.BaseDao;
import com.cz.dao.IScDao;
import com.cz.entity.Sp;
import com.cz.util.Page;

public class ScDaoImpl extends BaseDao implements IScDao {
	//收藏
			public int scSp(int uid,int spid) {
				String sql="insert into Sc values(?,?)";
				try {
					Object [] pats={uid,spid};
					int ret=this.exceUpdate(sql, pats);
					if(ret>0){
						return ret;
					}
				} catch (Exception e) {
					e.printStackTrace();
				}
				return 0;
			}

			//查询收藏商品
			public List<Sp> scList(int uId,Page pg) {
				List<Sp> sList=new ArrayList<Sp>();
				try {
					this.conn=this.getConnection();
					String sql="select top (?) Sp.spId,spTp,spName,spMs,spxMoney,spXTypeId,scId from Sp " +
							"inner join Sc on Sp.spId=Sc.spId " +
							"where Sc.scId not in(select top (?) scId from Sc where uId=?) " +
							"and uId=?";
					this.pre=this.conn.prepareStatement(sql);
					this.pre.setInt(1,pg.getPageSize());
					this.pre.setInt(2,(pg.getCurrPageNo()-1)*pg.getPageSize());
					this.pre.setInt(3, uId);
					this.pre.setInt(4, uId);
					this.set=this.pre.executeQuery();
					while(this.set.next()){
						Sp sp=new Sp();
						sp.setSpId(this.set.getInt(1));
						sp.setSpTp(this.set.getString(2));
						sp.setSpName(this.set.getString(3));
						sp.setSpMs(this.set.getString(4));
						sp.setSpxMoney(this.set.getString(5));
						sp.setSpXTypeId(set.getInt("spXTypeId"));
						sp.setScId(set.getInt("scId"));
						sList.add(sp);
					}
				} catch (Exception e) {
					e.printStackTrace();
				}
				return sList;
			}

			//查询收藏商品数量
			public int scCount(int uId) {
				try {
					conn=getConnection();
					String sql="select count(*) from Sp inner join Sc on Sp.spId=Sc.spId where Sp.spId in(select spId from Sc where uId=?)";
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
			//删除收藏
			public int scDelete(int scId) {
				try {
					String sql="delete from Sc where scId=?";
					Object[] pats={scId};
					return exceUpdate(sql,pats);
				} catch (Exception e) {
					e.printStackTrace();
				}
				return 0;
			}
			//判断是否收藏
			public boolean scpd(int spid, int uid) {
				String sql="select * from Sc where spid=? and uid=?";
				this.conn=this.getConnection();
				try {
					this.pre=conn.prepareStatement(sql);
					pre.setInt(1, spid);
					pre.setInt(2, uid);
					this.set=pre.executeQuery();
					if(set.next()){
						return true;
					}
					
				} catch (SQLException e) {
				
					e.printStackTrace();
				}
				return false;
			}
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
}
