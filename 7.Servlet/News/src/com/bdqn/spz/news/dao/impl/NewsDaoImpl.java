package com.bdqn.spz.news.dao.impl;

import java.util.ArrayList;
import java.util.List;

import com.bdqn.spz.news.dao.INewsDao;
import com.bdqn.spz.news.entity.News;
import com.bdqn.spz.news.util.BaseDao;
import com.bdqn.spz.news.util.Page;

public class NewsDaoImpl extends BaseDao implements INewsDao {

	/* (non-Javadoc)
	 * @see com.bdqn.spz.news.dao.INewsDao#findNewsByTId(int)
	 * 通过主题id查询新闻
	 */
	@Override
	public boolean findNewsByTId(int nTId) {
		try {
			connection=getConnection();
			String sql="select * from news where ntid=?";
			preparedStatement=connection.prepareStatement(sql);
			preparedStatement.setInt(1,nTId);
			resultSet=preparedStatement.executeQuery();
			if (resultSet.next()) {
				return true;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return false;
	}

	/* (non-Javadoc)
	 * @see com.bdqn.spz.news.dao.INewsDao#findNewsByTId(int, com.bdqn.spz.news.util.Page)
	 * 新闻标题分页
	 */
	@Override
	public List<News> findNewsByTId(int nTId, Page page) {
		List<News> newsList=new ArrayList<News>();
		try {
			connection=getConnection();
			String sql="select top "+page.getPageSize()+" ntitle,ncreatedate from news where ntid=? and nid not in(select top "+(page.getCurrPageNo()-1)*page.getPageSize()+" nid from news where ntid=?)";
			preparedStatement=connection.prepareStatement(sql);
			preparedStatement.setInt(1,nTId);
			preparedStatement.setInt(2,nTId);
			resultSet=preparedStatement.executeQuery();
			while (resultSet.next()) {
				News news=new News(resultSet.getString("ntitle"),resultSet.getString("ncreatedate"));
				newsList.add(news);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return newsList;
	}

	
	/**
	 * 查询通过类型Id查询新闻总数量
	 * @return int
	 */
	@Override
	public int findCount(int nTId) {
		try {
			connection=getConnection();
			String sql="select count(*) from news where ntid=?";
			preparedStatement=connection.prepareStatement(sql);
			preparedStatement.setInt(1, nTId);
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
