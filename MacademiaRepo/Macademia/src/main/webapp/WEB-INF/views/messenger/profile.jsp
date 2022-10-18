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
			grid-template-rows: 10% 40% auto;
		}

		#profile-title > h1{
			border-left: 5px solid #1315a6;
			padding-left: 15px;
		}

		#profile-main-content{
			display: grid;
			grid-template-columns: 1fr 1.5fr 1fr;
			grid-template-rows: 1fr 1fr 1fr;
			border: 3px solid #1315a6;
			border-radius: 15px;
			align-items: center;
			text-align: center;
		}

		#main-content-img-wrap{
			grid-row: span 3;
			width: 100%;
			height: 100%;
			padding:10px 20px;
			border: 1px solid black;
		}

		
		#profile-main-content>div>button{
			width: 80%;
		}


		#profile-bottom-content{
			margin-top: 50px;
			display: grid;
			grid-template-rows: repeat(7, 1fr);
			align-items: center;
			
			width: 100%;
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
            
			<div id="profile-title" style="margin-top: 30px;"><h1>기본프로필 관리</h1></div>

			<div id="profile-main-content">
				<div id="main-content-img-wrap" >
					<img src="" alt="" width="100%" height="90%" style="border:1px solid black">
					<span style="height: 10%;">파일명</span>
				</div>
				<div>직원명</div>
				<div>3-공백</div>
				<div style="grid-row: span 2;">자기소개글</div>
				<div><a class="btn btn-primary" href="/md/messenger/profile/edit" style="color: white;">편집</a></div>
				<div>6-공백</div>
			</div>

			<div id="profile-bottom-content">
				<div class="badge bg-secondary"><h5>부서명-직책</h5></div>
				<div class="badge bg-secondary"><h5>주소</h5></div>
				<div class="badge bg-secondary"><h5>이메일주소</h5></div>
			</div>
			
        </main>


    </div>

</html>