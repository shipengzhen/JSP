package com.entity;

/**
 * 帖子表
 * @author  包小栋
 *
 */
public class Post {
	private String PID;//帖子ID
	private String Phh;//帖子标题
	private String Text;//帖子内容
	private int UID; //发帖人ID
	private String UName;//发帖人姓名
	private int TID;  //帖子所属分类ID
	private String Uexp;//经验值
	private String PDate; //发表日期
	private int PRead;  //帖子阅读量
	private int PZan; //点赞数
	private int PCai; //踩数
	//无参构造函数
	public Post() {
		super();
	}
	/**
	 * 带参构造函数
	 */
	public Post(String pID, String phh, String text, int uID, String uName,
			int tID, String uexp, String pDate, int pRead, int pZan, int pCai) {
		super();
		PID = pID;
		Phh = phh;
		Text = text;
		UID = uID;
		UName = uName;
		TID = tID;
		Uexp = uexp;
		PDate = pDate;
		PRead = pRead;
		PZan = pZan;
		PCai = pCai;
	}
	public String getPID() {
		return PID;
	}
	public void setPID(String pID) {
		PID = pID;
	}
	public String getPhh() {
		return Phh;
	}
	public void setPhh(String phh) {
		Phh = phh;
	}
	public String getUexp() {
		return Uexp;
	}
	public void setUexp(String uexp) {
		Uexp = uexp;
	}
	public String getText() {
		return Text;
	}
	public void setText(String text) {
		Text = text;
	}
	public int getUID() {
		return UID;
	}
	public void setUID(int uID) {
		UID = uID;
	}
	public int getTID() {
		return TID;
	}
	public void setTID(int tID) {
		TID = tID;
	}
	public String getUName() {
		return UName;
	}
	public void setUName(String uName) {
		UName = uName;
	}
	public String getPDate() {
		return PDate;
	}
	public void setPDate(String pDate) {
		PDate = pDate;
	}
	public int getPRead() {
		return PRead;
	}
	public void setPRead(int pRead) {
		PRead = pRead;
	}
	public int getPZan() {
		return PZan;
	}
	public void setPZan(int pZan) {
		PZan = pZan;
	}
	public int getPCai() {
		return PCai;
	}
	public void setPCai(int pCai) {
		PCai = pCai;
	}
}
	