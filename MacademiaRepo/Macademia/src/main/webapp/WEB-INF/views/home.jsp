<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html>
<head>
	<title>Home</title>
	
	<%@include file="/resources/css/common/common.css" %>
	
</head>
<body>
	
	<div id="wrap">
		<header>
			<%@include file="/WEB-INF/views/common/header.jsp" %>
		</header>
		<aside>좌측</aside>
		<main>
			<%@include file="/WEB-INF/views/home-content.jsp" %>
		</main>
		<aside>우측</aside>
	</div>

</body>
</html>
