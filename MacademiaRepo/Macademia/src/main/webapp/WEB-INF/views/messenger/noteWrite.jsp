<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
	<style>
	    <%@ include file="/resources/css/messenger/commonHeaderAside.css" %>

		main > form{
			height: 100%;
			display: grid;
			grid-template-columns: 1.5fr 7.5fr;
			grid-template-rows: 1fr 1fr 1fr 2fr 2fr;
		}
	
		#attemp-area-wrap{
			display: grid;
			grid-template-columns: repeat(4, 1fr);
			height: 70%;
		}

		.attemp-area{
			display: grid;
			grid-template-rows: 8fr 2fr;
		}

    </style>
</head>
<body>

	<%@ include file="/WEB-INF/views/common/header.jsp" %>


    <div id="wrap">

		<%@ include file="/WEB-INF/views/messenger/commonHeaderAside.jsp" %>
       

        <main>
            <form action="">
				
				<div> 받는 사람</div>
				<div >
					<input type="text">
					<a href="/md/messenger/note/recipient"> 검색하기 </a>
				</div>

				<div>참조인</div>
				<div>
					<input type="text">
					<button onclick=""></button>
				</div>

				<div>제목</div>
				<div>6</div>

				<div>내용</div>
				<div>8</div>

				<div>첨부하기</div>
				<div id="attemp-area-wrap">

					<div class="attemp-area">
						<div id="profile-tumb">
							<img id="profile-img-thumb" src="" width="100%" height="100%">
						</div>
						<div><input type="file" name="profile" value="이미지첨부하기"></div>
					</div>

					<div class="attemp-area">
						<div id="profile-tumb">
							<img id="profile-img-thumb" src="" width="100%" height="100%">
						</div>
						<div><input type="file" name="profile" value="이미지첨부하기"></div>
					</div>
					
					<div>1</div>
					<div>2</div>
				</div>
				
				<div></div>

				<div>
					<input type="submit" value="전송">
					<button onclick="">닫기</button>
				</div>

			</form>
        </main>


    </div>

</html>