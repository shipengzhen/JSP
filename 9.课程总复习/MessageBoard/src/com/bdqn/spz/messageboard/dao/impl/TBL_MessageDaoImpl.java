package com.bdqn.spz.messageboard.dao.impl;

import java.util.ArrayList;
import java.util.List;

import com.bdqn.spz.messageboard.dao.ITBL_MessageDao;
import com.bdqn.spz.messageboard.entity.TBL_Message;
import com.bdqn.spz.messageboard.util.BaseDao;
import com.bdqn.spz.messageboard.util.Page;

/**
 * 留言实现类
 * @author 施鹏振
 *
 */
public class TBL_MessageDaoImpl extends BaseDao implements ITBL_MessageDao {

	
	/* 分页查询全部留言
	 * (non-Javadoc)
	 * @see com.bdqn.spz.messageboard.dao.ITBL_MessageDao#findAllMessages(com.bdqn.spz.messageboard.util.Page)
	 */
	@Override
	public List<TBL_Message> findAllMessage(Page page) {
		List<TBL_Message> tbl_MessagesList=new ArrayList<TBL_Message>();
		try {
			connection=getConnection();
			String sql="select top "+page.getPageSize()+" * from TBL_Message where id not in(select top "+(page.getCurrPageNo()-1)*page.getPageSize()+" id from TBL_Message)";
			preparedStatement=connection.prepareStatement(sql);
			resultSet=preparedStatement.executeQuery();
			while (resultSet.next()) {
				TBL_Message tbl_Message=new TBL_Message(resultSet.getInt("id"),resultSet.getString("message"),resultSet.getString("author"),resultSet.getString("postTime"));
				tbl_MessagesList.add(tbl_Message);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return tbl_MessagesList;
	}

	/*新增留言
	 *  (non-Javadoc)
	 * @see com.bdqn.spz.messageboard.dao.ITBL_MessageDao#insertMessages(com.bdqn.spz.messageboard.entity.TBL_Message)
	 */
	@Override
	public boolean insertMessages(TBL_Message tbl_Message) {
		try {
			String sql="insert into TBL_Message values(?,?,?)";
			Object[] pats={tbl_Message.getMessage(),tbl_Message.getAuthor(),tbl_Message.getPostTime()};
			if(exceUpdate(sql, pats)>0){
				return true;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return false;
	}

	
	/*
	 *  查询留言总数
	 * (non-Javadoc)
	 * @see com.bdqn.spz.messageboard.dao.ITBL_MessageDao#findCountMessage()
	 */
	@Override
	public int findCountMessage() {
		try {
			connection=getConnection();
			String sql="select count(*) from TBL_Message";
			preparedStatement=connection.prepareStatement(sql);
			resultSet=preparedStatement.executeQuery();
			while (resultSet.next()) {
				return resultSet.getInt(1);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return 0;
	}
}
