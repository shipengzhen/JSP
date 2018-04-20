package com.serenity.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.serenity.entity.Student;

public class StudentDao {
	
	/**
	 * ���ѧ����Ϣ
	 * @return ����˼���
	 */
	public  int add(Student stu) {
		String addsql = "insert into student(sno,sname,age) values(?,?,?)";
		try {
			//�������ݿ�
			Connection connection = ConnectionFacotry.getConnection();
			PreparedStatement prepareStatement = connection.prepareStatement(addsql);
			//�������
			prepareStatement.setInt(1, stu.getsNo());
			prepareStatement.setString(2, stu.getsName());
			prepareStatement.setInt(3, stu.getAge());
			int executeUpdate = prepareStatement.executeUpdate();
			
			//�رսӿ�
			ConnectionFacotry.close(prepareStatement);
			ConnectionFacotry.close(connection);
			
			return executeUpdate;
		} catch (SQLException e) {
			e.printStackTrace();
			return -1;
		}
	}

	/**
	 * ��ѯ
	 * @return
	 */
	public List<Student> findAll() {
		
		String findSql = "select * from student";
		List<Student> students = new ArrayList<Student>();
		try {
			//�������ݿⲢִ��sql����
			Connection connection = ConnectionFacotry.getConnection();
			PreparedStatement prepareStatement = connection.prepareStatement(findSql);
			//��������
			ResultSet resultSet = prepareStatement.executeQuery();
			while (resultSet.next()) {
				int sNo = resultSet.getInt("sno");
				String sName = resultSet.getString("sname");
				int age = resultSet.getInt("age");
				Student s = new Student();
				s.setsNo(sNo);
				s.setsName(sName);
				s.setAge(age);
				
				students.add(s);
			}
			
			ConnectionFacotry.close(resultSet);
			ConnectionFacotry.close(prepareStatement);
			ConnectionFacotry.close(connection);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return students;
	}
	
	/**
	 * ����sno�����Ϣ
	 * @param _sno
	 * @return
	 */
	public Student findviewByid(int _sno) {

		String findSql = "select * from student where sno=?";
		try {
			//�������ݿⲢִ��sql����
			Connection connection = ConnectionFacotry.getConnection();
			PreparedStatement prepareStatement = connection.prepareStatement(findSql);
			prepareStatement.setInt(1, _sno);
			//��������
			ResultSet resultSet = prepareStatement.executeQuery();
			
			resultSet.next();
		
			int sNo = resultSet.getInt("sno");
			String sName = resultSet.getString("sname");
			int age = resultSet.getInt("age");
			
			Student s = new Student();
			s.setsNo(sNo);
			s.setsName(sName);
			s.setAge(age);
			
			ConnectionFacotry.close(resultSet);
			ConnectionFacotry.close(prepareStatement);
			ConnectionFacotry.close(connection);
			
			return s;
		} catch (SQLException e) {
			e.printStackTrace();
			return null;
		}
	}

	/**
	 * �޸�����
	 * @param stu
	 */
	public void modify(Student stu) {
		String modsql = "update student set sname=?, age = ? where sno = ?";
		try {
			//�������ݿ�
			Connection connection = ConnectionFacotry.getConnection();
			PreparedStatement prepareStatement = connection.prepareStatement(modsql);
			//�޸�����
			prepareStatement.setString(1, stu.getsName());
			prepareStatement.setInt(2, stu.getAge());
			prepareStatement.setInt(3, stu.getsNo());
			prepareStatement.executeUpdate();
			
			//�رսӿ�
			ConnectionFacotry.close(prepareStatement);
			ConnectionFacotry.close(connection);
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	/**
	 * ɾ��
	 * @param sno
	 */
	public void delete(int sno) {
		String delSql= "delete student where sno= ?";
		
		try {
			//�������ݿ�
			Connection connection = ConnectionFacotry.getConnection();
			PreparedStatement prepareStatement = connection.prepareStatement(delSql);
			//ִ�в���
			prepareStatement.setInt(1, sno);
			prepareStatement.executeUpdate();
			//�رսӿ�
			ConnectionFacotry.close(prepareStatement);
			ConnectionFacotry.close(connection);
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		
	}
}
