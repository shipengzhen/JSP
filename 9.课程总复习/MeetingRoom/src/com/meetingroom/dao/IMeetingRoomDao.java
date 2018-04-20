package com.meetingroom.dao;

import java.sql.Date;
import java.util.List;
import com.meetingroom.entity.MeetingCroom;

public interface IMeetingRoomDao {

	/**
	 * 查询全部
	 * @return
	 */
	List<MeetingCroom> selectAllCroom();
	
	/**
	 * 预定会议室
	 * @return
	 */
	int insertCroom(String meeting_name,String meeting_order,String advance_name);
}
