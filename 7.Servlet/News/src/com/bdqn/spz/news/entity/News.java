package com.bdqn.spz.news.entity;

/**
 * @author ʩ����
 *���ű�
 */
public class News {
	/**
	 * ����Id
	 */
	private int nId;

	public int getnId() {
		return nId;
	}
	public void setnId(int nId) {
		this.nId = nId;
	}

	/**
	 * ����ID
	 */
	private int ntId;

	public int getNtId() {
		return ntId;
	}
	public void setNtId(int ntId) {
		this.ntId = ntId;
	}
	
	//���ű���
	private String nTitle;
	
	//���ŷ���ʱ��
	private String nCreateDate;

	/**
	 * ���ű���
	 * @return String
	 */
	public String getnTitle() {
		return nTitle;
	}
	
	/**
	 * ���ű���
	 * @param String
	 */
	public void setnTitle(String nTitle) {
		this.nTitle = nTitle;
	}
	
	/**
	 * ���ŷ���ʱ��
	 * @return String
	 */
	public String getnCreateDate() {
		return nCreateDate;
	}
	
	/**
	 * ���ŷ���ʱ��
	 * @param String 
	 */
	public void setnCreateDate(String nCreateDate) {
		this.nCreateDate = nCreateDate;
	}
	
	
	public News() {
		super();
	}
	
	/**
	 * ���ű����ҳ
	 * @param String nTitle
	 * @param Strin nCreateDate
	 */
	public News(String nTitle, String nCreateDate) {
		super();
		this.nTitle = nTitle;
		this.nCreateDate = nCreateDate;
	}
	
}
