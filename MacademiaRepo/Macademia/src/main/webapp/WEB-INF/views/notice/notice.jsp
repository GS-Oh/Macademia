<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html>
<head>
	<title>공지사항</title>
	
	<%@include file="/resources/css/common/common.css" %>
	
</head>
<body>
	
	<div id="wrap">
		<header>
			<%@include file="/WEB-INF/views/common/header.jsp" %>
		</header>
		<aside>
			<%-- <%@include file="/WEB-INF/views/admin/admin-sidebar.jsp" %> --%>
			~어사이드~
		</aside>
		<main>
			<%@include file="/WEB-INF/views/notice/notice-content.jsp" %>
		</main>
	</div>

</body>
</html>