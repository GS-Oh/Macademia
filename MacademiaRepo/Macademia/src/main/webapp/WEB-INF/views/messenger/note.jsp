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
			grid-template-rows: 15% 7% 44% 34%;
		}

		#note-header-area{
			display: grid;
			grid-template-columns: repeat(4, 1fr);
			justify-items: center;
		}

		#note-header-area > a{
			width: 80%;
			height: 90%;
			text-align: center;
			text-decoration: none;
			color: #6667AB;
			margin-top: 5%;
		}

		.header-area-content{
			display: grid;
			height: 100%;
			grid-template-rows: 1.5fr 0.5fr;
			justify-items: center;
		}

		.header-area-content > img{
			border: 1px solid black;
			width: 70%;
		}

	
		#note-search-area{
			margin: 10px 0px 10px 0px;
		}

		#note-search-area > form{
			height: 100%;
			display: grid;
			grid-template-columns: 13% 65% 17%;
			padding-left: 6%;
			justify-items: center;
		}

		


		#note-search-area > form > div > *{
			height: 100%;	
			border: 1px solid black;
		}


		#note-info-area{
			display: grid;
			grid-template-columns: 50px 1fr 1fr 1fr 2fr 1fr;
			grid-template-rows: repeat(8, 1fr);
			place-items: center;
			border: 3px solid #6667AB;
			border-radius: 10px;

			grid-auto-rows: 1fr;
			grid-auto-flow: row;

			overflow-y: scroll;
			


		}

		.info-header{
			background-color: #1315a6;
			color: white;
		}



		#note-info-area > div{
			border-right: 1px dashed black;
			width: 100%;
			text-align: center;
		}


		#note-detail-area{
			display: grid;
			grid-template-columns: 2fr 8fr;
			grid-template-rows: repeat(5,1fr) 2fr;
			margin-top: 15px;
			border: 3px solid #1315a6;
			border-radius: 10px;
		}

		.detail-area-title{
			background-color: #6667AB;
			border-right: 1px solid black;
			margin-bottom: 5px;
			color: white;
			align-items: center;
			text-align: center;
			padding-top: 5px;
		}

		.detail-area-content{
			border-top: 2px solid #6667AB;
			align-items: center;
			padding: 5px 0px 0px 10px;
		}

		/* #1315a6 #6667AB */
    </style>
