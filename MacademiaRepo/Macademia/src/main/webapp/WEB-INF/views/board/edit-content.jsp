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
			                        <dt>첨부파일</dt>         
			                        <!--첨부파일 없을 시  -->
			                        <dd><input type="file" placeholder="첨부파일" name="file" multiple="multiple"></dd>
			                       	
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
                      		<div>
	                      		<a class="" href="/md/resources/upload/board/data/${x.fileName}">${x.originName}</a>
	                      		<button type="button" id="zzz" onclick='deleteFile(this, "${x.fileName}", "${x.boardNo}")' class="btn btn-outline-danger">삭제</button>
                      		</div>
                      		</c:forEach>
                       </c:if>
                      </div>
		           
		            <div class="bt_wrap">
		                <a class="on" href="#" onclick="return chk_form()" >수정</a> 
		                <a href="${root}/board/data/delete/${vo.no}" class="on2">삭제</a>
		                <a href="${root}/board/">취소</a>
		            </div>
	                </form>
		        </div>
		    </div>
		    
		    
		    
		    <script>
			function chk_form() {
				document.getElementById('frm').submit();
			}
			
			</script>
    		
    		<script>
    			function deleteFile(target, fileName, boardNo) {
    				$.ajax({
						url : "/md/board/data/deleteFile?fileName=" + fileName + "&boardNo=" + boardNo,
						success : function () {
							target.parentNode.remove();
						} 	
					})
    			}
    		</script>
		    
	