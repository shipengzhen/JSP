package com.entity;

/**
 * ���ӱ�
 * @author  ��С��
 *
 */
public class Post {
	private String PID;//����ID
	private String Phh;//���ӱ���
	private String Text;//��������
	private int UID; //������ID
	private String UName;//����������
	private int TID;  //������������ID
	private String Uexp;//����ֵ
	private String PDate; //��������
	private int PRead;  //�����Ķ���
	private int PZan; //������
	private int PCai; //����
	//�޲ι��캯��
	public Post() {
		super();
	}
	/**
	 * ���ι��캯��
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
	