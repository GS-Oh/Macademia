package com.kh.md.meetingResrv.Service;


import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import com.kh.md.meetingResrv.vo.MeetingResrv;
import com.kh.md.meetingResrv.vo.MeetingRoom;
import com.kh.md.meetingResrv.vo.PageInfo;

public interface MeetingResrvService {
    
    int getListCount();
    
    ArrayList<MeetingResrv> selectList(PageInfo pi);
    
    int getMyListCount(String mNo);
    
    ArrayList<MeetingResrv> selectMyList(HashMap map);
    
    int insertMeetingResrv(MeetingResrv mr);
    
    ArrayList<MeetingRoom> selectRoomList(HashMap map);
    
    int autoUpdate(Timestamp tNow);
    
    int searchListCount(HashMap map);
    
    ArrayList<MeetingResrv> searchList(PageInfo pi, HashMap map);
    
    int searchMyListCount(HashMap map);
    
    ArrayList<MeetingResrv> searchMyList(PageInfo pi, HashMap map);
    
    MeetingResrv selectMeetingResrv(int rNo);
    
    int updateMeetingResrv(MeetingResrv mr);
    
    int completeMeetingResrv(int rNo);
    
    int cancelMeetingResrv(int rNo);
    
    int completesMeetingResrv(List<Integer> chksList);
    
    int cancelsMeetingResrv(List<Integer> chksList);
    
    MeetingRoom selectMeetingRoom(int meet_no);
    
    ArrayList<MeetingResrv> selectList();
    
}
