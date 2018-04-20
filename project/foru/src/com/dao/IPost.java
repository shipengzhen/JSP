package com.dao;

import java.util.List;

import com.entity.Post;

/**
 * 帖子表接口
 * @author  包小栋
 *
 */
public interface IPost {

	/**
	 * 添加一个帖子，返回受影响行数，同时为该用户添加10经验
	 */
	public int CaPost(Post p);
	
	/**
	 * 查询自定ID的帖子，返回详细信息
	 */
	public Post RaPost(String PID);
	
	
	/*
	 * 分页参考公式
	 * select top 页大小 * from Post 
	 * where [TID=分类ID and] PID not in(select top ((当前页-1)*页大小) XID from Post [where TID=分类ID] ) 
	 */
	
	/**
	 * 按指定-页大小-当前页-的指定分类ID查询帖子列表 
	 * @param dx 页大小
	 * @param dang 当前页
	 * @param TID 分类ID
	 * @return
	 */
	public List<Post> RPostByFenTID(int dx,int dang,String TID);
	/**
	 * 按指定-页大小-当前页-的指定用户ID查询帖子列表
	 */
	public List<Post>RPostByFenUID(int dx,int dang,String UID);
	/**
	 * 删除指定ID帖子,返回受影响的行数
	 */
	public int DaPost(int PID);
	/**
	 * 按照指定分类ID获得x条随机帖子，不可重复
	 * @param TID 类型ID
	 * @param x 要获得的帖子数
	 * @return
	 */
	public List<Post> RPostByTIDandX(String TID,int x);
	/**
	 *  按指定-页大小-当前页-查询热门（按照点赞数计算）的帖子（不分帖子种类）
	 * @param dx 页大小
	 * @param dang 当前页
	 * @return
	 */
	public List<Post> RPostByPZan(int dx,int dang);

	/**
	 *  按指定-页大小-当前页-查询本月（本月一号至今）的
	 *  热门（按照点赞数计算）的帖子（不分帖子种类）
	 * @param dx 页大小
	 * @param dang 当前页
	 * @return
	 */
	public List<Post> RPostByPZanMM(int dx,int dang);
	
	/**
	 * 查询数据库一共有多少条帖子,指定类型
	 */
	public int RPostCount(String TID);
	
	/**
	 * 指定ID帖子点赞
	 * @return
	 */
	public int UaPostZan(String PID);
	
	/**
	 * 指定帖子点踩
	 */
	public int UaPostCai(String PID);
	
	/**
	 * 指定帖子增加阅读量
	 */
	public int UaPostRead(String PID);
	
	
	/**
	 * 根据标题关键词模糊查询X条帖子
	 */
	public List<Post> RPostByPhhX(String Phh,int x);
	
	
	/**
	 * 指定ID账号发过的x帖子
	 */
	public List<Post> RPostByUID(String UID,int x);
	
}
