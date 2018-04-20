package com.bdqn.spz.news.dao;

import java.util.List;

import com.bdqn.spz.news.entity.News;
import com.bdqn.spz.news.util.Page;

/**
 * @author 施鹏振
 *新闻接口
 */
public interface INewsDao {
	
	/**
	 * @param tId
	 * @return
	 * 通过主题id查询新闻
	 */
	boolean findNewsByTId(int nTId);
	
	/**
	 * 新闻标题分页
	 * @param int tId
	 * @param Page page
	 * @return 新闻集合
	 */
	List<News> findNewsByTId(int tId,Page page);
	
	/**
	 * 查询通过类型Id查询新闻总数量
	 * @return int
	 */
	int findCount(int nTId);
}
