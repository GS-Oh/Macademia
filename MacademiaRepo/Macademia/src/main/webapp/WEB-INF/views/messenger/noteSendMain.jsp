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
			grid-template-rows: 15% 7% 45% 40%;
		}


		#note-header-area{
			display: grid;
			grid-template-columns: repeat(4, 1fr);
			justify-items: center;
			align-items: center;
		}

		#note-header-area > a{
			width: 80%;
			height: 90%;
			text-align: center;
			text-decoration: none;
			color: #6667AB;
			padding-top : 5%;
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
			grid-template-columns: 50px 1fr 1fr 1fr 2fr 0.5fr;
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
			grid-template-columns: 50px 1fr 1fr 1fr 2fr 0.5fr;
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
			grid-template-rows: repeat(4,1fr) 2fr 2fr;
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


		#detail-img-file {
			height : 150px;
			width : 150px;
			padding-bottom: 10px;
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
						<i class="fas fa-edit" style="font-size : 60px;"></i>
						<h5>쪽지</h5>
					</div>
				</a>

				<a href="" id="note-reple-area">
					<div class="header-area-content">
						<i class="fas fa-share-square" style="font-size : 60px;"></i>
						<h5>답장하기</h5>
					</div>
				</a>
				
				<a href="/md/messenger/noteSendBox">
					<div class="header-area-content">
						<i class="fas fa-sync-alt" style="font-size : 60px;"></i>
						<h5>새로고침</h5>
					</div>
				</a>

				<a href="" id="note-delete-area">
					<div class="header-area-content">
						<i class="fas fa-trash-alt" style="font-size : 60px;"></i>
						<h5>삭제하기</h5>
					</div>
				</a>

			</div>

			<!--  -->
			<div id="note-search-area">
				<form action="/md/messenger/note/searchSend" method="post">
					<div style="width: 60%;">
						<select name="menu" id="" >
							<!-- <option value="sendName">보낸사람</option> -->
							<option value="receiveName">받은사람</option>
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
				<div class="info-header" style="display: none;">보낸사람</div>
				<div class="info-header">받은사람</div>
				<div class="info-header">제목</div>
				<div class="info-header">날짜</div>
				<div class="info-header">내용</div>
				<div class="info-header">첨부파일 유무</div>

				<!-- 쪽지 수 만큼 여기 반복 -->
				<c:forEach items="${mnVoList}" var="mnVo">
				
					<c:if test="${msgVo.msgNo eq mnVo.msgNo}">		
						<div class="msg-noteNo" style="display:none;">${mnVo.noteNo}</div>
						<div class="msg-fileName" style="display: none;">/md/resources/upload/messenger/${mnVo.fileName}</div>
						<div class="msg-originName" style="display: none;">${mnVo.originName}</div>


						<div class="info-content">
							<div><input type="checkbox" class="msg-checkBox" name="msg-checkBox"></div>
							<div class="msg-sender" style="display: none;">${mnVo.sendName}</div>
							<div class="msg-receive" >${mnVo.receiveName}</div>
							<div class="msg-title">${mnVo.title}</div>
							<div class="msg-sendDate">${mnVo.sendDate}</div>
							<div class="msg-content">${mnVo.content}</div>
							<div>
							<c:if test="${not empty mnVo.fileName}">
								<a href="/md/messenger/download/${mnVo.fileName}/${mnVo.originName}" target='_blank'>파일있음</a>
							</c:if>
							</div>
							
						</div>
					</c:if>
					
				</c:forEach>
				
				
			</div>
			
			<!--  -->
			<div id="note-detail-area">

				<div class="detail-area-title">보낸 사람(나)</div>
				<div class="detail-area-content" id="detail-sender"></div>
				<div class="detail-area-title">받은 사람</div>
				<div class="detail-area-content" id="detail-receive"></div>
				<div class="detail-area-title">제목</div>
				<div class="detail-area-content" id="detail-title"></div>
				<div class="detail-area-title">보낸 날짜</div>
				<div class="detail-area-content" id="detail-sendDate"></div>



				<div class="detail-area-title">내용</div>
				<div class="detail-area-content" id="detail-content"></div>
				<div class="detail-area-title">첨부파일</div>
				<div class="detail-area-content" ><img src="" alt="-" id="detail-img-file" ><span  id="detail-etc-file"></span></div>
				
			</div>
			
			
			


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

	<!-- 쪽지 세부 내용 표시 -->
	<script>
		const content = document.querySelectorAll('.info-content');
		const msgCheckBox = document.querySelectorAll('.msg-checkBox');

		const msgSender = document.querySelectorAll('.msg-sender');
		const msgReceive = document.querySelectorAll('.msg-receive');
		const msgTitle = document.querySelectorAll('.msg-title');
		const msgSendDate = document.querySelectorAll('.msg-sendDate');
		const msgFile = document.querySelectorAll('.msg-fileName');
		const msgOriginFile = document.querySelectorAll('.msg-originName');
		const msgContent = document.querySelectorAll('.msg-content');


		const detailSender = document.querySelector('#detail-sender');
		const detailReceive = document.querySelector('#detail-receive');
		const detailTitle = document.querySelector('#detail-title');
		const detailSendDate = document.querySelector('#detail-sendDate');
		const detailImgFile = document.querySelector('#detail-img-file');
		const detailEtcFile = document.querySelector('#detail-etc-file');
		const detailContent = document.querySelector('#detail-content');
		
		const msgNoteNo = document.querySelectorAll('.msg-noteNo');
		const repleHref = document.querySelector('#note-reple-area');
		const deleteHref = document.querySelector('#note-delete-area');

		
		
		for(let i=0; i<content.length; ++i){

			content[i].addEventListener('click', function(){
				
				if(msgCheckBox[i].checked){
					msgCheckBox[i].checked = false;
				}else{
					msgCheckBox[i].checked = true;
				}
				
				detailSender.innerText = msgSender[i].innerText;
				detailReceive.innerText = msgReceive[i].innerText;
				detailTitle.innerText = msgTitle[i].innerText;
				detailSendDate.innerText = msgSendDate[i].innerText;
				detailContent.innerText = msgContent[i].innerText;
				
				
				let fileStr = msgFile[i].innerText;
				let fileStrDot = fileStr.substring((fileStr.lastIndexOf('.')));
				
				if(fileStrDot == ".jpg" || fileStrDot == ".png"){

					detailEtcFile.innerText = "";
					detailImgFile.src =  fileStr;

				}else if(fileStr == '/md/resources/upload/messenger/'){
					
					detailEtcFile.innerText = "";
					detailImgFile.src =  "";
					
				}else{

					detailImgFile.src =  "";
					detailEtcFile.innerText = msgOriginFile[i].innerText;

				}
				
				
				if(msgCheckBox[i].checked){
					repleHref.href = "/md/messenger/note/reple/"+ msgNoteNo[i].innerText;
					deleteHref.href = "/md/messenger/note/deleteSend/"+ msgNoteNo[i].innerText;
					alert(cntCheckbox);
				}

			});	
		};
	
		//쪽지 1개만 선택했을때 답장 가능하도록 해주기
		repleHref.addEventListener('click',function(){
			const cntCheckbox = $("input[name=msg-checkBox]:checked").length;
			
			if(cntCheckbox > 1){
				repleHref.href = "";
				deleteHref.href = "";
				alert('하나의 쪽지만 선택해 주세요 ^-^');
			}
		});






	</script>
	


	


</html>