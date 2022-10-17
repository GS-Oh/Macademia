<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
	<style>

		<%@ include file="/resources/css/messenger/commonHeaderAside.css" %>
	
		.main-partition{
			padding-top : 30px;
			border-top: 3px dashed black;
			margin-bottom : 20px;
			display: flex;
			text-align : bottom;
		}


		.main-content-wrap{
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
			
			border: 3px solid #1315a6;
			border-radius: 15px;
			align-items: center;
		}

		#main-content-img-wrap{
			grid-row: span 3;
			height: 100%;
			padding:20px;
		}


    </style>
</head>

	<header>
			<%@include file="/WEB-INF/views/common/header.jsp" %>
	</header>
<body>


	
    <div id="wrap">

		
		<%@ include file="/WEB-INF/views/messenger/commonHeaderAside.jsp" %>
        
		
        <main>
            
			<!-- 부서1 -- 부서 수 만큼 div 추가하기 (5개라고 생각하고 작성)-->
			<div class="main-partition"><h2>개발부</h2><h5 style="color: gray;">(3명)</h5></div>

			<!-- 얘로 감싸고 -->
			<div class="main-content-wrap">


				<!-- 직원 수 만큼 얘 반복 -->
				<div class="messenger-main-content">
					<div style="height: 150px; ">
						<a data-bs-toggle="modal" data-bs-target="#myModal" href="" ><img alt="프로필사진" src=""  height="100%" style="border: 1px solid black;"></a>
					</div>
					<div class="content-detail">
						<div id="detail-name">직원명</div>
						<div>부서명</div>
						<div>직책</div>
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
			<h4 class="modal-title">직원명</h4>
			<button type="button" class="btn-close" data-bs-dismiss="modal"></button>
			</div>
	
			<!-- Modal body -->
			<div id="profile-main-content">
				<div id="main-content-img-wrap" >
					<img src="" alt="" width="150px" height="150px" style="border:1px solid black">
				</div>
				<div>부서명</div>
				<div style="grid-row: span 2;">자기소개글</div>
			</div>
	
			<!-- Modal footer -->
			<div class="modal-footer">
			</div>
	
		</div>
		</div>
	</div>




</html>