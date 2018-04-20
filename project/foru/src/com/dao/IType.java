package com.dao;

import java.util.List;

import com.entity.Type;
/**
 * 帖子种类接口
 * @author  包小栋
 *
 */
public interface IType {
	/**
	 * 新增帖子种类
	 * @param type
	 */
	void save(Type type);
	/**
	 * 删除帖子种类
	 * @param TID
	 */
	void delete(String TID);
	/**
	 * 按条件查询帖子的分类(通过TID查询)
	 * @param TID
	 * @return
	 */
	Type findTypeTID(String TID);
	/**
	 * 查询全部帖子种类
	 * @return
	 */
	List<Type>findAll();
}
