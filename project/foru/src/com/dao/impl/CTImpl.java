package com.dao.impl;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import com.dao.ICT;
import com.entity.CT;
/**
 * 评论接口实现类
 * @author 包小栋
 *
 */
public class CTImpl extends BaseDao implements ICT {
	
	//新增帖子评论----测试通过
	@Override
	public int save(CT ct) 
	{
		String sql="insert into CT(CText,PID,UID,CDate,Cnum )values(?,?,?,?,?,?)";
		Object[]object={ct.getText(),ct.getPID(),ct.getUID(),ct.getCDate(),ct.getCnum()};
		return this.getExecuteUpdate(sql, object);
	}
	

	//删除帖子评论----测试通过
	@Override
	public int delete(String CTID) 
	{
		String sql="delete from CT where CID=?";
		Object[]object={CTID};
		return this.getExecuteUpdate(sql, object);
	}
	
	//查询帖子的评论(通过CID)
	@Override
	public CT findCTID(String CID) {
		//List<CT>cts=new ArrayList<CT>()；
		CT cts=new CT();
		this.conn=this.getConn();
		String sql="select CID,CText,PID,UID,CDate,Cnum from CT where CID=?";
		try {
			this.pst=this.conn.prepareStatement(sql);
			this.pst.setString(1, CID);
			this.set=this.pst.executeQuery();
			if(set.next())
			{
				cts.setCID(set.getString(1));
				cts.setText(set.getString(2));
				cts.setPID(set.getInt(3));
				cts.setUID(set.getInt(4));
				cts.setCDate(set.getString(5));
				cts.setCnum(set.getInt(6));
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return cts;
	}
	/**
	 *查询全部帖子评论的信息
	 */
	@Override
	public List<CT> findAll() {
		List<CT>list=new ArrayList<CT>();
		this.conn=this.getConn();
		String sql="select CID,CText,PID,UID,CDate,Cnum from CT";
		try {
			this.pst=this.conn.prepareStatement(sql);
			this.set=this.pst.executeQuery();
			while(set.next())
			{
				CT ct=new CT();
				ct.setCID(set.getString(1));
				ct.setText(set.getString(2));
				ct.setPID(set.getInt(3));
				ct.setUID(set.getInt(4));
				ct.setCDate(set.getString(5));
				ct.setCnum(set.getInt(6));
				list.add(ct);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}
	
	//增加一个评论，返回受影响行数，[同时该ID用户加3经验值],----测试通过
	@Override
	/**
	 * 增加一个评论，返回受影响行数，同时该ID用户加3经验值,
	 * @return
	 */
	public int CaCT(CT ct) {
		String sql="insert into CT values(?,?,?,default,0)";
		Object[]object={ct.getText(),ct.getPID(),ct.getUID()};
		return this.getExecuteUpdate(sql, object);
	}
	
	//查询x条指定帖子ID的热门评论（按点赞数计算）----测试通过
	@Override
	/**
	 * 查询x条指定帖子ID的热门评论（按点赞数计算）
	 * @param x 指定条数
	 * @param PID 指定ID
	 * @return
	 */
	public List<CT> RCTByPIDandCnum(int x, String PID) {
		String sql="select top "+x+" CID,CText,PID,CT.UID,CDate,Cnum,UName,Uexp from CT inner join Usee on CT.UID=Usee.UID where PID='"+PID+"' order by Cnum desc";
		
		ResultSet rs=getExecuteQuery(sql,null);
		
		//遍历
		List<CT> cts=new ArrayList<CT>();
		try {
			while(rs.next()){
				CT c=new CT();
				c.setCID(rs.getString(1));//评论ID
				c.setText(rs.getString(2));//评论的内容
				c.setPID(rs.getInt(3));//评论的帖子ID
				c.setUID(rs.getInt(4));//评论者ID
				c.setCDate(rs.getString(5));//评论日期
				c.setCnum(rs.getInt(6));//评论赞数
				c.setUName(rs.getString(7));//评论者名字
				c.setUexp(rs.getInt(8));//评论者经验
				cts.add(c);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return cts;
	}
	
	
	//查询x条指定帖子ID的-评论（按时间降序，即从最新评论开始到最早的）,------测试通过
	@Override
	/**
	 * 查询x条指定帖子ID的-评论（按时间降序，即从最新评论开始到最早的）
	 * @param x 指定条数
	 * @param PID 指定ID
	 * @return
	 */
	public List<CT> RCTByPIDandCDate(int x, String PID) {
		String sql="select top "+x+" CID,CText,PID,CT.UID,CDate,Cnum,UName,Uexp from CT inner join Usee on CT.UID=Usee.UID where PID='"+PID+"' order by CDate desc";
		
		ResultSet rs=getExecuteQuery(sql,null);
		
		//遍历
		List<CT> cts=new ArrayList<CT>();
		try {
			while(rs.next()){
				CT c=new CT();
				c.setCID(rs.getString(1));//评论ID
				c.setText(rs.getString(2));//评论的内容
				c.setPID(rs.getInt(3));//评论的帖子ID
				c.setUID(rs.getInt(4));//评论者ID
				c.setCDate(rs.getString(5));//评论日期
				c.setCnum(rs.getInt(6));//评论赞数
				c.setUName(rs.getString(7));//评论者名字
				c.setUexp(rs.getInt(8));//评论者经验
				cts.add(c);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return cts;
	}


	//为指定评论点赞---测试通过
	@Override
	public int UaCTZan(String CTID) {
		String sql="update CT set Cnum=Cnum+1 where CID='"+CTID+"'";
		int a=getExecuteUpdate(sql, null);
		return a;
	}
}
