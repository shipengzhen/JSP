package com.test;

import java.util.List;


import com.dao.*;
import com.dao.impl.FC;
import com.entity.*;

public class Test {

	
	public static void main(String[] args) {
		//测试   按指定-页大小-当前页-的指定分类ID查询帖子列表 
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
					
					//System.out.println("--------分割线-----------");
				}
				
				
	}
	
	//测试标题模糊查询X条
	public static void show17(){
		IPost it=FC.getPostI();
		List<Post>ps=it.RPostByPhhX("无名",10);
		
		for (Post p : ps) {
			System.out.println(p.getPhh());
			System.out.println(p.getText());
			System.out.println(p.getUID());
			System.out.println(p.getUName());
			System.out.println(p.getPDate());
			System.out.println(p.getUexp());
			
			System.out.println("\n--------分割线-----------\n");
		}
		
	}
	
	//测试修改用户资料
	public static void show16(){

		Usee u=new Usee();
		u.setUName("李四");
		u.setPwd("123456");
		u.setSex("女");
		u.setUEmail("110@qq.com");
		u.setUPhone("15164035995");
		u.setUxy("快和我做朋友");
		u.setID("10015");
		System.out.println(FC.getUserI().UaUsee(u));
	}
	
	//测试注册用户
	public static void show15(){
		
		IUsee iu=FC.getUserI();
		Usee u=new Usee();
		u.setUName("张三12");
		u.setPwd("123456");
		u.setUPhone("13110012001");
		System.out.println(iu.CaUsee(u));
	}
	//测试登录
	public static void show14(){
		//测试登录
				IUsee iu=FC.getUserI();
				System.out.println(iu.RLogin("市长", "ygz123"));
				
				
	}
	//测试返回指定ID用户信息
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
	
	//测试等级
	public static void show12(){
		
//		
//		IULV iv=FC.getIULV();
//		
//		ULV u=iv.RLV(100);
//		System.out.println(u.getLV());	
	}
	
	
	//查询一个帖子的平路
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
	//查询照片冲锋位置
	public static void show10(){
		IPhoto io=FC.getIPhoto();
		System.out.println(io.Max());
		
		//插入一条
		//IPhoto io=FC.getIPhoto();
		//System.out.println(io.Create(1, "1"));
	}
	
		
	//删除一个帖子------测试通过
	public static void show9(){
		
		IPost it=FC.getPostI();
		System.out.println(it.DaPost(1005));
		
	}
	
	
	//测试热门,本月
	public static void show8(){
		//测试热门,本月
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
			
			System.out.println("\n--------分割线-----------\n");
		}
	}
	
	//测试热门总
	public static void show7(){

		//测试热门总
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
			
			System.out.println("\n--------分割线-----------\n");
		}
		
	}
	
	//测试随机十条数据
	public static void show6(){
		//测试随机十条数据
		IPost it=FC.getPostI();
		List<Post>ps=it.RPostByTIDandX(null, 2);
		
		for (Post p : ps) {
			System.out.println(p.getPhh());
			System.out.println(p.getText());
			System.out.println(p.getUID());
			System.out.println(p.getUName());
			System.out.println(p.getPDate());
			System.out.println(p.getUexp());
			
			System.out.println("\n--------分割线-----------\n");
		}
		
		
		
		
	}
	
	
	//测试   按指定-页大小-当前页-的指定用户ID查询帖子列表 
	public static void show5(){
		//测试   按指定-页大小-当前页-的指定用户ID查询帖子列表 
				IPost it=FC.getPostI();
				List<Post>ps=it.RPostByFenUID(2, 1, "10001");
				
				for (Post p : ps) {
					System.out.println(p.getPhh());
					System.out.println(p.getText());
					System.out.println(p.getUID());
					System.out.println(p.getUName());
					System.out.println(p.getPDate());
					System.out.println(p.getUexp());
					
					System.out.println("\n--------分割线-----------\n");
				}
				
	}
	
	//测试   按指定-页大小-当前页-的指定分类ID查询帖子列表 
	public static void sho4(String[] args) {
		//show2();
		//测试   按指定-页大小-当前页-的指定分类ID查询帖子列表 
		IPost it=FC.getPostI();
		List<Post>ps=it.RPostByFenTID(10, 1, "1");
		
		for (Post p : ps) {
			System.out.println(p.getPhh());
			System.out.println(p.getText());
			System.out.println(p.getUID());
			System.out.println(p.getUName());
			System.out.println(p.getPDate());
			System.out.println(p.getUexp());
			
			System.out.println("\n--------分割线-----------\n");
		}
		
	}
	
	
	//测试查新帖子ByID
	public static void show3(){

		//测试查新帖子ByID
		IPost it=FC.getPostI();
		Post p=it.RaPost("1000");
		

		System.out.println(p.getPhh());
		System.out.println(p.getText());
		System.out.println(p.getUID());
		System.out.println(p.getUName());
		System.out.println(p.getPDate());
		System.out.println(p.getUexp());
		
	}
	
	//测试插入帖子
	public static void show2(){
		Post p=new Post();
		//insert into Post values('这是·标题','这是正文','10001','1','2001-1-1','100','400','20')
		p.setPhh("我的名字叫标题");
		p.setText("我的身份是斜文顶，谢文东之哥");
		p.setUID(10001);//用户ID
		p.setTID(1);//所属分类ID
		p.setPDate(new java.sql.Date(new java.util.Date().getTime()).toString());//发表时间
		p.setPRead(100);
		p.setPZan(1);
		p.setPCai(1);
		
		//
		IPost it=FC.getPostI();
		System.out.println(it.CaPost(p)+"\t1为成功");
		
	}
	
	
	/**
	 * 测试全部
	 */
	public static void show1(){
		//评论表测试
				//查询全部
					ICT ict=FC.getICT();
					List<CT>ct=ict.findAll();
					for (CT ct2 : ct) {
						System.out.println(ct2.getCID()+ct2.getText()+ct2.getPID()+ct2.getUID()+ct2.getCDate()+ct2.getCnum());
					}
	}
	
	
}


