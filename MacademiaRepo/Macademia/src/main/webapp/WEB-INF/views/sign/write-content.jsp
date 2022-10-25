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


<script>

$(document).ready(function () {
    $('#summernote').summernote({
        placeholder: '내용을 작성하세요',
        height: 400,
        maxHeight: 400
    });
});
</script>