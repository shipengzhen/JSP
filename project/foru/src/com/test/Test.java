package com.test;

import java.util.List;


import com.dao.*;
import com.dao.impl.FC;
import com.entity.*;

public class Test {

	
	public static void main(String[] args) {
		//����   ��ָ��-ҳ��С-��ǰҳ-��ָ������ID��ѯ�����б� 
				IPost it=FC.getPostI();
				List<Post>ps=it.RPostByFenTID(10, 5, "1");
				
				for (Post p : ps) {
					System.out.println(p.getPID()+"\t");
//					System.out.println(p.getPhh());
//					System.out.println(p.getText());
//					System.out.println(p.getUID());
//					System.out.println(p.getUName());
//					System.out.println(p.getPDate());
//					System.out.println(p.getUexp());
					
					//System.out.println("--------�ָ���-----------");
				}
				
				
	}
	
	//���Ա���ģ����ѯX��
	public static void show17(){
		IPost it=FC.getPostI();
		List<Post>ps=it.RPostByPhhX("����",10);
		
		for (Post p : ps) {
			System.out.println(p.getPhh());
			System.out.println(p.getText());
			System.out.println(p.getUID());
			System.out.println(p.getUName());
			System.out.println(p.getPDate());
			System.out.println(p.getUexp());
			
			System.out.println("\n--------�ָ���-----------\n");
		}
		
	}
	
	//�����޸��û�����
	public static void show16(){

		Usee u=new Usee();
		u.setUName("����");
		u.setPwd("123456");
		u.setSex("Ů");
		u.setUEmail("110@qq.com");
		u.setUPhone("15164035995");
		u.setUxy("�����������");
		u.setID("10015");
		System.out.println(FC.getUserI().UaUsee(u));
	}
	
	//����ע���û�
	public static void show15(){
		
		IUsee iu=FC.getUserI();
		Usee u=new Usee();
		u.setUName("����12");
		u.setPwd("123456");
		u.setUPhone("13110012001");
		System.out.println(iu.CaUsee(u));
	}
	//���Ե�¼
	public static void show14(){
		//���Ե�¼
				IUsee iu=FC.getUserI();
				System.out.println(iu.RLogin("�г�", "ygz123"));
				
				
	}
	//���Է���ָ��ID�û���Ϣ
	public static void show13(){

		IUsee iu=FC.getUserI();
		Usee u=iu.RaUseeByUID("10001");

		System.out.println(u.getID());
		System.out.println(u.getUName());
		System.out.println(u.getPwd());
		System.out.println(u.getUexp());
		System.out.println(u.getUxy());
		System.out.println(u.getUA());
		
	}
	
	//���Եȼ�
	public static void show12(){
		
//		
//		IULV iv=FC.getIULV();
//		
//		ULV u=iv.RLV(100);
//		System.out.println(u.getLV());	
	}
	
	
	//��ѯһ�����ӵ�ƽ·
	public static void show11(){

		ICT it=FC.getICT();
		List<CT>cts=it.RCTByPIDandCDate(10, "1000");
		
		
		for (CT c : cts) {

			System.out.println(c.getCID());
			System.out.println(c.getText());
			System.out.println(c.getPID());
			System.out.println(c.getCDate());
			System.out.println(c.getUexp());
			System.out.println(c.getUName());
			System.out.println(c.getCnum());
			
			System.out.println("---------------------------------");
		}
	}
	//��ѯ��Ƭ���λ��
	public static void show10(){
		IPhoto io=FC.getIPhoto();
		System.out.println(io.Max());
		
		//����һ��
		//IPhoto io=FC.getIPhoto();
		//System.out.println(io.Create(1, "1"));
	}
	
		
	//ɾ��һ������------����ͨ��
	public static void show9(){
		
		IPost it=FC.getPostI();
		System.out.println(it.DaPost(1005));
		
	}
	
	
	//��������,����
	public static void show8(){
		//��������,����
		IPost it=FC.getPostI();
		
		List<Post>ps=it.RPostByPZanMM(10, 1);
		
		for (Post p : ps) {
			System.out.println(p.getPZan());
			System.out.println(p.getPhh());
			System.out.println(p.getText());
			System.out.println(p.getUID());
			System.out.println(p.getUName());
			System.out.println(p.getPDate());
			System.out.println(p.getUexp());
			
			System.out.println("\n--------�ָ���-----------\n");
		}
	}
	
