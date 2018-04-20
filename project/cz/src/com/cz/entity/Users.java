package com.cz.entity;

public class Users {
	private int uId;	//用户id
	private String uName;//用户名
	private String uPwd;	//密码
	private String name;	//名字
	private String sex;		//姓名
	private String phone;	//电话
	private String address;	//地址
	private int jf;			//积分
	private String uTx;     //用户头像
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
