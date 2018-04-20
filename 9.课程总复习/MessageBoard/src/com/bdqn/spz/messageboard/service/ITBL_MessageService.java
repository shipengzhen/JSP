package com.bdqn.spz.messageboard.service;

import java.util.List;

import com.bdqn.spz.messageboard.entity.TBL_Message;
import com.bdqn.spz.messageboard.util.Page;

/**
 * 留言接口
 * @author 施鹏振
 *
 */
public interface ITBL_MessageService {

	/**
	 * 分页查询全部留言
	 * @param page
	 * @return
	 */
	List<TBL_Message> findAllMessages(Page page);
	
	/**
	 * 新增留言
	 * @param tbl_Message
	 * @return boolean
	 */
	boolean insertMessages(TBL_Message tbl_Message);
	
	/**
	 * 查询留言总数
	 * @return int
	 */
	int findCountMessage();
}
