package com.bdqn.spz.messageboard.service;

import java.util.List;

import com.bdqn.spz.messageboard.entity.TBL_Message;
import com.bdqn.spz.messageboard.util.Page;

/**
 * ���Խӿ�
 * @author ʩ����
 *
 */
public interface ITBL_MessageService {

	/**
	 * ��ҳ��ѯȫ������
	 * @param page
	 * @return
	 */
	List<TBL_Message> findAllMessages(Page page);
	
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
