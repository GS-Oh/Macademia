<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>


<!DOCTYPE html>
<html>
<head>
<!-- 스위트 알랏 -->
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>

<!-- 부트스트랩 -->
<!-- Latest compiled and minified CSS -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/css/bootstrap.min.css" rel="stylesheet">

<!-- Latest compiled JavaScript -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/js/bootstrap.bundle.min.js"></script>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>

	html, body, a{
	    padding: 0px;
	    margin: 0px;
		display: inline-block;
		text-decoration: none;
		color: black;
	}
	
	#download-wrap{
		margin: 50px;
		width: 800px;
		height: 810px;
		text-align: center;

		border: 5px solid #6667AB;
	}

	#download-img-area {
		display: grid;
		
		justify-self: center;

		border : 1px solid black;
		width : 500px; 
		height : 500px;
	}

	.card-header {
		background-color: #6667AB;
		color: white;
	}

	.card-body{
		margin-left: 130px;
	}

</style>
</head>
<body>

	<c:if test="${checkDownload eq 1}">
		<script>
			swal({
			title: "파일저장완료!",
			text: "Click button to close the window.",
			icon: "success",
			button: "쪽지함으로 돌아가기",
			})
			.then((willDelete) => {
			if (willDelete) {
				window.close();
			} 
			});
		</script>
		
	</c:if>
	
	
	
<div id="download-wrap">
	<div class="card">
		<div class="card-header"><h1>파일 다운로드 받기</h1></div>
		
		
		<c:if test="${checkFileDot eq 'jpg' || dot eq '.jpg' || dot eq '.png'}">
			<div class="card-body"><div id="download-img-area"><img id="dot-image-area" src="/md/resources/upload/messenger/${fileName}" alt="" width="100%" height="100%"></div></div>
		</c:if>
		
		
		<c:if test="${checkFileDot eq 'etc'|| ( not empty dot && (dot ne '.jpg' || dot ne '.png')) }">
			<div class="card-body"><div id="download-img-area"><img src="/md/resources/upload/messenger/download.jpg" alt="" width="100%" height="100%"></div></div>
		</c:if>
		
		
		<div><h5>${originName}</h5></div>	
		<div class="card-footer"></div>
		<div class="card-footer"><h4><a href="/md/messenger/allFileBox/Enroll/${fileName}/${originName}">파일보관함에 추가하기</a></h4></div>
		<div class="card-footer"></div>
		<div class="card-footer"><h4><a download href="/md/resources/upload/messenger/${fileName}">내컴퓨터에 다운로드받기</a></h4></div>
		<div class="card-footer"></div>
	</div>
</div>
	
	
	

	
</body>
</html>