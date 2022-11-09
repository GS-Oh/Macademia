<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
		  
		  <div class="board_wrap">
		        <div class="board_title">
		            <strong>게시판 수정</strong>
		        </div>
		        
		        <div class="board_write_wrap">
	               <form id="frm" action="" method="post" enctype="multipart/form-data">
		            <div class="board_write">
			                <div class="title">
			                    <dl>
			                        <dt>제목</dt>
			                        <dd><input name="title" type="text" placeholder="제목 입력" value="${vo.title}"></dd>
			                    </dl>
		                    </div>
		                    <div class="info">
			                    <dl>
			                        <dt>카테고리</dt>
			                        <c:if test="${vo.categoryNo eq 1}">
			                        <dd><input type="text" placeholder="OO게시판" value="자유게시판" readonly="readonly"></dd>
			                        </c:if>
			                        <c:if test="${vo.categoryNo eq 2}">
			                        <dd><input type="text" placeholder="OO게시판" value="자료공유게시판" readonly="readonly"></dd>
			                        </c:if>
			                    </dl>
			                    <dl>  
			                        <dt>썸네일</dt>         
			                        <dd><input type="file" placeholder="썸네일" name="file"></dd>
			                       	
		                    	</dl>
		                	</div>
			                        
		                
		                <div class="cont">
		                    <textarea placeholder="내용 입력" id="summernote" class="summernote" name="content">${vo.content }</textarea>
		                </div>
		            </div>
		           
		            <!--첨부파일 있다면  -->
                      <div class="title">
                      	<strong>첨부파일</strong>
                      	<c:if test="${!empty attachments}">
                      		<c:forEach var="x" items="${attachments}">
                      		<a class="" href="/md/resources/upload/board/${x.fileName}">${x.originName}</a>
                      		</c:forEach>
                       </c:if>
                      </div>
		           
		            <div class="bt_wrap">
		                <a class="on" href="#" onclick="return chk_form()" >수정</a> 
		                <a href="${root}/board/free/delete/${vo.no}" class="on2">삭제</a>
		                <a href="${root}/board/free">취소</a>
		            </div>
	                </form>
		        </div>
		    </div>
		    
		    
		    
		    <script>
			function chk_form() {
				document.getElementById('frm').submit();
			}
			</script>
    
		    
	