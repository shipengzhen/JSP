package com.entity;

/**
 * �û��ȼ���
 * @author  ��С��
 *
 */
public class ULV {
	private String LV; //�û��ȼ�
	private int Exp;//����ľ���ֵ
	private String LTitle; //�˵ȼ�����Ӧ��ͷ��
	private int NextExp;//������������پ���
	//�޲ι��캯��
	public ULV() {
		super();
	}
	//���ι��캯��
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
