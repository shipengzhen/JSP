package com.entity;

/**
 * ���۱�
 * @author  ��С��
 *
 */
public class CT {
	private String CID;  //����ID
	private String Text; //��������
	private int PID;  //��������ID
	private int UID; //������ID
	private String UName;//����������
	private int Uexp;//�����߾���
	private String CDate; //��������
	private int Cnum; //��������
	//�޲ι��캯��
	public CT() {
		super();
	}
	//���ι��캯��
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
