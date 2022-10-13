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
			grid-template-rows: 70% 10% 10%;
		}

		#notice-list{
			display: grid;
			grid-template-columns: 1fr 3fr 1fr 1.5fr 1fr;
			grid-template-rows: repeat(11, 1fr);
			row-gap: 10px;
		}
		
		#page-area{
            width: 30%;
            margin: 0 auto;
            display: flex;
            justify-content: space-evenly;
        }

    </style>
</head>
<body>

	<%@ include file="/WEB-INF/views/common/header.jsp" %>

    <div id="wrap">

		<%@ include file="/WEB-INF/views/messenger/commonHeaderAside.jsp" %>
        

        <main>
            
			<div id="notice-list">
				<div style="grid-column: span 2;">제목</div>
				<div>작성자</div>
				<div>작성일</div>
				<div>조회수</div>

				<div>공지</div>
				<div><a href="/md/messenger/notice/detail">제목누르면상세페이지로 이동</a></div>
				<div>3</div>
				<div>4</div>
				<div>5</div>
			</div>	
			
			<div id="page-area" >
				<a href="">1</a>
				<a href="">2</a>
				<a href="">3</a>
				<a href="">4</a>
				<a href="">5</a>
			</div>


			<div style="text-align: right;">
				<a href="">글 작성</a>
			</div>
	

        </main>
		

    </div>

</html>