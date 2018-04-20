package com.cz.entity;

import java.sql.Date;

/**
 * 商品表
 * @author lizhen
 *
 */
public class Sp {
    private int spId;	//商品id
    private String spName;//商品名字
    private int spTypeid;	//商品类型名字
    private String spyMoney;//商品原价
    private String spxMoney;//商品现价格
    private String spMs;//商品描述
    private String spBh;//商品编号
    private int jf;		//积分
    private String jj;		//季节
    private String spXtype;	//小类型
    private String cc;		//尺寸
    private int xl;			//销量
    private String spTp;	//展示图片
    private String kc;		//库存
    private Date sptime;	//上架时间
    private int plNum;    //评论数
    private int spXTypeId;  //商品小类型Id
    private int scId;     //收藏Id
    
	public int getScId() {
		return scId;
	}
	public void setScId(int scId) {
		this.scId = scId;
	}
	public int getSpXTypeId() {
		return spXTypeId;
	}
	public void setSpXTypeId(int spXTypeId) {
		this.spXTypeId = spXTypeId;
	}
	public Date getSptime() {
		return sptime;
	}
	public void setSptime(Date sptime) {
		this.sptime = sptime;
	}
	public int getSpId() {
		return spId;
	}
	public void setSpId(int spId) {
		this.spId = spId;
	}
	public String getSpName() {
		return spName;
	}
	public void setSpName(String spName) {
		this.spName = spName;
	}
	public int getSpTypeid() {
		return spTypeid;
	}
	public void setSpTypeid(int spTypeid) {
		this.spTypeid = spTypeid;
	}
	

	
	public String getSpyMoney() {
		return spyMoney;
	}
	public void setSpyMoney(String spyMoney) {
		this.spyMoney = spyMoney;
	}
	public String getSpxMoney() {
		return spxMoney;
	}
	public void setSpxMoney(String spxMoney) {
		this.spxMoney = spxMoney;
	}
	public String getSpMs() {
		return spMs;
	}
	public void setSpMs(String spMs) {
		this.spMs = spMs;
	}
	public String getSpBh() {
		return spBh;
	}
	public void setSpBh(String spBh) {
		this.spBh = spBh;
	}
	public int getJf() {
		return jf;
	}
	public void setJf(int jf) {
		this.jf = jf;
	}

	public String getJj() {
		return jj;
	}
	public void setJj(String jj) {
		this.jj = jj;
	}
	public String getSpXtype() {
		return spXtype;
	}
	public void setSpXtype(String spXtype) {
		this.spXtype = spXtype;
	}
	public String getCc() {
		return cc;
	}
	public void setCc(String cc) {
		this.cc = cc;
	}
	public int getXl() {
		return xl;
	}
	public void setXl(int xl) {
		this.xl = xl;
	}

	public String getSpTp() {
		return spTp;
	}
	public void setSpTp(String spTp) {
		this.spTp = spTp;
	}
	public String getKc() {
		return kc;
	}
	public void setKc(String kc) {
		this.kc = kc;
	}
	public int getPlNum() {
		return plNum;
	}
	public void setPlNum(int plNum) {
		this.plNum = plNum;
	}
    
}
