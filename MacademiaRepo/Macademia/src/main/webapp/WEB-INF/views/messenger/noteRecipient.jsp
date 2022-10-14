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
		
	

		#recipient-search-area{
			overflow-y: scroll;
		}

		#recipient-search-area > ul > h5{
			margin-top: 20px;
			font-size: 1.3rem;
			font-weight: 900;
			text-align: left;
			color: #1315a6;
			margin-top: 50px;
		}

		.search-header{
			margin-top: 20px;
		}

		.search-header > li{
			margin-top: 20px;
		}


		#recipient-select-area{
			display: grid;
			grid-template-columns: 0.5fr 1fr 1fr 1fr;
			grid-template-rows: repeat(11, 1fr);
			align-items: center;
			justify-items: center;
		}

		.select-header{
			background-color: #6667AB;
			width: 90%;
			color: white;
			text-align: center;
		}

		.select-content{
			width: 90%;
			text-align: center;
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
			<div id="recipient-search-area">

				<ul>
					<h5>개발부(대분류)</h5>
					<ul class="search-header">
						<li>프론트(중분류)
							<ul>
								<li>html(소부서)</li>
								<li>html(소부서)</li>
								<li>html(소부서)</li>
								<li>html(소부서)</li>
							</ul>
						</li>
						<li>프론트(중분류)
							<ul>
								<li>html(소부서)</li>
							</ul>
						</li><li>프론트(중분류)
							<ul>
								<li>html(소부서)</li>
							</ul>
						</li><li>프론트(중분류)
							<ul>
								<li>html(소부서)</li>
							</ul>
						</li>
					</ul>
			
					<h5>개발부(대분류)</h5>
					<ul class="search-header">
						<li>프론트(중분류)
							<ul>
								<li>html(소부서)</li>
							</ul>
						</li>
					</ul>



				</ul>
			</div>

			<!--  -->
			<div id="recipient-select-area">

				<div class="select-header"> <input type="checkbox"> </div>
				<div class="select-header">성명</div>
				<div class="select-header">직책</div>
				<div class="select-header">부서</div>	

				<div class="select-content"> <input type="checkbox"> </div>
				<div class="select-content">성명</div>
				<div class="select-content">직책</div>
				<div class="select-content">부서</div>	

			</div>
			<!--  -->
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