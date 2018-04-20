package com.dao.impl;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import com.dao.ICT;
import com.entity.CT;
/**
 * ���۽ӿ�ʵ����
 * @author ��С��
 *
 */
public class CTImpl extends BaseDao implements ICT {
	
	//������������----����ͨ��
	@Override
	public int save(CT ct) 
	{
		String sql="insert into CT(CText,PID,UID,CDate,Cnum )values(?,?,?,?,?,?)";
		Object[]object={ct.getText(),ct.getPID(),ct.getUID(),ct.getCDate(),ct.getCnum()};
		return this.getExecuteUpdate(sql, object);
	}
	

	//ɾ����������----����ͨ��
	@Override
	public int delete(String CTID) 
	{
		String sql="delete from CT where CID=?";
		Object[]object={CTID};
		return this.getExecuteUpdate(sql, object);
	}
	
	//��ѯ���ӵ�����(ͨ��CID)
	@Override
	public CT findCTID(String CID) {
		//List<CT>cts=new ArrayList<CT>()��
		CT cts=new CT();
		this.conn=this.getConn();
		String sql="select CID,CText,PID,UID,CDate,Cnum from CT where CID=?";
		try {
			this.pst=this.conn.prepareStatement(sql);
			this.pst.setString(1, CID);
			this.set=this.pst.executeQuery();
			if(set.next())
			{
				cts.setCID(set.getString(1));
				cts.setText(set.getString(2));
				cts.setPID(set.getInt(3));
				cts.setUID(set.getInt(4));
				cts.setCDate(set.getString(5));
				cts.setCnum(set.getInt(6));
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return cts;
	}
	/**
	 *��ѯȫ���������۵���Ϣ
	 */
	@Override
	public List<CT> findAll() {
		List<CT>list=new ArrayList<CT>();
		this.conn=this.getConn();
		String sql="select CID,CText,PID,UID,CDate,Cnum from CT";
		try {
			this.pst=this.conn.prepareStatement(sql);
			this.set=this.pst.executeQuery();
			while(set.next())
			{
				CT ct=new CT();
				ct.setCID(set.getString(1));
				ct.setText(set.getString(2));
				ct.setPID(set.getInt(3));
				ct.setUID(set.getInt(4));
				ct.setCDate(set.getString(5));
				ct.setCnum(set.getInt(6));
				list.add(ct);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}
	
	//����һ�����ۣ�������Ӱ��������[ͬʱ��ID�û���3����ֵ],----����ͨ��
	@Override
	/**
	 * ����һ�����ۣ�������Ӱ��������ͬʱ��ID�û���3����ֵ,
	 * @return
	 */
	public int CaCT(CT ct) {
		String sql="insert into CT values(?,?,?,default,0)";
		Object[]object={ct.getText(),ct.getPID(),ct.getUID()};
		return this.getExecuteUpdate(sql, object);
	}
	
	//��ѯx��ָ������ID���������ۣ������������㣩----����ͨ��
	@Override
	/**
	 * ��ѯx��ָ������ID���������ۣ������������㣩
	 * @param x ָ������
	 * @param PID ָ��ID
	 * @return
	 */
	public List<CT> RCTByPIDandCnum(int x, String PID) {
		String sql="select top "+x+" CID,CText,PID,CT.UID,CDate,Cnum,UName,Uexp from CT inner join Usee on CT.UID=Usee.UID where PID='"+PID+"' order by Cnum desc";
		
		ResultSet rs=getExecuteQuery(sql,null);
		
		//����
		List<CT> cts=new ArrayList<CT>();
		try {
			while(rs.next()){
				CT c=new CT();
				c.setCID(rs.getString(1));//����ID
				c.setText(rs.getString(2));//���۵�����
				c.setPID(rs.getInt(3));//���۵�����ID
				c.setUID(rs.getInt(4));//������ID
				c.setCDate(rs.getString(5));//��������
				c.setCnum(rs.getInt(6));//��������
				c.setUName(rs.getString(7));//����������
				c.setUexp(rs.getInt(8));//�����߾���
				cts.add(c);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return cts;
	}
	
	
	//��ѯx��ָ������ID��-���ۣ���ʱ�併�򣬼����������ۿ�ʼ������ģ�,------����ͨ��
	@Override
	/**
	 * ��ѯx��ָ������ID��-���ۣ���ʱ�併�򣬼����������ۿ�ʼ������ģ�
	 * @param x ָ������
	 * @param PID ָ��ID
	 * @return
	 */
	public List<CT> RCTByPIDandCDate(int x, String PID) {
		String sql="select top "+x+" CID,CText,PID,CT.UID,CDate,Cnum,UName,Uexp from CT inner join Usee on CT.UID=Usee.UID where PID='"+PID+"' order by CDate desc";
		
		ResultSet rs=getExecuteQuery(sql,null);
		
		//����
		List<CT> cts=new ArrayList<CT>();
		try {
			while(rs.next()){
				CT c=new CT();
				c.setCID(rs.getString(1));//����ID
				c.setText(rs.getString(2));//���۵�����
				c.setPID(rs.getInt(3));//���۵�����ID
				c.setUID(rs.getInt(4));//������ID
				c.setCDate(rs.getString(5));//��������
				c.setCnum(rs.getInt(6));//��������
				c.setUName(rs.getString(7));//����������
				c.setUexp(rs.getInt(8));//�����߾���
				cts.add(c);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return cts;
	}


	//Ϊָ�����۵���---����ͨ��
	@Override
	public int UaCTZan(String CTID) {
		String sql="update CT set Cnum=Cnum+1 where CID='"+CTID+"'";
		int a=getExecuteUpdate(sql, null);
		return a;
	}
}
