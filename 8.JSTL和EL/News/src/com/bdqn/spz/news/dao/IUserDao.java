package com.bdqn.spz.news.dao;

import com.bdqn.spz.news.entity.User;

/**
 * @author 施鹏振
 *用户接口
 */
public interface IUserDao {
	
	/**
	 * 登录
	 * @return
	 */
	User login(User users);
}
