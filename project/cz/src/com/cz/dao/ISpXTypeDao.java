package com.cz.dao;

import java.util.List;

import com.cz.entity.SpXType;

/**
 * 商品小类型
 * @author lizhen
 *
 */
public interface ISpXTypeDao {
	/**
	 * 相关推荐
	 * 查询全部 小类型
	 * @return
	 */
	List<SpXType> findallxtype(int SptypeId);
}
