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
	

	
		.main-partition{
			padding-top : 30px;
			border-top: 3px dashed black;
			margin-bottom : 20px;
			display: flex;
			text-align : bottom;
		}


		.main-content-wrap{
			width: 80%;
			height: 10%;
			display: flex;
			flex-wrap: wrap;
			height: auto;
		}

	

		.messenger-main-content{
			height: 150px;
			width: 30%;
			margin: 10px;
			margin-bottom: 3%;

			display: grid;
			grid-template-columns: 1.5fr 1fr;
			justify-items: center;

			border: 2px solid lightblue;
			border-radius: 10px;
			text-align: center;
		}
	
		.content-detail{
			display: grid;
			grid-template-rows: 1fr 1fr 1fr;
			align-items: center;
		}

		.detail-name{
			font-weight: 900;
			font-size: large;
		}

		/* 모달 */

	
		
		#profile-main-content{
			display: grid;
			grid-template-columns: 30% 70%;
			
			border: 3px solid #6667AB;
			border-radius: 15px;
			align-items: center;
		}

		.modal-header > div{
			border-left: 5px solid #6667AB;
			padding-left:15px;
			padding-top:10px;
		}

		#modal-content-img-wrap{
			height: 100%;
			padding:20px;
		}

		#modal-content-wrap{
			height: 100%;
			padding:20px;

			display: grid;
			grid-template-rows: 20% 80%;
			align-items: center;
		}

		#modal-content-wrap > div > h4 > textarea{
			margin-top: 20px;
			border: none;
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
            
            
            
			<!-- 행정팀 -->
			<div class="main-partition"><h2>행정팀</h2><h5 style="color: gray;">(3명)</h5></div>
			
			<!-- 행정팀 직원 -- 얘로 감싸고 -->
			<div class="main-content-wrap">
			
				<!-- 행정팀 직원 수 만큼 반복 -->
				<c:forEach items="${msgVoList}" var="msgTotalVo">

					<c:if test="${msgTotalVo.dept eq '행정팀'}">
						<div class="messenger-main-content  detail-target">
							<div style="height: 145px; width: 100%; border: 1px solid black;"  >
								<a data-bs-toggle="modal" data-bs-target="#myModal" href="javascript:void(0);" ><img class="detail-img" alt="" src="${root}/resources/upload/messenger/${msgTotalVo.fileName}"  width="90%" height="100%" style="border: 1px solid black;"></a>
							</div>
							<div class="content-detail">
								<div class="detail-name">${msgTotalVo.name}</div>
								<div class="detail-dept">${msgTotalVo.dept}</div>
								<div class="detail-position">${msgTotalVo.position}</div>
								<div class="detail-msgNo" style="display: none;">${msgTotalVo.msgNo}</div>
								<div class="detail-introduce" style="display: none;">${msgTotalVo.introduce}</div>
							</div>
						</div>
					</c:if>
						
					

				</c:forEach>
				
			</div>



			<!-- 재정팀 -- 부서 수 만큼 div 추가하기 (5개라고 생각하고 작성)-->
			<div class="main-partition"><h2>재정팀</h2><h5 style="color: gray;">(3명)</h5></div>
			
			
			
			
			

			<!-- 영업부 -- 부서 수 만큼 div 추가하기 (5개라고 생각하고 작성)-->
			<div class="main-partition"><h2>시설지원팀</h2><h5 style="color: gray;">(3명)</h5></div>
			

			

        </main>

		<!-- The Modal -->
		<div class="modal" id="myModal">
			<div class="modal-dialog modal-dialog-centered modal-lg" >
			<div class="modal-content">
		
				<!-- Modal Header -->
				<div class="modal-header">
					<div style="display: flex;"><h3 class="modal-dept"></h3>-<h3 class="modal-position"></h3></div>
					
					<button type="button" class="btn-close" data-bs-dismiss="modal"></button>
				</div>
		
				<!-- Modal body -->
				<div id="profile-main-content" class="modal-body">
					<div id="modal-content-img-wrap" >
						<img class="modal-img" src="" alt="" width="150px" height="150px" style="border:1px solid black">
					</div>
					<div id="modal-content-wrap">
						<h1 class="modal-title modal-name"></h1>
						<div><h4><textarea class="modal-introduce" rows="5" cols="40"></textarea></h4></div>
					</div>
				</div>
		
				<!-- Modal footer -->
				<div class="modal-footer">
					<a href="/md/messenger/note/write/${msgTotalVo.msgNo}" class="btn btn-lg bg-secondary modal-msgNo" style="color: white;">쪽지보내기</a>
				</div>
		
			</div>
			</div>
		</div>
	
	
	
	
		<script>

			const detailTarget = document.querySelectorAll('.detail-target');

			const detailImg = document.querySelectorAll('.detail-img');
			const detailName = document.querySelectorAll('.detail-name');
			const detailDept = document.querySelectorAll('.detail-dept');
			const detailPosition = document.querySelectorAll('.detail-position');
			const detailMsgNo = document.querySelectorAll('.detail-msgNo');
			const detailIntroduce = document.querySelectorAll('.detail-introduce');

			const modalImg = document.querySelector('.modal-img');
			const modalName = document.querySelector('.modal-name');
			const modalDept = document.querySelector('.modal-dept');
			const modalPosition = document.querySelector('.modal-position');
			const modalMsgNo = document.querySelector('.modal-msgNo');
			const modalIntroduce = document.querySelector('.modal-introduce');



			for(let i=0; i<detailTarget.length; ++i){

				detailTarget[i].addEventListener('click',function(){
					
					modalImg.src = detailImg[i].src;
					modalName.innerText = detailName[i].innerText;
					modalDept.innerText = detailDept[i].innerText;
					modalPosition.innerText = detailPosition[i].innerText;
					modalIntroduce.innerText = detailIntroduce[i].innerText;
					modalMsgNo.href = "/md/messenger/note/write?receiveNo="+detailMsgNo[i].innerText+"&receiveName="+detailName[i].innerText;

				});

			}



		</script>
	
	
	
	
	
    </div>


	


	



</html>