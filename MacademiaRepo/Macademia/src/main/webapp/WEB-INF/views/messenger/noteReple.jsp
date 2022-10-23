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

		main > form{
			margin-top : 50px;
			height: 100%;
			display: grid;
			grid-template-rows: 5% 5% 5% 35% 25% 25%;
		}
	
		/*  */
		#reply-title{
			margin : 50px;
			margin-left : 100px;
		}

		#reply-title > h1{
			border-left: 5px solid #6667AB;
			padding-left: 15px;
		}


		/*  */

	

		.write-header-area{
			display: grid; grid-template-columns: 15% 70% 5%;
			justify-content: center;
		}

		.write-header-area > input{
			font-size : 1.5rem;
			
		}
		
		.form-control > h4{
			padding-top : 10px;
		}
		

		#profile-img-wrap{
			display: grid;
			grid-template-rows: 80% 20%;
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

			<div id="reply-title"><h1>쪽지 답장하기</h1></div>

            <form action="/md/messenger/note/write/${noteRepleVo.receiveNo}" method="post" enctype="multipart/form-data">
				<!--  -->
				<div class="write-header-area">
					<span class="input-group-text"><h4>받는사람</h4></span>
					<div class="form-control"><h4>${noteRepleVo.receiveName}</h4></div>
				</div>
				<!--  -->
				<div class="write-header-area">
					<span class="input-group-text"><h4>참조인</h4></span>
					<input type="text" class="form-control" name="">
					<a href="/md/messenger/note/recipient"><h4>검색하기</h4></a>
				</div>
				<!--  -->
				<div class="write-header-area">
					<span class="input-group-text"><h4>제목</h4></span>
					<input type="text" class="form-control" name="title">
				</div>
				<!--  -->
				<div class="write-header-area">
					<span class="input-group-text"><h4>내용</h4></span>
					<textarea class="form-control" name="content" id="" cols="30" rows="10" >&#10;&#10;&#10;&#10;&#10;&#10;&#10;========================== 이전 내역 ==========================&#10;&#10;&#10;제목 : ${noteRepleVo.title}&#10;&#10;내용 : ${noteRepleVo.content}</textarea></h4>
				</div>
			
				<!--  -->
				<div class="write-header-area">
					<span class="input-group-text">파일첨부</span>
					<div id="profile-img-wrap" class="form-control">
						<img id="profile-img-thumb" src="" width="60%" height="100%">
						<input  type="file" name="attFile" style="font-size: 1.3rem;">
					</div>
				</div>


				<!--  -->
				<div style="text-align: center; margin-top:50px;">
					<input  class="btn btn-primary" type="submit" value="전송">
					<button class="btn btn-primary" onclick="" >닫기</button>
				</div>

			</form>
        </main>


    </div>

</html>