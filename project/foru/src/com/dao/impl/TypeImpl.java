package com.dao.impl;

import java.util.ArrayList;
import java.util.List;

import com.dao.IType;
import com.entity.Type;

/**
 * ���ӷ���ӿ�ʵ����
 * @author ��С��
 *
 */
public class TypeImpl extends BaseDao implements IType {

	@Override
	/**
	 *�������ӵ�����
	 */
	public void save(Type type) {
		String sql="insert into Type(TName)values(?)";
		Object[]object={type.getTName()};
		this.getExecuteUpdate(sql, object);
	}
	/**
	 *ɾ�����ӵķ���
	 */
	@Override
	public void delete(String TID) {
		String sql="delete from Type where TID=?";
		Object[]object={TID};
		this.getExecuteUpdate(sql,object);
	}
	/**
	 *ͨ��TID��ѯ���ӵķ���
	 */
	@Override
	public Type findTypeTID(String TID) {
		Type type=null;
		this.conn=this.getConn();
		String sql="select TID,TName from Type where TID=?";
		try {
			this.pst=this.conn.prepareStatement(sql);
			this.pst.setString(1, TID);
			this.set=this.pst.executeQuery();
			if(set.next())
			{
				type=new Type();
				type.setTID(set.getString(1));
				type.setTName(set.getString(2));
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return type;
	}
	/**
	 * ��ѯȫ�����ӷ�������
	 */
	@Override
	public List<Type> findAll() {
		List<Type>list=new ArrayList<Type>();
		this.conn=this.getConn();
		String sql="select TID,TName from Type";
		try {
			this.pst=this.conn.prepareStatement(sql);
			this.set=this.pst.executeQuery();
			while(set.next())
			{
				Type type=new Type();
				type.setTID(set.getString(1));
				type.setTName(set.getString(2));
				list.add(type);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}
}
