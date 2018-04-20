package com.bdqn.spz.news.dao.impl;

import com.bdqn.spz.news.dao.IUserDao;
import com.bdqn.spz.news.entity.User;
import com.bdqn.spz.news.util.BaseDao;

public class UserDaoImpl extends BaseDao implements IUserDao {

	/* (non-Javadoc)
	 * @see com.bdqn.spz.news.dao.INEWS_USERSDao#login()
	 * µ«¬º µœ÷¿‡
	 */
	@Override
	public User login(User users) {
		// TODO Auto-generated method stub
		try {
			connection=getConnection();
			String sql="select * from NEWS_USERS where uname=? and upwd=?";
			preparedStatement=connection.prepareStatement(sql);
			preparedStatement.setString(1, users.getuName());
			preparedStatement.setString(2, users.getuPwd());
			resultSet=preparedStatement.executeQuery();
			while (resultSet.next()) {
				return new User();
			}
		} catch (Exception e) {
			e.printStackTrace();
			// TODO: handle exception
		}finally{
			closeAll();
		}
		return null;
	}

}
