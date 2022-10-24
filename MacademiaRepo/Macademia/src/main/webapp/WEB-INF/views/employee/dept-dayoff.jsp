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
		<aside>
			<%@include file="/WEB-INF/views/employee/atdc-sidebar.jsp" %>
		</aside>
		<main>
			<%@include file="/WEB-INF/views/employee/dept-dayoff-content.jsp" %>
		</main>
		
	</div>

</body>
</html>