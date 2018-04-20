package com.entity;

/**
 * 帖子分类表
 * @author  包小栋
 *
 */
public class Type {
	private String TID; //帖子种类ID
	private String TName; //种类名称
	//无参构造函数
	public Type() {
		super();
	}
	//带参构造函数
	public Type(String tID, String tName) {
		super();
		TID = tID;
		TName = tName;
	}
	public String getTID() {
		return TID;
	}
	public void setTID(String tID) {
		TID = tID;
	}
	public String getTName() {
		return TName;
	}
	public void setTName(String tName) {
		TName = tName;
	}
}
