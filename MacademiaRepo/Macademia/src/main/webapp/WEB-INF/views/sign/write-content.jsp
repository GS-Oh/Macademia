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
	width:100px;
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
 }
 .td_bottom{
 height:30px;
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
</style>

<div id="center_menu">
	<h2>기안서 작성</h2><span id="writeComplete">작성 완료</span>
	<hr>
  <br>
  
	<table id="sign_top" >
		<tr>
			<td>문서 종류</td>
			<td><select id="doc_type">
				<option value="1">종류</option>
				<option value="2">종류2</option>
				<option value="3">종류3</option>
			</select></td>
			<td>작성자</td>
			<td class="writer" id="${loginMember.positionName}">${loginMember.name}</td>
			
		
		</tr>
	</table>
	<h5>결재 제목</h5> 

	<hr>
  
  <input type="text" name="s_title" id="s_title">
	
	<br>
	<br>
	<h5>결재선 지정</h5>
	<hr>
	<div id="wrap2">
		<div id="m_main"><a id="plus" data-toggle="modal" href="#myModal"> 결재 <i class="fa-solid fa-plus"></i></a></div>
	<table id="sign_middle">
	</table>

	</div>
	
	
	<br>
	
	
	<h5>상세 입력</h5>
	
	<hr>
	<div id="summernote"></div>
	
</div>

			
			<!-- 부트스트랩의 모달 창을 사용할려면 아래의 class 이름들을 그대로 사용해야 한다. 변경하면 모양이 달라진다.-->
  <!-- Modal -->
  <div class="modal fade" id="myModal" role="dialog"> <!-- 사용자 지정 부분① : id명 -->
    <div class="modal-dialog">
    
      <!-- Modal content-->
      <div class="modal-content">
        <div class="modal-header">
          
        <h6 id="m_title">결재선 지정</h4>
        </div>
        <div class="modal-body w-100">

			<div class="modal-wrap d-inline-flex w-100">
				<div class="w-50">
		          <select id="select_top">
						<option >전체</option>
						<option value="1">대표이사</option>
						<option value="2">부원장</option>
						<option value="3">운영기획부</option>
						<option value="4">교육훈련부</option>
						<option value="5">취업지원부</option>
						<option value="6">마케팅부</option>
						<option value="7">행정팀</option>
						<option value="8">재정팀</option>
						<option value="9">시설지원팀</option>
						<option value="10">교육1팀</option>
						<option value="11">교육2팀</option>
						<option value="12">교육지원팀</option>
						<option value="13">취업팀</option>
						<option value="14">상담팀</option>
						<option value="15">홍보팀</option>
						<option value="16">대외협력팀</option>
					</select> <!-- 사용자 지정 부분③ : 텍스트 메시지 -->
					
					<br>
					<br> 
					<select multiple id="select_box">
						<c:forEach items="${memberList}" var="x">
							<option>${x.name} (${x.deptName} - ${x.positionName})</option>
						</c:forEach>
					</select>
				</div>
				<div class="w-25 d-flex flex-column justify-content-center align-items-center">
					<a id="addUser" class="fe-arrow-right-square">
						<svg xmlns="http://www.w3.org/2000/svg" width="25" height="25" fill="currentColor" class="bi bi-arrow-right-square" viewBox="0 0 16 16">
							<path fill-rule="evenodd" d="M15 2a1 1 0 0 0-1-1H2a1 1 0 0 0-1 1v12a1 1 0 0 0 1 1h12a1 1 0 0 0 1-1V2zM0 2a2 2 0 0 1 2-2h12a2 2 0 0 1 2 2v12a2 2 0 0 1-2 2H2a2 2 0 0 1-2-2V2zm4.5 5.5a.5.5 0 0 0 0 1h5.793l-2.147 2.146a.5.5 0 0 0 .708.708l3-3a.5.5 0 0 0 0-.708l-3-3a.5.5 0 1 0-.708.708L10.293 7.5H4.5z"/>
						  </svg></a>
						  <br>
					<a id="deleteUser" class="bi bi-arrow-left-circle"><svg xmlns="http://www.w3.org/2000/svg" width="25" height="25" fill="currentColor" class="bi bi-arrow-left-square" viewBox="0 0 16 16">
						<path fill-rule="evenodd" d="M15 2a1 1 0 0 0-1-1H2a1 1 0 0 0-1 1v12a1 1 0 0 0 1 1h12a1 1 0 0 0 1-1V2zM0 2a2 2 0 0 1 2-2h12a2 2 0 0 1 2 2v12a2 2 0 0 1-2 2H2a2 2 0 0 1-2-2V2zm11.5 5.5a.5.5 0 0 1 0 1H5.707l2.147 2.146a.5.5 0 0 1-.708.708l-3-3a.5.5 0 0 1 0-.708l3-3a.5.5 0 1 1 .708.708L5.707 7.5H11.5z"/>
					  </svg></a>
				</div>
				<div class="w-50">
					<select multiple id="select_right">


					</select>
				</div>
			</div>

        </div>


        <div class="modal-footer">
		  <button type="button"  id="select_complete" data-dismiss="modal">선택완료</button>
          <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
        </div>
      </div>
    </div>
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
   let seq = 1;
  
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
    $('#writeComplete').on('click',function(){

      if(approverVal.length==0){
        alert("결재선을 지정해주세요");
        var content = $('#summernote').summernote('code');
        console.log(content); 
      }else{
        var result = confirm("기안서를 작성 하시겠습니까?");
        if(result==1){
          var title = $('#s_title').val();
        var type = $('#doc_type option:selected').val();
        var content = $('#summernote').summernote('code');
        $.ajax({
          url :'/md/sign/signWrite',
        			    type : 'post',
        			    dataType : 'json', 
        			    data : { title:title,
                           type:type,
                           content:content
                  }, 
        			    success: function(){ 
                    console.log("ajax성공");
                  }
        })

        $.ajax({
          url: '/md/sign/signLine',
          type: 'post',
        //  dataType: 'text',
        //  contentType: "application/json; charset=utf-8",
          data : {"line": JSON.stringify(approverVal)},
          success:function(data){
            console.log("ajax성공");
            console.log(data);
          }
        })
        }
      
      }
    })




</script>

