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
	
		img {
			border : 0px;
		}
	
		.main-partition{
			padding-top : 30px;
			border-top: 1px dashed black;
			margin-bottom : 20px;
			display: flex;
			text-align : bottom;
		}

		.msg-main-title-wrap{
		 	border:5px solid #6667AB; 
			padding:20px; 
			border-radius: 15px;
			margin-bottom: 20px;
		}

		.msg-main-title{
			border-left: 10px solid #6667AB;
			padding-left: 10px;
			font-size: 10rem;
			font-weight: 900;
			margin: 30px 0px 30px 0px;
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
			width: 350px;
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
			
			border-top: 3px solid #6667AB;
			border-bottom: 3px solid #6667AB;
			align-items: center;
		}

		.modal-header > div{
			padding-left:15px;
			padding-top:10px;
		}
		
		.modal-header > div > h3{
			margin-right:10px;
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
            
            
            <div class="msg-main-title-wrap">
				<!-- 운영기획부 -->
				<div class="msg-main-title"><h1>운영기획부</h1><h5 style="color: gray;"></h5></div>
				
				<!-- 행정팀(운영기획부) -->
				<div class="main-partition"><h2>행정팀</h2><h5 style="color: gray;"></h5></div>

				<!-- 부서 보여주는 부분 얘로 감싸고 -->
				<div class="main-content-wrap" style="width: 100%;">

					<c:forEach items="${msgVoList}" var="msgTotalVo">
						<!-- 운영기획부인 회원 기준 -->										
						<!-- 행정팀 직원 수 만큼 반복 -->
						<c:if test="${msgTotalVo.dept eq '행정팀'}">
	
							<div class="messenger-main-content  detail-target">
								<div style="height: 145px; width: 100%;"  >
									<a data-bs-toggle="modal" data-bs-target="#myModal" href="javascript:void(0);" ><img class="detail-img rounded-circle" alt="" src="${root}/resources/upload/messenger/${msgTotalVo.fileName}"  width="90%" height="100%" style="border: 1px solid black;"></a>
								</div>
								<div class="content-detail">
									<div class="detail-name">${msgTotalVo.name}</div>
									<div class="detail-part">${msgTotalVo.part}</div>
									<div class="detail-dept" style="display: none;">${msgTotalVo.dept}</div>
									<div class="detail-position">${msgTotalVo.position}</div>
									<div class="detail-msgNo" style="display: none;">${msgTotalVo.msgNo}</div>
									<div class="detail-introduce" style="display: none;">${msgTotalVo.introduce}</div>
								</div>
							</div>
							
						</c:if>
					</c:forEach>		

				</div>		
							
							
				<!-- 총무팀(운영기획부) -->
				<div class="main-partition"><h2>재정팀</h2><h5 style="color: gray;"></h5></div>
				
				
				
				<!-- 부서 보여주는 부분 얘로 감싸고 -->
				<div class="main-content-wrap">

					<c:forEach items="${msgVoList}" var="msgTotalVo">
						<!-- 운영기획부인 회원 기준 -->										
						<!-- 재정팀 직원 수 만큼 반복 -->
						<c:if test="${msgTotalVo.dept eq '재정팀'}">
	
							<div class="messenger-main-content  detail-target">
								<div style="height: 145px; width: 100%;"  >
									<a data-bs-toggle="modal" data-bs-target="#myModal" href="javascript:void(0);" ><img class="detail-img rounded-circle" alt="" src="${root}/resources/upload/messenger/${msgTotalVo.fileName}"  width="90%" height="100%" style="border: 1px solid black;"></a>
								</div>
								<div class="content-detail">
									<div class="detail-name">${msgTotalVo.name}</div>
									<div class="detail-part">${msgTotalVo.part}</div>
									<div class="detail-dept" style="display: none;">${msgTotalVo.dept}</div>
									<div class="detail-position">${msgTotalVo.position}</div>
									<div class="detail-msgNo" style="display: none;">${msgTotalVo.msgNo}</div>
									<div class="detail-introduce" style="display: none;">${msgTotalVo.introduce}</div>
								</div>
							</div>
							
						</c:if>
					</c:forEach>		

				</div>		
							


				<!-- 시설지원팀(운영기획부) -->
				<div class="main-partition"><h2>시설지원팀</h2><h5 style="color: gray;"></h5></div>
				
				<!-- 부서 보여주는 부분 얘로 감싸고 -->
				<div class="main-content-wrap">

					<c:forEach items="${msgVoList}" var="msgTotalVo">
							<!-- 운영기획부인 회원 기준 -->										
							<!-- 시설지원팀 직원 수 만큼 반복 -->
							<c:if test="${msgTotalVo.dept eq '시설지원팀'}">
		
								<div class="messenger-main-content  detail-target">
									<div style="height: 145px; width: 100%;"  >
										<a data-bs-toggle="modal" data-bs-target="#myModal" href="javascript:void(0);" ><img class="detail-img rounded-circle" alt="" src="${root}/resources/upload/messenger/${msgTotalVo.fileName}"  width="90%" height="100%" style="border: 1px solid black;"></a>
									</div>
									<div class="content-detail">
										<div class="detail-name">${msgTotalVo.name}</div>
										<div class="detail-part">${msgTotalVo.part}</div>
										<div class="detail-dept" style="display: none;">${msgTotalVo.dept}</div>
										<div class="detail-position">${msgTotalVo.position}</div>
										<div class="detail-msgNo" style="display: none;">${msgTotalVo.msgNo}</div>
										<div class="detail-introduce" style="display: none;">${msgTotalVo.introduce}</div>
									</div>
								</div>
								
							</c:if>
						</c:forEach>	

				</div>		
						
						
			</div>
			
					
			<div class="msg-main-title-wrap">
				<!-- 교육훈련부 -->
				<div class="msg-main-title"><h1>교육훈련부</h1><h5 style="color: gray;"></h5></div>
				
				<!-- 교육1팀(교육훈련부) -->
				<div class="main-partition"><h2>교육1팀</h2><h5 style="color: gray;"></h5></div>

				<!-- 부서 보여주는 부분 얘로 감싸고 -->
				<div class="main-content-wrap">
					
					<c:forEach items="${msgVoList}" var="msgTotalVo">

							<!-- 운영기획부인 회원 기준 -->										
							<!-- 교육1팀 직원 수 만큼 반복 -->
							<c:if test="${msgTotalVo.dept eq '교육1팀' }">
		
								<div class="messenger-main-content  detail-target">
									<div style="height: 145px; width: 100%;"  >
										<a data-bs-toggle="modal" data-bs-target="#myModal" href="javascript:void(0);" ><img class="detail-img rounded-circle" alt="" src="${root}/resources/upload/messenger/${msgTotalVo.fileName}"  width="90%" height="100%" style="border: 1px solid black;"></a>
									</div>
									<div class="content-detail">
										<div class="detail-name">${msgTotalVo.name}</div>
										<div class="detail-part">${msgTotalVo.part}</div>
										<div class="detail-dept" style="display: none;">${msgTotalVo.dept}</div>
										<div class="detail-position">${msgTotalVo.position}</div>
										<div class="detail-msgNo" style="display: none;">${msgTotalVo.msgNo}</div>
										<div class="detail-introduce" style="display: none;">${msgTotalVo.introduce}</div>
									</div>
								</div>
								
							</c:if>
					</c:forEach>			

				</div>		
							
							
							
				<!-- 교육2팀(교육훈련부) -->
				<div class="main-partition"><h2>교육2팀</h2><h5 style="color: gray;"></h5></div>
				
				<div class="main-content-wrap">
				
				<c:forEach items="${msgVoList}" var="msgTotalVo">

					<!-- 부서 보여주는 부분 얘로 감싸고 -->
							<!-- 운영기획부인 회원 기준 -->										
							<!-- 교육2팀 직원 수 만큼 반복 -->
							<c:if test="${msgTotalVo.dept eq '교육2팀' }">
		
								<div class="messenger-main-content  detail-target">
									<div style="height: 145px; width: 100%;"  >
										<a data-bs-toggle="modal" data-bs-target="#myModal" href="javascript:void(0);" ><img class="detail-img rounded-circle" alt="" src="${root}/resources/upload/messenger/${msgTotalVo.fileName}"  width="90%" height="100%" style="border: 1px solid black;"></a>
									</div>
									<div class="content-detail">
										<div class="detail-name">${msgTotalVo.name}</div>
										<div class="detail-part">${msgTotalVo.part}</div>
										<div class="detail-dept" style="display: none;">${msgTotalVo.dept}</div>
										<div class="detail-position">${msgTotalVo.position}</div>
										<div class="detail-msgNo" style="display: none;">${msgTotalVo.msgNo}</div>
										<div class="detail-introduce" style="display: none;">${msgTotalVo.introduce}</div>
									</div>
								</div>
								
							</c:if>
					
				</c:forEach>
								
				</div>		
							
							
				<!-- 교재지원팀(교육훈련부) -->
				<div class="main-partition"><h2>교재지원팀</h2><h5 style="color: gray;"></h5></div>
				
				<!-- 부서 보여주는 부분 얘로 감싸고 -->
				<div class="main-content-wrap">

					<c:forEach items="${msgVoList}" var="msgTotalVo">
							<!-- 교재지원팀 회원 기준 -->										
							<!-- 교재지원팀 직원 수 만큼 반복 -->
							<c:if test="${msgTotalVo.dept eq '교재지원팀'}">
		
								<div class="messenger-main-content  detail-target">
									<div style="height: 145px; width: 100%;"  >
										<a data-bs-toggle="modal" data-bs-target="#myModal" href="javascript:void(0);" ><img class="detail-img rounded-circle" alt="" src="${root}/resources/upload/messenger/${msgTotalVo.fileName}"  width="90%" height="100%" style="border: 1px solid black;"></a>
									</div>
									<div class="content-detail">
										<div class="detail-name">${msgTotalVo.name}</div>
										<div class="detail-part">${msgTotalVo.part}</div>
										<div class="detail-dept" style="display: none;">${msgTotalVo.dept}</div>
										<div class="detail-position">${msgTotalVo.position}</div>
										<div class="detail-msgNo" style="display: none;">${msgTotalVo.msgNo}</div>
										<div class="detail-introduce" style="display: none;">${msgTotalVo.introduce}</div>
									</div>
								</div>
								
							</c:if>
					</c:forEach>							

				</div>		
			
			</div>
				


			<div class="msg-main-title-wrap">
				<!-- 취업지원부 -->
				<div class="msg-main-title"><h1>취업지원부</h1><h5 style="color: gray;"></h5></div>
				
				<!-- 취업팀(취업지원부) -->
				<div class="main-partition"><h2>취업팀</h2><h5 style="color: gray;"></h5></div>

				<!-- 부서 보여주는 부분 얘로 감싸고 -->
				<div class="main-content-wrap">
				
					<c:forEach items="${msgVoList}" var="msgTotalVo">
							<!-- 취업지원부 회원 기준 -->										
							<!-- 취업팀 직원 수 만큼 반복 -->
							<c:if test="${msgTotalVo.dept eq '취업팀' }">
		
								<div class="messenger-main-content  detail-target">
									<div style="height: 145px; width: 100%;"  >
										<a data-bs-toggle="modal" data-bs-target="#myModal" href="javascript:void(0);" ><img class="detail-img rounded-circle" alt="" src="${root}/resources/upload/messenger/${msgTotalVo.fileName}"  width="90%" height="100%" style="border: 1px solid black;"></a>
									</div>
									<div class="content-detail">
										<div class="detail-name">${msgTotalVo.name}</div>
										<div class="detail-part">${msgTotalVo.part}</div>
										<div class="detail-dept" style="display: none;">${msgTotalVo.dept}</div>
										<div class="detail-position">${msgTotalVo.position}</div>
										<div class="detail-msgNo" style="display: none;">${msgTotalVo.msgNo}</div>
										<div class="detail-introduce" style="display: none;">${msgTotalVo.introduce}</div>
									</div>
								</div>
								
							</c:if>
					</c:forEach>			

				</div>		
							
							
							
				<!-- 상담팀(취업지원부) -->
				<div class="main-partition"><h2>상담팀</h2><h5 style="color: gray;"></h5></div>
				
				<!-- 부서 보여주는 부분 얘로 감싸고 -->
				<div class="main-content-wrap">
					
					<c:forEach items="${msgVoList}" var="msgTotalVo">

							<!-- 운영기획부인 회원 기준 -->										
							<!-- 취업지원부 직원 수 만큼 반복 -->
							<c:if test="${msgTotalVo.dept eq '상담팀' }">
		
								<div class="messenger-main-content  detail-target">
									<div style="height: 145px; width: 100%;"  >
										<a data-bs-toggle="modal" data-bs-target="#myModal" href="javascript:void(0);" ><img class="detail-img rounded-circle" alt="" src="${root}/resources/upload/messenger/${msgTotalVo.fileName}"  width="90%" height="100%" style="border: 1px solid black;"></a>
									</div>
									<div class="content-detail">
										<div class="detail-name">${msgTotalVo.name}</div>
										<div class="detail-part">${msgTotalVo.part}</div>
										<div class="detail-dept" style="display: none;">${msgTotalVo.dept}</div>
										<div class="detail-position">${msgTotalVo.position}</div>
										<div class="detail-msgNo" style="display: none;">${msgTotalVo.msgNo}</div>
										<div class="detail-introduce" style="display: none;">${msgTotalVo.introduce}</div>
									</div>
								</div>
								
							</c:if>
					</c:forEach>				

				</div>		

			</div>
						
					
			

			<div class="msg-main-title-wrap">			
				<!-- 마케팅부 -->
				<div class="msg-main-title"><h1>마케팅부</h1><h5 style="color: gray;"></h5></div>
				
				<!-- 홍보팀(마케팅부) -->
				<div class="main-partition"><h2>홍보팀</h2><h5 style="color: gray;"></h5></div>

				<!-- 부서 보여주는 부분 얘로 감싸고 -->
				<div class="main-content-wrap">

					<c:forEach items="${msgVoList}" var="msgTotalVo">

							<!-- 마케팅부 회원 기준 -->										
							<!-- 행정팀 직원 수 만큼 반복 -->
							<c:if test="${msgTotalVo.dept eq '홍보팀' }">
		
								<div class="messenger-main-content  detail-target">
									<div style="height: 145px; width: 100%; "  >
										<a data-bs-toggle="modal" data-bs-target="#myModal" href="javascript:void(0);" ><img class="detail-img rounded-circle" alt="" src="${root}/resources/upload/messenger/${msgTotalVo.fileName}"  width="90%" height="100%" style="border: 1px solid black;"></a>
									</div>
									<div class="content-detail">
										<div class="detail-name">${msgTotalVo.name}</div>
										<div class="detail-part">${msgTotalVo.part}</div>
										<div class="detail-dept" style="display: none;">${msgTotalVo.dept}</div>
										<div class="detail-position">${msgTotalVo.position}</div>
										<div class="detail-msgNo" style="display: none;">${msgTotalVo.msgNo}</div>
										<div class="detail-introduce" style="display: none;">${msgTotalVo.introduce}</div>
									</div>
								</div>
								
							</c:if>
							
					</c:forEach>		

				</div>		
							
							
							
				<!-- 대외협력팀(마케팅부) -->
				<div class="main-partition"><h2>대외협력팀</h2><h5 style="color: gray;"></h5></div>
				
				<!-- 부서 보여주는 부분 얘로 감싸고 -->
				<div class="main-content-wrap">

					<c:forEach items="${msgVoList}" var="msgTotalVo">

							<!-- 마케팅부 회원 기준 -->										
							<!-- 대외협력팀 직원 수 만큼 반복 -->
							<c:if test="${msgTotalVo.dept eq '대외협력팀' }">
		
								<div class="messenger-main-content  detail-target">
									<div style="height: 145px; width: 100%; "  >
										<a data-bs-toggle="modal" data-bs-target="#myModal" href="javascript:void(0);" ><img class="detail-img rounded-circle" alt="" src="${root}/resources/upload/messenger/${msgTotalVo.fileName}"  width="90%" height="100%" style="border: 1px solid black;"></a>
									</div>
									<div class="content-detail">
										<div class="detail-name">${msgTotalVo.name}</div>
										<div class="detail-part">${msgTotalVo.part}</div>
										<div class="detail-dept" style="display: none;">${msgTotalVo.dept}</div>
										<div class="detail-position">${msgTotalVo.position}</div>
										<div class="detail-msgNo" style="display: none;">${msgTotalVo.msgNo}</div>
										<div class="detail-introduce" style="display: none;">${msgTotalVo.introduce}</div>
									</div>
								</div>
								
							</c:if>
					</c:forEach>		

				</div>		
				
			</div>
			
			

        </main>

		<!-- The Modal -->
		<div class="modal" id="myModal" >
			<div class="modal-dialog modal-dialog-centered modal-lg" >
			<div class="modal-content" >
		
				<!-- Modal Header -->
				<div class="modal-header">
					<div style="display: flex;"><h3><span class="modal-dept badge bg-secondary"></span></h3><h3><span class="modal-part badge bg-secondary"></span></h3><h3><span class="modal-position badge bg-secondary"></span></h3></div>
					
					<button type="button" class="btn-close" data-bs-dismiss="modal"></button>
				</div>
		
				<!-- Modal body -->
				<div id="profile-main-content" class="modal-body" >
					<div id="modal-content-img-wrap" >
						<img class="modal-img rounded" src="" alt="" width="150px" height="150px" style="border:1px solid black">
					</div>
					<div id="modal-content-wrap">
						<h1 class="modal-title modal-name"></h1>
						<div><h4><textarea class="modal-introduce" rows="5" cols="40" readonly></textarea></h4></div>
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
			const detailPart = document.querySelectorAll('.detail-part');
			const detailPosition = document.querySelectorAll('.detail-position');
			const detailMsgNo = document.querySelectorAll('.detail-msgNo');
			const detailIntroduce = document.querySelectorAll('.detail-introduce');

			const modalImg = document.querySelector('.modal-img');
			const modalName = document.querySelector('.modal-name');
			const modalDept = document.querySelector('.modal-dept');
			const modalPart = document.querySelector('.modal-part');
			const modalPosition = document.querySelector('.modal-position');
			const modalMsgNo = document.querySelector('.modal-msgNo');
			const modalIntroduce = document.querySelector('.modal-introduce');



			for(let i=0; i<detailTarget.length; ++i){

				detailTarget[i].addEventListener('click',function(){
					
					modalImg.src = detailImg[i].src;
					modalName.innerText = detailName[i].innerText;
					modalDept.innerText = detailDept[i].innerText;
					modalPart.innerText = detailPart[i].innerText;
					modalPosition.innerText = detailPosition[i].innerText;
					modalIntroduce.innerText = detailIntroduce[i].innerText;
					modalMsgNo.href = "/md/messenger/note/write?receiveNo="+detailMsgNo[i].innerText+"&receiveName="+detailName[i].innerText;

				});

			}



		</script>
	
	
	
	
	
    </div>


	


	



</html>