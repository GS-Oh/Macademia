package com.kh.md.meetingResrv.vo;

import java.sql.Date;

import lombok.Data;

@Data
public class MeetingRoom {
	
	 private int meet_no;
	    private String meet_name;
	    private String meet_info;
	    private Date meet_regi_date;
	    private Date meet_update_date;
	    private int meet_status;
	    private String img_origin_name;
	    private String img_change_name;
    
}
