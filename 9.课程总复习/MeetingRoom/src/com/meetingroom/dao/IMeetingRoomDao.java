package com.meetingroom.dao;

import java.sql.Date;
import java.util.List;
import com.meetingroom.entity.MeetingCroom;

public interface IMeetingRoomDao {

	/**
	 * ��ѯȫ��
	 * @return
	 */
	List<MeetingCroom> selectAllCroom();
	
	/**
	 * Ԥ��������
	 * @return
	 */
	int insertCroom(String meeting_name,String meeting_order,String advance_name);
}
