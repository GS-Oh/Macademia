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
	

	
		.main-partition{
			padding-top : 30px;
			border-top: 3px dashed black;
			margin-bottom : 20px;
			display: flex;
			text-align : bottom;
		}


		.main-content-wrap{
			width: 80%;
			height: 10%;
			display: flex;
			flex-wrap: wrap;
			height: auto;
		}

	

		.messenger-main-content{
			height: 150px;
			width: 30%;
			margin: 10px;
			margin-bottom: 3%;

			display: grid;
			grid-template-columns: 1.5fr 1fr;
			justify-items: center;

			border: 2px solid lightblue;
			border-radius: 10px;
			text-align: center;
		}
	
		.content-detail{
			display: grid;
			grid-template-rows: 1fr 1fr 1fr;
			align-items: center;
		}

		#detail-name{
			font-weight: 900;
			font-size: large;
		}

		/* 모달 */

	
		
		#profile-main-content{
			display: grid;
			grid-template-columns: 30% 70%;
			grid-template-rows: 20% 80%;
			
			border: 3px solid #6667AB;
			border-radius: 15px;
			align-items: center;
		}

		.modal-header > h1{
			border-left: 5px solid #6667AB;
			padding-left:15px;
		}

		#main-content-img-wrap{
			grid-row: span 3;
			height: 100%;
			padding:20px;
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
            
			<!-- 부서1 -- 부서 수 만큼 div 추가하기 (5개라고 생각하고 작성)-->
			<div class="main-partition"><h2>개발부</h2><h5 style="color: gray;">(3명)</h5></div>

			<!-- 부서1- 직원 -- 얘로 감싸고 -->
			<div class="main-content-wrap">
				<!-- 직원 수 만큼 얘 반복 -->
				<div class="messenger-main-content">
					<div style="height: 100%; width: 100%; " >
						<a data-bs-toggle="modal" data-bs-target="#myModal" href="" ><img alt="" src="${root}/resources/upload/messenger/${msgVo.fileName}"  width="90%" height="100%" style="border: 1px solid black;"></a>
					</div>
					<div class="content-detail">
						<div id="detail-name">${msgVo.name}</div>
						<div>${msgVo.dept}</div>
						<div>${msgVo.position}</div>
					</div>
				</div>
			</div>











        </main>


    </div>


	
	<!-- The Modal -->
	<div class="modal" id="myModal">
		<div class="modal-dialog modal-dialog-centered modal-lg" >
		<div class="modal-content">
	
			<!-- Modal Header -->
			<div class="modal-header">
			<h1 class="modal-title">${msgVo.name}</h1>
			<button type="button" class="btn-close" data-bs-dismiss="modal"></button>
			</div>
	
			<!-- Modal body -->
			<div id="profile-main-content">
				<div id="main-content-img-wrap" >
					<img src="${root}/resources/upload/messenger/${msgVo.fileName}" alt="" width="150px" height="150px" style="border:1px solid black">
				</div>
				<div><h4>${msgVo.dept}</h4></div>
				<div style="grid-row: span 2;"><h4>${msgVo.introduce}</h4></div>
			</div>
	
			<!-- Modal footer -->
			<div class="modal-footer">
				<a href="/md/messenger/note/write?" class="btn btn-lg bg-secondary" style="color: white;">쪽지보내기</a>
			</div>
	
		</div>
		</div>
	</div>



</html>