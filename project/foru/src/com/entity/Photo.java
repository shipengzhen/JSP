package com.entity;

/**
 * ͼƬ��
 * @author ��С��
 *
 */
public class Photo {
	private int PID; //ͼƬ�����
	private int UID;  //�û������ID
	public Photo(int pID, int uID) {
		super();
		PID = pID;
		UID = uID;
	}
	public Photo() {
		super();
	}
	public int getPID() {
		return PID;
	}
	public void setPID(int pID) {
		PID = pID;
	}
	public int getUID() {
		return UID;
	}
	public void setUID(int uID) {
		UID = uID;
	}
}
