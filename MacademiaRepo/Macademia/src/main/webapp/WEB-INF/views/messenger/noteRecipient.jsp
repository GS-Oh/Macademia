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
			grid-template-columns: 3fr 7fr;
			grid-template-rows: 7fr 3fr;
		}
	
		#recipient-select-area{
			display: grid;
			grid-template-columns: 0.5fr 1fr 1fr 1fr;
			grid-template-rows: repeat(11, 1fr);
		}

		#recipient-submit-area > form{
			display: grid;
			grid-template-columns: 1.5fr 7fr;
			grid-template-rows: repeat(3, 1fr);
		}

		.submit-select{
			font-weight: 999;
			color: brown;
			grid-column: span 2;
		}

		.submit-select > input{
			width: 80%;
		}
		
    </style>
</head>
<body>

	<%@ include file="/WEB-INF/views/common/header.jsp" %>


    <div id="wrap">

		<%@ include file="/WEB-INF/views/messenger/commonHeaderAside.jsp" %>
       

        <main>
            
			<div>
				<!-- 대분류 -->
				<div>개발부</div>
				<div>영업부</div>
				<div>인사부</div>
				<div>재무부</div>
			</div>

			<div id="recipient-select-area">
				<div> <input type="checkbox"> </div>
				<div>성명</div>
				<div>직책</div>
				<div>부서</div>	

				<div> <input type="checkbox"> </div>
				<div>성명</div>
				<div>직책</div>
				<div>부서</div>	
				


			</div>

			<div id="recipient-submit-area" style="grid-column: span 2;">
				<form action="">
					<div class="submit-select" >받는이 : <input type="text" name="" ></div>
					<div class="submit-select" >참조인 : <input type="text" name="" ></div>
					<div></div>
					<div style="text-align: right; padding-right: 20%;">
						<input type="submit" name="" value="확인">
						<input type="button" name="" value="취소">
					</div>
				</form>	
			</div>

			

        </main>


    </div>

</html>