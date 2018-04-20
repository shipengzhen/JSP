package com.bdqn.spz.news.entity;

/**
 * @author 施鹏振
 *主题表
 */
public class Topic {
	
	/**
	 * 主题ID
	 */
	private int tId;

	public int gettId() {
		return tId;
	}


	public void settId(int tId) {
		this.tId = tId;
	}
	/**
	 * 主题
	 */
	private String tName;

	/**
	 * 
	 * @return String
	 */
	public String gettName() {
		return tName;
	}


	/**
	 * 
	 * @param String 
	 */
	public void settName(String tName) {
		this.tName = tName;
	}


	/**
	 * @param int tId
	 * @param String tName
	 */
	public Topic(int tId, String tName) {
		super();
		this.settId(tId);
		this.settName(tName);
	}


	public Topic() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	
}