	//����������
	public static void show7(){

		//����������
		IPost it=FC.getPostI();
		
		List<Post>ps=it.RPostByPZan(10, 1);
		
		for (Post p : ps) {
			System.out.println(p.getPZan());
			System.out.println(p.getPhh());
			System.out.println(p.getText());
			System.out.println(p.getUID());
			System.out.println(p.getUName());
			System.out.println(p.getPDate());
			System.out.println(p.getUexp());
			
			System.out.println("\n--------�ָ���-----------\n");
		}
		
	}
	
	//�������ʮ������
	public static void show6(){
		//�������ʮ������
		IPost it=FC.getPostI();
		List<Post>ps=it.RPostByTIDandX(null, 2);
		
		for (Post p : ps) {
			System.out.println(p.getPhh());
			System.out.println(p.getText());
			System.out.println(p.getUID());
			System.out.println(p.getUName());
			System.out.println(p.getPDate());
			System.out.println(p.getUexp());
			
			System.out.println("\n--------�ָ���-----------\n");
		}
		
		
		
		
	}
	
	
	//����   ��ָ��-ҳ��С-��ǰҳ-��ָ���û�ID��ѯ�����б� 
	public static void show5(){
		//����   ��ָ��-ҳ��С-��ǰҳ-��ָ���û�ID��ѯ�����б� 
				IPost it=FC.getPostI();
				List<Post>ps=it.RPostByFenUID(2, 1, "10001");
				
				for (Post p : ps) {
					System.out.println(p.getPhh());
					System.out.println(p.getText());
					System.out.println(p.getUID());
					System.out.println(p.getUName());
					System.out.println(p.getPDate());
					System.out.println(p.getUexp());
					
					System.out.println("\n--------�ָ���-----------\n");
				}
				
	}
	
	//����   ��ָ��-ҳ��С-��ǰҳ-��ָ������ID��ѯ�����б� 
	public static void sho4(String[] args) {
		//show2();
		//����   ��ָ��-ҳ��С-��ǰҳ-��ָ������ID��ѯ�����б� 
		IPost it=FC.getPostI();
		List<Post>ps=it.RPostByFenTID(10, 1, "1");
		
		for (Post p : ps) {
			System.out.println(p.getPhh());
			System.out.println(p.getText());
			System.out.println(p.getUID());
			System.out.println(p.getUName());
			System.out.println(p.getPDate());
			System.out.println(p.getUexp());
			
			System.out.println("\n--------�ָ���-----------\n");
		}
		
	}
	
	
	//���Բ�������ByID
	public static void show3(){

		//���Բ�������ByID
		IPost it=FC.getPostI();
		Post p=it.RaPost("1000");
		

		System.out.println(p.getPhh());
		System.out.println(p.getText());
		System.out.println(p.getUID());
		System.out.println(p.getUName());
		System.out.println(p.getPDate());
		System.out.println(p.getUexp());
		
	}
	
	//���Բ�������
	public static void show2(){
		Post p=new Post();
		//insert into Post values('���ǡ�����','��������','10001','1','2001-1-1','100','400','20')
		p.setPhh("�ҵ����ֽб���");
		p.setText("�ҵ������б�Ķ���л�Ķ�֮��");
		p.setUID(10001);//�û�ID
		p.setTID(1);//��������ID
		p.setPDate(new java.sql.Date(new java.util.Date().getTime()).toString());//����ʱ��
		p.setPRead(100);
		p.setPZan(1);
		p.setPCai(1);
		
		//
		IPost it=FC.getPostI();
		System.out.println(it.CaPost(p)+"\t1Ϊ�ɹ�");
		
	}
	
	
	/**
	 * ����ȫ��
	 */
	public static void show1(){
		//���۱����
				//��ѯȫ��
					ICT ict=FC.getICT();
					List<CT>ct=ict.findAll();
					for (CT ct2 : ct) {
						System.out.println(ct2.getCID()+ct2.getText()+ct2.getPID()+ct2.getUID()+ct2.getCDate()+ct2.getCnum());
					}
	}
	
	
}


