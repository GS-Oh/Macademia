package com.kh.md.admin.service;

import java.util.List;

import com.kh.md.meetingResrv.vo.MeetingRoom;

public interface MeetRoomService {

	List<MeetingRoom> selectMeetRoomList();

	int insertMeetRoom(MeetingRoom meetRoom);

	MeetingRoom selectMeetRoom(int meet_no);

	int updateMeetRoom(MeetingRoom meetRoom);

	int deleteMeetRoom(int meet_no);

}
