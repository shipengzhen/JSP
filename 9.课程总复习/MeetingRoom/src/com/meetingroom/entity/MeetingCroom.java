package com.meetingroom.entity;

import java.sql.Date;

public class MeetingCroom {
	private int id;//���
	private String meeting_name;//����������
	private String meeting_order;//Ԥ������
	private String advance_name;//Ԥ����
	/**
	 * ���
	 * @return
	 */
	public int getId() {
		return id;
	}
	/**
	 * ���
	 * @param id
	 */
	public void setId(int id) {
		this.id = id;
	}
	/**
	 * ����������
	 * @return
	 */
	public String getMeeting_name() {
		return meeting_name;
	}
	/**
	 * ����������
	 * @param meeting_name
	 */
	public void setMeeting_name(String meeting_name) {
		this.meeting_name = meeting_name;
	}
	/**
	 * Ԥ������
	 * @return
	 */
	public String getMeeting_order() {
		return meeting_order;
	}
	/**
	 * Ԥ������
	 * @param meeting_order
	 */
	public void setMeeting_order(String meeting_order) {
		this.meeting_order = meeting_order;
	}
	/**
	 * Ԥ����
	 * @return
	 */
	public String getAdvance_name() {
		return advance_name;
	}
	/**
	 * Ԥ����
	 * @param advance_name
	 */
	public void setAdvance_name(String advance_name) {
		this.advance_name = advance_name;
	}
	/**
	 * ��ѯȫ��
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
