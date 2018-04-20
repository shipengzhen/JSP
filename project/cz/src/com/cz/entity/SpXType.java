package com.cz.entity;

public class SpXType {
	private int spxTypeId;	//商品小类型id
	private int spTypeId;	//商品大类型id
	private String spxTypeName;//商品小类型名字
	public int getSpxTypeId() {
		return spxTypeId;
	}
	public void setSpxTypeId(int spxTypeId) {
		this.spxTypeId = spxTypeId;
	}
	public int getSpTypeId() {
		return spTypeId;
	}
	public void setSpTypeId(int spTypeId) {
		this.spTypeId = spTypeId;
	}
	public String getSpxTypeName() {
		return spxTypeName;
	}
	public void setSpxTypeName(String spxTypeName) {
		this.spxTypeName = spxTypeName;
	}
	
	
}
