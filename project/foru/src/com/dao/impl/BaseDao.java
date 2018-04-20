package com.dao.impl;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

/**
 * ���ݿ�ķ�װ�����ݷ��ʲ������ʵ���඼Ӧ�ü̳��Դ���
 * @author ��С��
 *
 */
public class BaseDao {
	//�����ַ���
	String QD="com.microsoft.sqlserver.jdbc.SQLServerDriver";
	//�����ַ���
	String link="jdbc:sqlserver://localhost:1433;DatabaseName=forum";
	//�û���
	String name="sa";
	//����
	String pwd="sasa";
	//���Ӷ���
	Connection conn=null;
	//ִ�нӿ� PreParedStatement 
	PreparedStatement pst=null;
	//�����
	ResultSet set=null;
	/**
	 * �������
	 * @return
	 */
	public Connection getConn(){
		try {
			
			//��������
			Class.forName(QD);
			//�������
			conn=DriverManager.getConnection(link,name,pwd);
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return conn;
	}
	/**
	 * ��ѯ������ResultSet
	 * @param sql
	 * @param params
	 * @return
	 */
	public ResultSet getExecuteQuery(String sql,Object[]params){
		//������
		ResultSet rs=null;
		try {
			getConn();//������
			PreparedStatement ps=conn.prepareStatement(sql);
			//���ݲ���
			if (params!=null) {
				for (int i = 0; i < params.length; i++) {
					ps.setObject(i+1, params[i]);
				}
			}
			//ִ��
			rs=ps.executeQuery();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return rs;
	}
	/**
	 * ��ɾ�ģ�������Ӱ������
	 */
	public int getExecuteUpdate(String sql,Object[]params) {
		int fan=-1;
		try {
			getConn();//������
			PreparedStatement ps=conn.prepareStatement(sql);
			//���ݲ���
			if (params!=null) {
				for (int i = 0; i < params.length; i++) {
					ps.setObject(i+1, params[i]);
				}
			}
			//ִ��
			fan=ps.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return fan;
	}
	/**
	 * �ͷ���Դ
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