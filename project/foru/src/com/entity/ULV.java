package com.entity;

/**
 * 用户等级表
 * @author  包小栋
 *
 */
public class ULV {
	private String LV; //用户等级
	private int Exp;//所需的经验值
	private String LTitle; //此等级所对应的头衔
	private int NextExp;//距离升级差多少经验
	//无参构造函数
	public ULV() {
		super();
	}
	//带参构造函数
	public ULV(String lV, int exp, String lTitle) {
		super();
		LV = lV;
		Exp = exp;
		LTitle = lTitle;
	}
	public int getNextExp() {
		return NextExp;
	}
	public void setNextExp(int nextExp) {
		NextExp = nextExp;
	}
	public String getLV() {
		return LV;
	}
	public void setLV(String lV) {
		LV = lV;
	}
	public int getExp() {
		return Exp;
	}
	public void setExp(int exp) {
		Exp = exp;
	}
	public String getLTitle() {
		return LTitle;
	}
	public void setLTitle(String lTitle) {
		LTitle = lTitle;
	}
}
