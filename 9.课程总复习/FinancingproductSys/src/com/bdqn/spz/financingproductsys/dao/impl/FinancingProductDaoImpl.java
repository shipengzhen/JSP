package com.bdqn.spz.financingproductsys.dao.impl;

import java.util.ArrayList;
import java.util.List;

import com.bdqn.spz.financingproductsys.dao.BaseDao;
import com.bdqn.spz.financingproductsys.dao.IFinancingProductDao;
import com.bdqn.spz.financingproductsys.entity.FinancingProduct;
/**
 * 理财产品信息表实现类
 * @author 施鹏振
 *
 */
public class FinancingProductDaoImpl extends BaseDao implements IFinancingProductDao {

	/**
	 * 查询全部理财信息
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
	 * 模糊查询
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
	 * 新增理财信息
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
