package com.cz.dao;

import java.util.List;

import com.cz.entity.Sp;
import com.cz.util.Page;

public interface IScDao {

	/**
	 * 收藏
	 * @param spid
	 * @param userid
	 * @return
	 */
	int scSp(int spid,int uid);
	
	
	/**
	 * 查询收藏商品
	 * @param userId
	 * @return
	 */
	List<Sp> scList(int uId,Page p);
	
	/**
	 * 收藏商品的数量
	 * @param uId
	 * @return
	 */
	int scCount(int uId);
	
	/**
	 * 删除收藏
	 * @param scId
	 * @return
	 */
	int scDelete(int scId);
	/**
	 * 判断是否收藏
	 */
	boolean scpd(int spid,int uid);
}











