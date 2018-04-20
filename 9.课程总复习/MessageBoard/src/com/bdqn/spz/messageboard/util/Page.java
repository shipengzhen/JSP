package com.bdqn.spz.messageboard.util;

/**
 * 
 * @author 施鹏振
 *分页类
 */
public class Page {

	//当前页
	private int currPageNo=1;

	//页大小
	private int pageSize=0;
	
	//记录总数
	private int tatalCount=0;
	
	//总页数
	private int totalPageCount=1;

	/**
	 * 当前页
	 * @return int
	 */
	public int getCurrPageNo() {
		return currPageNo;
	}
	
	/**
	 * 当前页
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
	 * 页大小
	 * @return int
	 */
	public int getPageSize() {
		return pageSize;
	}
	
	/**
	 * 页大小
	 * @param int
	 */
	public void setPageSize(int pageSize) {
		this.pageSize = pageSize;
	}

	/**
	 * 记录总数
	 * @return int
	 */
	public int getTatalCount() {
		return tatalCount;
	}

	/**
	 * 记录总数
	 * @param int
	 */
	public void setTatalCount(int tatalCount) {
		this.tatalCount = tatalCount;
	}

	/**
	 * 总页数
	 * @return int
	 */
	public int getTotalPageCount() {
		totalPageCount=tatalCount%pageSize==0?tatalCount/pageSize:tatalCount/pageSize+1;
		return totalPageCount;
	}
}
