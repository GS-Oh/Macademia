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
			grid-template-rows: 0.5fr 8fr 0.5fr;
		}

		#fileBox-header{
			display: grid;
			grid-template-columns: 1fr 1fr 1fr repeat(4, 1fr);
		}
	
		#fileBox-content > div{
			display: grid;
			grid-template-columns: repeat(3, 1fr);
			grid-template-rows: repeat(3, 1fr);
			height: 100%;
			border: 1px solid pink;
		}

		.fileBox-tumb{
			display: grid;
			grid-template-rows: 70% 15% 15%;
			border: 1px solid black;
		}


    </style>
</head>
<body>
	<%@ include file="/WEB-INF/views/common/header.jsp" %>


	
    <div id="wrap">

		<%@ include file="/WEB-INF/views/messenger/commonHeaderAside.jsp" %>
        

        <main>
            
			<div id="fileBox-header">
				<button>전체</button>
				<button>이미지</button>
				<button>기타</button>
			</div>
			
			<div id="fileBox-content">
				<div>
					<div class="fileBox-tumb">
						<div> <img src="" alt="" width="100%" height="100%"> </div>
						<div> <h4>originName</h4> </div>
						<div> <h4>2022-10-03</h4> </div>
					</div>
					
					

				</div>
			</div>


        </main>


    </div>

</html>