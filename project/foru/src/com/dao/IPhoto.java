package com.dao;

/**
 * 图片表的数据
 * @author HP
 *
 */
public interface IPhoto {
	/**
	 * 返回最大值的数据
	 * @return
	 */
	public int Max();
	
	
	
	/**
	 * 插入一条数据,照片ID和用户ID
	 * @param PID
	 * @param UID
	 * @return
	 */
	public int Create(int PID,String UID);
	
	
	
}
