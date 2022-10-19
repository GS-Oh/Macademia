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
			width:60vw;
			display: grid;
			grid-template-rows: 10% 70% 5% 5%;
		}


		#notice-header > h1{
			margin-top: 30px;
			padding-left: 15px;
			border-left: 5px solid #6667AB;
		}


		#notice-list{
			display: grid;
			grid-template-columns: 1fr 3fr 1fr 1.5fr 1fr;
			grid-template-rows: repeat(11, 1fr);
			row-gap: 10px;
			align-items: center;
			border: 3px solid #6667AB;
			border-radius: 10px;

			
		}

		.list-header{
			height: 60%;
			text-align: center;
			background-color: #6667AB;
			color: white;
			font-weight: 800;
			border-right: 1px dashed white;

			display: grid;
			align-items: center;
		}

		.list-content{
			text-align: center;
			padding-bottom: 15px;
			border-bottom: 1px dashed #6667AB;
			font-size: 1.4rem;
		}

		.list-content > a{
			text-decoration: none;
			font-weight: 800;
			color: #1315a6 ;
		}

		#page-area{
            width: 30%;
            margin: 0 auto;
            display: flex;
            justify-content: space-evenly;
			align-items: center;
        }

		#page-area > a{
			text-decoration: none;
			background-color:#6667AB;
			border-radius: 5px;
			color: white;
			width: 30px;
			height: 30px;
			text-align: center;

			display: grid;
			align-items: center;
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
			<div id="notice-header"><h1> 메신저 공지글</h1></div>
            
			<div id="notice-list">
				<div class="list-header" style="grid-column: span 2;">제목</div>
				<div class="list-header">작성자</div>
				<div class="list-header">작성일</div>
				<div class="list-header">조회수</div>

				<!-- 글 수 만큼 반복 -->
				<div class="list-content"><span  class="badge bg-info" >공지</span></div>
				<div class="list-content" style="text-align: left; "><a href="/md/messenger/notice/detail">제목 누르면 상세페이지로 이동</a></div>
				<div class="list-content">3</div>
				<div class="list-content">4</div>
				<div class="list-content">5</div>

			



			</div>	
			
			<div id="page-area" >

				<a href=""><</a>
				<a href="">1</a>
				<a href="">2</a>
				<a href="">3</a>
				<a href="">4</a>
				<a href="">5</a>
				<a href="">></a>
			</div>


			<div style="text-align: right;">
				<a class="btn btn-primary btn-lg" href="/md/messenger/notice/write" >글 작성</a>
			</div>
	

        </main>
		

    </div>

</html>