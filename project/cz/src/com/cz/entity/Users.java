package com.cz.entity;

public class Users {
	private int uId;	//�û�id
	private String uName;//�û���
	private String uPwd;	//����
	private String name;	//����
	private String sex;		//����
	private String phone;	//�绰
	private String address;	//��ַ
	private int jf;			//����
	private String uTx;     //�û�ͷ��
	private double uMoney;	//qian
	
	
	public double getuMoney() {
		return uMoney;
	}
	public void setuMoney(double uMoney) {
		this.uMoney = uMoney;
	}
	public String getuTx() {
		return uTx;
	}
	public void setuTx(String uTx) {
		this.uTx = uTx;
	}
	public int getuId() {
		return uId;
	}
	public void setuId(int uId) {
		this.uId = uId;
	}
	public String getuName() {
		return uName;
	}
	public void setuName(String uName) {
		this.uName = uName;
	}
	public String getuPwd() {
		return uPwd;
	}
	public void setuPwd(String uPwd) {
		this.uPwd = uPwd;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getSex() {
		return sex;
	}
	public void setSex(String sex) {
		this.sex = sex;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public int getJf() {
		return jf;
	}
	public void setJf(int jf) {
		this.jf = jf;
	}
	
	
}
