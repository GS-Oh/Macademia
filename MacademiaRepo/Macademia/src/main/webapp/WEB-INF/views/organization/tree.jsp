<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html>
<head>
	<title>myPage</title>


	<%@include file="/resources/css/common/common.css" %>
	
</head>
<body>
	
	<div id="wrap">
		<header>
			<%@include file="/WEB-INF/views/common/header.jsp" %>
		</header>
		<aside>
			<%@include file="/WEB-INF/views/organization/tree-sidemenu.jsp" %>
		</aside>
		<main>
			<%@include file="/WEB-INF/views/organization/tree-content.jsp" %>
		</main>
	</div>


</body>
</html>
