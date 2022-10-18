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


		main{
			display: grid;
			grid-template-columns: 4fr 6fr;
			grid-template-rows: 7fr 3fr;
		}
		
	

		#recipient-search-area{
			overflow-y: scroll;
		}

		#recipient-search-area > ul > h5{
			margin-top: 30px;
			font-size: 1.3rem;
			font-weight: 900;
			text-align: left;
			color: #1315a6;
		}

		.search-header{
			margin: 30px 30px 50px 0px;
			padding-bottom: 50px;
			border-bottom: 1px dashed #1315a6;
		}
		

		.search-header > li{
			margin-top: 20px;
		}

		/*  */
		#recipient-select-area{
			display: grid;
			grid-template-columns: 0.5fr 1fr 1fr 1fr;
			grid-template-rows: repeat(11, 1fr);
			align-items: center;
			justify-items: center;

			margin-left: 10px;
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


		/*  */

		#recipient-submit-area{
			margin-top: 50px;
			padding-top: 50px;
			border-top: 3px solid #6667AB;
		}

		#recipient-submit-area > form{
			display: grid;
			grid-template-columns: 1.5fr 7fr;
			grid-template-rows: repeat(3, 1fr);
		}

		.submit-select{
			grid-column: span 2;
		}

		.submit-select > input{
			width: 80%;
			margin: 10px;
		}
		
    </style>
</head>
<body>



    <div id="wrap">

		<header>
			<%@include file="/WEB-INF/views/common/header.jsp" %>
        </header>
		<aside>		
			<%@ include file="/WEB-INF/views/messenger/commonAside.jsp" %>
		</aside>       

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
				<div class="select-content"><span> 성명</span></div>
				<div class="select-content"><span> 직책</span></div>
				<div class="select-content"><span> 부서</span></div>	

			</div>


			<!--  -->
			<div id="recipient-submit-area" style="grid-column: span 2;">
				<form action="">
					<div class="submit-select " ><span class="badge bg-secondary"> 받는이 : </span><input type="text" name="" ></div>
					<div class="submit-select" ><span class="badge bg-secondary"> 참조인 : </span><input  type="text" name="" ></div>
					<div></div>
					<div style="text-align: right; padding-right: 20%;">
						<input type="submit" name="" value="확인" class="btn btn-outline-light text-dark">
						<input type="button" name="" value="취소" class="btn btn-outline-light text-dark">
					</div>
				</form>	
			</div>

			

        </main>


    </div>

</html>