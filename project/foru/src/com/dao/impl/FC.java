package com.dao.impl;

import com.dao.*;

/**
 * factory�����࣬���нӿڵ�ʵ����������װ�ڴ����У�������ֱ��new 
 * �뽫���е�null��δд�ķ�������
 */
public class FC {
	/**
	 * ʾ��
	 * ���UserIʵ��������
	 * @returnUserImp
	 */
	public static IUsee getUserI() {
		return new UseeImpl();
	}
	
	/**
	 * ���TypeIʾ������
	 * @return
	 */
	public static IType getTypeI(){
		return null;
	}
	/**
	 * ���PostI����
	 * @return
	 */
	public static IPost getPostI() {
		return new PostImpl();
	}
	
	/**
	 * ���Photo����
	 */
	public static IPhoto getIPhoto(){
		return new PhotoImpl();
	}
	
	/**
	 * ���Ct�Զ���
	 */
	public static ICT getICT(){
		return new CTImpl();
	}
	
	
	/**
	 * ��õȼ���Խӿ�
	 */
	public static IULV getIULV(){
		return new ULVImpl();
	}
	
	
}
