<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <script src="http://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.js"></script>

	<link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.css" rel="stylesheet"> 
  <script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.js"></script>
  <script src=" https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.18/lang/summernote-ko-KR.min.js"></script>
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
	background-color:#6667ab8f
	
	}
	 #sign_top tr td:nth-child(4){
	 	background-color:#6667ab8f;
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
			<td id="m_main" rowspan="3"> 결재 <i class="fa-solid fa-plus"></i></td>
			<td>zz</td>
			<td>zz</td>
			
		</tr>
		<tr>
			<td>zz</td>
			<td>zz</td>
		</tr>
		<tr>
			<td>zz</td>
			<td>zz</td>
		</tr>
	
	</table>
	
	<br>
	
	
	<h5>상세 입력</h5>
	
	<hr>
	<div id="summernote"></div>
	
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