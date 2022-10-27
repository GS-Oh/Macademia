<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page import="java.util.List"%>
<%@page import="com.kh.md.plan.vo.PlanVo"%>
<% List<PlanVo> planList = (List<PlanVo>)request.getAttribute("planList");%>

<html>
<head>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

<link
	href='https://cdn.jsdelivr.net/npm/fullcalendar@5.8.0/main.min.css'
	rel='stylesheet' />
<script
	src='https://cdn.jsdelivr.net/npm/fullcalendar@5.8.0/main.min.js'></script>
<!-- fullcalendar 언어 CDN -->
<script
	src='https://cdn.jsdelivr.net/npm/fullcalendar@5.8.0/locales-all.min.js'></script>

<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta/css/bootstrap.min.css">
<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.11.0/umd/popper.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta/js/bootstrap.min.js"></script>



<style>
@import
	url('https://fonts.googleapis.com/css2?family=Black+Han+Sans&family=Dokdo&family=Gowun+Dodum&family=Gugi&family=Poor+Story&display=swap')
	;

@font-face {
	font-family: 'GangwonEdu_OTFBoldA';
	src:
		url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2201-2@1.0/GangwonEdu_OTFBoldA.woff')
		format('woff');
	font-weight: normal;
	font-style: normal;
}

@font-face {
	font-family: 'AppleSDGothicNeo';
	src: url('/md/resources/font/apple/AppleSDGothicNeoUL.ttf')
		format('truetype');
}

ul, li {
	list-style: none;
}

#content {
	width: 100vw;
	height: 100vh;
	display: flex;
}

#side_menu {
	width: 13vw;
	height: 100vh;
	border-radius: 0 7px 7px 0;
	background-color: #6667AB;
}

#center_menu {
	width: 70vw;
	height: 100vh;
	border: 1px solid #fff;
	border-radius: 15px;
}

#right_menu {
	width: 20vw;
	height: 80vh;
}

#test {
	width: 100px;
	height: 100px;
	border: 1px solid red;
}

#menu {
	width: 100%;
	margin: 0;
	padding: 0;
	border-top: 1px solid #ffffff6e;;
}

#menu li {
	text-align: center;
	width: 100%;
	height: 8%;
	color: white;
	border-bottom: 1px solid #ffffff6e;;
	cursor: pointer;
	padding-top: 10px;
	font-weight: 100;
	font-size: 15px;
	/* font-family: 'Gowun Dodum', sans-serif;} */
	font-family: 'AppleSDGothicNeo', 'Noto Sans KR', sans-serif;
}

#menu li:hover {
	background-color: #fff;
	color: #6667AB;
}

#right_menu {
	
}

#menu-top {
	height: 8%;
	display: flex;
	color: #fff;
	font-size: 14px;
	margin-left: -8px;
}

#menu-top li {
	font-size: 19px;
	margin-top: 15px;
}

#menu-top li:nth-child(2) {
	width: 100%;
	height: 10%;
	margin: 0 auto;
	margin-top: 15px;
	margin-left: 20px;
	font-family: 'GangwonEdu_OTFBoldA';
}

#menu-top li:nth-child(1) {
	font-size: 13px;
}

#calendar {
	font-size: 16px;
	height: 1000px;
}

.fc-view-harness .fc-view-harness-active .fc .fc-bg-event {
	border: none;
	bottom: px;
}

.fc-view-harness .fc-view-harness-active {
	height: 1000px;
}

a {
	color: #fff;
	text-decoreation: none;
}

.fc-day-sun a {
	color: red;
	text-decoration: none;
}

.fc-day-mon a {
	color: #000;
}

.fc-day-tue a {
	color: #000;
}

.fc-day-wed a {
	color: #000;
}

.fc-day-thu a {
	color: #000;
}

.fc-day-fri a {
	color: #000;
}

.fc-day-sat a {
	color: #000;
}

/* 토요일 날짜 파란색 */
.fc-col-header-cell {
	background-color: #6667AB;
	color: #fff;
}

.fc-button-primary {
	background-color: #6667AB;
}

 textarea{
    resize:none;
    border-radius:5px;
      border:4px solid #6667AB;
    }
</style>
<title>마카데미아</title>

<%@include file="/resources/css/common/common.css"%>



