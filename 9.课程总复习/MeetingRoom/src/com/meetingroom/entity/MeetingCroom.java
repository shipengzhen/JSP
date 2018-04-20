package com.meetingroom.entity;

import java.sql.Date;

public class MeetingCroom {
	private int id;//编号
	private String meeting_name;//会议室名称
	private String meeting_order;//预定日期
	private String advance_name;//预定人
	/**
	 * 编号
	 * @return
	 */
	public int getId() {
		return id;
	}
	/**
	 * 编号
	 * @param id
	 */
	public void setId(int id) {
		this.id = id;
	}
	/**
	 * 会议室名称
	 * @return
	 */
	public String getMeeting_name() {
		return meeting_name;
	}
	/**
	 * 会议室名称
	 * @param meeting_name
	 */
	public void setMeeting_name(String meeting_name) {
		this.meeting_name = meeting_name;
	}
	/**
	 * 预定日期
	 * @return
	 */
	public String getMeeting_order() {
		return meeting_order;
	}
	/**
	 * 预定日期
	 * @param meeting_order
	 */
	public void setMeeting_order(String meeting_order) {
		this.meeting_order = meeting_order;
	}
	/**
	 * 预定人
	 * @return
	 */
	public String getAdvance_name() {
		return advance_name;
	}
	/**
	 * 预定人
	 * @param advance_name
	 */
	public void setAdvance_name(String advance_name) {
		this.advance_name = advance_name;
	}
	/**
	 * 查询全部
	 * @param id
	 * @param meeting_name
	 * @param meeting_order
	 * @param advance_name
	 */
	public MeetingCroom(int id, String meeting_name, String meeting_order,
			String advance_name) {
		super();
		this.id = id;
		this.meeting_name = meeting_name;
		this.meeting_order = meeting_order;
		this.advance_name = advance_name;
	}
	public MeetingCroom() {
		super();
	}
	
}
