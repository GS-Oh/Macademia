<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
	<style>
	    <%@ include file="/resources/css/messenger/commonHeaderAside.css" %>


		main{
			display: grid;
			grid-template-rows: 10% 50% ;
		}

		#detail-header{
			display: grid;
			grid-template-columns: 10% 60% 15% 15%;
		}


		#reply-list{
			display: grid;
			grid-template-columns: 2fr 9fr;
			grid-template-rows: repeat(3, 1fr);
		}

		#reply-insert{
			width: 80%;
			height: 200px;
			margin-top: 30px;
			display: grid;
			grid-template-rows: 50px 100px 50px;
			border: 1px solid gray;
			border-radius: 10px;
		}

    </style>
</head>
<body>

	<%@ include file="/WEB-INF/views/common/header.jsp" %>


    <div id="wrap">

		<%@ include file="/WEB-INF/views/messenger/commonHeaderAside.jsp" %>
        

        <main>
            <!--  -->
			<div id="detail-header">
				<div>공지</div>
				<div>[스팸대전 그후] 그 많던 스팸은 어디로 갔을까요?</div>
				<div>조회 수 : 3</div>
				<div>댓글 수 : 3</div>
			</div>

			<!--  -->
			<div id="detail-content">

				<textarea name="" id="" cols="30" rows="10" style="width: 90%; height: 90%;">

				</textarea>

			</div>

			<!--  -->
			<div style="text-align: right;">
				<a href="">수정하기</a>
				<a href="">삭제하기</a>
			</div>

			<!--  -->
			<div id="reply-area">

				<h3>댓글</h3>

				<div id="reply-list">

					<div style="grid-row: span 3;"><img src="" alt="">1</div>
					<div>작성자닉네임</div>
					<div>내용</div>
					<div>작성일자</div>

				</div>


				<div id="reply-insert">

					<label for="comment">로그인한사람닉네임</label>
					<textarea class="form-control" rows="5" id="comment" name="text">

					</textarea>
					<button type="submit" class="btn btn-primary" style="width: 20%;">Submit</button>

				</div>




			</div>

        </main>


    </div>

</html>