package com.entity;
/**
 * 用户实体类
 * @author 包小栋
 *
 */
public class Usee {
	private String ID; //用户ID
	private String UName; //用户昵称
	private String Sex;//用户性别
	private String Pwd;//登录密码
	private int Uexp;//用户经验值
	private int UMoney; //用户金币
	private String Uxy; //用户签名
	private String UPhone; //用户手机号
	private String UEmail; //用户邮箱
	private int UA;	//用户身份 
	//无参构造函数
	public Usee() {
		super();
	}
	//带参构造函数
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
