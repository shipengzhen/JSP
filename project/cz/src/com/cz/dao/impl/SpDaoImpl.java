package com.cz.dao.impl;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.cz.dao.BaseDao;
import com.cz.dao.IPlDao;
import com.cz.dao.ISpDao;
import com.cz.entity.Pl;
import com.cz.entity.Sp;
import com.cz.entity.Spimgae;
import com.cz.util.Page;

public class SpDaoImpl extends BaseDao implements ISpDao {
	IPlDao plDao=new PlDaoImpl();
	
	//最新上架商品
	public List<Sp> findbytime() {
		
		List<Sp> lisy=new ArrayList<Sp>();
		this.conn=this.getConnection();
		String sql="select top(6) * from Sp order by sptime desc";
		try {
			this.pre=conn.prepareStatement(sql);
			this.set=pre.executeQuery();
			while(set.next()){
				Sp s=new Sp();
				s.setSpId(set.getInt("spId"));
				s.setSpName(set.getString("spName"));
				s.setSpTp(set.getString("spTp"));
				s.setSpxMoney(set.getString("spxMoney"));
				s.setJf(set.getInt("jf"));
				s.setSpXTypeId(set.getInt("spXtypeId"));
				lisy.add(s);
			}
			
		} catch (SQLException e) {
			
			e.printStackTrace();
		}
		
		return lisy;
	}
	
	//销量高	
	public List<Sp> findbynum() {
		List<Sp> lisy=new ArrayList<Sp>();
		this.conn=this.getConnection();
		String sql="select top(6) * from Sp order by xl desc";
		try {
			this.pre=conn.prepareStatement(sql);
			this.set=pre.executeQuery();
			while(set.next()){
				Sp s=new Sp();
				s.setSpId(set.getInt("spId"));
				s.setSpName(set.getString("spName"));
				s.setSpTp(set.getString("spTp"));
				s.setSpxMoney(set.getString("spxMoney"));
				s.setJf(set.getInt("jf"));
				s.setSpXTypeId(set.getInt("spXtypeId"));
				lisy.add(s);
			}
			
		} catch (SQLException e) {
			
			e.printStackTrace();
		}
		
		return lisy;
	}
	//好评的
	public List<Sp> findbyhaop() {
		List<Sp> lisy=new ArrayList<Sp>();
		this.conn=this.getConnection();
		String sql="select top(6) * from Sp " +
				"where spid in (select spid from Pl where plType='好评' and spid=(select count(*) from Pl where plType='好评' )) order by xl desc";                  
		try {
			this.pre=conn.prepareStatement(sql);
			this.set=pre.executeQuery();
			while(set.next()){
				Sp s=new Sp();
				s.setSpId(set.getInt("spId"));
				s.setSpName(set.getString("spName"));
				s.setSpTp(set.getString("spTp"));
				s.setSpxMoney(set.getString("spxMoney"));
				s.setJf(set.getInt("jf"));
				s.setSpXTypeId(set.getInt("spXtypeId"));
				lisy.add(s);
			}
			
		} catch (SQLException e) {
			
			e.printStackTrace();
		}
		
		return lisy;
	}

