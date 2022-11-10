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
 width:100px;

 border-radius: 5px;
 cursor:pointer;
 text-align:center;
 
 
 display:inline-block;
 margin-right: 4px;
 
 }
 .button_area{
 	text-align:center;
 	
 	line-height:30px;
 	margin-left:330px;
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
 width:100px;

 border-radius: 5px;
 cursor:pointer;
 text-align:center;
 
 
 display:inline-block;
 }
</style>

<div id="center_menu">
	<h2>기안서 수정</h2>
	
	<c:set var="mno" value="${loginMember.no}"/>
  <c:set var="eno" value="${signOne.ENo}"/>
  
  <c:if test="${mno eq eno}">
				<div class="button_area">
				
				<span id="sign_btn">결재문서 수정</span>
				
				</div>
				</c:if>
	<hr>
  <br>
  
  
	<table id="sign_top" >
		<tr>
			<td>문서 종류</td>
			<td><select id="doc_type">
				<option value="업무기안">업무기안</option>
				<option value="운송서비스 신청">운송서비스 신청</option>
				<option value="추가 예산 신청">추가예산 신청</option>
				<option value="채용 요청">채용 요청</option>
				<option value="사원증 발급 신청">사원증 발급 신청</option>
			</select></td>
			<td>작성자</td>
			<td class="writer" >${signOne.name}</td>
			
		
		</tr>
	</table>
	<h5>결재 제목</h5> 

	<hr>
  
  <input type="text" name="s_title" id="s_title" value="${signOne.STitle}">
	
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
			
			
				
		</div>
		<div class="td_bottom" id="${x.memberNo}">${x.name}</div>
			
		</div>
		
		</c:forEach>
				
		</div>
	</div>
	
	
	<br>
	
	
	<h5>상세 입력</h5>
	
	<hr>
	<div id="summernote" value="">${signOne.SContent}
	
</div>

<script>
  let approverVal = [];
$(document).ready(function () {
    $('#summernote').summernote({
        placeholder: '내용을 작성하세요',
        height: 400,
        maxHeight: 400
    });
});
$('#select_top').on('change', function(){
	let deptCode = $('#select_top option:selected').val();
  
	
	console.log(deptCode)
	$.ajax({
		url:"/md/sign/deptList",
		mehod : "get",
		data :{dept : deptCode },
		dataType: 'json',
		success: function(data){
			console.log("성공")
			$('#select_box option').remove();
			 let str;
			$.each(data, function(i){
				str += '<option value="' + data[i].no +'">' + data[i].name+' ('+data[i].deptName +' - ' + data[i].positionName + ')</option>'
				 
			}) 
			$('#select_box').append(str);
			
		}
		,error: function(data){
		    	console.log("실패");
		    	console.log(data)
		    }
	})

	})

$('#plus').on('click', function(){
	$('#select_right *').remove();
})

$('#addUser').on('click', function(){
	let userCode = $('#select_box option:selected').val();
	let userOption = $('#select_box option[value=' + userCode + ' ]')[0].outerHTML;

	$('#select_right').append(userOption)
})

$("#deleteUser").on('click',function(){
	let userCode = $('#select_right option:selected').val();
	let userOption = $('#select_right option[value=' + userCode+']');

	$('#select_right option[value='+userCode+']').remove();


})
var i = 0
$("#select_complete").on('click',function(){
   let userCode = $('#select_right option').val();

   $('#sign_middle *').remove();
   let apprTableHtml;
   let rankHtml;
    let nameHtml;
    let markHtml;
   var seq = 1;
  
        $('#select_right option').each(function () {
          var selected = $(this).val();
          approverVal.push(selected);
		
        })
      $.each(approverVal, function (j) {
		 console.log(j);
		 console.log(approverVal)
          let approverEmp = $('#select_right option[value=' + approverVal[j] + ']').attr('approverSeq', seq+=1)[0].innerHTML;
          let empInfo = approverEmp.split(' ');
          let empName = empInfo[0];
          let empRankName = empInfo[3].replace(')', '');
          let writer = $('.writer')[0].innerHTML;
          let writerCode = $('.writer').attr('id');
          //첫번째 결재자를 작성자로 박아두기
          if(i == 0 && j == 0){
           
            rankHtml += '<td style="width : 140px" class="td_top">기안자</td>';
            markHtml += '<td></td>';
            nameHtml += '<td>' + writer + "("+writerCode+")" + '</td>';
          }

          //html 담아두기
          rankHtml += '<td style="width : 110px" class="td_top">' + empRankName + '</td>';
          markHtml += '<td></td>';
          nameHtml += '<td>' + empName + '</td>';
          

 
	})   
	
	let blankTd;
        if(approverVal.length < 7 && i == 0) {
          let blankCount = (7-approverVal.length);
          for(let i=0; i<blankCount; i++){
            blankTd += '<td ></td>';
          }
        } else {
          let blankCount = (5-approverVal.length);
          for(let i=0; i<blankCount; i++){
            blankTd += '<td></td>';
          }
        }
        if(approverVal.length != 0){
          apprTableHtml += '<tr class="appr-table-color">'  + rankHtml + blankTd + '</tr> <tr style="height: 100px;">' + markHtml + blankTd + '</tr> <tr class="approver-emp">' + nameHtml + blankTd + '</tr>';
        }

      


      $('#sign_middle').append(apprTableHtml);
	});
