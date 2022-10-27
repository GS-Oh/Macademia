<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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
	
	
	<h1>${originName}</h1>
    <div id="download-img-area"><img src="/md/resources/upload/messenger/${fileName}" alt="" width="100%" height="100%"></div>

	<h2><a href="/md/messenger/allFileBox/Enroll/${fileName}/${originName}">파일보관함에 추가하기</a></h2>
	<h2><a download href="/md/resources/upload/messenger/${fileName}">내컴퓨터에 다운로드받기</a></h2>
</body>
</html>