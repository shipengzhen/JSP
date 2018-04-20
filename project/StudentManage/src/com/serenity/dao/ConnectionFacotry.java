package com.serenity.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

/**
 * ���ӹ���
 */
public class ConnectionFacotry {

	private static ConnectionFacotry cf = new ConnectionFacotry();
	
	private static String username = "scott";
	private static String password = "666";
	//@���ݿ�λ��:�˿�:ʵ����
	private static String url = "jdbc:oracle:thin:@localhost:1521:orcl";
	
	//˽�й��췽���������ⲻ���Դ����������������
	//��������
	private ConnectionFacotry() {
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}
	}
	
	/**
	 * ��ȡ���ݿ����Ӷ���
	 * @return
	 */
	public static Connection getConnection(){
		try {
			return DriverManager.getConnection(url, username, password);
		} catch (SQLException e) {
			e.printStackTrace();
			return null;
		}
	}
	
	/**
	 * �رս����
	 */
	public static void close(ResultSet rs){
		if(null != rs){
			try {
				rs.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
	}
	
	/**
	 * �ر�������
	 * @param stmt
	 */
	public static void close(Statement stmt){
		if(stmt != null ){
			try {
				stmt.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
	}
	/**
	 * �ر����Ӷ���
	 * @param conn
	 */
	public static void close(Connection conn){
		if(null != conn){
			try {
				conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
	}
	
}
