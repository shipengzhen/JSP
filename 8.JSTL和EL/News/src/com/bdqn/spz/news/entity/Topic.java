package com.bdqn.spz.news.entity;

/**
 * @author ʩ����
 *�����
 */
public class Topic {
	
	/**
	 * ����ID
	 */
	private int tId;

	public int gettId() {
		return tId;
	}


	public void settId(int tId) {
		this.tId = tId;
	}
	/**
	 * ����
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
