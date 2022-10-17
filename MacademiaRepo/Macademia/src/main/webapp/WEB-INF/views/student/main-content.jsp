<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!-- fullcalendar cdn -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/fullcalendar@5.11.3/main.min.css">
<script src="https://cdn.jsdelivr.net/npm/fullcalendar@5.11.3/main.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/fullcalendar@5.11.3/locales/ko.js"></script>
<script>

    document.addEventListener('DOMContentLoaded', function() {
      var calendarEl = document.getElementById('calendar');
  
      var calendar = new FullCalendar.Calendar(calendarEl, {
        headerToolbar: {
          left: 'prev,next today',
          center: 'title',
          right: 'dayGridMonth,timeGridWeek,timeGridDay,listMonth'
        },
        // initialDate: '2020-09-12',
        navLinks: true, // can click day/week names to navigate views
        businessHours: true, // display business hours
        editable: true,
        selectable: true,
        events: [
        {
          title: 'Business Lunch',
          start: '2022-10-17T13:00:00',
          constraint: 'businessHours'
        },
        {
          title: 'Meeting',
          start: '2020-09-13T11:00:00',
          constraint: 'availableForMeeting', // defined below
          color: '#257e4a'
        },
        {
          title: 'Conference',
          start: '2020-09-18',
          end: '2020-09-20'
        },
        {
          title: 'Party',
          start: '2020-09-29T20:00:00'
        },

        // areas where "Meeting" must be dropped
        {
          groupId: 'availableForMeeting',
          start: '2020-09-11T10:00:00',
          end: '2020-09-11T16:00:00',
          display: 'background'
        },
        {
          groupId: 'availableForMeeting',
          start: '2020-09-13T10:00:00',
          end: '2020-09-13T16:00:00',
          display: 'background'
        },

        // red areas where no events can be dropped
        {
          start: '2020-09-24',
          end: '2020-09-28',
          overlap: false,
          display: 'background',
          color: '#ff9f89'
        },
        {
          start: '2020-09-06',
          end: '2020-09-08',
          overlap: false,
          display: 'background',
          color: '#ff9f89'
        }
      ]
      });
  
      calendar.render();
    });
  
  </script>

<style>
    #main-content-wrap{
        width: 60vw;
        border: 3px solid black;
        padding: 2vw;
        display: grid;
        grid-template-rows: 10vh;
        row-gap: 10px;
    }
    #main-content-wrap>div:nth-child(2){
        /* display: flex; */
        flex-wrap: wrap;
        justify-content: center;
        align-items: flex-start;
    }
    #class-list{
        border-top: 1px solid gray;
        width: 100%;
        display: grid;
        grid-template-columns: 1fr 2.5fr 1fr 1fr 1fr 1fr 1fr;
        grid-template-rows: 3vh;
        row-gap: 10px;
    }
    #class-list>div{
        border-bottom: 1px solid gray;
        padding-left: 10px;
    }
    #calendar{
        height: 80%;
    }
    #main-content-wrap>div{
        border: 1px solid red;
    }
</style>


<div id="main-content-wrap">
    <div><h4>출결 현황</h4></div>
    
    <div>
        <div id='calendar'></div>
    </div>


    <div id="class-list">
        <div><b>카테고리</b></div>
        <div><b>강의명</b></div>
        <div><b>담당강사</b></div>
        <div><b>강의실</b></div>
        <div><b>강의 기간</b></div>
        <div><b>수업 시간</b></div>
        <div><b>수강 인원</b></div>

        <div>디지털 컨버전스</div>
        <div>자바(JAVA)기반 클라우드 융합 개발자 양성과정A</div>
        <div>심투용</div>
        <div>20-D</div>
        <div>10.17 ~ 11.24</div>
        <div>15:30 ~ 22:00</div>
        <div>30명</div>
        
    </div>

</div>