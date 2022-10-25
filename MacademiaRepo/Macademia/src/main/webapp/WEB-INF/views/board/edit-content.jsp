<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
	<link rel="stylesheet" href="../resources/summernote/summernote-lite.css">
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
		                      <div class="info">
			                    <dl>
			                        <dt>카테고리</dt>
			                        <dd><input type="text" placeholder="OO게시판"></dd>
			                    </dl>
			                    <dl>
		                     <dl>
		                        <dt>첨부파일</dt>
		                        <dd><input type="file" placeholder="첨부파일"></dd>
		                    </dl>
		                </div>
		                <div class="info">
		                   
		                </div>
		                <div class="cont">
		                    <textarea placeholder="내용 입력" id="summernote" name="summernote">
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
			
			<script src="../resources/summernote/summernote-lite.js"></script>
	<script src="../resources/summernote/summernote-ko-KR.js"></script>
	
	<script type="text/javascript">


		$(document).ready(function() {
		//여기 아래 부분
		$('#summernote').summernote({
			  height: 300,                 // 에디터 높이
			  minHeight: null,             // 최소 높이
			  maxHeight: null,             // 최대 높이
			  focus: true,                  // 에디터 로딩후 포커스를 맞출지 여부
			  lang: "ko-KR",					// 한글 설정
			  placeholder: '최대 2048자까지 쓸 수 있습니다',	//placeholder 설정
			  toolbar: [
				    ['groupName', ['list of button']],
				    ['fontname', ['fontname']],
				    ['fontsize', ['fontsize']],
				    ['style', ['bold', 'italic', 'underline','strikethrough', 'clear']],
				    ['color', ['forecolor','color']],
				    ['table', ['table']],
				    ['para', ['ul', 'ol', 'paragraph']],
				    ['height', ['height']],
				    ['insert',['picture','link','video']],
				    ['view', ['fullscreen', 'help']]
				  ],
				fontNames: ['Arial', 'Arial Black', 'Comic Sans MS', 'Courier New','맑은 고딕','궁서','굴림체','굴림','돋움체','바탕체'],
				fontSizes: ['8','9','10','11','12','14','16','18','20','22','24','28','30','36','50','72']
		      
			});
		});
	</script>
	