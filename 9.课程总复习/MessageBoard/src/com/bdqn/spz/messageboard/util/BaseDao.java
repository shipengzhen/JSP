package com.bdqn.spz.messageboard.util;

import java.sql.*;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;


public class BaseDao {
	
	protected Connection connection;
	protected PreparedStatement preparedStatement;
	protected ResultSet resultSet;
	
	protected Connection getConnection(){
		try {
			Context context=new InitialContext();
			DataSource dataSource=(DataSource)context.lookup("java:comp/env/messages");
			connection=dataSource.getConnection();
		}catch (SQLException e) {
			e.printStackTrace();
		} catch (NamingException e) {
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
