package com.entity;

/**
 * 评论表
 * @author  包小栋
 *
 */
public class CT {
	private String CID;  //评论ID
	private String Text; //评论内容
	private int PID;  //所属帖子ID
	private int UID; //评论者ID
	private String UName;//评论者名字
	private int Uexp;//评论者经验
	private String CDate; //评论日期
	private int Cnum; //点赞数量
	//无参构造函数
	public CT() {
		super();
	}
	//带参构造函数
	public CT(String cID, String text, int pID, int uID, String cDate, int cnum) {
		super();
		CID = cID;
		Text = text;
		PID = pID;
		UID = uID;
		CDate = cDate;
		Cnum = cnum;
	}
	public String getCID() {
		return CID;
	}
	public void setCID(String cID) {
		CID = cID;
	}
	public String getText() {
		return Text;
	}
	public void setText(String text) {
		Text = text;
	}
	public int getPID() {
		return PID;
	}
	public void setPID(int pID) {
		PID = pID;
	}
	public int getUID() {
		return UID;
	}
	public void setUID(int uID) {
		UID = uID;
	}
	public String getCDate() {
		return CDate;
	}
	public void setCDate(String cDate) {
		CDate = cDate;
	}
	public int getCnum() {
		return Cnum;
	}
	public void setCnum(int cnum) {
		Cnum = cnum;
	}
	public String getUName() {
		return UName;
	}
	public void setUName(String uName) {
		UName = uName;
	}
	public int getUexp() {
		return Uexp;
	}
	public void setUexp(int uexp) {
		Uexp = uexp;
	}
}
