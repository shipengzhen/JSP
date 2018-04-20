package com.bdqn.spz.messageboard.service.impl;

import java.util.List;

import com.bdqn.spz.messageboard.dao.ITBL_MessageDao;
import com.bdqn.spz.messageboard.dao.impl.TBL_MessageDaoImpl;
import com.bdqn.spz.messageboard.entity.TBL_Message;
import com.bdqn.spz.messageboard.service.ITBL_MessageService;
import com.bdqn.spz.messageboard.util.BaseDao;
import com.bdqn.spz.messageboard.util.Page;

public class TBL_MessageServiceImpl extends BaseDao implements
		ITBL_MessageService {
	
	ITBL_MessageDao messageDao=new TBL_MessageDaoImpl();
	
	/* 分页查询全部留言
	 * (non-Javadoc)
	 * @see com.bdqn.spz.messageboard.service.ITBL_MessageService#findAllMessages(com.bdqn.spz.messageboard.util.Page)
	 */
	@Override
	public List<TBL_Message> findAllMessages(Page page) {
		return messageDao.findAllMessage(page);
	}

	/* 新增留言
	 * (non-Javadoc)
	 * @see com.bdqn.spz.messageboard.service.ITBL_MessageService#insertMessages(com.bdqn.spz.messageboard.entity.TBL_Message)
	 */
	@Override
	public boolean insertMessages(TBL_Message tbl_Message) {
		return messageDao.insertMessages(tbl_Message);
	}

	/*  查询留言总数
	 * (non-Javadoc)
	 * @see com.bdqn.spz.messageboard.service.ITBL_MessageService#findCountMessage()
	 */
	@Override
	public int findCountMessage() {
		return messageDao.findCountMessage();
	}

}
