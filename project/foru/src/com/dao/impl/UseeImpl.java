package com.dao.impl;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.dao.IUsee;
import com.entity.Usee;

public class UseeImpl extends BaseDao implements IUsee {
	
	
	
	@Override
	/**
	 * 查询全部用户信息
	 */
	public List<Usee> FindAll() {
		List<Usee>list=new ArrayList<Usee>();
		String sql="select UID,UName,pwd,Uexp,Umoney,Sex,Uxy,UPhone,UEmail,UA from Usee";
		this.conn=this.getConn();
		try {
			this.pst=this.conn.prepareStatement(sql);
			this.set=this.pst.executeQuery();
			while(set.next())
			{
				Usee usee=new Usee();
				usee.setID(set.getString(1));
				usee.setUName(set.getString(2));
				usee.setPwd(set.getString(3));
				usee.setUexp(set.getInt(4));
				usee.setUMoney(set.getInt(5));
				usee.setSex(set.getString(6));
				usee.setUxy(set.getString(7));
				usee.setUPhone(set.getString(8));
				usee.setUEmail(set.getString(9));
				usee.setUA(set.getInt(10));
				list.add(usee);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}
	
	//检查指定用户名和密码是否能够登录成功，成功返回1 不成功返回-1-----测试通过
	@Override
	public int RLogin(String name, String pwd) {
		String sql="select * from Usee where UName='"+name+"' and pwd='"+pwd+"'";
		ResultSet rs=getExecuteQuery(sql, null);
		try {
			//如果有数据
			if(rs.next()){
				return 1;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return -1;
	}
	
	//检查指定用户名和密码是否能够以管理员身份登录成功,成功返回1，不成功返回-1------测试通过
	@Override
	public int RLoginByAdmin(String name, String pwd) {
		String sql="select * from Usee where UA=1 and UName='"+name+"' and pwd='"+pwd+"'";
		ResultSet rs=getExecuteQuery(sql, null);
		try {
			//如果有数据
			if(rs.next()){
				return 1;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return -1;
	}
	
	//返回指定ID用户的详细信息,测试通过-----测试通过
	@Override
	public Usee RaUseeByUID(String UID) {
		//sql语句
		String sql="select * from Usee where UID='"+UID+"'";
		System.out.println(sql);
		//查询
		ResultSet rs=getExecuteQuery(sql, null);
		Usee u=null;
		try {
			if(rs.next()){
				u=new Usee();
				u.setID(rs.getString(1));//ID
				u.setUName(rs.getString(2));//U名字
				u.setPwd(rs.getString(3));//密码
				u.setUexp(rs.getInt(4));//经验
				u.setUMoney(rs.getInt(5));//金币
				u.setSex(rs.getString(6));//性别
				u.setUxy(rs.getString(7));//个性签名
				u.setUPhone(rs.getString(8));//电话
				u.setUEmail(rs.getString(9));//邮箱
				u.setUA(rs.getInt(10));//UA身份，1-普通用户，2-管理员
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return u;
	}

	//注册一位用户（姓名、密码、手机号）,返回受影响的行数，----测试通过
	@Override
	public int CaUsee(Usee us) {
		//sql语句
		String sql="insert into Usee values(?,?,0,0,'男','','','',0)";
		//参数
		Object[]params=new Object[]{us.getUName(),us.getPwd()};
		
		try {
			int a=getExecuteUpdate(sql, params);
			//如果注册成功，我有义务返回其ID号
			if(a>0){
				String sqq="select UID from Usee where UName='"+us.getUName()+"'";
				ResultSet rs=getExecuteQuery(sqq, null);
				//返回Ta的ID
				if(rs.next()){
					return rs.getInt(1);
				}
			}
			
		} catch (Exception e) {
			return -1;
		}
		
		return -1;
	}
	
	
	//修改一位用户资料,返回受影响的行数,------测试通过
	@Override
	public int UaUsee(Usee u) {
		//sql语句
		String sql="update Usee set UName=?,pwd=?,Sex=?,Uxy=?,UPhone=?,UEmail=? where UID=?";
		//参数
		Object[] params=new Object[]{u.getUName(),u.getPwd(),u.getSex(),u.getUxy(),u.getUPhone(),u.getUEmail(),u.getID()};
		//返回受影响行数
		return getExecuteUpdate(sql, params);
	}
	
	//查询指定数量用户,按照等级排序(及用户的经验值倒序排列)----测试通过
	@Override
	public List<Usee> RUsee(int x) {
		
		String sql="select top "+x+" * from Usee order by Uexp desc";
		ResultSet rs=getExecuteQuery(sql, null);
		//遍历填充
		List<Usee>us=new ArrayList<Usee>();
		try {
			while (rs.next()) {
				Usee u=new Usee();
				u.setID(rs.getString(1));//ID
				u.setUName(rs.getString(2));//U名字
				u.setPwd(rs.getString(3));//密码
				u.setUexp(rs.getInt(4));//经验
				u.setUMoney(rs.getInt(5));//金币
				u.setSex(rs.getString(6));//性别
				u.setUxy(rs.getString(7));//个性签名
				u.setUPhone(rs.getString(8));//电话
				u.setUEmail(rs.getString(9));//邮箱
				u.setUA(rs.getInt(10));//UA身份，1-普通用户，2-管理员
				us.add(u);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return us;
	}

	//为指定ID用户增加指定经验,返回受影响行数
	@Override
	public int UxUexp(String UID, int uexp) {
		//sql
		String sql="update Usee set Uexp=Uexp+"+uexp+" where UID='"+UID+"'";
		//
		int a=getExecuteUpdate(sql, null);
		
		return a;
	}

	@Override
	public String RuidByUName(String UName) {
		String sql="select UID from Usee where UName='"+UName+"'";
		ResultSet rs=getExecuteQuery(sql, null);
		try {
			//如果有数据
			if(rs.next()){
				return rs.getString(1);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return null;
	}
	
	
	
}
