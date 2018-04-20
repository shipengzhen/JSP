package com.dao;

import java.util.List;

import com.entity.Usee;

/**
 * 用户表
 * @author  包小栋
 *
 */
public interface IUsee {
	
	
	
	/**
	 * --查询全部用户
	 * @return
	 */
	List<Usee>FindAll();
	/**
	 * 检查指定用户名和密码是否能够登录成功,成功返回1，不成功返回-1
	 * @param name用户名
	 * @param pwd密码
	 * @return登录结果
	 */
	public int RLogin(String name,String pwd);
	
	/**
	 * 检查指定用户名和密码是否能够以管理员身份登录成功,成功返回1，不成功返回-1
	 * @param name用户名
	 * @param pwd密码
	 * @return登录结果
	 */
	public int RLoginByAdmin(String name,String pwd);
	
	
	/**
	 * 返回指定ID用户的详细信息
	 */
	public Usee RaUseeByUID(String UID);	
	/**
	 * 注册一位用户,成功返回ID  主键 否则返回-1
	 */
	public int CaUsee(Usee us);	
	/**
	 * 修改一位用户资料,返回受影响行数
	 */
	public int UaUsee(Usee us);
	/**
	 * 查询指定数量用户，按照等级排序（及用户的经验值倒序排列）
	 */
	public List<Usee>RUsee(int x);	
	
	
	/**
	 * 为指定ID用户增加指定经验,返回受影响行数
	 * @param ID
	 * @return
	 */
	public int UxUexp(String ID,int uexp);
	
	
	/**
	 * 根据用户昵称查询ID
	 * @param UName
	 * @return
	 */
	public String RuidByUName(String UName);
	
}
