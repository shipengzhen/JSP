package com.dao.impl;

import com.dao.*;

/**
 * factory工厂类，所有接口的实例化方法封装在此类中，而不是直接new 
 * 请将所有的null和未写的方法修正
 */
public class FC {
	/**
	 * 示例
	 * 获得UserI实例化对象
	 * @returnUserImp
	 */
	public static IUsee getUserI() {
		return new UseeImpl();
	}
	
	/**
	 * 获得TypeI示例对象
	 * @return
	 */
	public static IType getTypeI(){
		return null;
	}
	/**
	 * 获得PostI对象
	 * @return
	 */
	public static IPost getPostI() {
		return new PostImpl();
	}
	
	/**
	 * 获得Photo对象
	 */
	public static IPhoto getIPhoto(){
		return new PhotoImpl();
	}
	
	/**
	 * 获得Ct对对象
	 */
	public static ICT getICT(){
		return new CTImpl();
	}
	
	
	/**
	 * 获得等级表对接口
	 */
	public static IULV getIULV(){
		return new ULVImpl();
	}
	
	
}
