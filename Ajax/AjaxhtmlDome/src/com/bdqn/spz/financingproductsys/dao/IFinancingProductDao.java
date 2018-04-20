package com.bdqn.spz.financingproductsys.dao;

import java.util.List;

import com.bdqn.spz.financingproductsys.entity.FinancingProduct;

/**
 * ��Ʋ�Ʒ��Ϣ��ӿ�
 * @author ʩ����
 *
 */
public interface IFinancingProductDao {

	/**
	 * ��ѯȫ�������Ϣ
	 * @return
	 */
	List<FinancingProduct> findAllFinancingProduct();
	
	/**
	 * ģ����ѯ
	 * @param id
	 * @param risk
	 * @return
	 */
	List<FinancingProduct> findFinancingProduct(String id,int risk);
	
	/**
	 * ���������Ϣ
	 * @param financingProduct
	 * @return
	 */
	int insertFinancingProduct(FinancingProduct financingProduct);
}
