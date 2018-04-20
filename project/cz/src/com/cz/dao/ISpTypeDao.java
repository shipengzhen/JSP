package com.cz.dao;

import java.util.List;

import com.cz.entity.SpType;

public interface ISpTypeDao {
	/**
	 * 查看所有类型
	 * @return
	 */
	List<SpType> findAllStype();
}
