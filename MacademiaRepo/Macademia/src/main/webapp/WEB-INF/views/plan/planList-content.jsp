<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<style>

 h3{
    margin: 15px 0 0	;
    font-weight:900;
    
    
    }
     body{
     font-family: 'AppleSDGothicNeo', 'Noto Sans KR', sans-serif;
    
    }
    
    #calendar{
    	height:100%;
    	width:100%;
    	
    
    	
    }
    .fc-daygrid-day{
    background-color:#6667ab82;
    
    }
   .fc-daygrid, .fc-dayGridMonth-view, .fc-view{
   	border-radius:30px;
   }
.fc-scroller{
	border-radius:15px;
	border:none;
}
.fc-scroller-harness{
border:none;

}
.fc-view-harness{
boredr:none;
}
.fc-daygrid{
border:none;
}
.fc-scrollgrid{
border:none;
}
.fc-scrollgrid, .fc-scrollgrid-liquid{
border:none;
}
.fc-day-today{
background-color:red;
}



	
</style>
			<div id="center_menu">
			<h3>나의 일정</h3>
	<hr>
			 <div style="border-radius:30px;" id="calendar"></div>

			</div>