package com.dao;

import java.util.List;

import com.entity.Post;

/**
 * ���ӱ�ӿ�
 * @author  ��С��
 *
 */
public interface IPost {

	/**
	 * ���һ�����ӣ�������Ӱ��������ͬʱΪ���û����10����
	 */
	public int CaPost(Post p);
	
	/**
	 * ��ѯ�Զ�ID�����ӣ�������ϸ��Ϣ
	 */
	public Post RaPost(String PID);
	
	
	/*
	 * ��ҳ�ο���ʽ
	 * select top ҳ��С * from Post 
	 * where [TID=����ID and] PID not in(select top ((��ǰҳ-1)*ҳ��С) XID from Post [where TID=����ID] ) 
	 */
	
	/**
	 * ��ָ��-ҳ��С-��ǰҳ-��ָ������ID��ѯ�����б� 
	 * @param dx ҳ��С
	 * @param dang ��ǰҳ
	 * @param TID ����ID
	 * @return
	 */
	public List<Post> RPostByFenTID(int dx,int dang,String TID);
	/**
	 * ��ָ��-ҳ��С-��ǰҳ-��ָ���û�ID��ѯ�����б�
	 */
	public List<Post>RPostByFenUID(int dx,int dang,String UID);
	/**
	 * ɾ��ָ��ID����,������Ӱ�������
	 */
	public int DaPost(int PID);
	/**
	 * ����ָ������ID���x��������ӣ������ظ�
	 * @param TID ����ID
	 * @param x Ҫ��õ�������
	 * @return
	 */
	public List<Post> RPostByTIDandX(String TID,int x);
	/**
	 *  ��ָ��-ҳ��С-��ǰҳ-��ѯ���ţ����յ��������㣩�����ӣ������������ࣩ
	 * @param dx ҳ��С
	 * @param dang ��ǰҳ
	 * @return
	 */
	public List<Post> RPostByPZan(int dx,int dang);

	/**
	 *  ��ָ��-ҳ��С-��ǰҳ-��ѯ���£�����һ�����񣩵�
	 *  ���ţ����յ��������㣩�����ӣ������������ࣩ
	 * @param dx ҳ��С
	 * @param dang ��ǰҳ
	 * @return
	 */
	public List<Post> RPostByPZanMM(int dx,int dang);
	
	/**
	 * ��ѯ���ݿ�һ���ж���������,ָ������
	 */
	public int RPostCount(String TID);
	
	/**
	 * ָ��ID���ӵ���
	 * @return
	 */
	public int UaPostZan(String PID);
	
	/**
	 * ָ�����ӵ��
	 */
	public int UaPostCai(String PID);
	
	/**
	 * ָ�����������Ķ���
	 */
	public int UaPostRead(String PID);
	
	
	/**
	 * ���ݱ���ؼ���ģ����ѯX������
	 */
	public List<Post> RPostByPhhX(String Phh,int x);
	
	
	/**
	 * ָ��ID�˺ŷ�����x����
	 */
	public List<Post> RPostByUID(String UID,int x);
	
}
