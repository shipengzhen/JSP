package com.entity;

/**
 * ���ӷ����
 * @author  ��С��
 *
 */
public class Type {
	private String TID; //��������ID
	private String TName; //��������
	//�޲ι��캯��
	public Type() {
		super();
	}
	//���ι��캯��
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
