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


		main{
			display: grid;
			grid-template-rows: 10% 70% auto;
			border-radius : 10px;
		}


		#detail-header{
			display: grid;
			grid-template-columns: 6% 74% 10% 10%;
			align-items: center;
			font-size: 1.5rem;
		}

		#detail-content > a{
			text-decoration: none;
			float: right;
			margin-right: 20px;
		}

		#detail-content > textarea{
			border: 3px solid lightseagreen;
			width: 100%;
			height: 90%;
		}

		/* 댓글영역 */
		#reply-area{
			border: 3px solid lightseagreen;
			border-radius: 10px;
		}

		#reply-area > span{
			margin: 10px;
			padding-bottom: 20px;
		}
		
		#reply-area > span > h3{
			border-left: 5px solid lightseagreen;
			padding-left: 10px;
			margin-left: 10px;
		}


		.reply-list{
			display: grid;
			grid-template-columns: 1fr 9fr;
			grid-template-rows: 20% 60% 20%;
			align-items: center;
			padding : 10px;
			margin-bottom: 5px;
			border-bottom: 1px solid lightgray;
		}

		.reply-img-wrap{
			grid-row: span 3;
			height: 100%;
			width: 100%;
			margin-right: 80px;
		}


		#reply-insert{
			margin: 5% 5% 5% 10%;
			width: 80%;
			
			display: grid;
			grid-template-rows: 20% 60% 20%;
			align-items: center;

			border: 3px solid gray;
			border-radius: 10px;
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
			
            <!--  -->
			<div id="detail-header">
				<div><span  class="badge bg-info" >공지</span></div>
				<div><h3>[스팸대전 그후] 그 많던 스팸은 어디로 갔을까요?</h3></div>
				<div>조회 수 : 3</div>
				<div>댓글 수 : 3</div>
			</div>

			<!--  -->
			<div id="detail-content">

				<textarea name="" id="" cols="30" rows="10" ></textarea>

				<a href="" class="badge bg-warning"><h5>삭제하기</h5></a>
				<a href="/md/messenger/notice/edit" class="badge bg-success"><h5>수정하기</h5></a>
			</div>
			


			<!--  -->
			<div id="reply-area">

				<span><h3>댓글</h3></span>

				<!-- 리스트 만큼 이거 반복 -->
				<div class="reply-list">
					<div class="reply-img-wrap" ><img src="" alt="" width="90%" height="100%" style="border : 1px solid black;"></div>
					<div><span>작성자닉네임</span></div>
					<div><h4>내용</h4></div>
					<div><h6 style="color:gray">작성일자</h6></div>
				</div>

				<!-- 리스트 만큼 이거 반복 -->
				<div class="reply-list">
					<div class="reply-img-wrap" ><img src="" alt="" width="90%" height="100%" style="border : 1px solid black;"></div>
					<div><span>작성자닉네임</span></div>
					<div><h4>내용</h4></div>
					<div><h6 style="color:gray">작성일자</h6></div>
				</div>

				<!-- 리스트 만큼 이거 반복 -->
				<div class="reply-list">
					<div class="reply-img-wrap" ><img src="" alt="" width="90%" height="100%" style="border : 1px solid black;"></div>
					<div><span>작성자닉네임</span></div>
					<div><h4>내용</h4></div>
					<div><h6 style="color:gray">작성일자</h6></div>
				</div>


				<div id="reply-insert">

					<div style="margin-left: 10px;">
						<label for="comment"><span  class="badge bg-secondary" >로그인한사람닉네임</span></label>
					</div>
					<div style="margin: 10px;">
						<textarea class="form-control" rows="4" id="comment" name="text">
						</textarea>
					</div>	
					<div >
						<button type="submit" class="badge bg-info" style="float: right;">등록하기</button>
					</div>	

				</div>

			</div>

        </main>


    </div>

</html>