</head>
<body>


	<header>
		<%@include file="/WEB-INF/views/common/header.jsp"%>
	</header>


	<aside>
		<%@include file="/WEB-INF/views/plan/plan-sidebar.jsp"%>
	</aside>

	<main>
		<%@include file="/WEB-INF/views/plan/planList-content.jsp"%>

	</main>





</body>

<script>
	  var deleteNo = null;
      document.addEventListener('DOMContentLoaded', function() {
    	  
        var calendarEl = document.getElementById('calendar');
        var calendar = new FullCalendar.Calendar(calendarEl, {
        	 initialView: 'dayGridMonth',
        	 headerToolbar: {  
        	  left: 'prev,next,today'
        	  ,center: 'title',
        		  right: 'resourceTimelineDay,resourceTimelineWeek,resourceTimelineMonth'
        	  },editable: true, // 수정 가능
        	  
         	  events : [
        		  <%if (planList != null) {%>
        		  <%for(PlanVo vo : planList){%>
        		  {
        			title : "<%=vo.getPTitle()%>", 
        		  	start : '<%=vo.getPStartDate()%>',
        		  	end : '<%=vo.getPEndDate()%>',
        		  	id : '<%=vo.getPNo()%>',
        		  	color: '#6667AB'
  				},
        		 <% }
        		  }%>
        	  ],eventClick : function(info) {
        		  $.ajax({ 
        				url :'/md/plan/listDetail',
        			    type : 'get',
        			    dataType : 'json', 
        			    data : { pno : info.event.id, }, 
        			    success: function(data){ 
        			    	console.log("성공"); 
        			    	console.log(data)
        			    	
        			    	$("#modal-title").html("<span>"+ data.pTitle +"</span>")
        			    	$("#mContent").html("<textarea rows='5' cols='60' resize='none' readonly>"+data.pContent+"</textarea>")
        			    	$("#mType").html("<span>" +data.pTypeNo+"</span>")
        			    	$("#mDate").html("<span>"+data.pStartDate+" - "+ data.pEndDate+"</span")
        			    	deleteNo = data.pNo
        			    } 
        			});
        		  $("#deleteBtn").click(function(){
        			 var result = confirm('일정을 삭제 하시겠습니까?');
        			  
        			 if(result) {
        		    	  $.ajax({ 
          					url :'/md/plan/delete',
          				    type : 'post',
          				    dataType : 'json', 
          				    data : { pno : info.event.id,}, 
          				    success: function(data){ 
          				    	console.log("성공"); 
          				    	console.log(data)
          				    	 window.location.href = "/md/plan/list";
          				    	
          				    	
          				    }
          				    ,error: function(data){
          				    	console.log("실패");
          				    	console.log(data)
          				    }
          				});
        		        } else {
        		            //no
        		        }
        	
        	      })
        		  
        		  console.log(info)
        		  console.log(info.event.id)
        		 /*  저 id로 db에서
        		  일정 정보 조회해와서 모달창에 뿌려주면 될듯 info.event.id로 뿌리면 되는거임???
        				  그니까 그 일정번호로 일정 내용을 조회해 와야하잖아 db에서 뿌려주려면??ㅇㅇㅇ
        						  저 id로 이제 여기다가 ajax 써서 파라미터 넘긴다음에 데이터를 받아오면
        						  그걸 이제 jquery로 */
        						 /*  $(".modal-body").html()요 안에다가 <div> 요런거 써서 폼 너가 css 해서 넣으면 되는거지 ㅇㅋㅇㅋㅇ 해보겟어요 감사합니다
        						  근데 결국 모달은 어디서 뜨는거임 어떻게해서 ㅅㅂ 내가 속성값 넣어줬는데 그거때문에 걍뜨는 */
        	  }
        	  
        	  
        	   
        	  
        	
        	  
        	 
         
       		
        });
        
        calendar.render();
        $('.fc-event-title-container').attr('data-toggle','modal');
        $('.fc-event-title-container').attr('data-target','#myModal');
   
       console.log(calendar)
       
      });
    
     
      $(".fc-event-main").click(function(){
			
    		//var data = $(this).data('id'); 뭐야 시발발로마 잠만
     	    //$("#contents.body-contents").val(data);
    	   // $("#text-contents.body-contents").html(data);
    	    
    	    
    	    var pno = $(this).data("pno")
    	    
    	  	console.log(pno)
    		console.log("왜안떠");
    	});
    </script>


</html>
