package com.cz.entity;

/**
 * 商品类型表
 * @author lizhen
 *
 */
public class SpType {
	private int spTypeid;	//商品类型id
	private String spTypeName;//商品类型
	
	/**
	 * 商品类型id
	 * @return
	 */
	public int getSpTypeid() {
		return spTypeid;
	}
	/**
	 * 商品类型id
	 * @param spTypeid
	 */
	public void setSpTypeid(int spTypeid) {
		this.spTypeid = spTypeid;
	}
	/**
	 * 商品类型
	 * @return
	 */
	public String getSpTypeName() {
		return spTypeName;
	}
	/**
	 * 商品类型
	 * @param spTypeName
	 */
	public void setSpTypeName(String spTypeName) {
		this.spTypeName = spTypeName;
	}
	
	
}
