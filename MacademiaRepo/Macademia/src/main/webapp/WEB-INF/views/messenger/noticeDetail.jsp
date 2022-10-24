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
			grid-template-rows: 10% 70% auto;
			border-radius : 10px;
		}


		#detail-header{
			display: grid;
			grid-template-columns: 6% 74% 10% 10%;
			align-items: center;
			font-size: 1.5rem;
		}

		#detail-content > a{
			text-decoration: none;
			float: right;
			margin-right: 20px;
		}

		#detail-content > textarea{
			font-size: 2rem;
			border: 3px solid lightseagreen;
			width: 100%;
			height: 90%;
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
		
		#reply-area > span > h3{
			border-left: 5px solid lightseagreen;
			padding-left: 10px;
			margin-left: 10px;
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
				<div><h1>${noticeVo.title}</h1></div>
				<div>조회 수 : ${noticeVo.count}</div>
				<div>작성일자 : ${noticeVo.enrollDate}</div>
			</div>

			<!--  -->
			<div id="detail-content">

				<textarea name="" id="" cols="30" rows="10" readonly>${noticeVo.content}</textarea>

				<a href="/md/messenger/notice/delete/${noticeVo.noticeNo}" class="badge bg-warning"><h5>삭제하기</h5></a>
				<a href="/md/messenger/notice/edit/${noticeVo.noticeNo}" class="badge bg-success"><h5>수정하기</h5></a>
			</div>
			


			<!--  -->
			<!--  -->
			<div id="reply-area">

				<span ><h3>댓글</h3></span>
				
					<div id="reple-list-ps">
						<c:forEach items="${repleVoList}" var="repleVo">				
							<!-- 리스트 만큼 이거 반복 -->
								<div class="reply-list">
									<div class="reply-img-wrap" ><img src="" alt="" width="90%" height="100%" style="border : 1px solid black;"></div>
									<div><span>${repleVo.msgNo}</span></div>
									<div><h4>${repleVo.content}</h4></div>
									<div><h6 style="color:gray">${repleVo.enrollDate}</h6></div>
								</div>
		
								<div>
								<c:if test="${repleVo.msgNo eq noticeVo.msgNo }">
									<a href="/md/messenger/notice/reple/delete/${repleVo.repleNo}/${noticeVo.noticeNo}" class="btn btn-lg">삭제하기</a>
								</c:if>
								</div>
						</c:forEach>
					</div>


				<div id="reply-insert">

					<div style="margin-left: 10px;">
						<label for="content"><h3><span  class="badge bg-secondary" >${noticeVo.msgNo}</span></h3></label>
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
			
			const repleContent = document.querySelector('#reple-content').value;
			const repleWriterNick = '${noticeVo.msgNo}';
			const repleNo = '${repleVo.repleNo}'
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
						$(target).prepend('<div class="reply-list"><div class="reply-img-wrap" ><img src="" alt="" width="90%" height="100%" style="border : 1px solid black;"></div><div><span>'
												+ repleWriterNick +'</span></div><div><h4>'+repleContent+'</h4></div><div><h6 style="color:gray">'
												+ now.getFullYear()+"-"+now.getMonth()+"-"+now.getDay()+'</h6></div></div><div><a href="/md/messenger/notice/reple/delete/'+repleNo+'" class="btn btn-lg">삭제하기</a></div>');
						
						//기존에 입력한 내용 지우기
						document.querySelector('#reple-content').value = "";
					}else{
						alert("댓글 작성 실패 ....");
					}
				},
				error : function(){
					alert("통신 에러 ...");
				}
				
				
			});
			
		});
		
		
	
	</script>







</html>