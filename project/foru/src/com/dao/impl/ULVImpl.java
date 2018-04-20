package com.dao.impl;

import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.dao.IULV;
import com.entity.ULV;

/**
 * �û��ȼ��ӿ�ʵ����
 * @author ��С��
 *
 */
public class ULVImpl extends BaseDao implements IULV {

	@Override
	/**
	 * �����û��ȼ�
	 */
	public void save(ULV ulv) {
		String sql="insert into ULv(EXP,LTitle)values(?,?)";
		Object[]object={ulv.getExp(),ulv.getLTitle()};
		this.getExecuteUpdate(sql, object);
	}
	/**
	 * ��ѯ�û��ȼ�ͨ���ȼ����
	 */
	@Override
	public ULV findULV(int lv) {
		ULV ulv=null;
		this.conn=this.getConn();
		String sql="select LV,EXP,LTitle from Ulv where LV=?";
		try {
			this.pst=this.conn.prepareStatement(sql);
			this.pst.setInt(1, lv);
			this.set=this.pst.executeQuery();
			if(set.next())
			{
				ulv=new ULV();
				ulv.setExp(set.getInt(1));
				ulv.setLTitle(set.getString(2));
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return ulv;
	}
	/**
	 * ��ѯȫ�����û��ȼ�
	 */
	@Override
	public List<ULV> findAll() {
		List<ULV>list=new ArrayList<ULV>();
		this.conn=this.getConn();
		String sql="select LV,EXP,LTitle from Ulv";
		try {
			this.pst=this.conn.prepareStatement(sql);
			this.set=this.pst.executeQuery();
			while(set.next())
			{
				ULV ulv=new ULV();
				ulv.setExp(set.getInt(1));
				ulv.setLTitle(set.getString(2));
				list.add(ulv);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}
	/**
	 *������̬���ϴ���ȼ�������
	 */
	public static List<ULV>LVS;
	//�����û����鷵�صȼ�
	public ULV RLV(int uexp)
	{
		//�жϼ����Ƿ�Ϊ��
		if(LVS==null)
		{
			//��ѯ����
			LVS=new ArrayList<ULV>();
			String sql="select * from ULv";
			ResultSet rs=getExecuteQuery(sql, null);
			try {
				while(rs.next())
				{
					ULV ulvs=new ULV();
					ulvs.setLV(rs.getString(1));
					ulvs.setExp(rs.getInt(2));
					ulvs.setLTitle(rs.getString(3));
					LVS.add(ulvs);
				}
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		//��õȼ�
		String lv="1";
		for (ULV u: LVS) {
			if(uexp>u.getExp()){
				lv=u.getLV();
			}
		}
		for (ULV u: LVS) {
			if(lv.equals(u.getLV())){
				return u;
			}
		}
		return null;
	}
}
