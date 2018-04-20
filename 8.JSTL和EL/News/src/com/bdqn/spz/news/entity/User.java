package com.bdqn.spz.news.entity;


/**
 * @author 施鹏振
 *用户表
 */
public class User {
	/**
	 * 用户名
	 */
	private String uName;

	
	public String getuName() {
		return uName;
	}

	public void setuName(String uName) {
		this.uName = uName;
	}

	/**
	 * 密码
	 */
	private String uPwd;

	public String getuPwd() {
		return uPwd;
	}

	public void setuPwd(String uPwd) {
		this.uPwd = uPwd;
	}

	/**
	 * 构造
	 * @param uName
	 * @param uPwd
	 */
	public User(String uName, String uPwd) {
		super();
		this.setuName(uName);
		this.setuPwd(uPwd);
	}

	public User() {
		super();
	}
}
