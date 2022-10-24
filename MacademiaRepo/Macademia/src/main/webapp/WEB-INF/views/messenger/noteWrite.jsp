<%@ page language="java" contentType="text/html; charset=UTF-8" 
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

	<%@ include file="/resources/css/common/common.css" %>
	<style>
	    <%@ include file="/resources/css/messenger/commonAside.css" %>

		#write-title{
			margin : 50px;
			margin-left : 120px;
		}

		#write-title > h1{
			border-left: 5px solid #6667AB;
			padding-left: 15px;
		}

		main > form{
			margin-top : 50px;
			height: 100%;
			display: grid;
			grid-template-rows: 5% 5% 5% 35% 25% 25%;
		}
		
		.write-header-area{
			display: grid; 
			grid-template-columns: 10% 70% 5%;
			justify-content: center;
		}
		
		.write-header-area>span{
			font-size: 1.3rem;
		}

		.write-header-area > a{
			text-decoration: none;
			display: grid;
			align-items: center;
			margin-top: 10%;
			height: 80%;
		}

	

		#attFile-img-wrap{
			display: grid;
			grid-template-rows: 80% 20%;
		}

		/*  */
		#write-bottom-area{
			text-align: center; 
			margin-top:50px; 
			font-size: 2rem;
		}
		


    </style>
</head>
<body>



    <div id="wrap">

		<header>
			<%@include file="/WEB-INF/views/common/header.jsp" %>
        </header>
		<aside>		
			<%@ include file="/WEB-INF/views/messenger/commonAside.jsp" %>
		</aside>       

        <main>

			<div id="write-title"><h1>쪽지 보내기</h1></div>

            <form action="/md/messenger/note/write/${receiveNo}" method="post" enctype="multipart/form-data">
				<!--  -->
				<div class="write-header-area" >
					<span class="input-group-text">받는사람</span>
					<input type="text" class="form-control" name="receiveNo" value="${receiveName}" readonly placeholder="검색하기 버튼으로 선택해주세요">
					<a href="/md/messenger/note/recipient" class="badge bg-secondary"><h5>검색하기</h5></a>
				</div>
				<!--  -->
				<div class="write-header-area">
					<span class="input-group-text">참조인</span>
					<input type="text" class="form-control" name="referNo" readonly placeholder="검색하기 버튼으로 선택해주세요">
					<a href="/md/messenger/note/recipient" class="badge bg-secondary"><h5>검색하기</h5></a>
				</div>
				<!--  -->
				<div class="write-header-area">
					<span class="input-group-text">제목</span>
					<input type="text" class="form-control" name="title">
				</div>
				<!--  -->
				<div class="write-header-area">
					<span class="input-group-text">내용</span>
					<input type="text" class="form-control" name="content">
				</div>
			
				<!--  -->
				<div class="write-header-area">
					<span class="input-group-text">파일첨부</span>
					<div id="attFile-img-wrap" class="form-control">
						<img id="attFile-img-thumb" src="" width="50%" height="100%">
						<input  type="file" name="attFile" style="font-size: 1.3rem;">
					</div>
				</div>


				<!--  -->
				<div id="write-bottom-area">
					<input  class="btn btn-primary btn-lg" type="submit" value="전송">
					<button class="btn btn-light btn-lg" onclick="" >닫기</button>
				</div>

			</form>
        </main>


    </div>

	<script>
	    // 파일 있는지 확인하기
	    const fileInputTag = document.querySelector('input[name=attFile]');
		
	    // 해당파일에 변화가 생기면 함수가 작동하도록 설정
	    fileInputTag.onchange = function(){
	    
	        //썸네일 보여줄 img태그 가져오기 (url 값 변경할 애 가져오기)
	        const imgTag = document.querySelector('#attFile-img-thumb');
	        
	        //파일에 어떤 변화가 생긴건치 체크 --- 파일 추가하였을때 동작하도록 해주자
	        if(fileInputTag.files.length > 0){
	            
	            //파일 준비
	            const fr = new FileReader();
	            
	            //파일 읽기
	            fr.readAsDataURL(fileInputTag.files[0]);
	            
	            //파일 다 읽어오면 동작하는 함수 생성
	            fr.onload = function(data){
	                //썸네일img태그의 src 경로를 - 읽어온 파일의 url로 변경해주기
	                imgTag.src = data.target.result;
	            }
	        }else{
	            imgTag.src = "";
	        }
	    }
	</script>

</html>