package com.kh.md.meetingResrv.vo;

import java.sql.Date;
import java.sql.Timestamp;

import lombok.Data;

@Data
public class MeetingResrv {
    private int revNo;                 // 예약번호
    private Date revDate;              // 예약날짜(YYYY-MM-DD)
    private Timestamp revStartTime;   // 시작시간(HH:MM)
    private Timestamp revEndTime;     // 종료시간(HH:MM)
    private String revContent;         // 예약목적(내용)
    private int revStatus;             // 예약상태(0: 예약 완료, 1: 사용 완료, 2: 예약 취소)
    private Date revApplyDate;        // 예약 정보가 등록/수정된 시간
    private int meetNo;                // 예약한 회의실 등록번호
    private String mNo;                 // 예약자 번호
    
    private String meetName;           // 예약한 회의실 이름
    private String mName;               // 예약자 이름
    private String email;               // 예약자 이메일
    private String positionName;        // 예약자 직위
    private String deptName;            // 예약자 부서
    
    private String revTime;            // 예약날짜 정보(YYYY-MM-DD HH:MM ~ HH:MM)
    
}
    