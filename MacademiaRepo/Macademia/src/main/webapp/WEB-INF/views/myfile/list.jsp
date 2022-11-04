<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html>
<head>
	<title>memberEdit</title>
	
	<%@include file="/resources/css/common/common.css" %>

	<style>

		#sidemenu{
			height: 80vh;
			position: fixed;
			top:10vh;
			right: 0;
		}
	</style>
	
</head>
<body>
	
	<div id="wrap">
		<header>
			<%@include file="/WEB-INF/views/common/header.jsp" %>
		</header>
		<aside>
		</aside>
		<main>
			<%@include file="/WEB-INF/views/myfile/list-content.jsp" %>
		</main>
		<div id="sidemenu">
			<%@include file="/WEB-INF/views/member/mypage-sidemenu.jsp" %>
		</div>
	</div>

</body>
</html>
