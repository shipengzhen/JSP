
package com.dao.impl;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.dao.IPost;
import com.entity.Post;

/**
 * ���ӱ�ӿ�ʵ����
 * @author ��С��
 *
 */
public class PostImpl extends BaseDao implements IPost {

	
	//���һ������
	//-----����ͨ��
	@Override
	public int CaPost(Post p) {
		String sql="insert into Post values(?,?,?,?,getdate(),?,?,?)";
		Object[]object={p.getPhh(),p.getText(),p.getUID(),p.getTID(),p.getPRead(),p.getPZan(),p.getPCai()};
		int ret=this.getExecuteUpdate(sql, object);
		//�������ɹ�,��ѯ��ID��
		if(ret>0){
			sql="select max(PID) from Post";
			ResultSet rs=getExecuteQuery(sql, null);
			try {
				//������ID��
				if(rs.next()){
					return rs.getInt(1);
				}
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		
		return -1;
	}
	
	
	//��ѯ�Զ�ID�����ӣ�������ϸ��Ϣ-----����ͨ��
	@Override
	public Post RaPost(String PID) {
		String sql="select PID,Post.Phh,PText,Post.UID,TID,PDate,PRend,pzan,PCai,UName,Uexp from Post inner join Usee on Post.UID=Usee.UID where PID="+PID;
		ResultSet rs=getExecuteQuery(sql,null);
		
		Post p=new Post();
		//����
		try {
			if (rs.next()) {
				p.setPID(rs.getString(1));//Post��ID
				p.setPhh(rs.getString(2));//����
				p.setText(rs.getString(3));//����
				p.setUID(rs.getInt(4));//�������û�ID
				p.setTID(rs.getInt(5));//��������ID
				p.setPDate(rs.getString(6));//����ʱ��
				p.setPRead(rs.getInt(7));//�Ķ���
				p.setPZan(rs.getInt(8));//����
				p.setPCai(rs.getInt(9));//����
				p.setUName(rs.getString(10));//����������
				p.setUexp(rs.getString(11));//�����˵ľ���
			}
		} catch (SQLException e) { 
			e.printStackTrace();
		}
		
		return p;
	}
	
	
	
	
	//��ָ��-ҳ��С-��ǰҳ-��ָ������ID��ѯ�����б� -------�Ѿ�����ͨ��
	@Override
	/**
	 * ��ָ��-ҳ��С-��ǰҳ-��ָ������ID��ѯ�����б� 
	 * @param dx ҳ��С
	 * @param dang ��ǰҳ
	 * @param TID ����ID
	 * @return
	 */
	public List<Post> RPostByFenTID(int dx, int dang, String TID) {
		//Ϊ������׼��
		if(TID==null||"".equals(TID)){
			TID="TID";
		}
		String sql="select top "+dx+" PID,Post.Phh,PText,Post.UID,TID,PDate,PRend,pzan,PCai,UName,Uexp from Post inner join Usee on Post.UID=Usee.UID where TID="+TID+" and PID not in(select top (("+dang+"-1)*"+dx+") PID from Post where TID="+TID+"  order by PDate desc,PID desc)  order by PDate desc,PID desc";
		System.out.println(sql);
		ResultSet rs=getExecuteQuery(sql, null);
		
		//����
		List<Post>ps=new ArrayList<Post>();
		try {
			while(rs.next()){
				Post p=new Post();
				p.setPID(rs.getString(1));//Post��ID
				p.setPhh(rs.getString(2));//����
				p.setText(rs.getString(3));//����
				p.setUID(rs.getInt(4));//�������û�ID
				p.setTID(rs.getInt(5));//��������ID
				p.setPDate(rs.getString(6));//����ʱ��
				p.setPRead(rs.getInt(7));//�Ķ���
				p.setPZan(rs.getInt(8));//����
				p.setPCai(rs.getInt(9));//����
				p.setUName(rs.getString(10));//����������
				p.setUexp(rs.getString(11));//�����˵ľ���
				
				ps.add(p);
				
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		
		return ps;
	}
	
	//��ָ��-ҳ��С-��ǰҳ-��ָ���û�ID��ѯ�����б�-------�Ѿ�����ͨ��
	@Override
	/**
	 * ��ָ��-ҳ��С-��ǰҳ-��ָ���û�ID��ѯ�����б�
	 * @param dx ҳ��С
	 * @param dang ��ǰҳ
	 * @param UID �û�ID
	 * @return
	 */
	public List<Post> RPostByFenUID(int dx, int dang, String UID) {

		String sql="select top "+dx+" PID,Post.Phh,PText,Post.UID,TID,PDate,PRend,pzan,PCai,UName,Uexp from Post inner join Usee on Post.UID=Usee.UID where Post.UID="+UID+" and PID not in(select top (("+dang+"-1)*"+dx+") PID from Post where Post.UID='"+UID+"'  order by PDate desc)  order by PDate desc";
		
		ResultSet rs=getExecuteQuery(sql, null);
		
		//����
		List<Post>ps=new ArrayList<Post>();
		try {
			while(rs.next()){
				Post p=new Post();
				p.setPID(rs.getString(1));//Post��ID
				p.setPhh(rs.getString(2));//����
				p.setText(rs.getString(3));//����
				p.setUID(rs.getInt(4));//�������û�ID
				p.setTID(rs.getInt(5));//��������ID
				p.setPDate(rs.getString(6));//����ʱ��
				p.setPRead(rs.getInt(7));//�Ķ���
				p.setPZan(rs.getInt(8));//����
				p.setPCai(rs.getInt(9));//����
				p.setUName(rs.getString(10));//����������
				p.setUexp(rs.getString(11));//�����˵ľ���
				
				ps.add(p);
				
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		
		return ps;
	}
	
	
	//ɾ��ָ��ID���ӣ�������Ӱ������----����ͨ��
	@Override
	/**
	 * ɾ��ָ��ID���ӣ�������Ӱ������
	 */
	public int DaPost(int PID) {
		//��ɾ����
		String sql="delete from CT where PID='"+PID+"'";
		getExecuteUpdate(sql, null);
		//��ɾ����
		String sqq="delete from Post where PID='"+PID+"'";
		
		int a=getExecuteUpdate(sqq, null);
		
		return a;
	}
	
	// ����ָ������ID���x��������ӣ������ظ�---����ͨ��
	@Override
	/**
	 * ����ָ������ID���x��������ӣ������ظ�
	 * @param TID ����ID
	 * @param x Ҫ��õ�������
	 * @return
	 */
	public List<Post> RPostByTIDandX(String TID, int x) {
		//Ϊ������׼��
		if(TID==null||"".equals(TID)){
			TID="TID";
		}
		
		//������� 
		int count=this.RPostCount(TID);
		//�ֶܷ���ҳ
		int zong=count%x==0?count/x:count/x+1;
		//���һҳ
		int sui=(int)(Math.random()*zong+1);
		
		//͵������
		return RPostByFenTID(x, sui,TID);
	}
	
	
	//��ָ��-ҳ��С-��ǰҳ-��ѯ���ţ����յ��������㣩�����ӣ������������ࣩ-----����ͨ��
	@Override
	/**
	 *  ��ָ��-ҳ��С-��ǰҳ-��ѯ���ţ����յ��������㣩�����ӣ������������ࣩ
	 * @param dx ҳ��С
	 * @param dang ��ǰҳ
	 * @return
	 */
	public List<Post> RPostByPZan(int dx, int dang) {
		//Ϊ������׼��
		String sql="select top "+dx+" PID,Post.Phh,PText,Post.UID,TID,PDate,PRend,pzan,PCai,UName,Uexp from Post inner join Usee on Post.UID=Usee.UID where PID not in(select top (("+dang+"-1)*"+dx+") PID from Post order by PZan desc)  order by PZan desc";
		
		ResultSet rs=getExecuteQuery(sql, null);
		
		//����
		List<Post>ps=new ArrayList<Post>();
		try {
			while(rs.next()){
				Post p=new Post();
				p.setPID(rs.getString(1));//Post��ID
				p.setPhh(rs.getString(2));//����
				p.setText(rs.getString(3));//����
				p.setUID(rs.getInt(4));//�������û�ID
				p.setTID(rs.getInt(5));//��������ID
				p.setPDate(rs.getString(6));//����ʱ��
				p.setPRead(rs.getInt(7));//�Ķ���
				p.setPZan(rs.getInt(8));//����
				p.setPCai(rs.getInt(9));//����
				p.setUName(rs.getString(10));//����������
				p.setUexp(rs.getString(11));//�����˵ľ���
				
				ps.add(p);
				
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		
		return ps;
	}
	
	
	//��ָ��-ҳ��С-��ǰҳ-��ѯ���£�����һ�����񣩵�------����ͨ��
	@Override
	/**
	 *  ��ָ��-ҳ��С-��ǰҳ-��ѯ���£�����һ�����񣩵�
	 *  ���ţ����յ��������㣩�����ӣ������������ࣩ
	 * @param dx ҳ��С
	 * @param dang ��ǰҳ
	 * @return
	 */
	public List<Post> RPostByPZanMM(int dx, int dang) {
		
		String sql="select top "+dx+" PID,Post.Phh,PText,Post.UID,TID,PDate,PRend,pzan,PCai,UName,Uexp from Post inner join Usee on Post.UID=Usee.UID where DateDiff(mm,PDate,getdate())=0 and PID not in(select top (("+dang+"-1)*"+dx+") PID from Post where DateDiff(mm,PDate,getdate())=0 order by PZan desc)  order by PZan desc";
		//System.out.println(sql);
		ResultSet rs=getExecuteQuery(sql, null);
		
		//����
		List<Post>ps=new ArrayList<Post>();
		try {
			while(rs.next()){
				Post p=new Post();
				p.setPID(rs.getString(1));//Post��ID
				p.setPhh(rs.getString(2));//����
				p.setText(rs.getString(3));//����
				p.setUID(rs.getInt(4));//�������û�ID
				p.setTID(rs.getInt(5));//��������ID
				p.setPDate(rs.getString(6));//����ʱ��
				p.setPRead(rs.getInt(7));//�Ķ���
				p.setPZan(rs.getInt(8));//����
				p.setPCai(rs.getInt(9));//����
				p.setUName(rs.getString(10));//����������
				p.setUexp(rs.getString(11));//�����˵ľ���
				
				ps.add(p);
				
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		
		return ps;
	}

	//ѯ���ݿ�һ���ж���������,ָ������
	@Override
	public int RPostCount(String TID) {
		if(TID==null||"".equals(TID)){
			TID="TID";
		}
		
		String sql="select count(1) from Post where TID="+TID;
		ResultSet rs=getExecuteQuery(sql, null);
		try {
			if(rs.next()){
				return rs.getInt(1);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		
		return 0;
	}

	//ָ��ID���ӵ���---����-ͨ��
	@Override
	public int UaPostZan(String PID) {
		String sql="update Post set pzan=pzan+1 where PID='"+PID+"'";
		return getExecuteUpdate(sql, null);
	}

	//ָ��ID���ӵ��---����-ͨ��
	@Override
	public int UaPostCai(String PID) {
		String sql="update Post set PCai=PCai+1 where PID='"+PID+"'";
		return getExecuteUpdate(sql, null);
	}

	//ָ��ID���������Ķ���---����-ͨ��
	@Override
	public int UaPostRead(String PID) {
		String sql="update Post set PRend=PRend+1 where PID='"+PID+"'";
		return getExecuteUpdate(sql, null);
	}


	//���ݱ���ؼ���ģ����ѯX������
	@Override
	public List<Post> RPostByPhhX(String Phh, int x) {
		
		String sql="select top "+x+" PID,Post.Phh,PText,Post.UID,TID,PDate,PRend,pzan,PCai,UName,Uexp from Post inner join Usee on Post.UID=Usee.UID where Phh like '%"+Phh+"%' order by PDate desc";
ResultSet rs=getExecuteQuery(sql, null);
		
		//����
		List<Post>ps=new ArrayList<Post>();
		try {
			while(rs.next()){
				Post p=new Post();
				p.setPID(rs.getString(1));//Post��ID
				p.setPhh(rs.getString(2));//����
				p.setText(rs.getString(3));//����
				p.setUID(rs.getInt(4));//�������û�ID
				p.setTID(rs.getInt(5));//��������ID
				p.setPDate(rs.getString(6));//����ʱ��
				p.setPRead(rs.getInt(7));//�Ķ���
				p.setPZan(rs.getInt(8));//����
				p.setPCai(rs.getInt(9));//����
				p.setUName(rs.getString(10));//����������
				p.setUexp(rs.getString(11));//�����˵ľ���
				
				ps.add(p);
				
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return ps;
	}


	//ָ��ID�˺ŷ�����x����
	@Override
	public List<Post> RPostByUID(String UID,int x) {

		String sql="select top "+x+" PID,Post.Phh,PText,Post.UID,TID,PDate,PRend,pzan,PCai,UName,Uexp from Post inner join Usee on Post.UID=Usee.UID where Post.UID = '"+UID+"' order by PDate desc";
ResultSet rs=getExecuteQuery(sql, null);
		
		//����
		List<Post>ps=new ArrayList<Post>();
		try {
			while(rs.next()){
				Post p=new Post();
				p.setPID(rs.getString(1));//Post��ID
				p.setPhh(rs.getString(2));//����
				p.setText(rs.getString(3));//����
				p.setUID(rs.getInt(4));//�������û�ID
				p.setTID(rs.getInt(5));//��������ID
				p.setPDate(rs.getString(6));//����ʱ��
				p.setPRead(rs.getInt(7));//�Ķ���
				p.setPZan(rs.getInt(8));//����
				p.setPCai(rs.getInt(9));//����
				p.setUName(rs.getString(10));//����������
				p.setUexp(rs.getString(11));//�����˵ľ���
				
				ps.add(p);
				
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return ps;
	}

	
}
