package com.bdqn.spz.news.entity;

/**
 * @author 施鹏振
 *新闻表
 */
public class News {
	/**
	 * 新闻Id
	 */
	private int nId;

	public int getnId() {
		return nId;
	}
	public void setnId(int nId) {
		this.nId = nId;
	}

	/**
	 * 主题ID
	 */
	private int ntId;

	public int getNtId() {
		return ntId;
	}
	public void setNtId(int ntId) {
		this.ntId = ntId;
	}
	
	//新闻标题
	private String nTitle;
	
	//新闻发布时间
	private String nCreateDate;

	/**
	 * 新闻标题
	 * @return String
	 */
	public String getnTitle() {
		return nTitle;
	}
	
	/**
	 * 新闻标题
	 * @param String
	 */
	public void setnTitle(String nTitle) {
		this.nTitle = nTitle;
	}
	
	/**
	 * 新闻发布时间
	 * @return String
	 */
	public String getnCreateDate() {
		return nCreateDate;
	}
	
	/**
	 * 新闻发布时间
	 * @param String 
	 */
	public void setnCreateDate(String nCreateDate) {
		this.nCreateDate = nCreateDate;
	}
	
	
	public News() {
		super();
	}
	
	/**
	 * 新闻标题分页
	 * @param String nTitle
	 * @param Strin nCreateDate
	 */
	public News(String nTitle, String nCreateDate) {
		super();
		this.nTitle = nTitle;
		this.nCreateDate = nCreateDate;
	}
	
}
