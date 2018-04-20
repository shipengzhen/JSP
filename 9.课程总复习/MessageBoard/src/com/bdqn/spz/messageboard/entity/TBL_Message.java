package com.bdqn.spz.messageboard.entity;

public class TBL_Message {

	//����id
	private int id;
	
	//������Ϣ
	private String message;
	
	
	/**
	 * ��������
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

	//����
	private String author;
	
	//����ʱ��
	private String postTime;

	/**
	 * ����id
	 * @return int
	 */
	public int getId() {
		return id;
	}

	/**
	 * ����id
	 * @param int
	 */
	public void setId(int id) {
		this.id = id;
	}

	/**
	 * ������Ϣ
	 * @return String
	 */
	public String getMessage() {
		return message;
	}

	/**
	 * ������Ϣ
	 * @param String
	 */
	public void setMessage(String message) {
		this.message = message;
	}

	/**
	 * ����
	 * @return String
	 */
	public String getAuthor() {
		return author;
	}

	/**
	 * ����
	 * @param String
	 */
	public void setAuthor(String author) {
		this.author = author;
	}

	/**
	 * ����ʱ��
	 * @return String
	 */
	public String getPostTime() {
		return postTime;
	}

	/**
	 * ����ʱ��
	 * @param postTime
	 */
	public void setPostTime(String postTime) {
		this.postTime = postTime;
	}
	
	/**
	 * ��ѯȫ�����Է�ҳ
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

	//��
	public TBL_Message() {
		super();
	}
	
}
