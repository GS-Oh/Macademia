<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>

  <div class="board_wrap">
        <div class="board_title">
            <strong>게시판</strong>
            <p>특정 게시판에 대한 간단한 설명~~</p>
        </div>
        <div class="board_write_wrap">
            <div class="board_write">
                <div class="title">
                    <dl>
                        <dt>제목</dt>
                        <dd><input type="text" placeholder="제목 입력" value="글 제목이 들어갑니다"></dd>
                    </dl>
                     <dl>
                        <dt>첨부파일</dt>
                        <dd><input type="file" placeholder="첨부파일"></dd>
                    </dl>
                </div>
                <div class="info">
                   
                </div>
                <div class="cont">
                    <textarea placeholder="내용 입력">
글 내용이 들어갑니다.
글 내용이 들어갑니다.
글 내용이 들어갑니다.
글 내용이 들어갑니다.
글 내용이 들어갑니다.
글 내용이 들어갑니다.
글 내용이 들어갑니다.
글 내용이 들어갑니다.</textarea>
                </div>
            </div>
            <div class="bt_wrap">
                <a href="view.html" class="on">수정</a>
                <a href="view.html" class="on2">삭제</a>
                <a href="view.html">취소</a>
            </div>
        </div>
    </div>
</body>