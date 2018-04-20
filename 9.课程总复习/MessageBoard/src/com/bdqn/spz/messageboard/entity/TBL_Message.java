package com.bdqn.spz.messageboard.entity;

public class TBL_Message {

	//主键id
	private int id;
	
	//留言信息
	private String message;
	
	
	/**
	 * 新增留言
	 * @param message
	 * @param author
	 * @param postTime
	 */
	public TBL_Message(String message, String author, String postTime) {
		super();
		this.message = message;
		this.author = author;
		this.postTime = postTime;
	}

	//作者
	private String author;
	
	//发表时间
	private String postTime;

	/**
	 * 主键id
	 * @return int
	 */
	public int getId() {
		return id;
	}

	/**
	 * 主键id
	 * @param int
	 */
	public void setId(int id) {
		this.id = id;
	}

	/**
	 * 留言信息
	 * @return String
	 */
	public String getMessage() {
		return message;
	}

	/**
	 * 留言信息
	 * @param String
	 */
	public void setMessage(String message) {
		this.message = message;
	}

	/**
	 * 作者
	 * @return String
	 */
	public String getAuthor() {
		return author;
	}

	/**
	 * 作者
	 * @param String
	 */
	public void setAuthor(String author) {
		this.author = author;
	}

	/**
	 * 发表时间
	 * @return String
	 */
	public String getPostTime() {
		return postTime;
	}

	/**
	 * 发表时间
	 * @param postTime
	 */
	public void setPostTime(String postTime) {
		this.postTime = postTime;
	}
	
	/**
	 * 查询全部留言分页
	 * @param id
	 * @param message
	 * @param author
	 * @param postTime
	 */
	public TBL_Message(int id, String message, String author, String postTime) {
		super();
		this.setId(id);
		this.setMessage(message);
		this.setAuthor(author);
		this.setPostTime(postTime);
	}

	//空
	public TBL_Message() {
		super();
	}
	
}
