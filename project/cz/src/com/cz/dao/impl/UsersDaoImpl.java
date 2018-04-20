package com.cz.dao.impl;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.cz.dao.BaseDao;
import com.cz.dao.IUsersDao;
import com.cz.entity.Users;

public class UsersDaoImpl extends BaseDao implements IUsersDao {
	
	//注册
	public boolean insertUser(String name, String pwd) {
		this.conn=this.getConnection();
		String sql="insert into Users(uName,uPwd) values(?,?)";
		Object[]ob={name,pwd};
		if(this.exceUpdate(sql, ob)>0){
			return true;
		}
		return false;
	}
	//登录
	public Users findbypwd(String name, String pwd) {
		try {
			this.conn=this.getConnection();
			String sql="select * from Users where uName=? and uPwd=?";
			this.pre=conn.prepareStatement(sql);
			pre.setString(1, name);
			pre.setString(2, pwd);
			this.set=pre.executeQuery();
			while(set.next()){
				Users u=new Users();
				u.setuId(set.getInt(1));
				u.setuName(set.getString(2));
				u.setuPwd(set.getString(3));
				u.setName(set.getString(4));
				u.setSex(set.getString(5));
				u.setPhone(set.getString(6));
				u.setAddress(set.getString(7));
				u.setJf(set.getInt(8));
				u.setuTx(set.getString(9));
				u.setuMoney(set.getDouble(10));
				return u;
			}
		} catch (SQLException e) {
			
			e.printStackTrace();
		}
		
		return null;
	}
	
	//查询个人信息
		public Users findU(int uId) {
			try {
				conn=getConnection();
				String sql="select * from Users where uId=?";
				pre=conn.prepareStatement(sql);
				pre.setInt(1,uId);
				set=pre.executeQuery();
				while (set.next()) {
					Users user=new Users();
					user.setuId(set.getInt("uId"));
					user.setuName(set.getString("uName"));
					user.setPhone(set.getString("phone"));
					user.setuTx(set.getString("uTx"));
					user.setJf(set.getInt("jf"));
					user.setName(set.getString("name"));
					user.setSex(set.getString("sex"));
					return user;
				}
			} catch (Exception e) {
				e.printStackTrace();
			}
			return null;
		}
	//修改用户头像
		public int updateUTx(int uId, String uTx) {
			try {
				String sql="update Users set utx=?  where uid=?";
				Object[] pats={uTx,uId};
				return exceUpdate(sql, pats);
			} catch (Exception e) {
				e.printStackTrace();
			}
			return 0;
		}
		
		
		//修改用户名和性别
		public int updateUXx(int uId, String uName, String Sex) {
			try {
				String sql="update Users set uName=?,sex=?  where uid=?";
				Object[] pats={uName,Sex,uId};
				return exceUpdate(sql, pats);
			} catch (Exception e) {
				e.printStackTrace();
			}
			return 0;
		}
		
		//通过原密码修改密码
		public int updatemmGetymm(String mm,int uId, String ymm) {
			try {
				String sql="update users set uPwd=? where uId=? and uPwd=?";
				Object[] pats={mm,uId,ymm};
				return exceUpdate(sql, pats);
			} catch (Exception e) {
				e.printStackTrace();
			}
			return 0;
		}
		
		//通过手机号修改密码
		public int updatemmGetphone(String mm, int uId, String phone) {
			try {
				String sql="update users set uPwd=? where uId=? and phone=?";
				Object[] pats={mm,uId,phone};
				return exceUpdate(sql, pats);
			} catch (Exception e) {
				e.printStackTrace();
			}
			return 0;
		}
		
		//通过密码修改手机号
		public int updatephoneGetmm(String phone, int uId, String mm) {
			try {
				String sql="update users set phone=? where uId=? and uPwd=?";
				Object[] pats={phone,uId,mm};
				return exceUpdate(sql, pats);
			} catch (Exception e) {
				e.printStackTrace();
			}
			return 0;
		}
		/**
		 * 修改个人信息
		 */
		public boolean updateusers(Users u) {
			String sql="update Users set name=?,address= ?,phone=?,jf=?,uMoney=? WHERE uId=?";
			Object[] ss={u.getName(),u.getAddress(),u.getPhone(),u.getJf(),u.getuMoney(),u.getuId()};
			int i=this.exceUpdate(sql, ss);
			if(i>0){
				return true;
			}
			return false;
		}

		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
}
