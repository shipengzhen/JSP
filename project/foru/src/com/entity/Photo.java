package com.entity;

/**
 * 图片表
 * @author 包小栋
 *
 */
public class Photo {
	private int PID; //图片的序号
	private int UID;  //用户发表的ID
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
