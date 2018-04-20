package com.bdqn.spz.financingproductsys.dao;

import java.util.List;

import com.bdqn.spz.financingproductsys.entity.FinancingProduct;

/**
 * 理财产品信息表接口
 * @author 施鹏振
 *
 */
public interface IFinancingProductDao {

	/**
	 * 查询全部理财信息
	 * @return
	 */
	List<FinancingProduct> findAllFinancingProduct();
	
	/**
	 * 模糊查询
	 * @param id
	 * @param risk
	 * @return
	 */
	List<FinancingProduct> findFinancingProduct(String id,int risk);
	
	/**
	 * 新增理财信息
	 * @param financingProduct
	 * @return
	 */
	int insertFinancingProduct(FinancingProduct financingProduct);
}
