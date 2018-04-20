package com.serenity.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

/**
 * 连接工厂
 */
public class ConnectionFacotry {

	private static ConnectionFacotry cf = new ConnectionFacotry();
	
	private static String username = "scott";
	private static String password = "666";
	//@数据库位置:端口:实例名
	private static String url = "jdbc:oracle:thin:@localhost:1521:orcl";
	
	//私有构造方法，在类外不可以创建该类的其他对象
	//加载驱动
	private ConnectionFacotry() {
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}
	}
	
	/**
	 * 获取数据库链接对象
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
	 * 关闭结果集
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
	 * 关闭语句对象
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
	 * 关闭链接对象
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
