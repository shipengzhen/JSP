package com.meetingroom.dao;

import java.sql.*;


public class BaseDao {
	
	private String driver ="com.microsoft.sqlserver.jdbc.SQLServerDriver";
	private String	url ="jdbc:sqlserver://localhost:1433;DatabaseName=Meeting;?useUnicode=true&characterEncoding=utf-8";
	private	String	user ="spz";
	private	String	password ="shipengzhen1997";
	protected Connection connection;
	protected PreparedStatement preparedStatement;
	protected ResultSet resultSet;
	
	protected Connection getConnection(){
		try {
//			Context context=new InitialContext();
//			DataSource dataSource=(DataSource)context.lookup("java:comp/env/NewsManagerSystem");
//			connection=dataSource.getConnection();
			Class.forName(driver);
			connection=DriverManager.getConnection(url, user, password);
		}catch (SQLException e) {
			e.printStackTrace();
		}catch (ClassNotFoundException e) {
			e.printStackTrace();
		}
		return connection;
	}
	
	protected int exceUpdate(String sql, Object[] pats) {
		int ret = 0;
		connection =getConnection();
		try {
			preparedStatement =connection.prepareStatement(sql);
			if (pats!=null) {
				for (int i = 0; i < pats.length; i++) {
					preparedStatement.setObject(i+1,pats[i]);
				}
			}
			ret=preparedStatement.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}finally{
			closeAll();
		}
		return ret;
	}
	protected void closeAll() {
		if (resultSet!=null) {
			try {
				resultSet.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		if (preparedStatement!=null) {
			try {
				preparedStatement.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		if (connection!=null) {
			try {
				connection.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
	}
}
