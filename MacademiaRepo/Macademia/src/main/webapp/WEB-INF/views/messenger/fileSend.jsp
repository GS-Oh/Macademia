<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>


	<%@ include file="/resources/css/common/common.css" %>
	<style>
	
	    <%@ include file="/resources/css/messenger/commonAside.css" %>







    </style>
</head>
<body>
	<h1>${fileName}</h1>
	<h1>${originName}</h1>

    <div id="wrap">

		<header>
			<%@include file="/WEB-INF/views/common/header.jsp" %>
        </header>
		<aside>		
			<%@ include file="/WEB-INF/views/messenger/commonAside.jsp" %>
		</aside>        

        <main>
            
	
        </main>


    </div>

</html>