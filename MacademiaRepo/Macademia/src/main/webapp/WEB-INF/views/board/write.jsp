<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html>
<head>
	<title>게시판</title>
	<%@include file="/resources/css/common/common.css" %>
	<%@include file="/resources/css/board/board.css" %>
	
</head>
<body>
	<div id="wrap">
		<header>
			<%@include file="/WEB-INF/views/common/header.jsp" %>
		</header>
		<aside>
			<%@include file="/WEB-INF/views/board/board-sidebar.jsp" %>
		</aside>
		<main>
			<%@include file="/WEB-INF/views/board/write-content.jsp" %>
		</main>
	</div>
</html>
