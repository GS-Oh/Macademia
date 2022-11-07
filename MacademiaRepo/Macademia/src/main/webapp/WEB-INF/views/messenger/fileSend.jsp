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
			grid-template-columns: 4fr 6fr;
			grid-template-rows: 7fr 3fr;
			
		}
		
	

		#recipient-search-area{
			
			overflow-y: scroll;
		}

		#recipient-search-area > ul > h2{
			margin-top: 30px;
			font-weight: 900;
			text-align: left;
			color: #1315a6;
		}

		.search-header{
			font-size: 1.5rem;
			margin: 30px 30px 50px 0px;
			padding-bottom: 80px;
			border-bottom: 1px dashed #1315a6;
		}
		

		.search-header > li{
			margin-top: 15px;
			margin-left : 50px;
			padding : 15px;
			list-style: decimal;
			font-size: 2rem;
			color: #6667AB;
		}

		.search-header > li > ul{
			padding: 5px;
			color: #6667AB;
			font-size: 1.6rem;
		}

		.search-header > li > ul >li>button{
			border: none;
			background-color: none;
			margin: 10px 0px 10px 0px;
		}

		/*  */
		#recipient-select-area{

			font-size: 1.5rem;
			display: grid;
			grid-template-columns: 0.5fr 1fr 1fr 1fr;
			grid-template-rows: repeat(11, 1fr);
			align-items: center;
			justify-items: center;

			margin-left: 10px;
		}

		.dept-result-area{
			grid-column: span 4; 
			display: grid; 
			grid-template-columns: 0.5fr 1fr 1fr 1fr; 
			width: 100%;
			align-items: center;
			justify-items: center;

		}


		.select-header{
			background-color: #6667AB;
			width: 90%;
			color: white;
			text-align: center;
		}

		.select-content{
			width: 90%;
			text-align: center;
		}


		/*  */

		#recipient-submit-area{
			margin-top: 50px;
			padding-top: 50px;
			border-top: 3px solid #6667AB;
		}

		#recipient-submit-area > form{
			display: grid;
			grid-template-columns: 2fr 1.5fr 7fr;
			grid-template-rows: repeat(4, 1fr);
		}

		.submit-select{
			grid-column: span 2;
		}

		.submit-select > input{
			width: 80%;
			margin: 10px;
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
			<div id="recipient-search-area">

				<ul>
				
				
					<h2>운영기획부</h2>
						
					<ul class="search-header">
						<li><a href="" style="text-decoration : none; color:#6667AB" class="search-content">행정팀</a></li>
						<li><a href="" style="text-decoration : none; color:#6667AB" class="search-content">총무팀</a></li>
						<li><a href="" style="text-decoration : none; color:#6667AB" class="search-content">시설지원팀</a></li>
					</ul>
					
					
					
					<h2>교육훈련부</h2>
					<ul class="search-header">
						<li><a href="" style="text-decoration : none; color:#6667AB" class="search-content">교육1팀</a></li>
						<li><a href="" style="text-decoration : none; color:#6667AB" class="search-content">교육2팀</a></li>
						<li><a href="" style="text-decoration : none; color:#6667AB" class="search-content">교재지원팀</a></li>
					</ul>
					
					
			

					<h2>취업지원부</h2>
					<ul class="search-header">
						<li><a href="" style="text-decoration : none; color:#6667AB" class="search-content">취업팀</a></li>
						<li><a href="" style="text-decoration : none; color:#6667AB" class="search-content">상담팀</a></li>
					</ul>



					<h2>교육훈련부</h2>
					<ul class="search-header">
						<li><a href="" style="text-decoration : none; color:#6667AB" class="search-content">홍보팀</a></li>
						<li><a href="" style="text-decoration : none; color:#6667AB" class="search-content">대외협력팀</a></li>
					</ul>



				</ul>
			</div>

			<!--  -->
			<!--  -->
			<div id="recipient-select-area">

				<div class="select-header"> <input type="checkbox"> </div>
				<div class="select-header">성명</div>
				<div class="select-header">직책</div>
				<div class="select-header">부서</div>	

				<!-- 해당 부서 인원 수 만큼 반복 -->
				
				<c:forEach items="${deptMemberList}" var="deptMember">
				
					<div class="dept-result-area" >
						<div class="select-content"> <input type="checkbox" class="result-checkBox"> </div>
						<div class="select-content" style="display:none;"><span class="choice-receiveNo">${deptMember.get("MSG_NO")}</span> </div>
						<div class="select-content"><span class="choice-receiveName">${deptMember.get("NAME")}</span></div>
						<div class="select-content"><span>${deptMember.get("POSITION")}</span></div>
						<div class="select-content"><span>${deptMember.get("DEPT")} / ${deptMember.get("PART")}</span></div>	
					</div>
				
				</c:forEach>
				


			</div>

			

			<!--  -->
			<div id="recipient-submit-area" style="grid-column: span 2;">
				<form id="form-take-area" action="/md/messenger/fileSend" method="post">

					<div style="grid-row: span 2;"><img src="${root}/resources/upload/messenger/${fileName}" alt="${originName}" width="95%" height="95%"></div>
					<div style="display:none;"><input type="text" name="receiveNo" id="receive-no"></div>
					<div class="submit-select"><h2><span  class="badge bg-secondary"> 받는이 </span></h2><input type="text" name="receiveName" id="receive-name" readonly placeholder="선택해주세요"></div>
					<div class="submit-select" ><h2><span class="badge bg-secondary" >제목</span></h2><input  type="text" name="title" id=""></div>
					<div><input type="hidden" name="fileName" value="${fileName}"><input type="hidden" name="originName" value="${originName}"></div>
					<div class="submit-select" ><h2><span class="badge bg-secondary" >내용</span></h2><input  type="text" name="content" id=""></div>
					<div style="text-align: right; padding-right: 20%; grid-column: span 3;">
						<input type="submit" name="" value="확인" class="btn btn-outline-info btn-lg text-dark">
						<input type="button" name="" value="취소" class="btn btn-outline-light btn-lg text-dark">
					</div>
				</form>	
			</div>

        </main>

		<div style="display: none;" id="originName">${originName}</div>
		<div style="display: none;" id="fileName">${fileName}</div>

    </div>

	<script>

		const searchContent = document.querySelectorAll(".search-content");

		const deptResult = document.querySelectorAll(".dept-result");
		const originName = document.querySelector("#originName").innerText;
		const fileName = document.querySelector("#fileName").innerText;

		for(let i=0; i<searchContent.length; ++i){
			
			searchContent[i].addEventListener('click',function(){
				searchContent[i].href = "/md/messenger/fileDeptMember/"+ originName + "/" + fileName + "/" + searchContent[i].innerText
			});
		}


	</script>


	<script>

		const choiceMember = document.querySelectorAll(".dept-result-area");
		const choiceCheckBox = document.querySelectorAll(".result-checkBox");
		const choiceReceiveNo = document.querySelectorAll(".choice-receiveNo");
		const choiceReceiveName = document.querySelectorAll(".choice-receiveName");


		const receiveNo = document.querySelector("#receive-no");
		const receiveName = document.querySelector("#receive-name");

		// 
		const formTakeArea = document.querySelector("#form-take-area");

		for(let i=0; i<choiceMember.length; ++i){

			choiceMember[i].addEventListener('click',function(){
				
				choiceCheckBox[i].checked = true;

				receiveNo.value = choiceReceiveNo[i].innerText;
				receiveName.value = choiceReceiveName[i].innerText;

			});

		}



	</script>




</html>