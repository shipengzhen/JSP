package com.dao;

import java.util.List;

import com.entity.CT;

/**
 * 评论表接口
 * @author  包小栋
 *
 */
public interface ICT {
	/**
	 * 新增评论
	 * @param ct
	 */
	int save(CT ct);
	/**
	 * 删除评论
	 * @param CTID
	 */
	int delete(String CTID);
	/**
	 * 按条件查询帖子评论(通过CTID)
	 * @param CTID
	 * @return
	 */
	CT findCTID(String CTID);
	/**
	 * 查询全部帖子评论
	 * @return
	 */
	List<CT>findAll();
	/**
	 * 增加一个评论，返回受影响行数，同时该ID用户加3经验值,
	 * @return
	 */
	public int CaCT(CT c);
	/**
	 * 查询x条指定帖子ID的热门评论（按点赞数计算）
	 * @param x 指定条数
	 * @param PID 指定ID
	 * @return
	 */
	public List<CT>RCTByPIDandCnum(int x,String PID);
	/**
	 * 查询x条指定帖子ID的-评论（按时间降序，即从最新评论开始到最早的）
	 * @param x 指定条数
	 * @param PID 指定ID
	 * @return
	 */
	public List<CT>RCTByPIDandCDate(int x,String PID);	
	
	
	/**
	 * 为指定评论点赞
	 * @param CTID
	 * @return
	 */
	public int UaCTZan(String CTID);
	
}
