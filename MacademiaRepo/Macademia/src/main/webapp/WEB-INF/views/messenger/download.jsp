<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	#download-img-area {
		border : 1px solid black;
		width :500px; 
		height : 500px;
	}

</style>
</head>
<body>

	<h1>${fileName}</h1>

    <div id="download-img-area"><img src="${root}/messenger/upload/${fileName}" alt="" width="100%" height="100%"></div>

	<h2><a href="/md/messenger/imgFileBox/Enroll/${fileName}">파일보관함에 추가하기</a></h2>
	<h2><a download href="${root}/messenger/upload/${fileName}">내컴퓨터에 다운로드받기</a></h2>
</body>
</html>