package com.bdqn.spz.financingproductsys.entity;

/**
 * 理财产品信息表实体类
 * @author 施鹏振
 *
 */
public class FinancingProduct {

	private String id;//产品编号
	private int risk;//风险评级
	private String income;//预期收益
	private String saleStaring;//发售起始日
	private String saleEnd;//发售截止日
	private String end;//产品到期日
	/**
	 * 产品编号
	 * @return
	 */
	public String getId() {
		return id;
	}
	/**
	 *产品编号 
	 * @param id
	 */
	public void setId(String id) {
		this.id = id;
	}
	/**
	 * 风险评级
	 * @return
	 */
	public int getRisk() {
		return risk;
	}
	/**
	 * 风险评级
	 * @param risk
	 */
	public void setRisk(int risk) {
		this.risk = risk;
	}
	/**
	 * 预期收益
	 * @return
	 */
	public String getIncome() {
		return income;
	}
	/**
	 * 预期收益
	 * @param income
	 */
	public void setIncome(String income) {
		this.income = income;
	}
	/**
	 * 发售起始日
	 * @return
	 */
	public String getSaleStaring() {
		return saleStaring;
	}
	/**
	 * 发售起始日
	 * @param saleStaring
	 */
	public void setSaleStaring(String saleStaring) {
		this.saleStaring = saleStaring;
	}
	/**
	 * 发售截止日
	 * @return
	 */
	public String getSaleEnd() {
		return saleEnd;
	}
	/**
	 * 发售截止日
	 * @param saleEnd
	 */
	public void setSaleEnd(String saleEnd) {
		this.saleEnd = saleEnd;
	}
	/**
	 * 产品到期日
	 * @return
	 */
	public String getEnd() {
		return end;
	}
	/**
	 * 产品到期日
	 * @param end
	 */
	public void setEnd(String end) {
		this.end = end;
	}
	/**
	 * 全部信息
	 * @param id
	 * @param risk
	 * @param income
	 * @param saleStaring
	 * @param saleEnd
	 * @param end
	 */
	public FinancingProduct(String id, int risk, String income,
			String saleStaring, String saleEnd, String end) {
		super();
		this.id = id;
		this.risk = risk;
		this.income = income;
		this.saleStaring = saleStaring;
		this.saleEnd = saleEnd;
		this.end = end;
	}
	public FinancingProduct() {
		super();
	}
	
	
}
