package com.bdqn.spz.news.dao.impl;

import java.util.ArrayList;
import java.util.List;

import com.bdqn.spz.news.dao.ITopicDao;
import com.bdqn.spz.news.entity.Topic;
import com.bdqn.spz.news.util.BaseDao;

/**
 * @author 施鹏振
 *主题实现类
 */
public class TopicDaoImpl extends BaseDao implements ITopicDao {

	/* (non-Javadoc)
	 * 修改主题
	 * @see com.bdqn.spz.news.dao.ITopicDao#upDateN(java.lang.String)
	 */
	@Override
	public int upDateN(Topic topic) {
		try {
			connection=getConnection();
			String sql="update TOPIC set TNAME=? where TID=?";
			Object[] pats={topic.gettName(),topic.gettId()};
			return exceUpdate(sql, pats);
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return 0;
	}

	/* (non-Javadoc)
	 * @see com.bdqn.spz.news.dao.ITopicDao#findTopicAll()
	 * 查询所有主题
	 */
	@Override
	public List<Topic> findTopicAll(){
		List<Topic> topics=new ArrayList<Topic>();
		try {
			connection=getConnection();
			String sql="select * from topic";
			preparedStatement=connection.prepareStatement(sql);
			resultSet=preparedStatement.executeQuery();
			while (resultSet.next()) {
				Topic topic=new Topic(resultSet.getInt("tid"),resultSet.getString("tname"));
				topics.add(topic);
			}
		} catch (Exception e) {
			// TODO: handle exception
		}
		return topics;
	}

	/* (non-Javadoc)
	 * 删除主题
	 * @see com.bdqn.spz.news.dao.ITopicDao#delectTopic(int)
	 */
	@Override
	public int deleteTopic(int tId) {
		try {
			connection=getConnection();
			String sql="delete from topic where TID=?";
			Object[] pats={tId};
			return exceUpdate(sql, pats);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return 0;
	}

}
