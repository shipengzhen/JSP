package com.bdqn.memberinfomtion.util;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;


public class BaseDao {
	private String driver="com.microsoft.sqlserver.jdbc.SQLServerDriver";
	private String url="jdbc:sqlserver://localhost:1433;DataBaseName=Membersinfo";
	private String user="spz";
	private String password="shipengzhen1997";
	
	protected Connection connection;
	protected PreparedStatement preparedStatement;
	protected ResultSet resultSet;
	
	/**
	 * ����Connection����
	 * @return
	 */
	protected Connection getConnection(){
		try {
			Class.forName(driver);
			connection=DriverManager.getConnection(url, user, password);
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		}catch (Exception e) {
		}
		
		return connection;
	}
	
	/**
	 * ��ȡPreparedStatement
	 * @return
	 */
	protected PreparedStatement getPreparedStatement(String sql,Object[] objects){
		try {
			getConnection();
			preparedStatement=connection.prepareStatement(sql);
			if (objects!=null) {
				for (int i = 0; i < objects.length; i++) {
					preparedStatement.setObject(i+1,objects[i]);
				}
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}catch (Exception e) {
			e.printStackTrace();
		}
		return preparedStatement;
	}
	
	/**
	 * ��ѯ
	 * @param sql
	 * @param objects
	 * @return
	 */
	protected ResultSet selectResultSet(String sql,Object[] objects){
		try {
			getPreparedStatement(sql,objects);
			return preparedStatement.executeQuery();
		} catch (SQLException e) {
			e.printStackTrace();
		}catch (Exception e) {
			e.printStackTrace();
		}
		return resultSet;
	}
	
	/**
	 * ��ɾ��
	 * @return
	 */
	protected int exUpdate(String sql,Object[] objects){
		try {
			getPreparedStatement(sql,objects);
			return preparedStatement.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}catch (Exception e) {
			e.printStackTrace();
		}
		return 0;
	}
	
	/**
	 * �ر�
	 */
	protected void closeConnection(){
		try {
			if(resultSet!=null){
				resultSet.close();
			}
			if(preparedStatement!=null){
				preparedStatement.close();
			}
			if(connection!=null){
				connection.close();
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
}
