<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <div class="board_wrap">
    <div class="board_title">
        <strong>게시판 글 작성</strong> 
    </div>
    
    <div class="board_write_wrap">
       <form action="" method="post" enctype="multipart/form-data">
         <div class="board_write">
             <div class="title">
                 <dl>
                     <dt>제목</dt>
                     <dd><input type="text" placeholder="제목 입력" name="title"></dd>
                 </dl>
             </div>
             <div class="info">
                 <dl>
                     <dt>카테고리</dt>
                     <dd>
                     	<select name="categoryNo">
                     		<option value="1" selected="selected">자유게시판</option>
                     		<option value="2">자료공유게시판</option>
                     	</select>
                     </dd>
                 </dl>
                 <dl>
                     <dt> 작성자</dt>
                     <dd><input name="userNo" type="text" placeholder="작성자 이름" readonly="readonly" value="${loginMember.name}" ></dd>
                 </dl>
                 <dl>
                     <dt> 파일 첨부</dt>
                     <dd><input type="file"></dd>
                 </dl>
             </div>
             <div class="cont">
	        <textarea id="summernote" class="summernote"  name="content"></textarea>
                 
             </div>
         </div>
         <div class="bt_wrap">
             <input class="submit-button" type="submit" value="작성"> 
             <a href="javascript:history.back();">취소</a>
         </div>
        </form>
    </div>
</div>
		
	
	
	
        
        

	