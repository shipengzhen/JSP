package com.bdqn.spz.financingproductsys.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;


public class BaseDao {
	private String driver="com.microsoft.sqlserver.jdbc.SQLServerDriver";
	private String url="jdbc:sqlserver://localhost:1433;DataBaseName=Financing";
	private String user="spz";
	private String password="shipengzhen1997";
	
	protected Connection connection;
	protected PreparedStatement preparedStatement;
	protected ResultSet resultSet;
	
	/**
	 * 创建Connection连接
	 * @return Connection
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
	 * 获取PreparedStatement
	 * @return PreparedStatement
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
	 * 查询
	 * @param sql
	 * @return ResultSet
	 */
	protected ResultSet selectResultSet(String sql){
		try {
			getConnection();
			preparedStatement=connection.prepareStatement(sql);
			return preparedStatement.executeQuery();
		} catch (SQLException e) {
			e.printStackTrace();
		}catch (Exception e) {
			e.printStackTrace();
		}
		return resultSet;
	}
	
	/**
	 * 一条件查询返回一张表
	 * @param sql
	 * @param i
	 * @return ResultSet
	 */
	protected ResultSet selectResultSet(String sql,int i){
		try {
			getConnection();
			preparedStatement=connection.prepareStatement(sql);
			preparedStatement.setInt(1,i);
			return preparedStatement.executeQuery();
		} catch (SQLException e) {
			e.printStackTrace();
		}catch (Exception e) {
			e.printStackTrace();
		}
		return resultSet;
	}
	
	
	
	/**
	 * 一条件查询返回一张表
	 * @param sql
	 * @param string
	 * @return ResultSet
	 */
	protected ResultSet selectResultSet(String sql,String string){
		try {
			getConnection();
			preparedStatement=connection.prepareStatement(sql);
			preparedStatement.setString(1,string);
			return preparedStatement.executeQuery();
		} catch (SQLException e) {
			e.printStackTrace();
		}catch (Exception e) {
			e.printStackTrace();
		}
		return resultSet;
	}
	
	/**
	 * 多条件查询返回一张表
	 * @param sql
	 * @param objects
	 * @return ResultSet
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
	 * 查询返回一行一列(受影响行数)
	 * @param sql
	 * @param objects
	 * @return int
	 */
	protected int executeQuerySingle(String sql){
		try {
			resultSet=selectResultSet(sql);
			if (resultSet.next()) {
				return resultSet.getInt(1);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}catch (Exception e) {
			e.printStackTrace();
		}finally{
			closeConnection();
		}
		return 0;
	}
	
	/**
	 * 单条件查询返回一行一列(受影响行数)
	 * @param sql
	 * @param objects
	 * @return int
	 */
	protected int executeQuerySingle(String sql,String string){
		try {
			resultSet=selectResultSet(sql,string);
			if (resultSet.next()) {
				return resultSet.getInt(1);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}catch (Exception e) {
			e.printStackTrace();
		}finally{
			closeConnection();
		}
		return 0;
	}
	
	/**
	 * 单条件查询返回一行一列(受影响行数)
	 * @param sql
	 * @param i
	 * @return int
	 */
	protected int executeQuerySingle(String sql,int i){
		try {
			resultSet=selectResultSet(sql,i);
			if (resultSet.next()) {
				return resultSet.getInt(1);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}catch (Exception e) {
			e.printStackTrace();
		}finally{
			closeConnection();
		}
		return 0;
	}
	/**
	 * 多条件查询返回一行一列(受影响行数)
	 * @param sql
	 * @param objects
	 * @return int
	 */
	protected int executeQuerySingle(String sql,Object[] objects){
		try {
			resultSet=selectResultSet(sql, objects);
			if (resultSet.next()) {
				return resultSet.getInt(1);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}catch (Exception e) {
			e.printStackTrace();
		}finally{
			closeConnection();
		}
		return 0;
	}
	
	
	
	
	/**
	 * 遍历ResultSet并赋值到List
	 * @param rs
	 * @return
	 */
	protected  List<Object[]> resultSetToList(ResultSet rs){
		List<Object[]> lists=new ArrayList<Object[]>();
		try {
			ResultSetMetaData rsmd = rs.getMetaData();
			int colCount=rsmd.getColumnCount();//返回ResultSet中的列数
			String[] colNames=new String[colCount];
			for(int i=0;i<colCount;i++){
				colNames[i]=rsmd.getColumnName(i+1);//获取指定列名称下标从1开始
			} 
			while(rs.next()){
				
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} catch (Exception e) {
			e.printStackTrace();
		}finally{
			closeConnection();
		}
		return lists;
	}
	
	
	/**
	 * 遍历ResultSet并赋值到MapList
	 * @param rs
	 * @return List<Map<String,Object>>
	 */
	protected  List<Map<String,Object>> resultSetToMapList(ResultSet rs){
		List<Map<String,Object>> results=new ArrayList<Map<String,Object>>();
		try {
			ResultSetMetaData rsmd = rs.getMetaData();
			int colCount=rsmd.getColumnCount();//返回ResultSet中的列数
			List<String> colNameList=new ArrayList<String>();
			for(int i=0;i<colCount;i++){
				colNameList.add(rsmd.getColumnName(i+1));//获取指定列名称
			} 
			while(rs.next()){
				for(int i=0;i<colCount;i++){
					Map map=new HashMap<String, Object>();
					String key=colNameList.get(i);
					Object value=rs.getString(colNameList.get(i));
					map.put(key, value);
					results.add(map);
				}
			}
//			String[] colNames=new String[colCount];
//			for(int i=0;i<colCount;i++){
//				colNames[i]=rsmd.getColumnName(i+1);//获取指定列名称下标从1开始
//			} 
//			while(rs.next()){
//				for(int i=0;i<colCount;i++){
//					Map map=new HashMap<String, Object>();
//					String key=colNames[i];
//					Object value=rs.getString(colNames[i]);
//					map.put(key, value);
//					results.add(map);
//				}
//			}
		} catch (SQLException e) {
			e.printStackTrace();
		} catch (Exception e) {
			e.printStackTrace();
		}finally{
			closeConnection();
		}
			return results;
	}
	
	
	/**
	 * 增删改
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
		}finally{
			closeConnection();
		}
		return 0;
	}
	
	/**
	 * 关闭
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
