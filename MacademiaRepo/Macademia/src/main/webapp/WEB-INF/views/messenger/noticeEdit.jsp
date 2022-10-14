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
			grid-template-rows: 5% 20% 70% ;
			border-radius : 10px;
			width : 90%;
			margin: 5%;
		}


		#detail-header{
			display: grid;
			grid-template-columns: 6% 74% 10% 10%;
			align-items: center;
		}

		#detail-content > a{
			text-decoration: none;
			float: right;
			margin-right: 20px;
		}

		#detail-content > textarea{
			border: 3px solid lightseagreen;
			width: 100%;
			height: 90%;
		}


		
    </style>
</head>
<body>

	<%@ include file="/WEB-INF/views/common/header.jsp" %>


    <div id="wrap">

		<%@ include file="/WEB-INF/views/messenger/commonHeaderAside.jsp" %>
        

        <main>

			<div><h6>공지글 수정하기</h6></div>

            <!--  -->
			<div id="detail-header">
				<div><span  class="badge bg-info" >공지</span></div>
				<div><h3><input type="text" style="width: 100%; height: 100%;" value="[스팸대전 그후] 그 많던 스팸은 어디로 갔을까요?"></h3></div>
				<div>조회 수 : 3</div>
				<div>댓글 수 : 3</div>
			</div>

			<!--  -->
			<div id="detail-content">

				<textarea name="" id="" cols="30" rows="10"></textarea>

				<a href="/md/messenger/notice/edit" class="badge bg-warning">삭제하기</a>
				<a href="" class="badge bg-success">수정하기</a>
			</div>
			


			
			

        </main>


    </div>

</html>