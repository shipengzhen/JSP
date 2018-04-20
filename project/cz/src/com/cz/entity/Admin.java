package com.cz.entity;

public class Admin {
	private String adName;	//管理账号
	private String adPwd;	//管理密码
	
	/**
	 * 管理账号
	 * @return
	 */
	public String getAdName() {
		return adName;
	}
	/**
	 * 管理账号
	 * @param adName
	 */
	public void setAdName(String adName) {
		this.adName = adName;
	}
	/**
	 * 管理员密码
	 * @return
	 */
	public String getAdPwd() {
		return adPwd;
	}
	/**
	 * 管理员密码
	 * @param adPwd
	 */
	public void setAdPwd(String adPwd) {
		this.adPwd = adPwd;
	}
	
	
}
