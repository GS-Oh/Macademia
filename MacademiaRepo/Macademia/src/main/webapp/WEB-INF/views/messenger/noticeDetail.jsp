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
			grid-template-rows: 20% 70% auto;
			border-radius : 10px;
		}


		#detail-header{
			display: grid;
			grid-template-columns: 8% 74% 10% 10%;
			grid-template-rows : 60% 40%;
			align-items: center;
			font-size: 1.5rem;
			margin-bottom: 30px;
			
			text-align: center;
		}

		.detail-title-nickname{

			text-align: left;
			padding-left:15px;
			font-weight: 800;
		}

		#detail-content{
			height: 100%;
			width:100%;
		}
		
		#main-text-area{
			height: 95%;
			width:100%;
			border: 3px solid lightseagreen;
			border-radius: 10px;
			padding: 20px;
			font-size : 2rem;
			font-weight: 500;
		}

		#detail-content > a{
			text-decoration: none;
			float: right;
			margin-right: 20px;
			
		}

	

		/* 댓글영역 */
		#reply-area{
			border: 3px solid lightseagreen;
			border-radius: 10px;
		}

		#reply-area > span{
			margin: 10px;
			padding-bottom: 20px;
		}
		
		.content-subtitle{
			border-left: 5px solid #6667AB;
			padding-left: 10px;
			margin: 20px 0px 20px 10px;
		}


		.reply-list{
			display: grid;
			grid-template-columns: 1fr 9fr;
			grid-template-rows: 20% 60% 20%;
			align-items: center;
			padding : 10px;
			margin-bottom: 5px;
			border-bottom: 1px solid lightgray;
		}

		#reple-list-ps{
			display: grid;
			grid-template-columns: 90% 10%;
		}


		.reply-img-wrap{
			grid-row: span 3;
			height: 100%;
			width: 100%;
			margin-right: 80px;
		}


		#reply-insert{
			margin: 5% 5% 5% 10%;
			width: 80%;
			
			display: grid;
			grid-template-rows: 20% 60% 20%;
			align-items: center;

			border: 3px solid gray;
			border-radius: 10px;
		}

		#empty-reple{
			text-align: center;
			color: gray;
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
            <!--  -->
			<div id="detail-header">
				<div><span  class="badge bg-info" >공지</span></div>
				<div class="detail-title-nickname"><h1>${noticeVo.title}</h1></div>
				<div ><h3><span class="badge bg-secondary">조회 수</span></h3></div>
				<div ><h3><span class="badge bg-secondary">작성일자</span></h3></div>
				
				<div style="width: 100%; height: 100%; border: 1px solid black;"><img src="${root}/resources/upload/messenger/${noticeVo.fileName}" alt="" width="100%" height="100%"> </div>
				<div class="detail-title-nickname">${noticeVo.name}</div>
				<div>${noticeVo.count}</div>
				<div>${noticeVo.enrollDate}</div>
				
			</div>
	
	
			
			<!--  -->
			<div id="detail-content">
				
				
				<div id="main-text-area"><span ><h3 class="content-subtitle">내용</h3></span>${noticeVo.content}</div>
				
				<c:if test="${noticeVo.msgNo eq msgVo.msgNo}">
					<a href="/md/messenger/notice/delete/${noticeVo.noticeNo}" class="badge bg-warning"><h5>삭제하기</h5></a>
					<a href="/md/messenger/notice/edit/${noticeVo.noticeNo}" class="badge bg-success"><h5>수정하기</h5></a>
				</c:if>
			</div>
			

			<!--  -->
			<!--  -->
			<div id="reply-area">

				<span ><h3 class="content-subtitle">댓글</h3></span>
				
					<div id="reple-list-ps">
					
						<c:if test="${empty repleVoList}">
							<div ><h3 id="empty-reple">댓글이 없습니다. 작성해주세요  :)</h3></div>
						</c:if>
					
					
						<c:forEach items="${repleVoList}" var="repleVo">				
							<!-- 리스트 만큼 이거 반복 -->
								<div class="reply-list">
									<div class="reply-img-wrap" ><img id="reple-img-area" src="${root}/resources/upload/messenger/${repleVo.fileName}" alt="" width="90%" height="100%" style="border : 1px solid black;"></div>
									<div><span>${repleVo.name}</span></div>
									<div><h4>${repleVo.content}</h4></div>
									<div><h6 style="color:gray">${repleVo.enrollDate}</h6></div>
								</div>
		
								<div>
								<c:if test="${repleVo.msgNo eq msgVo.msgNo }">
									<a href="/md/messenger/notice/reple/delete/${repleVo.repleNo}/${noticeVo.noticeNo}" class="btn btn-lg">삭제하기</a>
								</c:if>
								</div>
						</c:forEach>
					</div>


				<div id="reply-insert">

					<div style="margin-left: 10px;">
						<label for="content"><h3><span  class="badge bg-secondary" >${sessionScope.msgVo.name}</span></h3></label>
					</div>
					<div style="margin: 10px;">
						<textarea id="reple-content" class="form-control" rows="4" id="content" name="text"></textarea>
					</div>	
					<div >
						<button id="reple-btn" class="badge bg-info" style="float: right;"><h5>등록하기</h5></button>
					</div>	

				</div>

			</div>

        </main>


	</div>

	<script>
	
		const repleBtn = document.querySelector('#reple-btn');
		
		repleBtn.addEventListener('click', function(){
			
			const repleWriterNick = '${msgVo.name}';
			const repleProfile = '${msgVo.fileName}';
			const repleContent = document.querySelector('#reple-content').value;
			const emptyReple = document.querySelector('#empty-reple');
			const now = new Date();
			
			$.ajax({
				
				url : "${root}/messenger/notice/reple/write",
				type : "post",
				data : { 
					content : repleContent,
					noticeNo : '${noticeVo.noticeNo}'
				},
				success : function(result){
					if(result == 'ok'){
						const target = document.querySelector('#reple-list-ps');
						$(target).prepend('<div class="reply-list"><div class="reply-img-wrap" ><img src="/md/resources/upload/messenger/'+ repleProfile +'" alt="" width="90%" height="100%" style="border : 1px solid black;"></div><div><span>'
												+ repleWriterNick +'</span></div><div><h4>'+repleContent+'</h4></div><div><h6 style="color:gray">'
												+ now.getFullYear()+"-"+now.getMonth()+"-"+now.getDay()+'</h6></div></div><div></div>');
						
						//기존에 입력한 내용 지우기
						document.querySelector('#reple-content').value = "";
						emptyReple.innerText = "";
					}else{
						alert("댓글 작성 실패 ....");
					}
				},
				error : function(){
					alert("댓글을 입력해주세요 ...");
				}
				
				
			});
			
		});
		
		
		
	</script>




	<script>
		const gwiseok = document.querySelector('#gwiseok');
		const noticeNo2 = ${noticeVo.noticeNo};

		gwiseok.addEventListener('click', function(){
			Swal.fire('Any fool can use a computer')
			Swal.fire({
				title: '정말 삭제하시겠습니까?',
				showDenyButton: true,
				showCancelButton: true,
				confirmButtonText: '삭제하기',
				}).then((result) => {
				/* Read more about isConfirmed, isDenied below */
				if (result.isConfirmed) {
					gwiseok.href = "/md/messenger/notice/delete/"+noticeNo2;
				} else if (result.isDenied) {
					gwiseok.href = "";
				}
				});

			})


	</script>


</html>