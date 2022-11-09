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
			font-size: 1.8rem;

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
					<img src="${root}/resources/upload/messenger/${msgVo.fileName}" alt="" width="100%" height="100%" style="border:1px solid black">
				</div>
				<div style="border-bottom:3px solid #1315a6; width:60%; margin-left:20%; padding-bottom:30px;">${msgVo.name}</div>
				<div></div>
				<div style="grid-row: span 2;"><textarea rows="5" cols="40" readonly style="border:none; text-align:center;">${msgVo.introduce}</textarea></div>
				<div><a class="btn btn-primary" href="/md/messenger/profile/edit" style="color: white; width: 30%;"><h4>편집</h4></a></div>
				<div></div>
			</div>

			<div id="profile-bottom-content">
				<div class="badge bg-secondary"><h3>${msgVo.dept} / ${msgVo.part} / ${msgVo.position}</h3></div>
				<div class="badge bg-secondary"><h3>${msgVo.address}</h3></div>
				<div class="badge bg-secondary"><h3>${msgVo.email}</h3></div>
			</div>
			
        </main>


    </div>

</html>