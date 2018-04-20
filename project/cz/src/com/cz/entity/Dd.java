package com.cz.entity;
/**
 * 订单表
 * @author lizhen
 *
 */
public class Dd {
	private int ddId;	//订单id
	private int spNum;	//订单数量
	private String ddType;	//订单状类型
	private int spid;	//商品id
	private int uid;	//用户id
	
	private String spTp;  //商品图片
	private String spMs;   //商品描述
	private int spXTypeId;  //商品小类型Id
	private String spXMoney;  //商品现价
	private String spName;    //商品名
	public String getSpTp() {
		return spTp;
	}
	public void setSpTp(String spTp) {
		this.spTp = spTp;
	}
	public String getSpMs() {
		return spMs;
	}
	public void setSpMs(String spMs) {
		this.spMs = spMs;
	}
	public int getSpXTypeId() {
		return spXTypeId;
	}
	public void setSpXTypeId(int spXTypeId) {
		this.spXTypeId = spXTypeId;
	}
	public String getSpXMoney() {
		return spXMoney;
	}
	public void setSpXMoney(String spXMoney) {
		this.spXMoney = spXMoney;
	}
	public String getSpName() {
		return spName;
	}
	public void setSpName(String spName) {
		this.spName = spName;
	}
	public int getDdId() {
		return ddId;
	}
	public void setDdId(int ddId) {
		this.ddId = ddId;
	}
	public int getSpNum() {
		return spNum;
	}
	public void setSpNum(int spNum) {
		this.spNum = spNum;
	}

	public String getDdType() {
		return ddType;
	}
	public void setDdType(String ddType) {
		this.ddType = ddType;
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
