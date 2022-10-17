<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

 <div class="board_wrap">
        <div class="board_title">
           <strong>게시판</strong>
            <p>특정 게시판에 대한 간단한 설명~~</p>
        </div>
        <div class="board_view_wrap">
           
            <div class="board_view">
                <div class="title">
                    글 제목이 들어갑니다.
                </div>
                <div class="info">
                    <dl>
                        <dt>번호</dt>
                        <dd>1</dd>
                    </dl>
                    <dl>
                        <dt>글쓴이</dt>
                        <dd>김이름</dd>
                    </dl>
                    <dl>
                        <dt>작성일</dt>
                        <dd>2022.10.13</dd>
                    </dl>
                    <dl>
                        <dt>조회</dt>
                        <dd>33</dd>
                    </dl>
                </div>
                <div class="cont">
                    글 내용이 들어갑니다<br>
                    글 내용이 들어갑니다<br>
                    글 내용이 들어갑니다<br>
                    글 내용이 들어갑니다<br>
                    글 내용이 들어갑니다<br>
                    글 내용이 들어갑니다<br>
                    글 내용이 들어갑니다<br>
                    글 내용이 들어갑니다
                </div>
            </div>
            <div class="board_view">
             	<div class="cont">
             		<div>
             			댓글1
             		</div>
             		<div>
             			댓글2
             		</div>
             	</div>
             	<div>

				<form method="post" action="/reply/write" >
					<p>
						<textarea style="width:100%;" name="content"></textarea>
					</p>
					<p style="text-align: right;">
						<button type="submit" class="reply">댓글작성</button>
					</p>
				</form>

				</div>
             </div>   
            <div class="bt_wrap">
                <a href="/md/board/main" class="on">목록</a>
                <a href="/md/board/edit">수정</a>
            </div>
        </div>
    </div>
