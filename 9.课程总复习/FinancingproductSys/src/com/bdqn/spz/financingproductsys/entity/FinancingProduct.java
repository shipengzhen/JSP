package com.bdqn.spz.financingproductsys.entity;

/**
 * ��Ʋ�Ʒ��Ϣ��ʵ����
 * @author ʩ����
 *
 */
public class FinancingProduct {

	private String id;//��Ʒ���
	private int risk;//��������
	private String income;//Ԥ������
	private String saleStaring;//������ʼ��
	private String saleEnd;//���۽�ֹ��
	private String end;//��Ʒ������
	/**
	 * ��Ʒ���
	 * @return
	 */
	public String getId() {
		return id;
	}
	/**
	 *��Ʒ��� 
	 * @param id
	 */
	public void setId(String id) {
		this.id = id;
	}
	/**
	 * ��������
	 * @return
	 */
	public int getRisk() {
		return risk;
	}
	/**
	 * ��������
	 * @param risk
	 */
	public void setRisk(int risk) {
		this.risk = risk;
	}
	/**
	 * Ԥ������
	 * @return
	 */
	public String getIncome() {
		return income;
	}
	/**
	 * Ԥ������
	 * @param income
	 */
	public void setIncome(String income) {
		this.income = income;
	}
	/**
	 * ������ʼ��
	 * @return
	 */
	public String getSaleStaring() {
		return saleStaring;
	}
	/**
	 * ������ʼ��
	 * @param saleStaring
	 */
	public void setSaleStaring(String saleStaring) {
		this.saleStaring = saleStaring;
	}
	/**
	 * ���۽�ֹ��
	 * @return
	 */
	public String getSaleEnd() {
		return saleEnd;
	}
	/**
	 * ���۽�ֹ��
	 * @param saleEnd
	 */
	public void setSaleEnd(String saleEnd) {
		this.saleEnd = saleEnd;
	}
	/**
	 * ��Ʒ������
	 * @return
	 */
	public String getEnd() {
		return end;
	}
	/**
	 * ��Ʒ������
	 * @param end
	 */
	public void setEnd(String end) {
		this.end = end;
	}
	/**
	 * ȫ����Ϣ
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
