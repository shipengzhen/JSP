package com.bdqn.spz.messageboard.dao;

import java.util.List;

import com.bdqn.spz.messageboard.entity.TBL_Message;
import com.bdqn.spz.messageboard.util.Page;

/**
 * ���Խӿ�
 * @author ʩ����
 *
 */
public interface ITBL_MessageDao {

	/**
	 * ��ҳ��ѯȫ������
	 * @param page
	 * @return
	 */
	List<TBL_Message> findAllMessage(Page page);
	
	/**
	 * ��������
	 * @param tbl_Message
	 * @return boolean
	 */
	boolean insertMessages(TBL_Message tbl_Message);
	
	/**
	 * ��ѯ��������
	 * @return int
	 */
	int findCountMessage();
}
