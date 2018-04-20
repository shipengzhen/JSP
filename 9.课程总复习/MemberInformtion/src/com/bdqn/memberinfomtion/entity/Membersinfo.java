package com.bdqn.memberinfomtion.entity;

/**
 * 会员信息表实体类
 * @author 施鹏振
 *
 */
public class Membersinfo {

	private int mId;//会员编号
	private String mName;//会员姓名
	private String mGender;//会员性别
	private int mAge;//会员年龄
	private String mAdderss;//家庭住址
	private String mEmail;//电子邮件
	
	
	/**
	 * 会员编号
	 * @return
	 */
	public int getmId() {
		return mId;
	}
	/**
	 * 会员编号
	 * @param mId
	 */
	public void setmId(int mId) {
		this.mId = mId;
	}
	/**
	 * 会员姓名
	 * @return
	 */
	public String getmName() {
		return mName;
	}
	/**
	 * 会员姓名
	 * @param mName
	 */
	public void setmName(String mName) {
		this.mName = mName;
	}
	/**
	 * 会员性别
	 * @return
	 */
	public String getmGender() {
		return mGender;
	}
	/**
	 * 会员性别
	 * @param mGender
	 */
	public void setmGender(String mGender) {
		this.mGender = mGender;
	}
	/**
	 * 会员年龄
	 * @return
	 */
	public int getmAge() {
		return mAge;
	}
	/**
	 * 会员年龄
	 * @param mAge
	 */
	public void setmAge(int mAge) {
		this.mAge = mAge;
	}
	/**
	 * 家庭住址
	 * @return
	 */
	public String getmAdderss() {
		return mAdderss;
	}
	/**
	 * 家庭住址
	 * @param mAdderss
	 */
	public void setmAdderss(String mAdderss) {
		this.mAdderss = mAdderss;
	}
	/**
	 * 电子邮件
	 * @return
	 */
	public String getmEmail() {
		return mEmail;
	}
	/**
	 * 电子邮件
	 * @param mEmail
	 */
	public void setmEmail(String mEmail) {
		this.mEmail = mEmail;
	}
	/**
	 * 查询全部
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
