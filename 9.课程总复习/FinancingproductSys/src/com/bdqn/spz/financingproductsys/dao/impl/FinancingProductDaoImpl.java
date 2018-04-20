package com.bdqn.spz.financingproductsys.dao.impl;

import java.util.ArrayList;
import java.util.List;

import com.bdqn.spz.financingproductsys.dao.BaseDao;
import com.bdqn.spz.financingproductsys.dao.IFinancingProductDao;
import com.bdqn.spz.financingproductsys.entity.FinancingProduct;
/**
 * ��Ʋ�Ʒ��Ϣ��ʵ����
 * @author ʩ����
 *
 */
public class FinancingProductDaoImpl extends BaseDao implements IFinancingProductDao {

	/**
	 * ��ѯȫ�������Ϣ
	 */
	@Override
	public List<FinancingProduct> findAllFinancingProduct() {
		List<FinancingProduct> financingProducts=new ArrayList<FinancingProduct>();
		try {
			String sql="select* from FinancingProduct";
			resultSet=selectResultSet(sql);
			while (resultSet.next()) {
				FinancingProduct financingProduct=new FinancingProduct(resultSet.getString("id"), resultSet.getInt("risk"),resultSet.getString("income"),resultSet.getString("saleStaring"),resultSet.getString("saleEnd"),resultSet.getString("end"));
				financingProducts.add(financingProduct);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return financingProducts;
	}

	/**
	 * ģ����ѯ
	 */
	@Override
	public List<FinancingProduct> findFinancingProduct(String id,int risk) {
		List<FinancingProduct> financingProducts=new ArrayList<FinancingProduct>();
		try {
			String sql="select id,Risk,Income,saleStaring,SaleEnd,[end] from FinancingProduct where id like ? and Risk =?";
			Object[] objects={'%'+id+'%',risk};
			resultSet=selectResultSet(sql,objects);
			while (resultSet.next()) {
				FinancingProduct financingProduct=new FinancingProduct(resultSet.getString("id"), resultSet.getInt("risk"),resultSet.getString("income"),resultSet.getString("saleStaring"),resultSet.getString("saleEnd"),resultSet.getString("end"));
				financingProducts.add(financingProduct);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return financingProducts;
	}

	/**
	 * ���������Ϣ
	 */
	@Override
	public int insertFinancingProduct(FinancingProduct financingProduct) {
		try {
			String sql="insert into FinancingProduct values(?,?,?,?,?,?)";
			Object [] objects={financingProduct.getId(),financingProduct.getRisk(),financingProduct.getIncome(),financingProduct.getSaleStaring(),financingProduct.getSaleEnd(),financingProduct.getEnd()};
			return exUpdate(sql, objects);
		} catch (Exception e) {
		}
		return 0;
	}
}
