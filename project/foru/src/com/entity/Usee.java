package com.entity;
/**
 * �û�ʵ����
 * @author ��С��
 *
 */
public class Usee {
	private String ID; //�û�ID
	private String UName; //�û��ǳ�
	private String Sex;//�û��Ա�
	private String Pwd;//��¼����
	private int Uexp;//�û�����ֵ
	private int UMoney; //�û����
	private String Uxy; //�û�ǩ��
	private String UPhone; //�û��ֻ���
	private String UEmail; //�û�����
	private int UA;	//�û���� 
	//�޲ι��캯��
	public Usee() {
		super();
	}
	//���ι��캯��
	public Usee(String iD, String uName, String sex, String pwd, int uexp,
			int uMoney, String uxy, String uPhone, String uEmail, int uA) {
		super();
		ID = iD;
		UName = uName;
		Sex = sex;
		Pwd = pwd;
		Uexp = uexp;
		UMoney = uMoney;
		Uxy = uxy;
		UPhone = uPhone;
		UEmail = uEmail;
		UA = uA;
	}
	public String getID() {
		return ID;
	}
	public void setID(String iD) {
		ID = iD;
	}
	public String getUName() {
		return UName;
	}
	public void setUName(String uName) {
		UName = uName;
	}
	public String getSex() {
		return Sex;
	}
	public void setSex(String sex) {
		Sex = sex;
	}
	public String getPwd() {
		return Pwd;
	}
	public void setPwd(String pwd) {
		Pwd = pwd;
	}
	public int getUexp() {
		return Uexp;
	}
	public void setUexp(int uexp) {
		Uexp = uexp;
	}
	public int getUMoney() {
		return UMoney;
	}
	public void setUMoney(int uMoney) {
		UMoney = uMoney;
	}
	public String getUxy() {
		return Uxy;
	}
	public void setUxy(String uxy) {
		Uxy = uxy;
	}
	public String getUPhone() {
		return UPhone;
	}
	public void setUPhone(String uPhone) {
		UPhone = uPhone;
	}
	public String getUEmail() {
		return UEmail;
	}
	public void setUEmail(String uEmail) {
		UEmail = uEmail;
	}
	public int getUA() {
		return UA;
	}
	public void setUA(int uA) {
		UA = uA;
	}
}
