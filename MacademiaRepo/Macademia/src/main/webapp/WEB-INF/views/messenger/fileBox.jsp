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
			grid-template-rows: 40px 8fr auto;
		}

		#fileBox-header{
			display: grid;
			grid-template-columns: 1fr 1fr 1fr repeat(4, 1fr);
		}

		#fileBox-header a{
			text-decoration: none;
			color: white;
		}

		#fileBox-header>button{
			border: 1px solid darkgray;
			border-top-right-radius: 20px;
			border-top-left-radius: 20px;
			margin: 5px 5px 0px 0px;
			
		}


		#fileBox-header-image{
			background-color: #1315a6;
		}

		#fileBox-header-etc{
			background-color: gray;
		}



		/*  */
		#fileBox-content > div{
			display: grid;
			grid-template-columns: repeat(3, 1fr);
			grid-template-rows: repeat(3, 1fr);

			place-items: center;

			height: 100%;
			width: 100%;

			padding-top: 30px;

			border-top: 3px solid gray;
		}


		.fileBox-tumb{
			display: grid;
			grid-template-rows: 70% 15% 15%;
			place-items: center;

			width: 200px;
			height: 300px;

			margin-bottom: 50px;

			border: 1px solid gray;
		}
		
		.fileBox-tumb:hover{
			border: 3px solid #1315a6;
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
            
			<div id="fileBox-header">
				<!-- a링크 버튼 클릭 ajax활용해서 바꿔서 fileBox-Content 내용 바꿔주기 -->
				<button id="fileBox-header-image"><a href="/md/messenger/imgFileBox">이미지</a></button> 
				<button id="fileBox-header-etc"> <a href="/md/messenger/etcFileBox">기타</a> </button>
			</div>
			
			
			<div id="fileBox-content">

				<div>

					<!-- 파일 수 만큼 이부분 반복 -->
					<c:forEach items="${ImgFileVoList}" var="imgFileVo">
					
						<div class="fileBox-tumb" data-bs-toggle="modal" data-bs-target="#myModal">
							<div> <img src="" alt="" width="140px" height="140px"> </div>
							<div> <h4>originName-${imgFileVo.originName}</h4> </div>
							<div> <h4>2022-10-03-${imgFileVo.enrollDate}</h4> </div>
						</div>
					
					</c:forEach>


					<div class="fileBox-tumb" data-bs-toggle="modal" data-bs-target="#myModal">
						<div> <img src="" alt="" width="160px" height="160px"> </div>
						<div> <h4>originName</h4> </div>
						<div> <h4>2022-10-03</h4> </div>
					</div><div class="fileBox-tumb">
						<div> <img src="" alt="" width="160px" height="160px"> </div>
						<div> <h4>originName</h4> </div>
						<div> <h4>2022-10-03</h4> </div>
					</div><div class="fileBox-tumb">
						<div> <img src="" alt="" width="160px" height="160px"> </div>
						<div> <h4>originName</h4> </div>
						<div> <h4>2022-10-03</h4> </div>
					</div><div class="fileBox-tumb">
						<div> <img src="" alt="" width="160px" height="160px"> </div>
						<div> <h4>originName</h4> </div>
						<div> <h4>2022-10-03</h4> </div>
					</div><div class="fileBox-tumb">
						<div> <img src="" alt="" width="160px" height="160px"> </div>
						<div> <h4>originName</h4> </div>
						<div> <h4>2022-10-03</h4> </div>
					</div>


				</div>

				
			</div>

		


        </main>


    </div>



	 <!-- The Modal -->
	 <div class="modal" id="myModal">
        <div class="modal-dialog modal-sm modal-dialog-centered">
        
            <div class="modal-content">
    
                <div class="modal-content">
                    <a class="btn btn-outline-dark" href=""><h3>보내기</h3></a>
                </div>
                <div class="modal-content">
                    <a class="btn btn-outline-dark" href=""><h3>삭제하기</h3></a>
                </div>
     
             </div>
             
        </div>
    </div>





</html>