//결재라인 설정 완료하기
$('#approver-submit').on('click', function () {
      //선택한 결재자 번호 가져오기
      let userCode = $('.approver-select-box option').val();
      
      //결재라인 지워주기
      $('#approval-table *').remove();
      
      //결재타입 가져오기
      let checkedVal = [];
      $('#modal-appr-type input[type=checkbox]:checked').each(function () {
        var checked = $(this).val();
        checkedVal.push(checked); 
      })
      
      let apprTableHtml;

      let seq = 1;
      //선택한 결재타입 갯수만큼 반복문
      $.each(checkedVal, function(i){
        
        let typeName = $('#type-content[apprTypeCode='+ checkedVal[i] +']>span')[0].outerText;
        let approverVal = [];
        $('.approver-select-box[id='+ checkedVal[i] +'] option').each(function () {
          var selected = $(this).val();
          approverVal.push(selected);
        })
        
        let rankHtml;
        let nameHtml;
        let markHtml;
        //선택한 결재자 수만큼 반복문
        $.each(approverVal, function (j) {
          let approverEmp = $('.approver-select-box[id='+ checkedVal[i] +'] option[value=' + approverVal[j] + ']').attr('approverSeq', seq += 1)[0].innerHTML;
          let empInfo = approverEmp.split(' ');
          let empName = empInfo[0];
          let empRankName = empInfo[3].replace(')', '');
          let writer = $('.writer-name')[0].innerHTML;
          let writerCode = $('.writer-name').attr('id');
          //첫번째 결재자를 작성자로 박아두기
          if(i == 0 && j == 0){
           
            rankHtml += '<td style="width : 80px"></td>';
            markHtml += '<td></td>';
            nameHtml += '<td>' + writer + writerCode + '</td>';
          }

          //html 담아두기
          rankHtml += '<td style="width : 80px">' + empRankName + '</td>';
          markHtml += '<td></td>';
          nameHtml += '<td>' + empName + '</td>';
		  
          


        })
        //이건 무시하셔도 돼용
        let blankTd;
        if(approverVal.length < 9 && i == 0) {
          let blankCount = (7-approverVal.length);
          for(let i=0; i<blankCount; i++){
            blankTd += '<td></td>';
          }
        } else {
          let blankCount = (8-approverVal.length);
          for(let i=0; i<blankCount; i++){
            blankTd += '<td></td>';
          }
        }
        if(approverVal.length != 0){
          apprTableHtml += '<tr class="appr-table-color"> <td  rowspan="3" style="width: 100px;">' + typeName + 
            '</td>' + rankHtml + blankTd + '</tr> <tr style="height: 100px;">' + markHtml + blankTd + '</tr> <tr class="approver-emp">' + nameHtml + blankTd + '</tr>';
        }
        
        
      })
        $('#approval-table').append(apprTableHtml);
    });
   

 
    $('#sign_btn').on('click',function(){
    	
    	var result = confirm("요청을 수정하시겠습니까?")
		if(result==1){
			var title = $('#s_title').val();
	        var type = $('#doc_type option:selected').val();
	        var content = $('#summernote').summernote('code');
			$.ajax({
				url:'/md/sign/setModify/${signOne.SNo}',
				method:'post',
				data:{ title: title,
					   type: type,
					   content: content
					
				},
				success: function(data){
					console.log("ajax성공")
					location.href="/md/sign/mySignDetail/${signOne.SNo}";
					alert("수정이 완료 되었습니다");
				}
				 
			})
		}
    	})

	
	


</script>


