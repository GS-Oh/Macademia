<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
		  <div class="board_wrap">
		        <div class="board_title">
		            <strong>게시판 수정</strong>
		        </div>
		        <div class="board_write_wrap">
		            <div class="board_write">
		                <form action="${root}/board/edit/${vo.no}" method="post" >
		                <div class="title">
		                    <dl>
		                        <dt>제목</dt>
		                        <dd><input name="title" type="text" placeholder="제목 입력" value="${vo.title}"></dd>
		                    </dl>
		                      <div class="info">
			                    <dl>
			                        <dt>카테고리</dt>
			                        <dd><input type="text" placeholder="OO게시판" value="${vo.categoryNo}" readonly="readonly"></dd>
			                    </dl>
			                    <dl>
		                     <dl>
		                        <dt>첨부파일</dt>
		                        <dd><input type="file" placeholder="첨부파일" name="file"></dd>
		                    </dl>
		                </div>
		                <div class="info">
		                   
		                </div>
		                <div class="cont">
		                    <textarea placeholder="내용 입력" id="summernote" class="summernote" name="content">${vo.content }</textarea>
		                </div>
		            </div>
		            <div class="bt_wrap">
		                <input type="submit" value="수정">
	                </form>
		                <a href="${root}/board/delete/${vo.no}" class="on2">삭제</a>
		                <a href="${root}/board/">취소</a>
		            </div>
		        </div>
		    </div>
	    </div>