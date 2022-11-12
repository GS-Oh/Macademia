
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

	<h3>일정 수정</h3>
	<hr>
	<div id="work_top">
		<h5>일정 제목</h5> <input id="write" type="submit" value="일정 수정하기">
		<br>
		<input type="hidden" name="pNo" value="${vo.getPNo()}">
		<input class="text"type="text" id="title"name="pTitle" value="${vo.getPTitle()}">
	</div>
	<div id="work_middle">
		<div id="work_left">
		<div class="line">
			<h5>등록자</h5>
			<br>
			<input type="text" class="text" id="userName"name="userName" readonly value="${loginMember.name}">
		</div>
		
			<br>
			<br>
		
			
			<br>
			<br>
			<div class="line">
			<h5 id="type">일정 종류</h5>
			<select name="pType" id="select_work" onchange="${vo.getPType()}" required>
				<option>회의</option>
				<option>경조사</option>
				<option>출장</option>
			</select>
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
			
			
			
			<br>
			<br>
			
			<div class="line">
			<h5>일정 기한</h5>
			<input type="date" value="${vo.getPStartDate()}" name="pStartDate" required id="pStartDate"> ~ <input type="date" id="pEndDate" value="${vo.getPEndDate()}" name="pEndDate" required>
			
			</div>
			
		</div>
		
	</div>
	<div id="work_bottom">
		<h5>일정 내용</h5>
		<textarea rows="5" cols="100" name="pContent" id="content" required value="${vo.getPContent()}">${vo.getPContent()}</textarea>
		
		</div>
		</div>
	   
					<script>
				$('#write').click(function(){
					var result = confirm("일정을 수정 하시겠습니까?")
						if(result===true){
							var title= $('#title').val();
							var content = $('#content').val();
							var start = $('#pStartDate').val();
							var end = $('#pEndDate').val()
							var type =	$('#select_work').val();
							$.ajax({
								url:'/md/plan/modify/${vo.getPNo()}'
								,method:'post',
								data:{title : title,
									  content: content,
									  start: start,
									  end : end,
									  type : type
								},
								success: function(data){
									console.log("ajax 성공");
									alert("일정이 수정되었습니다.")
									location.href="/md/plan/list"
								},
								error: function(data){
									console.log("ajax실패")
									alert("일정 수정이 실패하였습니다")
								}
							})
						
							
						}else{
							alert("일정등록이 취소되었습니다.")
							return false;
						}
				})
						
				</script>