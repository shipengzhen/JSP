package com.meetingroom.dao.impl;

import java.sql.Date;
import java.util.ArrayList;
import java.util.List;

import com.meetingroom.dao.BaseDao;
import com.meetingroom.dao.IMeetingRoomDao;
import com.meetingroom.entity.MeetingCroom;

public class MeetingRoomDaoImpl extends BaseDao implements IMeetingRoomDao {

	/**
	 * 查询全部
	 */
	@Override
	public List<MeetingCroom> selectAllCroom() {
		List<MeetingCroom> meetingCrooms=new ArrayList<MeetingCroom>();
		try {
			connection=getConnection();
			String sql="select * from MeetingCroom";
			preparedStatement=connection.prepareStatement(sql);
			resultSet=preparedStatement.executeQuery();
			while (resultSet.next()) {
				MeetingCroom meetingCroom=new MeetingCroom(resultSet.getInt("id"),resultSet.getString("meeting_name"),resultSet.getString("meeting_order"),resultSet.getString("advance_name"));
				meetingCrooms.add(meetingCroom);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return meetingCrooms;
	}

	/**
	 * 预定会议室
	 */
	@Override
	public int insertCroom(String meeting_name,String meeting_order,String advance_name) {
		try {
			connection=getConnection();
			String sql="insert into MeetingCroom values(?,?,?)";
			preparedStatement=connection.prepareStatement(sql);
			preparedStatement.setString(1,meeting_name);
			preparedStatement.setString(2,meeting_order);
			preparedStatement.setString(3,advance_name);
			return preparedStatement.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return 0;
	}

}
