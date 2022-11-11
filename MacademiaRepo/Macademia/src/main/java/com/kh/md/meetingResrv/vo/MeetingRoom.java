package com.kh.md.meetingResrv.vo;

import java.sql.Date;

import lombok.Data;

@Data
public class MeetingRoom {
	
    private int meetNo;
    private String meetName;
    private String meetInfo;
    private Date meetRegiDate;
    private Date meetUpdateDate;
    private int meetStatus;
    private String imgOriginName;
    private String imgChangeName;
    
}
