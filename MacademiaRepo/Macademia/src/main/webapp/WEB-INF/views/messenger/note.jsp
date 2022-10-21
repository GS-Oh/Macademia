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
			grid-template-columns: 25% 50% 25%;
			justify-items: center;
			
		}

		#note-search-area > form > div > select{
			text-align: center;
		}

		#note-search-area > form > div > *{
			width: 100%;
			height: 100%;	
			border: 1px solid black;
			
		}


		/*  */
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
			
			text-align: center;

		}

		.info-header{
			background-color: #6667AB;
			color: white;
			border-right: 1px dashed white;
			width: 100%;
			height: 60%;

			display: grid;
			align-items: center;
		}

		
		.info-content{
			display: grid;
			grid-template-columns: 50px 1fr 1fr 1fr 2fr 1fr;
			grid-column: span 6;
			place-items: center;
			
			padding: 5px 5px 5px 0px;

			border-bottom: 1px dashed black;
			width: 100%;
		}

		.info-content:hover{
			background-color: #1315a6;
			color: wheat;
		}



		/*  */
		#note-detail-area{
			display: grid;
			grid-template-columns: 2fr 8fr;
			grid-template-rows: repeat(5,1fr) 2fr;
			margin-top: 15px;
			border: 3px solid #6667AB;
			border-radius: 10px;

		}

		.detail-area-title{
			background-color: #6667AB;
			color: white;
			align-items: center;
			text-align: center;
			padding-top: 5px;

			display: grid;
			align-items: center;

			font-size: 1.5rem;
			
			border-bottom: 2px solid white;
		}

		.detail-area-content{
			border-top: 2px solid black;
			align-items: center;
			padding: 5px 0px 0px 10px;

			font-size: 1.5rem;
		}

		/* #1315a6 #6667AB */
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
			<div id="note-header-area">
				
				<a href="/md/messenger/note/write">
					<div class="header-area-content">
						<img src="" alt="" width="100%" height="100%" style="border: 1px solid black;">
						<h5>쪽지</h5>
					</div>
				</a>

				<a href="/md/messenger/note/reply?">
					<div class="header-area-content">
						<img src="" alt="" width="100%" height="100%" style="border: 1px solid black;">
						<h5>회신</h5>
					</div>
				</a>
				
				<a href="">
					<div class="header-area-content">
						<img src="" alt="" width="100%" height="100%" style="border: 1px solid black;">
						<h5>새로고침</h5>
					</div>
				</a>

				<a href="/md/messenger/note/delete?">
					<div class="header-area-content">
						<img src="" alt="" width="100%" height="100%" style="border: 1px solid black;">
						<h5>삭제</h5>
					</div>
				</a>

			</div>

			<!--  -->
			<div id="note-search-area">
				<form action="/md/messenger/note/search" method="post">
					<div style="width: 60%;">
						<select name="menu" id="" >
							<option value="msgNo">보낸사람</option>
							<option value="receiveNo">받은사람</option>
							<option value="title">제목</option>
							<option value="comment">내용</option>
						</select>
					</div>
					<div style="width: 100%;">
						<input type="text" name="keyword" value="${keyword}">
					</div>
					<div style="width: 40%;" >
						<input class="btn btn-outline-dark" type="submit" value="검색하기" style="font-size:1.3rem;">
					</div>
				</form>
			</div>


			<!--  -->
			<div id="note-info-area">

				<div class="info-header"><input type="checkbox"></div>
				<div class="info-header">보낸사람</div>
				<div class="info-header">받은사람</div>
				<div class="info-header">제목</div>
				<div class="info-header">내용</div>
				<div class="info-header">날짜</div>



				<!-- 쪽지 수 만큼 여기 반복 -->
				<c:forEach items="${mnVoList}" var="mnVo">
				
					<div class="info-content">
						<div><input type="checkbox" class="msg-checkBox"></div>
						<div class="msg-sender">${mnVo.msgNo}</div>
						<div class="msg-receive">${mnVo.receiveNo}</div>
						<div class="msg-title">${mnVo.title}</div>
						<div class="msg-content">${mnVo.content}</div>
						<div class="msg-sendDate">${mnVo.sendDate}</div>
					</div>
					
				</c:forEach>
				
				
				
				
			</div>
			
			<!--  -->
			<div id="note-detail-area">
				<div class="detail-area-title">보낸 사람</div>
				<div class="detail-area-content" id="detail-sender">2</div>
				<div class="detail-area-title">받은 사람</div>
				<div class="detail-area-content" id="detail-receive">4</div>
				<div class="detail-area-title">제목</div>
				<div class="detail-area-content" id="detail-title">6</div>
				<div class="detail-area-title">보낸 날짜</div>
				<div class="detail-area-content" id="detail-sendDate">8</div>
				<div class="detail-area-title">첨부파일</div>
				<div class="detail-area-content" id="detail-file">3</div>
				<div class="detail-area-title">내용</div>
				<div class="detail-area-content" id="detail-content">3</div>
				
			</div>
			
			
			<!-- <div class="msg-fileName">${mnVo.fileName}</div> -->
			
			<!-- <div class="detail-area-title">받은 날짜</div>
			<div class="detail-area-content" id="detail-receiveDate">1</div> -->

        </main>


    </div>
    
    <!-- 검색 값 유지 -->
	<c:if test="${not empty menu}">
		<script>
			window.onload = function(){
				document.querySelector('option[value=${menu}').selected = true;
			}
		</script>
	</c:if>

	<script>
		const content = document.querySelectorAll('.info-content');

		const msgCheckBox = document.querySelectorAll('.msg-checkBox');
		const msgSender = document.querySelectorAll('.msg-sender');
		const msgReceive = document.querySelectorAll('.msg-receive');
		const msgTitle = document.querySelectorAll('.msg-title');
		const msgContent = document.querySelectorAll('.msg-content');
		const msgSendDate = document.querySelectorAll('.msg-sendDate');

		
		const detailSender = document.querySelector('#detail-sender');
		const detailReceive = document.querySelector('#detail-receive');
		const detailTitle = document.querySelector('#detail-title');
		const detailSendDate = document.querySelector('#detail-sendDate');
		const detailFile = document.querySelector('#detail-file');
		const detailContent = document.querySelector('#detail-content');


		for(let i=0; i<content.length; ++i){

			content[i].addEventListener('click', function(){

				msgCheckBox[i].checked = true;
				detailSender.innerText = msgSender[i].innerText;
				detailReceive.innerText = msgReceive[i].innerText;
				detailTitle.innerText = msgTitle[i].innerText;
				detailSendDate.innerText = msgSendDate[i].innerText;
				detailFile.innerText = msgSender[i].innerText;
				detailContent.innerText = msgContent[i].innerText;

			});	
		};
	

	</script>



</html>