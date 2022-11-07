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
    
    .modal-content{
 width:700px;
 height:680px;
 margin-left:-40px;
 }
 #m_title{
 margin-left:-570px;
 font-size:26px;
 	
 }
 .modal-header{
	border-bottom: 1px solid #6667AB;
 }
 .modal-footer{
	border-top: 1px solid #6667AB;
 }
 .btn-default{
	background-color: #6667AB;
	color:#fff
 }

 #modal-wrap{
 border: 1px solid red;
 height: 300px;
 width:300px;
 
 }
 #select_box{
 width:260px;
 height:370px;
 border: 3px solid #6667AB;
 border-radius: 5px;
 
 }
 #select_top{
 margin-left:-38px;
 height: 28px;
 border: 3px solid #6667AB;
 border-radius: 5px;
 }
 a{
	color:#6667AB;
	cursor:pointer;
 }
 #select_right{
	width:260px;
	height:370px;
	border: 3px solid #6667AB;
 border-radius: 5px;
 margin-top: 47px;
 }
    </style>
    
<div id="center_menu">
	<h3>업무 요청 수정</h3>
	<hr>
	<div id="work_top">
		<h5>업무 요청 수정 제목</h5> <input id="write" type="submit" value="업무수정하기">
		<br>
		<input class="text"type="text" id="title"name="wTitle" value="${vo.WTitle}">
	</div>
	<div id="work_middle">
		<div id="work_left">
		<div class="line">
			<h5>등록자</h5>
			<br>
			<input type="text" class="text" id="userName"name="userName" readonly value="${vo.bossName}">
		</div>
		
			<br>
			<br>
			<div class="line">
			<h5>담당자</h5>
			<h6>${vo.slaveName}</h6>
			
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
			<input type="date"  id="dead_line" value="${vo.WDeadLine}">
			
			</div>
			
		</div>
		
	</div>
	<div id="work_bottom">
		<h5>업무 내용</h5>
		<textarea rows="10" cols="100" id="workContent">${vo.WContent}</textarea>
		
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
          
        <h6 id="m_title">업무 요청 지정</h4>
        </div>
       


			<script>
			
$('#write').on('click',function(){
	let selectWork = $('#select_work').val();
	let title = $('#title').val();
	let deadLine= $('#dead_line').val();
	let content = $('#workContent').val();
	
	
	result = confirm("업무를 요청을 수정 하시겠습니까?")
	if(result==1){
		$.ajax({
					url:"/md/work/workModify/${vo.WNo}",
					method : "post",
					data :{
							select: selectWork,
							title : title,
							deadLine :deadLine,
							content : content
					},
					dataType: 'json',
					success: function(data){
						console.log("성공")
						console.log(data)
						alert("요청이 완료 되었습니다")
 				    	 window.location.href = "/md/work/bossDetail/${vo.WNo}";
						
						
						
						
						
					}
					,error: function(data){
					    	console.log("실패");
					    	console.log(data)
					    }
				})
	}

})
			</script>