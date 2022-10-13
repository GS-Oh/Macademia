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
			display: grid;
			grid-template-columns: 1.5fr 1fr;
			margin: 5px;
			justify-items: center;
			text-align: center;
			border: 2px solid lightblue;
			border-radius: 10px;
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

    </style>
</head>
<body>
	<%@ include file="/WEB-INF/views/common/header.jsp" %>

    <div id="wrap">

		<%@ include file="/WEB-INF/views/messenger/commonHeaderAside.jsp" %>
        

        <main>
            
			<!-- 부서 수 만큼 div 추가하기 (5개라고 생각하고 작성)-->
			<div class="main-partition"><h2>개발부</h2><h5 style="color: gray;">(3명)</h5></div>

			<!-- 얘로 감싸고 -->
			<div class="main-content-wrap">


				<!-- 직원 수 만큼 얘 반복 -->
				<div class="messenger-main-content">
					<div style="height: 100%;">
						<img alt="프로필사진" src=""  style="border: 1px solid black; height: 100%;">
					</div>
					<div class="content-detail">
						<div id="detail-name">직원명</div>
						<div>부서명</div>
						<div>직책</div>
					</div>
				</div>

			

			</div>

			<!--  -->
			<div class="main-partition"><h2>영업부( 3명 )</h2></div>
			<div class="main-content-wrap">

				<div class="messenger-main-content">
					<div>
						<img alt="프로필사진" src="">
					</div>
					<div style="display: grid; grid-template-rows: 1fr 1fr 1fr;">
						<div>직원명</div>
						<div>부서명</div>
						<div>직책</div>
					</div>
				</div>

				<div class="messenger-main-content">
					<div>
						<img alt="프로필사진" src="">
					</div>
					<div style="display: grid; grid-template-rows: 1fr 1fr 1fr;">
						<div>직원명</div>
						<div>부서명</div>
						<div>직책</div>
					</div>
				</div><div class="messenger-main-content">
					<div>
						<img alt="프로필사진" src="">
					</div>
					<div style="display: grid; grid-template-rows: 1fr 1fr 1fr;">
						<div>직원명</div>
						<div>부서명</div>
						<div>직책</div>
					</div>
				</div><div class="messenger-main-content">
					<div>
						<img alt="프로필사진" src="">
					</div>
					<div style="display: grid; grid-template-rows: 1fr 1fr 1fr;">
						<div>직원명</div>
						<div>부서명</div>
						<div>직책</div>
					</div>
				</div>

			</div>
			<div class="main-partition"><h2>개발부( 3명 )</h2></div>
			<div class="main-content-wrap">

				<div class="messenger-main-content">
					<div>
						<img alt="프로필사진" src="">
					</div>
					<div style="display: grid; grid-template-rows: 1fr 1fr 1fr;">
						<div>직원명</div>
						<div>부서명</div>
						<div>직책</div>
					</div>
				</div>

				<div class="messenger-main-content">
					<div>
						<img alt="프로필사진" src="">
					</div>
					<div style="display: grid; grid-template-rows: 1fr 1fr 1fr;">
						<div>직원명</div>
						<div>부서명</div>
						<div>직책</div>
					</div>
				</div><div class="messenger-main-content">
					<div>
						<img alt="프로필사진" src="">
					</div>
					<div style="display: grid; grid-template-rows: 1fr 1fr 1fr;">
						<div>직원명</div>
						<div>부서명</div>
						<div>직책</div>
					</div>
				</div><div class="messenger-main-content">
					<div>
						<img alt="프로필사진" src="">
					</div>
					<div style="display: grid; grid-template-rows: 1fr 1fr 1fr;">
						<div>직원명</div>
						<div>부서명</div>
						<div>직책</div>
					</div>
				</div>

			</div>
			<div><h2>개발부( 3명 )</h2></div>
			<div class="main-content-wrap">

				<div class="messenger-main-content">
					<div>
						<img alt="프로필사진" src="">
					</div>
					<div style="display: grid; grid-template-rows: 1fr 1fr 1fr;">
						<div>직원명</div>
						<div>부서명</div>
						<div>직책</div>
					</div>
				</div>

				<div class="messenger-main-content">
					<div>
						<img alt="프로필사진" src="">
					</div>
					<div style="display: grid; grid-template-rows: 1fr 1fr 1fr;">
						<div>직원명</div>
						<div>부서명</div>
						<div>직책</div>
					</div>
				</div><div class="messenger-main-content">
					<div>
						<img alt="프로필사진" src="">
					</div>
					<div style="display: grid; grid-template-rows: 1fr 1fr 1fr;">
						<div>직원명</div>
						<div>부서명</div>
						<div>직책</div>
					</div>
				</div><div class="messenger-main-content">
					<div>
						<img alt="프로필사진" src="">
					</div>
					<div style="display: grid; grid-template-rows: 1fr 1fr 1fr;">
						<div>직원명</div>
						<div>부서명</div>
						<div>직책</div>
					</div>
				</div>

			</div>

        </main>


    </div>

</html>