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
width:120px;
background-color:#6667AB;
color:#fff

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
 .signLine{
 display: inline-block;
 border: 1px solid black;
 width: 200px;
 height: 400px;
 
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
 #select-right{
	width:260px;
	height:370px;
	border: 3px solid #6667AB;
 border-radius: 5px;
 margin-top: 47px;
 }
</style>

<div id="center_menu">
	<h2>기안서 작성</h2>
	<hr>
	<table id="sign_top" >
		<tr>
			<td>문서 종류</td>
			<td><select>
				<option>종류</option>
				<option>종류</option>
				<option>종류</option>
			</select></td>
			<td>작성자</td>
			<td>심원용</td>
			
		
		</tr>
	</table>
	
	
	
	<br>
	<h5>결재선 지정</h5>
	<hr>
	<table id="sign_middle">
		<tr>
			<td id="m_main" rowspan="4"><a id="plus" data-toggle="modal" href="#myModal"> 결재 <i class="fa-solid fa-plus"></i></a></td>
			
			
		</tr>
		<tr>
			<td class="td_top">아잉</td>
			<td class="td_top">아잉3</td>
			<td class="td_top">아잉4</td>
			<td class="td_top">아잉5</td>
			<td class="td_top">아잉6</td>
		</tr>
		<tr>
			<td >아잉2</td>
				<td>아잉3</td>
				<td>아잉4</td>
				<td>아잉5</td>
				<td>아잉6</td>
		</tr>
		<tr>
			<td class="td_bottom">아잉2</td>
				<td class="td_bottom">아잉3</td>
				<td class="td_bottom">아잉4</td>
				<td class="td_bottom">아잉5</td>
				<td class="td_bottom">아잉6</td>
		</tr>
		
		
	
	</table>
	
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
					<select multiple id="select-right">


					</select>
				</div>
			</div>

        </div>


        <div class="modal-footer">
          <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
        </div>
      </div>
    </div>
  </div>


<script>

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
			console.log(data)
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
$('#addUser').on('click', function(){
	let userCode = $('#select_box option:selected').val();
	let userOption = $('#select_box option[value=' + userCode + ']')[0].outerHTML;
	let addTypeCode = $(this).attr('id');
	let apprSelectBox = $('#select-right[id=' +addTypeCode + ']');
	let selectedOption = apprSelectBox.find('option').val();

	//중복체크
	let selectedOptionVal = [];
	$($('#select-right[id=' +addTypeCode+'] option')).each(function(){
		var selected = $(this).val();
		selectedOptionVal.push(selected);
	})
	if($.inArray(userCode, selectedOptionVal) != -1){
		alert('해당 결재타입에 추가한 결재자는 중복추가 할수 없습니다');

	}else{
		apprSelectBox.append(userOption);
	}
})
</script>

<script>

   /*  var langSelect = document.getElementById("select_top");
     
    // select element에서 선택된 option의 value가 저장된다.
    var selectValue = langSelect.options[langSelect.selectedIndex].value;
 
    // select element에서 선택된 option의 text가 저장된다.
    var selectText = langSelect.options[langSelect.selectedIndex].text;
} */






</script>

