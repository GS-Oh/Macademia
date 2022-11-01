<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

 <div class="board_wrap">
        <div class="board_title">
          <strong>${vo.categoryNo}의 ${vo.no}번 게시물</strong>
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
                <div class="cont">
                    ${vo.content}
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
                <a href="${root}/board/edit/${vo.no}">수정</a>
            </div>
        </div>
    </div>
