<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
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
.fc-unthemed .fc-today{
background-color:red;
}
.fc-button-group{
width:50px;
height:50px;
background-color:red;
color:#fff;

}
.fc-button{
background-color:red;
color:#fff;
}
#myPlan{
margin-left:-320px;
margin-top:-18px;
}
.modal-header{
height:40px;
}
.modal-content{

height:500px;
}
	 textarea{
    resize:none;
    border-radius:5px;
      border:4px solid #6667AB;
    }
 #modal-left{
 
 width:230px;
 }
  #modal-right{

 width:230px;
 }
 .modal-wras{
 display:flex;
 }
 .modal-body{
 margin-left:30px;
 font-weight:800;
 }
</style>
			<div id="center_menu">
			<h3>나의 일정</h3>
	<hr>
			 <div style="border-radius:30px;" id="calendar"></div>

			
				<!-- 부트스트랩의 모달 창을 사용할려면 아래의 class 이름들을 그대로 사용해야 한다. 변경하면 모양이 달라진다.-->
  <!-- Modal -->
  <div class="modal fade" id="myModal" role="dialog"> <!-- 사용자 지정 부분① : id명 -->
    <div class="modal-dialog">
    
      <!-- Modal content-->
      <div class="modal-content">
        <div class="modal-header">
          <h3 id="myPlan">나의 일정</h3>
          
        </div>
        <div class="modal-body">
			<div class="modal-wras">
				<div id="modal-left">
			<h4>일정 제목</h4>
			<span id="modal-title"></span>
			<h4>일정 날짜</h4>
			<span id="mDate"></span>
			</div>
			<div id="modal-right">
			<h4>등록 일자</h4>
			<span id="pDate"></span>
			<br>
			<h4>일정 종류</h4>
			<span id="mType"></span>
			
			</div>
          
			
</div>
		<h4>일정 내용</h4>
			<span id="mContent"></span>
        </div>
        <div class="modal-footer">
          <button type="button" class="btn btn-default" id="modifyBtn" >수정</button>
		  <button type="button" class="btn btn-default" id="deleteBtn">삭제</button>
		  <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
        </div>
      </div>
    </div>
  </div>
	

			
		