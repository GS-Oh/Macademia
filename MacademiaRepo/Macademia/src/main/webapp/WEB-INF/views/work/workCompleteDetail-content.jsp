<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <style>
    body{
     font-family: 'AppleSDGothicNeo', 'Noto Sans KR', sans-serif;
    }
    h3{
    margin: 15px 0 0	;
    font-weight:900;
    
    
    }
    #work {
    margin: 0 auto;
  
    width:1000px;
    height:300px;
    border:1px solid #6667AB;
    margin-top:30px;
    }
    
    #my_work{
    	width:100%;
    	height:100%;
    	
    }
    
     th{
    background-color:#6667AB;
    color: #fff;
    font-family: 'AppleSDGothicNeo', 'Noto Sans KR', sans-serif;
    text-align: center;
    }
    td{
    font-family: 'AppleSDGothicNeo', 'Noto Sans KR', sans-serif;
    text-align: center;
    border-bottom: solid 1px #0000001a;
    }
    #page-area{
    margin:20px 0 0 350px;
    }
    #page{
    display:flex;
    
    }
    #page li{
    width:25px;
    height:25px;
    text-align:center;
    color:#fff;
    border-radius:5px;
    margin-left:5px;
    
    background-color:#6667AB;
    }
    #title{
    width:567px;
    height:30px;
    }
    .text{
    margin-top:-15px;
     border-radius:5px;
     
      font-family: 'AppleSDGothicNeo', 'Noto Sans KR', sans-serif;
    }
    input[type=file]::file-selector-button{
    background-color:#6667AB;
    color:#fff;
    border:none;
    border-radius:5px;
    }
    #date{
    margin-top:-15px;}
    
    h5{
    font-family: 'AppleSDGothicNeo', 'Noto Sans KR', sans-serif;
    font-weight:800;
    }
    #work_middle{
    display:flex;
    height:265px;
    width:100%;
    margin-top:20px;
    }
    #work_left{
    
    width:250px;
    
    height:300px;
    }
    #work_right{
    
    height:300px;
     width:400px;
    }
   
    
    #center-ment{
    border-right:2px solid black;
    }
    
    .line{
    border-left:
    2px solid black;
    height:
    50px;
    
    
    }
    .line *, .line input{
    margin-left:15px;
    }
    
    textarea{
    resize:none;
    border-radius:5px;
      border:2px solid #6667AB;
    }
    #write{
    float:right;
    color:#fff;
    background-color:#6667AB;
    border:none;
    border-radius:5px;
    margin-right: 390px;
    margin-top: -23px;
    
    }
    </style>
    
<div id="center_menu">
	<h3>나의 업무</h3>
	<hr>
	<div id="work_top">
		<h5>업무 요청 제목</h5>
		<br>
		<div class="text"type="text" id="title"name="title">${vo.WTitle}</div>
	</div>
	<div id="work_middle">
		<div id="work_left">
		<div class="line">
			<h5>등록자</h5>
			<br>
			<span  class="text" id="userName"name="userName"><h6>${vo.bossName}</h6></span>
		</div>
		
			<br>
			<br>
			<div class="line">
			<h5>담당자</h5>
			<h6>${vo.slaveName}</h6>
			
			</div>
			
			<br>
			<br>
			
			
		</div>
		
		<div id="work_right">
		<div class="line">
		<h5 >등록일</h5>
			<br>
			<h6 id="date">${vo.WDate}</h6>
		
		</div>
			
			
			<br>
			<br>
			<div class="line">
			<h5 id="type">업무 종류</h5>
			<h6>${vo.WType}</h6>
			</div>
			
			
			<br>
			<br>
			
			<div class="line">
			<h5>요청 기한</h5>
			<h6>${vo.WDeadLine}</h6>
			
			</div>
			
		</div>
		
	</div>
	<div id="work_bottom">
		<h5>업무 내용</h5>
		<textarea rows="5" cols="100" readonly>${vo.WContent}</textarea>
		
		</div>
		</div>
		
					
		
				
				
			
			</div>
		