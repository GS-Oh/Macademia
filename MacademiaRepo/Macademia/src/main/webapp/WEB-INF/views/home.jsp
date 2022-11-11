<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   
<html>
<head>
	<title>마카다미아 에 오신것을 환영합니다</title>
	<link rel="shortcut icon" href="${root}/resources/img/logo/favicon.ico"/>
	<%@include file="/resources/css/common/common.css" %>
	
</head>
<body>
	
	<div id="wrap">
		<header>
			<%@include file="/WEB-INF/views/common/header.jsp" %>
		</header>
		<aside></aside>
		<main>
			<%@include file="/WEB-INF/views/home-content.jsp" %>
		</main>
		<!-- <aside></aside> -->
	</div>

</body>
</html>
