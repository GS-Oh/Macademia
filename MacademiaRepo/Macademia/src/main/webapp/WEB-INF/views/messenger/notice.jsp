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
			grid-template-rows: 10% 70% 5% 5%;
		}


		#notice-header > h1{
			padding-top: 15px;
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
			text-align: center;
			background-color: #6667AB;
			color: white;
			font-weight: 800;
			border-right: 1px dashed white;
		}

		.list-content{
			text-align: center;
			padding-bottom: 10px;
			border-bottom: 1px dashed #6667AB;
		}

		.list-content > a{
			text-decoration: none;
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
			width: 20px;
			text-align: center;
		}

    </style>
</head>
<body>

	<%@ include file="/WEB-INF/views/common/header.jsp" %>

    <div id="wrap">

		<%@ include file="/WEB-INF/views/messenger/commonHeaderAside.jsp" %>
        

        <main>
			<div id="notice-header"><h1>메신저 공지글</h1></div>
            
			<div id="notice-list">
				<div class="list-header" style="grid-column: span 2;">제목</div>
				<div class="list-header">작성자</div>
				<div class="list-header">작성일</div>
				<div class="list-header">조회수</div>

				<div class="list-content"><span  class="badge bg-info" >공지</span></div>
				<div class="list-content" style="text-align: left;"><a href="/md/messenger/notice/detail">제목누르면상세페이지로 이동</a></div>
				<div class="list-content">3</div>
				<div class="list-content">4</div>
				<div class="list-content">5</div>
			</div>	
			
			<div id="page-area" >
				<a href="">1</a>
				<a href="">2</a>
				<a href="">3</a>
				<a href="">4</a>
				<a href="">5</a>
			</div>


			<div style="text-align: right;">
				<a class="btn btn-primary" href="" >글 작성</a>
			</div>
	

        </main>
		

    </div>

</html>