package com.bdqn.spz.news.dao;

import java.util.List;

import com.bdqn.spz.news.entity.Topic;

/**
 * @author ʩ����
 *����ӿ�
 */
public interface ITopicDao {
	
	/**
	 * �޸�����
	 * @param string
	 * @return
	 */
	int upDateN(Topic topic);
	
	/**
	 * @return
	 * ��ѯ��������
	 */
	List<Topic> findTopicAll();
	
	/**
	 * ɾ������
	 * @param tId
	 * @return
	 */
	int deleteTopic(int tId);
}
