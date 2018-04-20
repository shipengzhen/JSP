package com.cz.entity;

/**
 * 商品详情
 * @author lizhen
 *
 */
public class Spimgae {
	private int Spimgaeid;	//商品详情图片 id
	private int spid;		//商品id
	private String imageurl;	//图片地址
	public int getSpimgaeid() {
		return Spimgaeid;
	}
	public void setSpimgaeid(int spimgaeid) {
		Spimgaeid = spimgaeid;
	}
	public int getSpid() {
		return spid;
	}
	public void setSpid(int spid) {
		this.spid = spid;
	}
	public String getImageurl() {
		return imageurl;
	}
	public void setImageurl(String imageurl) {
		this.imageurl = imageurl;
	}
	
	
}
