package com.cz.entity;

import java.sql.Date;

public class Pl {
	private int plId;	//评论id
	private String plString;//评论内容
	private Date plTime;	//评论时间
	private String	plType;	//评论类型
	private int spid;		//商品id
	private int uid;		//用户id
	private String uName;   //用户昵称
	private String uTx;  //用户图片
	private String spName; //商品名称
	private String spTp;  //商品图片
	private int spXTypeId; //商品小类型Id
	public int getSpXTypeId() {
		return spXTypeId;
	}
	public void setSpXTypeId(int spXTypeId) {
		this.spXTypeId = spXTypeId;
	}
	public String getSpName() {
		return spName;
	}
	public void setSpName(String spName) {
		this.spName = spName;
	}
	public String getSpTp() {
		return spTp;
	}
	public void setSpTp(String spTp) {
		this.spTp = spTp;
	}
	public String getuTx() {
		return uTx;
	}
	public void setuTx(String uTx) {
		this.uTx = uTx;
	}
	public String getuName() {
		return uName;
	}
	public void setuName(String uName) {
		this.uName = uName;
	}
	public int getPlId() {
		return plId;
	}
	public void setPlId(int plId) {
		this.plId = plId;
	}
	public String getPlString() {
		return plString;
	}
	public void setPlString(String plString) {
		this.plString = plString;
	}
	public Date getPlTime() {
		return plTime;
	}
	public void setPlTime(Date plTime) {
		this.plTime = plTime;
	}

	public String getPlType() {
		return plType;
	}
	public void setPlType(String plType) {
		this.plType = plType;
	}
	public int getSpid() {
		return spid;
	}
	public void setSpid(int spid) {
		this.spid = spid;
	}
	public int getUid() {
		return uid;
	}
	public void setUid(int uid) {
		this.uid = uid;
	}
	
}
