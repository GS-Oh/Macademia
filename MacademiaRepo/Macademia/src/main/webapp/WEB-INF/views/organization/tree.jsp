<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html>
<head>
	<title>myPage</title>
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jstree/3.2.1/themes/default/style.min.css" />

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
			<!-- <%@include file="/WEB-INF/views/home-content.jsp" %> -->
		</main>
	</div>


</body>
</html>
