package com.cz.dao;

import java.util.List;

import com.cz.entity.Users;

/**
 * 用户
 * @author lizhen
 *
 */
public interface IUsersDao {
	/**
	 * 注册
	 */
	boolean insertUser(String name, String pwd);
	
	/**
	 * 登录
	 */
	Users findbypwd(String name,String pwd);
	
	/**
	 * 通过用户Id查询个人信息
	 * @param uId
	 * @return
	 */
	Users findU(int uId);
	
	/**
	 * 修改用户头像
	 * @param uId
	 * @param uTx
	 * @return
	 */
	int updateUTx(int uId,String uTx);
	/**
	 * 修改用户用户名和性别
	 * @param uId
	 * @param uName
	 * @param Sex
	 * @return
	 */
	int updateUXx(int uId,String uName,String Sex);
	
	/**
	 * 通过原密码修改密码
	 * @param uId
	 * @param ymm
	 * @return
	 */
	int updatemmGetymm(String mm,int uId, String ymm);
	
	/**
	 * 通过手机号修改密码
	 * @param uId
	 * @param phone
	 * @return
	 */
	int updatemmGetphone(String mm,int uId,String phone);
	
	/**
	 * 通过密码修改手机号
	 * @param uId
	 * @param phone
	 * @return
	 */
	int updatephoneGetmm(String phone,int uId,String mm);
	/**
	 * 修改用户资料  -- 购物车 ---资料
	 */
	boolean updateusers(Users u);

	
	
	
	
	
	
	
	
	
	
	
	
}
