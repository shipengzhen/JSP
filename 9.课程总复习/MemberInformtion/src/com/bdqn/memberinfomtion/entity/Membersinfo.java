package com.bdqn.memberinfomtion.entity;

/**
 * ��Ա��Ϣ��ʵ����
 * @author ʩ����
 *
 */
public class Membersinfo {

	private int mId;//��Ա���
	private String mName;//��Ա����
	private String mGender;//��Ա�Ա�
	private int mAge;//��Ա����
	private String mAdderss;//��ͥסַ
	private String mEmail;//�����ʼ�
	
	
	/**
	 * ��Ա���
	 * @return
	 */
	public int getmId() {
		return mId;
	}
	/**
	 * ��Ա���
	 * @param mId
	 */
	public void setmId(int mId) {
		this.mId = mId;
	}
	/**
	 * ��Ա����
	 * @return
	 */
	public String getmName() {
		return mName;
	}
	/**
	 * ��Ա����
	 * @param mName
	 */
	public void setmName(String mName) {
		this.mName = mName;
	}
	/**
	 * ��Ա�Ա�
	 * @return
	 */
	public String getmGender() {
		return mGender;
	}
	/**
	 * ��Ա�Ա�
	 * @param mGender
	 */
	public void setmGender(String mGender) {
		this.mGender = mGender;
	}
	/**
	 * ��Ա����
	 * @return
	 */
	public int getmAge() {
		return mAge;
	}
	/**
	 * ��Ա����
	 * @param mAge
	 */
	public void setmAge(int mAge) {
		this.mAge = mAge;
	}
	/**
	 * ��ͥסַ
	 * @return
	 */
	public String getmAdderss() {
		return mAdderss;
	}
	/**
	 * ��ͥסַ
	 * @param mAdderss
	 */
	public void setmAdderss(String mAdderss) {
		this.mAdderss = mAdderss;
	}
	/**
	 * �����ʼ�
	 * @return
	 */
	public String getmEmail() {
		return mEmail;
	}
	/**
	 * �����ʼ�
	 * @param mEmail
	 */
	public void setmEmail(String mEmail) {
		this.mEmail = mEmail;
	}
	/**
	 * ��ѯȫ��
	 * @param mid
	 * @param mName
	 * @param mGender
	 * @param mAge
	 * @param mAdderss
	 * @param mEmail
	 */
	public Membersinfo(int mId, String mName, String mGender, int mAge,
			String mAdderss, String mEmail) {
		super();
		this.mId = mId;
		this.mName = mName;
		this.mGender = mGender;
		this.mAge = mAge;
		this.mAdderss = mAdderss;
		this.mEmail = mEmail;
	}
	public Membersinfo() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	
}
