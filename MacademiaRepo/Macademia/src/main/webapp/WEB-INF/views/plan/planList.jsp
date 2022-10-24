<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script> 

 <link href='https://cdn.jsdelivr.net/npm/fullcalendar@5.8.0/main.min.css' rel='stylesheet' />
  <script src='https://cdn.jsdelivr.net/npm/fullcalendar@5.8.0/main.min.js'></script>
  <!-- fullcalendar 언어 CDN -->
  <script src='https://cdn.jsdelivr.net/npm/fullcalendar@5.8.0/locales-all.min.js'></script>
<style>
@import url('https://fonts.googleapis.com/css2?family=Black+Han+Sans&family=Dokdo&family=Gowun+Dodum&family=Gugi&family=Poor+Story&display=swap');
@font-face {
    font-family: 'GangwonEdu_OTFBoldA';
    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2201-2@1.0/GangwonEdu_OTFBoldA.woff') format('woff');
    font-weight: normal;
    font-style: normal;
} 

@font-face {
    font-family: 'AppleSDGothicNeo';
    src: url('/md/resources/font/apple/AppleSDGothicNeoUL.ttf') format('truetype');
}



ul, li{

list-style:none;
}
#content{
width:100vw;
height:100vh;

display: flex;

}
#side_menu{
width:13vw;
height:100vh;
border-radius:0 7px 7px 0 ;

background-color:#6667AB;
}
#center_menu{
width:70vw;
height:100vh;
border: 1px solid #fff;
border-radius:15px;


}



#right_menu{
width:20vw;
height:80vh;

}
#test{
width: 100px;
height: 100px;
border: 1px solid red;
}
#menu{
width:100%;
margin:0;
padding:0;

border-top:1px solid #ffffff6e;;
}
#menu li {
    text-align: center;
    width: 100%;
    height: 8%;
    color: white;
    border-bottom: 1px solid #ffffff6e;;
    cursor: pointer;
    padding-top: 10px;

	font-weight:100;

	font-size:15px;
	/* font-family: 'Gowun Dodum', sans-serif;} */
	
	font-family: 'AppleSDGothicNeo', 'Noto Sans KR', sans-serif;
	
}
#menu li:hover{
background-color:#fff;
color:#6667AB;

}
#right_menu{
}
#menu-top{
height:8%;
display:flex;
color:#fff;

font-size:14px;
margin-left:-8px;

}
#menu-top li{
font-size:19px;
margin-top:15px;
}
#menu-top li:nth-child(2){
width:100%;
height:10%;
margin: 0 auto;
margin-top:15px;
margin-left:20px;
font-family: 'GangwonEdu_OTFBoldA';
}
#menu-top li:nth-child(1){

font-size:13px;

}#calendar{
font-size:16px;
height:1000px;
}
.fc-view-harness .fc-view-harness-active .fc .fc-bg-event{
border:none;
bottom: px;
}

.fc-view-harness .fc-view-harness-active{
height:1000px;
}
a{
	color:#fff;
	text-decoreation:none;
}
.fc-day-sun a {
  color: red;
  text-decoration: none;
}
.fc-day-mon a{
color:#000;
}
.fc-day-tue a{
color:#000;
}
.fc-day-wed a{
color:#000;
}
.fc-day-thu a{
color:#000;
}
.fc-day-fri a{
color:#000;
}
.fc-day-sat a{
color:#000;
}
.fc-daygrid-day-number{

}


/* 토요일 날짜 파란색 */

.fc-col-header-cell{
 background-color:#6667AB;
 color:#fff;
}


</style>
	<title>마카데미아</title>
	
	<%@include file="/resources/css/common/common.css" %>
	
	
	
</head>
<body>
	
	
		<header>
			<%@include file="/WEB-INF/views/common/header.jsp" %>
		</header>
		
		
		<aside>
			<%@include file="/WEB-INF/views/plan/plan-sidebar.jsp" %>
		</aside>
		
		<main>
				<%@include file="/WEB-INF/views/plan/planList-content.jsp" %>
			
		</main>
			
			
			
		

</body>

<script>

      document.addEventListener('DOMContentLoaded', function() {
        var calendarEl = document.getElementById('calendar');
        var calendar = new FullCalendar.Calendar(calendarEl, {
          initialView: 'dayGridMonth',
       		height:430,
       		
        });
        calendar.render();
      });

    </script>

</html>