</head>
<body>

	<%@ include file="/WEB-INF/views/common/header.jsp" %>

    <div id="wrap">

		<%@ include file="/WEB-INF/views/messenger/commonHeaderAside.jsp" %>
        

        <main>

           <!--  -->
			<div id="note-header-area">
				
				<a href="/md/messenger/note/write">
					<div class="header-area-content">
						<img src="" alt="">
						<h5>쪽지</h5>
					</div>
				</a>

				<a href="">
					<div class="header-area-content">
						<img src="" alt="">
						<h5>회신</h5>
					</div>
				</a>
				
				<a href="">
					<div class="header-area-content">
						<img src="" alt="">
						<h5>새로고침</h5>
					</div>
				</a>

				<a href="">
					<div class="header-area-content">
						<img src="" alt="">
						<h5>삭제</h5>
					</div>
				</a>

			</div>

			<!--  -->
			<div id="note-search-area">
				<form action="">
					<div>
						
						<select name="" id="" >
							<option value="msgNo">보낸사람</option>
							<option value="recipientNo">받은사람</option>
							<option value="comment">내용</option>
						</select>
					</div>
					<div style="width: 100%;">
						<input type="text" name="" style="width: 100%;" >
					</div>
					<div>
						<input class="btn btn-outline-dark" type="submit" value="검색하기">
					</div>
				</form>
			</div>


			<!--  -->
			<div id="note-info-area">

				<div class="info-header"><input type="checkbox"></div>
				<div class="info-header">보낸사람</div>
				<div class="info-header">받은사람</div>
				<div class="info-header">첨부종류</div>
				<div class="info-header">내용</div>
				<div class="info-header">날짜</div>
				
				<div><input type="checkbox"></div>
				<div>보낸사람</div>
				<div>받은사람</div>
				<div>첨부종류</div>
				<div>내용</div>
				<div>날짜</div>

				<div><input type="checkbox"></div>
				<div>보낸사람</div>
				<div>받은사람</div>
				<div>첨부종류</div>
				<div>내용</div>
				<div>날짜</div>

				<div><input type="checkbox"></div>
				<div>보낸사람</div>
				<div>받은사람</div>
				<div>첨부종류</div>
				<div>내용</div>
				<div>날짜</div>
				
				<div><input type="checkbox"></div>
				<div>보낸사람</div>
				<div>받은사람</div>
				<div>첨부종류</div>
				<div>내용</div>
				<div>날짜</div><div><input type="checkbox"></div>
				<div>보낸사람</div>
				<div>받은사람</div>
				<div>첨부종류</div>
				<div>내용</div>
				<div>날짜</div><div><input type="checkbox"></div>
				<div>보낸사람</div>
				<div>받은사람</div>
				<div>첨부종류</div>
				<div>내용</div>
				<div>날짜</div><div><input type="checkbox"></div>
				<div>보낸사람</div>
				<div>받은사람</div>
				<div>첨부종류</div>
				<div>내용</div>
				<div>날짜</div>

				<div><input type="checkbox"></div>
				<div>보낸사람</div>
				<div>받은사람</div>
				<div>첨부종류</div>
				<div>내용</div>
				<div>날짜</div>

				<div><input type="checkbox"></div>
				<div>보낸사람</div>
				<div>받은사람</div>
				<div>첨부종류</div>
				<div>내용</div>
				<div>날짜</div><div><input type="checkbox"></div>
				<div>보낸사람</div>
				<div>받은사람</div>
				<div>첨부종류</div>
				<div>내용</div>
				<div>날짜</div><div><input type="checkbox"></div>
				<div>보낸사람</div>
				<div>받은사람</div>
				<div>첨부종류</div>
				<div>내용</div>
				<div>날짜</div><div><input type="checkbox"></div>
				<div>보낸사람</div>
				<div>받은사람</div>
				<div>첨부종류</div>
				<div>내용</div>
				<div>날짜</div><div><input type="checkbox"></div>
				<div>보낸사람</div>
				<div>받은사람</div>
				<div>첨부종류</div>
				<div>내용</div>
				<div>날짜</div><div><input type="checkbox"></div>
				<div>보낸사람</div>
				<div>받은사람</div>
				<div>첨부종류</div>
				<div>내용</div>
				<div>날짜</div><div><input type="checkbox"></div>
				<div>보낸사람</div>
				<div>받은사람</div>
				<div>첨부종류</div>
				<div>내용</div>
				<div>날짜</div><div><input type="checkbox"></div>
				<div>보낸사람</div>
				<div>받은사람</div>
				<div>첨부종류</div>
				<div>내용</div>
				<div>날짜</div><div><input type="checkbox"></div>
				<div>보낸사람</div>
				<div>받은사람</div>
				<div>첨부종류</div>
				<div>내용</div>
				<div>날짜</div><div><input type="checkbox"></div>
				<div>보낸사람</div>
				<div>받은사람</div>
				<div>첨부종류</div>
				<div>내용</div>
				<div>날짜</div><div><input type="checkbox"></div>
				<div>보낸사람</div>
				<div>받은사람</div>
				<div>첨부종류</div>
				<div>내용</div>
				<div>날짜</div><div><input type="checkbox"></div>
				<div>보낸사람</div>
				<div>받은사람</div>
				<div>첨부종류</div>
				<div>내용</div>
				<div>날짜</div><div><input type="checkbox"></div>
				<div>보낸사람</div>
				<div>받은사람</div>
				<div>첨부종류</div>
				<div>내용</div>
				<div>날짜</div>
				
			</div>

			<!--  -->
			<div id="note-detail-area">
				<div class="detail-area-title">보낸 사람</div>
				<div class="detail-area-content">2</div>
				<div class="detail-area-title">받은 사람</div>
				<div class="detail-area-content">4</div>
				<div class="detail-area-title">제목</div>
				<div class="detail-area-content">6</div>
				<div class="detail-area-title">보낸 날짜</div>
				<div class="detail-area-content">8</div>
				<div class="detail-area-title">받은 날짜</div>
				<div class="detail-area-content">1</div>
				<div class="detail-area-title">내용</div>
				<div class="detail-area-content">3</div>
			</div>




        </main>


    </div>

</html>