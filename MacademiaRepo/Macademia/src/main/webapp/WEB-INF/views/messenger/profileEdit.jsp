<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
	<style>
	
	    <%@ include file="/resources/css/messenger/commonHeaderAside.css" %>


		main{
			display: grid;
			grid-template-rows: 10% 40% 20%;
		}

		#profile-main-content{
			display: grid;
			grid-template-columns: 1.5fr 1.5fr 1fr;
			grid-template-rows: 1fr 1fr 1fr;
			border: 3px solid #1315a6;
			border-radius: 15px;
			align-items: center;
			text-align: center;
		}

		#main-content-img-wrap{
			grid-row: span 3;
			height: 100%;
			padding:10px 20px;
			border: 1px solid black;
		}

		
		#profile-main-content>div>button{
			width: 80%;
		}


		#profile-bottom-content{
			display: grid;
			grid-template-rows: repeat(3, 1fr);
			align-items: center;
			padding-left: 50px;
		}

    </style>
</head>
<body>

	<%@ include file="/WEB-INF/views/common/header.jsp" %>

    <div id="wrap">

		<%@ include file="/WEB-INF/views/messenger/commonHeaderAside.jsp" %>
        

        <main>
            
			
			
        </main>


    </div>

</html>