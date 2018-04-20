package com.dao.impl;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

/**
 * 数据库的封装，数据访问层的所有实现类都应该继承自此类
 * @author 包小栋
 *
 */
public class BaseDao {
	//驱动字符串
	String QD="com.microsoft.sqlserver.jdbc.SQLServerDriver";
	//链接字符串
	String link="jdbc:sqlserver://localhost:1433;DatabaseName=forum";
	//用户名
	String name="sa";
	//密码
	String pwd="sasa";
	//链接对象
	Connection conn=null;
	//执行接口 PreParedStatement 
	PreparedStatement pst=null;
	//结果集
	ResultSet set=null;
	/**
	 * 获得链接
	 * @return
	 */
	public Connection getConn(){
		try {
			
			//加载驱动
			Class.forName(QD);
			//获得链接
			conn=DriverManager.getConnection(link,name,pwd);
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return conn;
	}
	/**
	 * 查询，返回ResultSet
	 * @param sql
	 * @param params
	 * @return
	 */
	public ResultSet getExecuteQuery(String sql,Object[]params){
		//先声明
		ResultSet rs=null;
		try {
			getConn();//打开链接
			PreparedStatement ps=conn.prepareStatement(sql);
			//传递参数
			if (params!=null) {
				for (int i = 0; i < params.length; i++) {
					ps.setObject(i+1, params[i]);
				}
			}
			//执行
			rs=ps.executeQuery();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return rs;
	}
	/**
	 * 增删改，返回受影响行数
	 */
	public int getExecuteUpdate(String sql,Object[]params) {
		int fan=-1;
		try {
			getConn();//打开链接
			PreparedStatement ps=conn.prepareStatement(sql);
			//传递参数
			if (params!=null) {
				for (int i = 0; i < params.length; i++) {
					ps.setObject(i+1, params[i]);
				}
			}
			//执行
			fan=ps.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return fan;
	}
	/**
	 * 释放资源
	 */
	public void closeConn() {
		if (conn!=null) {
			try {
				conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
	}	
}