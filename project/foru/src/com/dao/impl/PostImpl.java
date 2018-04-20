
package com.dao.impl;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.dao.IPost;
import com.entity.Post;

/**
 * 帖子表接口实现类
 * @author 包小栋
 *
 */
public class PostImpl extends BaseDao implements IPost {

	
	//添加一个帖子
	//-----测试通过
	@Override
	public int CaPost(Post p) {
		String sql="insert into Post values(?,?,?,?,getdate(),?,?,?)";
		Object[]object={p.getPhh(),p.getText(),p.getUID(),p.getTID(),p.getPRead(),p.getPZan(),p.getPCai()};
		int ret=this.getExecuteUpdate(sql, object);
		//如果发表成功,查询其ID号
		if(ret>0){
			sql="select max(PID) from Post";
			ResultSet rs=getExecuteQuery(sql, null);
			try {
				//返回其ID号
				if(rs.next()){
					return rs.getInt(1);
				}
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		
		return -1;
	}
	
	
	//查询自定ID的帖子，返回详细信息-----测试通过
	@Override
	public Post RaPost(String PID) {
		String sql="select PID,Post.Phh,PText,Post.UID,TID,PDate,PRend,pzan,PCai,UName,Uexp from Post inner join Usee on Post.UID=Usee.UID where PID="+PID;
		ResultSet rs=getExecuteQuery(sql,null);
		
		Post p=new Post();
		//遍历
		try {
			if (rs.next()) {
				p.setPID(rs.getString(1));//Post的ID
				p.setPhh(rs.getString(2));//标题
				p.setText(rs.getString(3));//正文
				p.setUID(rs.getInt(4));//发表人用户ID
				p.setTID(rs.getInt(5));//所属分类ID
				p.setPDate(rs.getString(6));//发表时间
				p.setPRead(rs.getInt(7));//阅读量
				p.setPZan(rs.getInt(8));//赞术
				p.setPCai(rs.getInt(9));//猜数
				p.setUName(rs.getString(10));//发表人姓名
				p.setUexp(rs.getString(11));//发表人的经验
			}
		} catch (SQLException e) { 
			e.printStackTrace();
		}
		
		return p;
	}
	
	
	
	
	//按指定-页大小-当前页-的指定分类ID查询帖子列表 -------已经测试通过
	@Override
	/**
	 * 按指定-页大小-当前页-的指定分类ID查询帖子列表 
	 * @param dx 页大小
	 * @param dang 当前页
	 * @param TID 分类ID
	 * @return
	 */
	public List<Post> RPostByFenTID(int dx, int dang, String TID) {
		//为不限做准备
		if(TID==null||"".equals(TID)){
			TID="TID";
		}
		String sql="select top "+dx+" PID,Post.Phh,PText,Post.UID,TID,PDate,PRend,pzan,PCai,UName,Uexp from Post inner join Usee on Post.UID=Usee.UID where TID="+TID+" and PID not in(select top (("+dang+"-1)*"+dx+") PID from Post where TID="+TID+"  order by PDate desc,PID desc)  order by PDate desc,PID desc";
		System.out.println(sql);
		ResultSet rs=getExecuteQuery(sql, null);
		
		//遍历
		List<Post>ps=new ArrayList<Post>();
		try {
			while(rs.next()){
				Post p=new Post();
				p.setPID(rs.getString(1));//Post的ID
				p.setPhh(rs.getString(2));//标题
				p.setText(rs.getString(3));//正文
				p.setUID(rs.getInt(4));//发表人用户ID
				p.setTID(rs.getInt(5));//所属分类ID
				p.setPDate(rs.getString(6));//发表时间
				p.setPRead(rs.getInt(7));//阅读量
				p.setPZan(rs.getInt(8));//赞术
				p.setPCai(rs.getInt(9));//猜数
				p.setUName(rs.getString(10));//发表人姓名
				p.setUexp(rs.getString(11));//发表人的经验
				
				ps.add(p);
				
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		
		return ps;
	}
	
	//按指定-页大小-当前页-的指定用户ID查询帖子列表-------已经测试通过
	@Override
	/**
	 * 按指定-页大小-当前页-的指定用户ID查询帖子列表
	 * @param dx 页大小
	 * @param dang 当前页
	 * @param UID 用户ID
	 * @return
	 */
	public List<Post> RPostByFenUID(int dx, int dang, String UID) {

		String sql="select top "+dx+" PID,Post.Phh,PText,Post.UID,TID,PDate,PRend,pzan,PCai,UName,Uexp from Post inner join Usee on Post.UID=Usee.UID where Post.UID="+UID+" and PID not in(select top (("+dang+"-1)*"+dx+") PID from Post where Post.UID='"+UID+"'  order by PDate desc)  order by PDate desc";
		
		ResultSet rs=getExecuteQuery(sql, null);
		
		//遍历
		List<Post>ps=new ArrayList<Post>();
		try {
			while(rs.next()){
				Post p=new Post();
				p.setPID(rs.getString(1));//Post的ID
				p.setPhh(rs.getString(2));//标题
				p.setText(rs.getString(3));//正文
				p.setUID(rs.getInt(4));//发表人用户ID
				p.setTID(rs.getInt(5));//所属分类ID
				p.setPDate(rs.getString(6));//发表时间
				p.setPRead(rs.getInt(7));//阅读量
				p.setPZan(rs.getInt(8));//赞术
				p.setPCai(rs.getInt(9));//猜数
				p.setUName(rs.getString(10));//发表人姓名
				p.setUexp(rs.getString(11));//发表人的经验
				
				ps.add(p);
				
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		
		return ps;
	}
	
	
	//删除指定ID帖子，返回受影响行数----测试通过
	@Override
	/**
	 * 删除指定ID帖子，返回受影响行数
	 */
	public int DaPost(int PID) {
		//先删评论
		String sql="delete from CT where PID='"+PID+"'";
		getExecuteUpdate(sql, null);
		//再删它！
		String sqq="delete from Post where PID='"+PID+"'";
		
		int a=getExecuteUpdate(sqq, null);
		
		return a;
	}
	
	// 按照指定分类ID获得x条随机帖子，不可重复---测试通过
	@Override
	/**
	 * 按照指定分类ID获得x条随机帖子，不可重复
	 * @param TID 类型ID
	 * @param x 要获得的帖子数
	 * @return
	 */
	public List<Post> RPostByTIDandX(String TID, int x) {
		//为不限做准备
		if(TID==null||"".equals(TID)){
			TID="TID";
		}
		
		//获得总数 
		int count=this.RPostCount(TID);
		//能分多少页
		int zong=count%x==0?count/x:count/x+1;
		//随机一页
		int sui=(int)(Math.random()*zong+1);
		
		//偷梁换柱
		return RPostByFenTID(x, sui,TID);
	}
	
	
	//按指定-页大小-当前页-查询热门（按照点赞数计算）的帖子（不分帖子种类）-----测试通过
	@Override
	/**
	 *  按指定-页大小-当前页-查询热门（按照点赞数计算）的帖子（不分帖子种类）
	 * @param dx 页大小
	 * @param dang 当前页
	 * @return
	 */
	public List<Post> RPostByPZan(int dx, int dang) {
		//为不限做准备
		String sql="select top "+dx+" PID,Post.Phh,PText,Post.UID,TID,PDate,PRend,pzan,PCai,UName,Uexp from Post inner join Usee on Post.UID=Usee.UID where PID not in(select top (("+dang+"-1)*"+dx+") PID from Post order by PZan desc)  order by PZan desc";
		
		ResultSet rs=getExecuteQuery(sql, null);
		
		//遍历
		List<Post>ps=new ArrayList<Post>();
		try {
			while(rs.next()){
				Post p=new Post();
				p.setPID(rs.getString(1));//Post的ID
				p.setPhh(rs.getString(2));//标题
				p.setText(rs.getString(3));//正文
				p.setUID(rs.getInt(4));//发表人用户ID
				p.setTID(rs.getInt(5));//所属分类ID
				p.setPDate(rs.getString(6));//发表时间
				p.setPRead(rs.getInt(7));//阅读量
				p.setPZan(rs.getInt(8));//赞术
				p.setPCai(rs.getInt(9));//猜数
				p.setUName(rs.getString(10));//发表人姓名
				p.setUexp(rs.getString(11));//发表人的经验
				
				ps.add(p);
				
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		
		return ps;
	}
	
	
	//按指定-页大小-当前页-查询本月（本月一号至今）的------测试通过
	@Override
	/**
	 *  按指定-页大小-当前页-查询本月（本月一号至今）的
	 *  热门（按照点赞数计算）的帖子（不分帖子种类）
	 * @param dx 页大小
	 * @param dang 当前页
	 * @return
	 */
	public List<Post> RPostByPZanMM(int dx, int dang) {
		
		String sql="select top "+dx+" PID,Post.Phh,PText,Post.UID,TID,PDate,PRend,pzan,PCai,UName,Uexp from Post inner join Usee on Post.UID=Usee.UID where DateDiff(mm,PDate,getdate())=0 and PID not in(select top (("+dang+"-1)*"+dx+") PID from Post where DateDiff(mm,PDate,getdate())=0 order by PZan desc)  order by PZan desc";
		//System.out.println(sql);
		ResultSet rs=getExecuteQuery(sql, null);
		
		//遍历
		List<Post>ps=new ArrayList<Post>();
		try {
			while(rs.next()){
				Post p=new Post();
				p.setPID(rs.getString(1));//Post的ID
				p.setPhh(rs.getString(2));//标题
				p.setText(rs.getString(3));//正文
				p.setUID(rs.getInt(4));//发表人用户ID
				p.setTID(rs.getInt(5));//所属分类ID
				p.setPDate(rs.getString(6));//发表时间
				p.setPRead(rs.getInt(7));//阅读量
				p.setPZan(rs.getInt(8));//赞术
				p.setPCai(rs.getInt(9));//猜数
				p.setUName(rs.getString(10));//发表人姓名
				p.setUexp(rs.getString(11));//发表人的经验
				
				ps.add(p);
				
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		
		return ps;
	}

	//询数据库一共有多少条帖子,指定类型
	@Override
	public int RPostCount(String TID) {
		if(TID==null||"".equals(TID)){
			TID="TID";
		}
		
		String sql="select count(1) from Post where TID="+TID;
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

	//指定ID帖子点赞---测试-通过
	@Override
	public int UaPostZan(String PID) {
		String sql="update Post set pzan=pzan+1 where PID='"+PID+"'";
		return getExecuteUpdate(sql, null);
	}

	//指定ID帖子点踩---测试-通过
	@Override
	public int UaPostCai(String PID) {
		String sql="update Post set PCai=PCai+1 where PID='"+PID+"'";
		return getExecuteUpdate(sql, null);
	}

	//指定ID帖子增加阅读量---测试-通过
	@Override
	public int UaPostRead(String PID) {
		String sql="update Post set PRend=PRend+1 where PID='"+PID+"'";
		return getExecuteUpdate(sql, null);
	}


	//根据标题关键词模糊查询X条帖子
	@Override
	public List<Post> RPostByPhhX(String Phh, int x) {
		
		String sql="select top "+x+" PID,Post.Phh,PText,Post.UID,TID,PDate,PRend,pzan,PCai,UName,Uexp from Post inner join Usee on Post.UID=Usee.UID where Phh like '%"+Phh+"%' order by PDate desc";
ResultSet rs=getExecuteQuery(sql, null);
		
		//遍历
		List<Post>ps=new ArrayList<Post>();
		try {
			while(rs.next()){
				Post p=new Post();
				p.setPID(rs.getString(1));//Post的ID
				p.setPhh(rs.getString(2));//标题
				p.setText(rs.getString(3));//正文
				p.setUID(rs.getInt(4));//发表人用户ID
				p.setTID(rs.getInt(5));//所属分类ID
				p.setPDate(rs.getString(6));//发表时间
				p.setPRead(rs.getInt(7));//阅读量
				p.setPZan(rs.getInt(8));//赞术
				p.setPCai(rs.getInt(9));//猜数
				p.setUName(rs.getString(10));//发表人姓名
				p.setUexp(rs.getString(11));//发表人的经验
				
				ps.add(p);
				
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return ps;
	}


	//指定ID账号发过的x帖子
	@Override
	public List<Post> RPostByUID(String UID,int x) {

		String sql="select top "+x+" PID,Post.Phh,PText,Post.UID,TID,PDate,PRend,pzan,PCai,UName,Uexp from Post inner join Usee on Post.UID=Usee.UID where Post.UID = '"+UID+"' order by PDate desc";
ResultSet rs=getExecuteQuery(sql, null);
		
		//遍历
		List<Post>ps=new ArrayList<Post>();
		try {
			while(rs.next()){
				Post p=new Post();
				p.setPID(rs.getString(1));//Post的ID
				p.setPhh(rs.getString(2));//标题
				p.setText(rs.getString(3));//正文
				p.setUID(rs.getInt(4));//发表人用户ID
				p.setTID(rs.getInt(5));//所属分类ID
				p.setPDate(rs.getString(6));//发表时间
				p.setPRead(rs.getInt(7));//阅读量
				p.setPZan(rs.getInt(8));//赞术
				p.setPCai(rs.getInt(9));//猜数
				p.setUName(rs.getString(10));//发表人姓名
				p.setUexp(rs.getString(11));//发表人的经验
				
				ps.add(p);
				
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return ps;
	}

	
}
