package com.bdqn.spz.news.entity;


/**
 * @author ʩ����
 *�û���
 */
public class User {
	/**
	 * �û���
	 */
	private String uName;

	
	public String getuName() {
		return uName;
	}

	public void setuName(String uName) {
		this.uName = uName;
	}

	/**
	 * ����
	 */
	private String uPwd;

	public String getuPwd() {
		return uPwd;
	}

	public void setuPwd(String uPwd) {
		this.uPwd = uPwd;
	}

	/**
	 * ����
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
