package com.cz.dao;

import java.sql.*;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;


public class BaseDao {
	

	private static final String DRIVER = "com.microsoft.sqlserver.jdbc.SQLServerDriver";
	private static final String URL = "jdbc:sqlserver://localhost:1433;DatabaseName=shop";
	private static final String USER_STRING = "spz";
	private static final String PWD_STRING = "shipengzhen1997";
	protected Connection conn = null;
	protected PreparedStatement pre = null;
	protected ResultSet set = null;

	protected Connection getConnection() {
			try {
				Class.forName(DRIVER);
				conn=DriverManager.getConnection(URL, USER_STRING, PWD_STRING);
			} catch (ClassNotFoundException e) {
				e.printStackTrace();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		return conn;
	}
	//增删�?
	protected int exceUpdate(String sql, Object[] pats) {
		int ret = 0;
		conn =getConnection();
		try {
			pre =conn.prepareStatement(sql);
			if (pats!=null) {
				for (int i = 0; i < pats.length; i++) {
					pre.setObject(i+1,pats[i]);
				}
			}
			ret=pre.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return ret;
	}
}












