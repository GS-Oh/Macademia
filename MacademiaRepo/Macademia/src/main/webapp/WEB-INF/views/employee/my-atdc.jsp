<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html>
<head>
	<title>Home</title>
	
	<%@include file="/resources/css/common/common.css" %>
	
	<style>
		#right-side{
        width: 20vw;
        height: 80vh;
        position: fixed;
		right: 0vw;
        top:10vh;
    }
	
	</style>
</head>
<body>
	
	<div id="wrap">
		<header>
			<%@include file="/WEB-INF/views/common/header.jsp" %>
		</header>
		<aside>
			<%@include file="/WEB-INF/views/employee/atdc-sidebar.jsp" %>
		</aside>
		<main>
			<%@include file="/WEB-INF/views/employee/my-atdc-content.jsp" %>
		</main>
		<div id="right-side">
			
		</div>
	</div>

</body>
</html>