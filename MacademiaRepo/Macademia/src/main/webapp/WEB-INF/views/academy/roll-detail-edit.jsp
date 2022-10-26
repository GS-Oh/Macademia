<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html>
<head>
	<title>Home</title>
	
	<%@include file="/resources/css/common/common.css" %>
	<style>
		main{
			width: 80vw;
		}
	</style>
	
</head>
<body>
	
	<div id="wrap">
		<header>
			<%@include file="/WEB-INF/views/common/header.jsp" %>
		</header>
		<aside>
			<%@include file="/WEB-INF/views/academy/academy-sidebar.jsp" %>
		</aside>
		<main>
			<%@include file="/WEB-INF/views/academy/roll-detail-edit-content.jsp" %>
		</main>
		<!-- <aside></aside> -->
	</div>

</body>
</html>
