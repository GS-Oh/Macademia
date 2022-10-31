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
			grid-template-columns: 100px 1fr 3fr 1fr 1.5fr 1fr;
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
            
            display:grid;
            grid-template-columns : 10% 80% 10%;
			
            justify-items : center;
 			align-items: center;
        }

		#page-area > div > a{
			text-decoration: none;
			background-color:#6667AB;
			border-radius: 5px;
			color: white;

			font-size : 1.8rem;
			text-align: center;
			
			padding : 5px;

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
				<div class="list-header">글 번호</div>
				<div class="list-header" style="grid-column: span 2;">제목</div>
				<div class="list-header">작성자</div>
				<div class="list-header">작성일</div>
				<div class="list-header">조회수</div>

				<!-- 글 수 만큼 반복 -->
				
				<c:forEach items="${noticeVoList}" var="noticeVoList">
				
					<div class="list-content">${noticeVoList.noticeNo}</div>
					<div class="list-content"><span  class="badge bg-info" >공지</span></div>
					<div class="list-content" style="text-align: left; "><a href="${root}/messenger/notice/detail/${noticeVoList.noticeNo}">${noticeVoList.title}</a></div>
					<div class="list-content">${noticeVoList.name}</div>
					<div class="list-content">${noticeVoList.enrollDate}</div>
					<div class="list-content">${noticeVoList.count}</div>
				
				</c:forEach>



			</div>	
			
			
			<div id="page-area" >
				
				<div>
					<c:if test="${pvo.startPage ne 1}">
						<a href="/md/messenger/notice/${pvo.startPage-1}"><</a>
					</c:if>
				</div>
				
				<div>
					<c:forEach begin="${pvo.startPage}" end="${pvo.endPage}" var="i">
						<a href="/md/messenger/notice/${i}">${i}</a>
					</c:forEach>
				</div>
				
				<div>
					<c:if test="${pvo.endPage ne pvo.maxPage}">
						<a href="/md/messenger/notice/${pvo.endPage+1}">></a>
					</c:if>				
				</div>
			</div>


			<div style="text-align: right;">
				<a class="btn btn-primary btn-lg" href="/md/messenger/notice/write">글 작성</a>
			</div>
	

        </main>
		

    </div>

</html>