	//热卖推荐
	public List<Sp> findSpBynumGetXType(int spXTypeId) {
		List<Sp> lisy=new ArrayList<Sp>();
		this.conn=this.getConnection();
		String sql="select top 3 * from Sp where spXTypeid=? order by xl desc";
		try {
			pre=conn.prepareStatement(sql);
			pre.setInt(1,spXTypeId);
			set=pre.executeQuery();
			while(set.next()){
				Sp s=new Sp();
				s.setSpId(set.getInt("spId"));
				s.setSpName(set.getString("spName"));
				s.setSpTp(set.getString("spTp"));
				s.setSpxMoney(set.getString("spxMoney"));
				s.setSpyMoney(set.getString("spyMoney"));
				s.setSpXTypeId(set.getInt("spXtypeId"));
				lisy.add(s);
			}
			
		} catch (SQLException e) {
			
			e.printStackTrace();
		}
		
		return lisy;
	}
	//通过小类型查询商品
	public List<Sp> findSpGetXType(int spXTypeId,Page page) {
		List<Sp> sps=new ArrayList<Sp>();
		try {
			IPlDao plDao=new PlDaoImpl();
			conn=getConnection();
			String sql="select top "+page.getPageSize()+
					" * from sp where spXTypeid=? and spId not in(select top "+(page.getCurrPageNo()-1)*page.getPageSize()+" spId from sp  where spXTypeid=?)";
			pre=conn.prepareStatement(sql);
			pre.setInt(1,spXTypeId);
			pre.setInt(2, spXTypeId);
			set=pre.executeQuery();
			while(set.next()){
				Sp s=new Sp();
				s.setSpId(set.getInt("spId"));
				s.setSpName(set.getString("spName"));
				s.setSpTp(set.getString("spTp"));
				s.setXl(set.getInt("xl"));
				s.setSpxMoney(set.getString("spxMoney"));
				s.setJf(set.getInt("jf"));
				s.setSptime(set.getDate("spTime"));
				s.setPlNum(plDao.findPlCount(set.getInt("spId")));
				sps.add(s);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return sps;
	}
	//通过小类型查询商品总数 分页
	public int findSpCountGetXtype(int spXTypeId) {
		try {
			conn=getConnection();
			String sql="select count(*) from sp where spXTypeid=?";
			pre=conn.prepareStatement(sql);
			pre.setInt(1, spXTypeId);
			set=pre.executeQuery();
			while (set.next()) {
				return set.getInt(1);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return 0;
	}

	//通过评论数排序商品
	
	public List<Sp> findSpPxGetPlNum(int spXTypeId, Page page) {
		List<Sp> sps=new ArrayList<Sp>();
		try {
			conn=getConnection();
			String sql="select top "+page.getPageSize()+" spId,spName,spTp,spxMoney,jf from sp " +
					"where spXTypeid=? and spId not in(select top "+(page.getCurrPageNo()-1)*page.getPageSize()+" spId from sp  where spXTypeid=?)";
			pre=conn.prepareStatement(sql);
			pre.setInt(1,spXTypeId);
			pre.setInt(2, spXTypeId);
			set=pre.executeQuery();;
			while(set.next()){
				Sp s=new Sp();
				s.setSpId(set.getInt("spId"));
				s.setSpName(set.getString("spName"));
				s.setSpTp(set.getString("spTp"));
				s.setSpxMoney(set.getString("spxMoney"));
				s.setJf(set.getInt("jf"));
				s.setPlNum(plDao.findPlCount(set.getInt("spId")));
				sps.add(s);
				for (int i=0;i<sps.size();i++) {
					if (i+1<sps.size()) {
						if(sps.get(i).getPlNum()<sps.get(i+1).getPlNum()){
							s=sps.get(i);
							sps.remove(i);
							sps.add(s);
						}
					}
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return sps;
	}
	
	//通过销量排序商品
	public List<Sp> findSpPxGetXl(int spXTypeId, Page page) {
		List<Sp> sps=new ArrayList<Sp>();
		try {
			String sql="select top "+page.getPageSize()+" spId,spName,spTp,spxMoney,jf from sp " +
					"where spXTypeid=? and spId not in(select top "+(page.getCurrPageNo()-1)*page.getPageSize()+" spId from sp  where spXTypeid=? order by xl desc) " +
					"order by xl desc";
			pre=conn.prepareStatement(sql);
			pre.setInt(1,spXTypeId);
			pre.setInt(2, spXTypeId);
			set=pre.executeQuery();
			while(set.next()){
				Sp s=new Sp();
				s.setSpId(set.getInt("spId"));
				s.setSpName(set.getString("spName"));
				s.setSpTp(set.getString("spTp"));
				s.setSpxMoney(set.getString("spxMoney"));
				s.setJf(set.getInt("jf"));
				s.setPlNum(plDao.findPlCount(set.getInt("spId")));
				sps.add(s);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return sps;
	}

	//通过价格排序商品
	public List<Sp> findSpPxGetSpxMoney(int spXTypeId, Page page) {
		List<Sp> sps=new ArrayList<Sp>();
		try {
			String sql="select top "+page.getPageSize()+" spId,spName,spTp,spxMoney,jf from sp " +
					"where spXTypeid=? and spId not in(select top "+(page.getCurrPageNo()-1)*page.getPageSize()+" spId from sp  where spXTypeid=?) ";
			pre=conn.prepareStatement(sql);
			pre.setInt(1,spXTypeId);
			pre.setInt(2, spXTypeId);
			set=pre.executeQuery();
			while(set.next()){
				Sp s=new Sp();
				s.setSpId(set.getInt("spId"));
				s.setSpName(set.getString("spName"));
				s.setSpTp(set.getString("spTp"));
				s.setSpxMoney(set.getString("spxMoney"));
				s.setJf(set.getInt("jf"));
				s.setPlNum(plDao.findPlCount(set.getInt("spId")));
				sps.add(s);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return sps;
	}

	//通过上架时间排序
	public List<Sp> findSpPxGetSptime(int spXTypeId, Page page) {
		List<Sp> sps=new ArrayList<Sp>();
		try {
			String sql="select top "+page.getPageSize()+" spId,spName,spTp,spxMoney,jf from sp " +
					"where spXTypeid=? and spId not in(select top "+(page.getCurrPageNo()-1)*page.getPageSize()+" spId from sp  where spXTypeid=?) order by sptime desc" +
					"order by sptime desc";
			pre=conn.prepareStatement(sql);
			pre.setInt(1,spXTypeId);
			pre.setInt(2, spXTypeId);
			set=pre.executeQuery();
			while(set.next()){
				Sp s=new Sp();
				s.setSpId(set.getInt("spId"));
				s.setSpName(set.getString("spName"));
				s.setSpTp(set.getString("spTp"));
				s.setSpxMoney(set.getString("spxMoney"));
				s.setJf(set.getInt("jf"));
				s.setPlNum(plDao.findPlCount(set.getInt("spId")));
				sps.add(s);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return sps;
	}

	//通过季节查询商品
	public List<Sp> findSpGetJj(int spXTypeId,String jj, Page page) {
		List<Sp> sps=new ArrayList<Sp>();
		try {
			String sql="select top "+page.getPageSize()+" spId,spName,spTp,spxMoney,jf,spXtypeId from sp " +
					"where spXTypeid=? and jj=? and spId not in(select top "+(page.getCurrPageNo()-1)*page.getPageSize()+" spId from sp  where spXTypeid=? and jj=?) ";
			pre=conn.prepareStatement(sql);
			pre.setInt(1,spXTypeId);
			pre.setString(2,jj);
			pre.setInt(3,spXTypeId);
			pre.setString(4,jj);
			set=pre.executeQuery();
			while(set.next()){
				Sp s=new Sp();
				s.setSpId(set.getInt("spId"));
				s.setSpName(set.getString("spName"));
				s.setSpTp(set.getString("spTp"));
				s.setSpxMoney(set.getString("spxMoney"));
				s.setJf(set.getInt("jf"));
				s.setPlNum(plDao.findPlCount(set.getInt("spId")));
				s.setSpXTypeId(set.getInt("spXtypeId"));
				sps.add(s);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return sps;
	}

	//通过季节查询商品总数
	public int findSpCountGetjj(int spXTypeId, String jj) {
		try {
			conn=getConnection();
			String sql="select count(*) from Sp where spXTypeid=? and jj=?";
			pre=conn.prepareStatement(sql);
			pre.setInt(1,spXTypeId);
			pre.setString(2,jj);
			set=pre.executeQuery();
			while (set.next()) {
				return set.getInt(1);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return 0;
	}
	
	//通过季节评论数排序商品
	public List<Sp> findSpjjPxGetPlNum(int spXTypeId, String jj, Page page) {
		List<Sp> sps=new ArrayList<Sp>();
		try {
			conn=getConnection();
			String sql="select top "+page.getPageSize()+" spId,spName,spTp,spxMoney,jf from sp " +
					"where spXTypeid=? and jj=? " +
					"and spId not in(select top "+(page.getCurrPageNo()-1)*page.getPageSize()+" spId from sp  where spXTypeid=? and jj=?)";
			pre=conn.prepareStatement(sql);
			pre.setInt(1,spXTypeId);
			pre.setString(2,jj);
			pre.setInt(3,spXTypeId);
			pre.setString(4,jj);
			set=pre.executeQuery();;
			while(set.next()){
				Sp s=new Sp();
				s.setSpId(set.getInt("spId"));
				s.setSpName(set.getString("spName"));
				s.setSpTp(set.getString("spTp"));
				s.setSpxMoney(set.getString("spxMoney"));
				s.setJf(set.getInt("jf"));
				s.setPlNum(plDao.findPlCount(set.getInt("spId")));
				sps.add(s);
				for (int i=0;i<sps.size();i++) {
					if (i+1<sps.size()) {
						if(sps.get(i).getPlNum()<sps.get(i+1).getPlNum()){
							s=sps.get(i);
							sps.remove(i);
							sps.add(s);
						}
					}
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return sps;
	}
	
	//通过季节销量排序商品
	public List<Sp> findSpjjPxGetXl(int spXTypeId, String jj, Page page) {
		List<Sp> sps=new ArrayList<Sp>();
		try {
			String sql="select top "+page.getPageSize()+" spId,spName,spTp,spxMoney,jf from sp " +
					"where spXTypeid=? and jj=? " +
					"and spId not in(select top "+(page.getCurrPageNo()-1)*page.getPageSize()+" spId from sp  where spXTypeid=? and jj=?) " +
					"order by xl desc";
			pre=conn.prepareStatement(sql);
			pre.setInt(1,spXTypeId);
			pre.setString(2,jj);
			pre.setInt(3,spXTypeId);
			pre.setString(4,jj);
			set=pre.executeQuery();
			while(set.next()){
				Sp s=new Sp();
				s.setSpId(set.getInt("spId"));
				s.setSpName(set.getString("spName"));
				s.setSpTp(set.getString("spTp"));
				s.setSpxMoney(set.getString("spxMoney"));
				s.setJf(set.getInt("jf"));
				s.setPlNum(plDao.findPlCount(set.getInt("spId")));
				sps.add(s);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return sps;
	}
	
	//通过季节价格排序商品
	public List<Sp> findSpjjPxGetSpxMoney(int spXTypeId, String jj, Page page) {
		List<Sp> sps=new ArrayList<Sp>();
		try {
			String sql="select top "+page.getPageSize()+" spId,spName,spTp,spxMoney,jf from sp " +
					"where spXTypeid=? and jj=? "+
					"and spId not in(select top "+(page.getCurrPageNo()-1)*page.getPageSize()+" spId from sp  where spXTypeid=? and jj=?) " +
					"order by spxMoney desc";
			pre=conn.prepareStatement(sql);
			pre.setInt(1,spXTypeId);
			pre.setString(2,jj);
			pre.setInt(3,spXTypeId);
			pre.setString(4,jj);
			set=pre.executeQuery();
			while(set.next()){
				Sp s=new Sp();
				s.setSpId(set.getInt("spId"));
				s.setSpName(set.getString("spName"));
				s.setSpTp(set.getString("spTp"));
				s.setSpxMoney(set.getString("spxMoney"));
				s.setJf(set.getInt("jf"));
				s.setPlNum(plDao.findPlCount(set.getInt("spId")));
				sps.add(s);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return sps;
	}

	//通过季节上架时间排序
	public List<Sp> findSpjjPxGetSptime(int spXTypeId, String jj, Page page) {
		List<Sp> sps=new ArrayList<Sp>();
		try {
			String sql="select top "+page.getPageSize()+" spId,spName,spTp,spxMoney,jf from sp " +
					"where spXTypeid=? and jj=? " +
					"and spId not in(select top "+(page.getCurrPageNo()-1)*page.getPageSize()+" spId from sp  where spXTypeid=? and jj=?) " +
					"order by sptime desc";
			pre=conn.prepareStatement(sql);
			pre.setInt(1,spXTypeId);
			pre.setString(2,jj);
			pre.setInt(3,spXTypeId);
			pre.setString(4,jj);
			set=pre.executeQuery();
			while(set.next()){
				Sp s=new Sp();
				s.setSpId(set.getInt("spId"));
				s.setSpName(set.getString("spName"));
				s.setSpTp(set.getString("spTp"));
				s.setSpxMoney(set.getString("spxMoney"));
				s.setJf(set.getInt("jf"));
				s.setPlNum(plDao.findPlCount(set.getInt("spId")));
				sps.add(s);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return sps;
	}
	
	
		//推荐 
		public List<Sp> findbyTj() {
			List<Sp> lisy=new ArrayList<Sp>();
			this.conn=this.getConnection();
			String sql="select top(6) * from Sp where jj='夏季' ";                  
			try {
				this.pre=conn.prepareStatement(sql);
				this.set=pre.executeQuery();
				while(set.next()){
					Sp s=new Sp();
					s.setSpId(set.getInt("spId"));
					s.setSpName(set.getString("spName"));
					s.setSpTp(set.getString("spTp"));
					s.setSpxMoney(set.getString("spxMoney"));
					s.setJf(set.getInt("jf"));
					s.setSpXTypeId(set.getInt("spXTypeid"));
					lisy.add(s);
				}
			
				
			} catch (SQLException e) {
				
				e.printStackTrace();
			}
			
			return lisy;
		}
		//商品小类型 返回商品
		public List<Sp> findXlx(int xtype) {
			List<Sp> lisy=new ArrayList<Sp>();
			String sql="select top(8) * from Sp where spXTypeid=?";
			this.conn=this.getConnection();
			try {
				this.pre=conn.prepareStatement(sql);
				pre.setInt(1, xtype);
				this.set=pre.executeQuery();
				while(set.next()){
					Sp s=new Sp();
					s.setSpId(set.getInt("spId"));
					s.setSpTp(set.getString("spTp"));
					s.setSpName(set.getString("spName"));
					s.setSpxMoney(set.getString("spxMoney"));
					lisy.add(s);
				}
			} catch (SQLException e) {
				e.printStackTrace();
			}
			return lisy;
		}
		//夏季推荐------------------------------------------
		public List<Sp> findxj(String xq) {
			List<Sp> lisy=new ArrayList<Sp>();
			this.conn=this.getConnection();
			String sql="select top(4) * from Sp where jj=?";
			try {
				this.pre=conn.prepareStatement(sql);
				pre.setString(1, xq);
				this.set=pre.executeQuery();
				while(set.next()){
					Sp s=new Sp();
					s.setSpId(set.getInt("spId"));
					s.setSpName(set.getString("spName"));
					s.setSpTp(set.getString("spTp"));
					s.setSpxMoney(set.getString("spxMoney"));
					s.setJf(set.getInt("jf"));
					s.setSpXTypeId(set.getInt("spXtypeId"));
					lisy.add(s);
				}
				
				
			} catch (SQLException e) {
				
				e.printStackTrace();
			}
			
			return lisy;
		}
		//商品评价
		public Pl findpl(int spid) {
			String sql="select plString,plType from pl where spid=?";
			Pl pl=null;
			try {
				this.conn=this.getConnection();
				this.pre=this.conn.prepareStatement(sql);
				this.pre.setInt(1, spid);
				this.set=this.pre.executeQuery();
				if(this.set.next()){
					pl=new Pl();
					pl.setPlString(this.set.getString(1));
					pl.setPlType(this.set.getString(2));
				}
			} catch (Exception e) {
				e.printStackTrace();
			}
			return pl;
		}
		//商品评价总数
		public int countPj(int spid) {
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
		/**
		 * 通过大类型 找小类型 在商品
		 */			
		public List<Sp> findsyxs(int SpType,int spx) {
			List<Sp> lisy=new ArrayList<Sp>();
			String sql="select top(8 )* from Sp where spTypeId=? and spXTypeid=?";
			this.conn=this.getConnection();
			try {
				this.pre=conn.prepareStatement(sql);
				pre.setInt(1, SpType);
				pre.setInt(2, spx);
				this.set=pre.executeQuery();
				while(set.next()){
					Sp s=new Sp();
					s.setSpId(set.getInt("spId"));
					s.setSpTp(set.getString("spTp"));
					s.setSpName(set.getString("spName"));
					s.setSpxMoney(set.getString("spxMoney"));
					s.setSpXTypeId(set.getInt("spXTypeid"));
					lisy.add(s);
				}
			} catch (SQLException e) {
				e.printStackTrace();
			}
			return lisy;
		}
	
	
		
		//商品详情页
		public Sp findxqsp(int spid) {
			Sp sp=null;
			String sql="select spName,spyMoney,spxMoney,spMs,spBh,jf,spTp,kc,spXtypeId,spId from Sp where spId=?";//商品名称，原价，现价，描述，编号，积分
			try {
				this.conn=this.getConnection();
				this.pre=this.conn.prepareStatement(sql);
				this.pre.setInt(1, spid);
				this.set=this.pre.executeQuery();
				if(this.set.next()){
					sp=new Sp();
					sp.setSpName(this.set.getString(1));
					sp.setSpyMoney(this.set.getString(2));
					sp.setSpxMoney(this.set.getString(3));
					sp.setSpMs(this.set.getString(4));
					sp.setSpBh(this.set.getString(5));
					sp.setJf(this.set.getInt(6));
					sp.setSpTp(this.set.getString(7));
					sp.setKc(this.set.getString(8));
					sp.setSpXTypeId(set.getInt("spXtypeId"));
					sp.setSpId(set.getInt("spId"));
				}
			} catch (Exception e) {
				e.printStackTrace();
			}
			return sp;
		}
		//商品图片详情页
		public List<Spimgae> findxqImage(int spid) {
			List<Spimgae> spList=new ArrayList<Spimgae>();
			String sql="select imageurl from Spimgae where spid=?";
			try {
				this.conn =this.getConnection();
				this.pre=this.conn.prepareStatement(sql);
				this.pre.setInt(1, spid);
				this.set=this.pre.executeQuery();
				while(this.set.next()){
					Spimgae spimage=new Spimgae();
					spimage.setImageurl(this.set.getString(1));
					spList.add(spimage);
				}
			} catch (Exception e) {
				e.printStackTrace();
			}
			return spList;
		}

		public List<Sp> findSpPxGetXl(int spXTypeId) {
			List<Sp> sps=new ArrayList<Sp>();
			try {
				String sql="select top 8 spId,spName,spTp,spxMoney,jf from sp where spXTypeid=? order by xl desc";
				pre=conn.prepareStatement(sql);
				pre.setInt(1,spXTypeId);
				set=pre.executeQuery();
				while(set.next()){
					Sp s=new Sp();
					s.setSpId(set.getInt("spId"));
					s.setSpName(set.getString("spName"));
					s.setSpTp(set.getString("spTp"));
					s.setSpxMoney(set.getString("spxMoney"));
					s.setJf(set.getInt("jf"));
					sps.add(s);
				}
			} catch (Exception e) {
				e.printStackTrace();
			}
			return sps;
		}
		/* 通过收索框查询想要的商品
		 * 
		 * @see com.lz.dao.ISpDao#findSpLike(java.lang.String)
		 */
		public List<Sp> findSpLike(String string, Page pg) {
			List<Sp> sps=new ArrayList<Sp>();
			try {
				conn=getConnection();
				String sql="select top "+pg.getPageSize()+
						" * from sp " +
						"inner join SpType on sp.spTypeId=SpType.spTypeId " +
						"inner join spXType on sp.spXTypeid=spXType.spxTypeId " +
						"where spName like '%'+?+'%' or jj like '%'+?+'%' or spxTypeName like '%'+?+'%' or spTypeName like '%'+?+'%'" +
						" and spId not in(select top "+(pg.getCurrPageNo()-1)*pg.getPageSize()+" spId from sp " +
						"where spName like '%'+?+'%' or jj like '%'+?+'%' or spxTypeName like '%'+?+'%' or spTypeName like '%'+?+'%' )";
				pre=conn.prepareStatement(sql);
				pre.setString(1,string);
				pre.setString(2,string);
				pre.setString(3,string);
				pre.setString(4,string);
				pre.setString(5,string);
				pre.setString(6,string);
				pre.setString(7,string);
				pre.setString(8,string);
				set=pre.executeQuery();
				while (set.next()) {
					Sp s=new Sp();
					s.setSpId(set.getInt("spId"));
					s.setSpName(set.getString("spName"));
					s.setSpTp(set.getString("spTp"));
					s.setXl(set.getInt("xl"));
					s.setSpxMoney(set.getString("spxMoney"));
					s.setJf(set.getInt("jf"));
					s.setSptime(set.getDate("spTime"));
					s.setPlNum(plDao.findPlCount(set.getInt("spId")));
					s.setSpXTypeId(set.getInt("spXTypeId"));
					sps.add(s);
				}
			} catch (Exception e) {
				e.printStackTrace();
			}
			return sps;
		}
		/**
		 * 查询收索框搜索的数量
		 */
		public int findSpListCount(String string) {
			try {
				conn=getConnection();
				String sql="select count(*) from sp " +
						"inner join SpType on sp.spTypeId=SpType.spTypeId " +
						"inner join spXType on sp.spXTypeid=spXType.spxTypeId " +
						"where spName like '%'+?+'%' or jj like '%'+?+'%' or spxTypeName like '%'+?+'%' or spTypeName like '%'+?+'%'";
				pre=conn.prepareStatement(sql);
				pre.setString(1,string);
				pre.setString(2,string);
				pre.setString(3,string);
				pre.setString(4,string);
				set=pre.executeQuery();
				while (set.next()) {
					return set.getInt(1);
				}
			} catch (Exception e) {
				e.printStackTrace();
			}
			return 0;
		}
		/**
		 * 库存减少
		 */
		public boolean updatespkc(int uid) {
			this.conn=this.getConnection();
			
			String sql="update Sp set kc=kc-(select spNum from Dd where uId="+uid+" and ddType='待付款') where spId=(select spId from Dd where uId="+uid+" and ddType='待付款')";
			try {
				this.pre=conn.prepareStatement(sql);
				int i=pre.executeUpdate();
				if(i>0){
					return true;
				}
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
			return false;
		}

}















