package com.bdqn.spz.news.dao;

import java.util.List;

import com.bdqn.spz.news.entity.News;
import com.bdqn.spz.news.util.Page;

/**
 * @author ʩ����
 *���Žӿ�
 */
public interface INewsDao {
	
	/**
	 * @param tId
	 * @return
	 * ͨ������id��ѯ����
	 */
	boolean findNewsByTId(int nTId);
	
	/**
	 * ���ű����ҳ
	 * @param int tId
	 * @param Page page
	 * @return ���ż���
	 */
	List<News> findNewsByTId(int tId,Page page);
	
	/**
	 * ��ѯͨ������Id��ѯ����������
	 * @return int
	 */
	int findCount(int nTId);
}
