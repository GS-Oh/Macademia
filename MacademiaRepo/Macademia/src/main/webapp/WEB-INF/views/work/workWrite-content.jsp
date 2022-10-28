<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <style>
    body{
     font-family: 'AppleSDGothicNeo', 'Noto Sans KR', sans-serif;
    }
    h3{
    margin: 15px 0 0	;
    font-weight:900;
    }
    a{
    	text-decoration:none;
    }
    a:hover{
    text-decoration:none;
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
      border:2px solid #6667AB;
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
	<h3>업무 요청</h3>
	<hr>
	<div id="work_top">
		<h5>업무 요청 제목</h5> <input id="write" type="submit" value="업무요청하기">
		<br>
		<input class="text"type="text" id="title"name="wTitle">
	</div>
	<div id="work_middle">
		<div id="work_left">
		<div class="line">
			<h5>등록자</h5>
			<br>
			<input type="text" class="text" id="userName"name="userName" readonly value="심투용">
		</div>
		
			<br>
			<br>
			<div class="line">
			<h5>담당자</h5>
			<a data-toggle="modal" href="#myModal"><h6><i class="fa-solid fa-plus"></i> 추가</h6></a>
			
			</div>
			
			<br>
			<br>
			<div class="line">
			<h5>첨부파일</h5>
			<input type="file" name="file" id="file">
			</div>
			
		</div>
		
		<div id="work_right">
		<div class="line">
		<h5 >등록일</h5>
			<br>
			<h6 id="date">자동 등록</h6>
		
		</div>
			
			
			<br>
			<br>
			<div class="line">
			<h5 id="type">업무 종류</h5>
			<select name="select_work" id="select_work">
				<option vlaue="문서작성">문서작성</option>
				<option vlaue="문서작성">문서작성</option>
				<option vlaue="문서작성">문서작성</option>
			</select>
			</div>
			
			
			<br>
			<br>
			
			<div class="line">
			<h5>요청 기한</h5>
			<input type="date" value="2022-10-20">
			
			</div>
			
		</div>
		
	</div>
	<div id="work_bottom">
		<h5>업무 내용</h5>
		<textarea rows="5" cols="100"></textarea>
		
		</div>
		</div>
		
					
		
				
				
			
			</div>
			
						
			<!-- 부트스트랩의 모달 창을 사용할려면 아래의 class 이름들을 그대로 사용해야 한다. 변경하면 모양이 달라진다.-->
  <!-- Modal -->
  <div class="modal fade" id="myModal" role="dialog"> <!-- 사용자 지정 부분① : id명 -->
    <div class="modal-dialog">
    
      <!-- Modal content-->
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal">×</button>
          <h4 class="modal-title">모달 창 타이틀</h4> <!-- 사용자 지정 부분② : 타이틀 -->
        </div>
        <div class="modal-body">
          <p>여기에 필요한 텍스트 메시지 넣기</p> <!-- 사용자 지정 부분③ : 텍스트 메시지 -->
        </div>
        <div class="modal-footer">
          <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
        </div>
      </div>
    </div>
  </div>


			