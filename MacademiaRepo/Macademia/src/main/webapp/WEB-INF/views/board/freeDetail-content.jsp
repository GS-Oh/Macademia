<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

 <div class="board_wrap">
        <div class="board_title">
          <c:if test="${vo.categoryNo eq 1}"><strong>자유게시판 ${vo.no}번 게시물</strong></c:if>
        </div>
          
        <div class="board_view_wrap">
           
            <div class="board_view">
                
                <div class="title">
                    ${vo.title}
                </div>
                <div class="info">
                    <dl>
                        <dt>번호</dt>
                        <dd>${vo.no}</dd>
                    </dl>
                    <dl>
                        <dt>글쓴이</dt>
                        <dd>${vo.userNo}</dd>
                    </dl>
                    <dl>
                        <dt>작성일</dt>
                        <dd>${vo.regdate}</dd>
                    </dl>
                    <dl>
                        <dt>조회</dt>
                        <dd>${vo.hit}</dd>
                    </dl>
                </div>
                <div class="cont" style="height: 1000px ">
                    ${vo.content}
                </div>
            </div>
            
            <!--댓글 작성 화면  -->
            <div class="board_view">
             	<c:if test="${!empty loginMember}">
	             	<div>
					<textarea style="width:100%; border: 1mm ridge #6667AB;" id="reply-content" name="content" ></textarea>
						<p style="text-align: right;">
							<button id="reply-btn" class="reply"  >댓글작성</button>
						</p>
					</div>
             	</c:if>
             	<!--댓글 목록 화면  -->
             	<div class="cont">
           		<c:if test="${empty replyVo }">
					<h2 align="center" id="reple-empty-text">현재 댓글이 없습니다. 댓글을 입력해 주세요</h2>
				</c:if>
           		
           		
           		<c:forEach items="${replyVo}" var="x" >
                    <div class="info">
                    <dl>
                        <input type="hidden" value="${x.replyNo}" id="${x.replyNo}">
                        <dt><img src="/md/resources/upload/profile/${x.profileName}" style="width: 30px; height: 30px; border-radius: 5px;"></dt>
                        <dt>${x.name}</td>
                        <dd> ${x.regdate} 
                      </dl>  
                        <!-- 로그인한 사람과 현재 보는 글 보는 사람이 같으면 삭제 버튼 보이도록 해주기  -->
							
							<c:if test="${loginMember.name eq x.name}">
								<a href="/md/reply/free/delete?replyNo=${x.replyNo}&boardNo=${vo.no}&name=${loginMember.name}"  class="btn btn-outline-danger">삭제하기</a>
							</c:if>
                        </dd>
                     <dl>
                     	<dt>${x.content}</dd>
                    </dl>
                   </div>
                     </c:forEach>
             	</div>
             </div>   
            
            <!--게시판 마지막 부분  -->
            <div class="bt_wrap">
                <a href="/md/board/free" class="on">목록</a>
               
               <c:if test="${loginMember.name eq vo.userNo}">				
                <a href="${root}/board/free/edit/${vo.no}">수정</a>
				</c:if> 
            </div>
            <!--게시판 테두리  -->
        </div>
    </div>
    
    
    <!--댓글 작성 스크립트  -->
    <script>
		const replyBtn = document.querySelector('#reply-btn');	
		replyBtn.addEventListener('click', function() {
			const replyContent = document.querySelector('#reply-content').value;
			const boardNo = ${vo.no};
			console.log(boardNo);
			const name = '${sessionScope.loginMember.name}'; 
			$.ajax({
				url : "/md/reply/free/write",
				type : "POST",
                data : {"content" : replyContent,
						"boardNo" : boardNo,
						"name" : name 
				},
				success : function(data){
					
						alert("댓글 작성 성공 !!!");	
						const target = document.querySelector('#reply-list')
						//기존에 입력한 내용 지우기
						document.querySelector('#reply-content').value = '';
						//다시 불러오기
						location.reload();
				},	
			})	
		})
		
		
	</script>