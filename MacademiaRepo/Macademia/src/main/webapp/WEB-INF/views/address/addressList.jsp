<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html>
<head>
	<title>주소록</title>
	
	<%@include file="/resources/css/common/common.css" %>
	<link href="${root}/admin/resources/assets/vendor/datatables/css/jquery.dataTables.min.css" rel="stylesheet">

	<style>
	 #wrap{
	 	main {
	    width: 80vw;
	    height: 80vh;
	    position: relative;
	    top: 10vh;
	    left: 20vw;
	 }
	</style>	
</head>
<body>
	
	<div id="wrap">
		<header>
			<%@include file="/WEB-INF/views/common/header.jsp" %>
		</header>
		<aside>
			<%@include file="/WEB-INF/views/admin/admin-sidebar.jsp" %> 
		</aside>
		<main>
			<%@include file="/WEB-INF/views/address/addressList-content.jsp" %>
		</main>

	</div>

</body>
</html>