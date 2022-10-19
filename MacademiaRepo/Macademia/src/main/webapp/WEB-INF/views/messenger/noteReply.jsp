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

			<div id="reply-title"><h1>쪽지 보내기</h1></div>

            <form action="">
				<!--  -->
				<div class="write-header-area">
					<span class="input-group-text"><h4>받는사람</h4></span>
					<div class="form-control"><h4>쪽지번호로 가져온 이름</h4></div>
				</div>
				<!--  -->
				<div class="write-header-area">
					<span class="input-group-text"><h4>참조인</h4></span>
					<input type="text" class="form-control">
					<a href="/md/messenger/note/recipient"><h4>검색하기</h4></a>
				</div>
				<!--  -->
				<div class="write-header-area">
					<span class="input-group-text"><h4>제목</h4></span>
					<input type="text" class="form-control" >
				</div>
				<!--  -->
				<div class="write-header-area">
					<span class="input-group-text"><h4>내용</h4></span>
					<textarea class="form-control" name="" id="" cols="30" rows="10">
                        
                        
                        
                        
                        
                        
                        
                                                                                                                  원래있던내용가져오기
                    </textarea></h4>
				</div>
			
				<!--  -->
				<div class="write-header-area">
					<span class="input-group-text">파일첨부</span>
					<div id="profile-img-wrap" class="form-control">
						<img id="profile-img-thumb" src="" width="60%" height="100%">
						<input  type="file" name="profile">
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