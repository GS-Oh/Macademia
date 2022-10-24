<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html>
<head>
	<title>메일읽기</title>
	<%@include file="/resources/css/common/common.css" %>
		<%@include file="/resources/css/mail/mail.css" %>
</head>
<body>
	
	<div id="wrap">
		<header>
			<%@include file="/WEB-INF/views/common/header.jsp" %>
		</header>
		<aside>
			<%@include file="/WEB-INF/views/mail/mail-sidebar.jsp" %>
		</aside>
		<main>	
			<%@include file="/WEB-INF/views/mail/detail-content.jsp" %>
		</main>
	</div>

</body>
</html>







