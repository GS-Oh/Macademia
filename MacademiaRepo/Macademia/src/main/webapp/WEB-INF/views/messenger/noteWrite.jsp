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

	

		#profile-img-wrap{
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

            <form action="">
				<!--  -->
				<div class="write-header-area" >
					<span class="input-group-text">받는사람</span>
					<input type="text" class="form-control" >
					<a href="/md/messenger/note/recipient" class="badge bg-secondary"><h5>검색하기</h5></a>
				</div>
				<!--  -->
				<div class="write-header-area">
					<span class="input-group-text">참조인</span>
					<input type="text" class="form-control" >
					<a href="/md/messenger/note/recipient" class="badge bg-secondary"><h5>검색하기</h5></a>
				</div>
				<!--  -->
				<div class="write-header-area">
					<span class="input-group-text">제목</span>
					<input type="text" class="form-control" >
				</div>
				<!--  -->
				<div class="write-header-area">
					<span class="input-group-text">내용</span>
					<input type="text" class="form-control" >
				</div>
			
				<!--  -->
				<div class="write-header-area">
					<span class="input-group-text">파일첨부</span>
					<div id="profile-img-wrap" class="form-control">
						<img id="profile-img-thumb" src="" width="50%" height="100%">
						<input  type="file" name="profile" style="font-size: 1.3rem;">
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

</html>