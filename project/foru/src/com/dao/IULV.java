package com.dao;

import java.util.List;

import com.entity.ULV;
/**
 * 用户等级表
 * @author  包小栋
 *
 */
public interface IULV {
	/**
	 * 新增用户的等级
	 * @param ulv
	 */
	void save(ULV ulv);
	/**
	 * 查询用户等级(通过)
	 * @param lv
	 * @return
	 */
	ULV findULV(int lv);
	/**
	 * 查询全部
	 * @return
	 */
	List<ULV>findAll();
	
	public ULV RLV(int uexp);
	
}
