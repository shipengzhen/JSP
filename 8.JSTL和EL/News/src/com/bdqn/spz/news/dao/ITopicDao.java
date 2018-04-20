package com.bdqn.spz.news.dao;

import java.util.List;

import com.bdqn.spz.news.entity.Topic;

/**
 * @author 施鹏振
 *主题接口
 */
public interface ITopicDao {
	
	/**
	 * 修改主题
	 * @param string
	 * @return
	 */
	int upDateN(Topic topic);
	
	/**
	 * @return
	 * 查询所有主题
	 */
	List<Topic> findTopicAll();
	
	/**
	 * 删除主题
	 * @param tId
	 * @return
	 */
	int deleteTopic(int tId);
}
