package com.bdqn.spz.messageboard.util;

/**
 * 
 * @author ʩ����
 *��ҳ��
 */
public class Page {

	//��ǰҳ
	private int currPageNo=1;

	//ҳ��С
	private int pageSize=0;
	
	//��¼����
	private int tatalCount=0;
	
	//��ҳ��
	private int totalPageCount=1;

	/**
	 * ��ǰҳ
	 * @return int
	 */
	public int getCurrPageNo() {
		return currPageNo;
	}
	
	/**
	 * ��ǰҳ
	 * @param int
	 */
	public void setCurrPageNo(int currPageNo) {
		if (currPageNo<=0) {
			return;
		} else if(currPageNo>totalPageCount) {
			return;
		}
		this.currPageNo = currPageNo;
	}

	/**
	 * ҳ��С
	 * @return int
	 */
	public int getPageSize() {
		return pageSize;
	}
	
	/**
	 * ҳ��С
	 * @param int
	 */
	public void setPageSize(int pageSize) {
		this.pageSize = pageSize;
	}

	/**
	 * ��¼����
	 * @return int
	 */
	public int getTatalCount() {
		return tatalCount;
	}

	/**
	 * ��¼����
	 * @param int
	 */
	public void setTatalCount(int tatalCount) {
		this.tatalCount = tatalCount;
	}

	/**
	 * ��ҳ��
	 * @return int
	 */
	public int getTotalPageCount() {
		totalPageCount=tatalCount%pageSize==0?tatalCount/pageSize:tatalCount/pageSize+1;
		return totalPageCount;
	}
}
