<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <script src="http://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.js"></script>

	<link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.css" rel="stylesheet"> 
  <script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.js"></script>
  <script src=" https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.18/lang/summernote-ko-KR.min.js"></script>
 <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">

  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<!DOCTYPE html>


<style>
	
  body{
     font-family: 'AppleSDGothicNeo', 'Noto Sans KR', sans-serif;
    }
    h2{
    margin: 15px 0 0	;
    font-weight:900;
    
	    
    }
    
    .mark2{
   width: 79%;
    height: 84px;
    /* margin-left: -13px; */
    margin-top: 10px;
    background-color: #fff;
    }
    h5{
    margin: 15px 0 0;
    font-weight:900;
    }
    #sign_top{
    	width:800px;
    	height:40px;
    	border: 0.5px solid gray;
    }
   th, td {
    border: 0.5px solid gray;
    text-align:center;
  }
  #sign_top tr td {
   background-color:#6667AB;
   color:#fff;
  }
  #sign_top tr td:nth-child(1){
  width:150px;
  }
   #sign_top tr td:nth-child(2){
	width:150px;
	color:#000;
	background-color:#fff;
	
	}
	 #sign_top tr td:nth-child(4){
	 	background-color:#fff;
	 	color:black;
	 	}
	 	
	 	
 #sign_middle{
    	width:800px;
    	height:170px;
    	border: 0.5px solid gray;
    }	 	
    
#m_main{
width:130px;
height: 170px;
text-align: center;
background-color:#6667AB;
color:#fff;
line-height: 170px;
font-size: 20px;;

 }
 hr{
 border-top:1px solid gray;
 }   
 #plus{
 cursor:pointer;
 color:#fff;
 text-decoration:none;
 }
 select{
 color:black;
 }
 .td_top{
 background-color:#6667AB;
 color:#fff;
 height: 30px;
 width:120px;
 border:1px  solid black;
 line-height:30px;
 text-align:center;
 border-left: 0.5px;
 border-bottom: 0.5px;
 }
 .td_middle{
 border: 1px solid black;
 border-left: 0.5px;
 border-bottom:none;
 width: 120px;
 height:110px;
 }
 .td_bottom{
 height:30px;
 border: 1px solid black;
 width:120px;
 line-height:30px;
 text-align:center;
 color:#000;
 border-left: 0.5px;
 
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
 #wrap2{
	display:flex;
	width:1000px;
	height:170px;
color:#fff

 }
 #writeComplete{
  display: inline-block;
  width: 70px;
  color:wheat;
  border-radius: 5px;
  height: 20px;
  background-color: #6667AB;
  cursor: pointer;

 }

 #s_title{

  width:800px;
  height:35px;
  border: 3px solid #6667AB;
  border-radius: 5px;
 }
 #area{
 height:300px;	
 border-radius:5px;
 border: 1px solid #6667AB;
 
 }
 #area_top{
 margin-bottom:10px;
 height:15px;
 background-color:#6667AB;
 border-radius:3px 3px 0 0;
 }
 #line{
 border-left:1px solid black;
 width: 800px;
 display : flex;
 }
 .level{
 width:150px;
 display:inline-block;
 }
 #sign_btn{
 background-color:#6667AB;
 color:#fff;
 width:40px;
 height:30px;
 border-radius: 5px;
 cursor:pointer;
 text-align:center;
 line-height:30px;
 
 display:inline-block;
 
 }
 .button_area{
 	text-align:center;
 	height: 100px;
 	line-height:100px;
 }
 #sign_btn:hover{
 opacity: 0.8;
 }
 #Companion_btn:hover{
 opacity:0.8;
 }
 
 #Companion_btn{
 background-color:#0f7cc378;
 color:#fff;
 width:40px;
 height:30px;
 border-radius: 5px;
 cursor:pointer;
 text-align:center;
 line-height:30px;
 display:inline-block;
 }
</style>

<div id="center_menu">
	<h2>기안서 상세</h2>
	<hr>
  <br>
  
	<table id="sign_top" >
		<tr>
			<td>문서 종류</td>
			<td>${signOne.STypeNo}
			</td>
			<td>작성자</td>
			<td class="writer" >${signOne.name}</td>
			
		
		</tr>
	</table>
	<h5>결재 제목</h5> 

	<hr>
  
  <input type="text" name="s_title" id="s_title" value="${signOne.STitle}" readonly>
	
	<br>
	<br>
	<h5>결재선</h5>
	<hr>
	<div id="wrap2">
		<div id="m_main">결재</div>
		
	
		
	
	
		
						 
						
						
	
		<div id="line">
		<c:forEach items="${signLine}" var="x">
		<div class="td_wrap">
			<div class="td_top">
			${x.positionName}
			</div>
		<div class="td_middle">
		<c:set var="name" value="${x.SStep}" />
			<c:if test="${name eq 'Y'}">
				<span class="level">
   				<img class='mark2' alt='결재도장' src='${root}/resources/img/sign/sign.png'>
   				</span>
			</c:if>
			<c:if test="${name eq 'X'}">
				<span class="level">
   				<img class='mark2' alt='결재도장' src='${root}/resources/img/sign/denied.png'>
   				</span>
			</c:if>
			
			<c:set var="eno" value="${x.ENo}"/>
			<c:set var="mno" value="${loginMember.no}"/>
				
		</div>
		<div class="td_bottom" id="${x.memberNo}">${x.name}</div>
			
		</div>
		
		</c:forEach>
				
		</div>
	</div>
	
	
	<br>
	
	
	<h5>상세 입력</h5>
	
	<hr>
	<div id="area"><div id="area_top"></div>${signOne.SContent}</div>
	
</div>



