package com.dao.impl;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.dao.IUsee;
import com.entity.Usee;

public class UseeImpl extends BaseDao implements IUsee {
	
	
	
	@Override
	/**
	 * ��ѯȫ���û���Ϣ
	 */
	public List<Usee> FindAll() {
		List<Usee>list=new ArrayList<Usee>();
		String sql="select UID,UName,pwd,Uexp,Umoney,Sex,Uxy,UPhone,UEmail,UA from Usee";
		this.conn=this.getConn();
		try {
			this.pst=this.conn.prepareStatement(sql);
			this.set=this.pst.executeQuery();
			while(set.next())
			{
				Usee usee=new Usee();
				usee.setID(set.getString(1));
				usee.setUName(set.getString(2));
				usee.setPwd(set.getString(3));
				usee.setUexp(set.getInt(4));
				usee.setUMoney(set.getInt(5));
				usee.setSex(set.getString(6));
				usee.setUxy(set.getString(7));
				usee.setUPhone(set.getString(8));
				usee.setUEmail(set.getString(9));
				usee.setUA(set.getInt(10));
				list.add(usee);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}
	
	//���ָ���û����������Ƿ��ܹ���¼�ɹ����ɹ�����1 ���ɹ�����-1-----����ͨ��
	@Override
	public int RLogin(String name, String pwd) {
		String sql="select * from Usee where UName='"+name+"' and pwd='"+pwd+"'";
		ResultSet rs=getExecuteQuery(sql, null);
		try {
			//���������
			if(rs.next()){
				return 1;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return -1;
	}
	
	//���ָ���û����������Ƿ��ܹ��Թ���Ա��ݵ�¼�ɹ�,�ɹ�����1�����ɹ�����-1------����ͨ��
	@Override
	public int RLoginByAdmin(String name, String pwd) {
		String sql="select * from Usee where UA=1 and UName='"+name+"' and pwd='"+pwd+"'";
		ResultSet rs=getExecuteQuery(sql, null);
		try {
			//���������
			if(rs.next()){
				return 1;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return -1;
	}
	
	//����ָ��ID�û�����ϸ��Ϣ,����ͨ��-----����ͨ��
	@Override
	public Usee RaUseeByUID(String UID) {
		//sql���
		String sql="select * from Usee where UID='"+UID+"'";
		System.out.println(sql);
		//��ѯ
		ResultSet rs=getExecuteQuery(sql, null);
		Usee u=null;
		try {
			if(rs.next()){
				u=new Usee();
				u.setID(rs.getString(1));//ID
				u.setUName(rs.getString(2));//U����
				u.setPwd(rs.getString(3));//����
				u.setUexp(rs.getInt(4));//����
				u.setUMoney(rs.getInt(5));//���
				u.setSex(rs.getString(6));//�Ա�
				u.setUxy(rs.getString(7));//����ǩ��
				u.setUPhone(rs.getString(8));//�绰
				u.setUEmail(rs.getString(9));//����
				u.setUA(rs.getInt(10));//UA��ݣ�1-��ͨ�û���2-����Ա
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return u;
	}

	//ע��һλ�û������������롢�ֻ��ţ�,������Ӱ���������----����ͨ��
	@Override
	public int CaUsee(Usee us) {
		//sql���
		String sql="insert into Usee values(?,?,0,0,'��','','','',0)";
		//����
		Object[]params=new Object[]{us.getUName(),us.getPwd()};
		
		try {
			int a=getExecuteUpdate(sql, params);
			//���ע��ɹ����������񷵻���ID��
			if(a>0){
				String sqq="select UID from Usee where UName='"+us.getUName()+"'";
				ResultSet rs=getExecuteQuery(sqq, null);
				//����Ta��ID
				if(rs.next()){
					return rs.getInt(1);
				}
			}
			
		} catch (Exception e) {
			return -1;
		}
		
		return -1;
	}
	
	
	//�޸�һλ�û�����,������Ӱ�������,------����ͨ��
	@Override
	public int UaUsee(Usee u) {
		//sql���
		String sql="update Usee set UName=?,pwd=?,Sex=?,Uxy=?,UPhone=?,UEmail=? where UID=?";
		//����
		Object[] params=new Object[]{u.getUName(),u.getPwd(),u.getSex(),u.getUxy(),u.getUPhone(),u.getUEmail(),u.getID()};
		//������Ӱ������
		return getExecuteUpdate(sql, params);
	}
	
	//��ѯָ�������û�,���յȼ�����(���û��ľ���ֵ��������)----����ͨ��
	@Override
	public List<Usee> RUsee(int x) {
		
		String sql="select top "+x+" * from Usee order by Uexp desc";
		ResultSet rs=getExecuteQuery(sql, null);
		//�������
		List<Usee>us=new ArrayList<Usee>();
		try {
			while (rs.next()) {
				Usee u=new Usee();
				u.setID(rs.getString(1));//ID
				u.setUName(rs.getString(2));//U����
				u.setPwd(rs.getString(3));//����
				u.setUexp(rs.getInt(4));//����
				u.setUMoney(rs.getInt(5));//���
				u.setSex(rs.getString(6));//�Ա�
				u.setUxy(rs.getString(7));//����ǩ��
				u.setUPhone(rs.getString(8));//�绰
				u.setUEmail(rs.getString(9));//����
				u.setUA(rs.getInt(10));//UA��ݣ�1-��ͨ�û���2-����Ա
				us.add(u);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return us;
	}

	//Ϊָ��ID�û�����ָ������,������Ӱ������
	@Override
	public int UxUexp(String UID, int uexp) {
		//sql
		String sql="update Usee set Uexp=Uexp+"+uexp+" where UID='"+UID+"'";
		//
		int a=getExecuteUpdate(sql, null);
		
		return a;
	}

	@Override
	public String RuidByUName(String UName) {
		String sql="select UID from Usee where UName='"+UName+"'";
		ResultSet rs=getExecuteQuery(sql, null);
		try {
			//���������
			if(rs.next()){
				return rs.getString(1);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return null;
	}
	
	
	
}
