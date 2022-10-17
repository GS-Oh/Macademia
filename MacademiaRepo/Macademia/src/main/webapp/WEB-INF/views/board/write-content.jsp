<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<link rel="stylesheet" href="../resources/summernote/summernote-lite.css">
 		   <div class="board_wrap">
	        <div class="board_title">
	            <strong>게시판</strong>
	            <p>특정 게시판에 대한 간단한 설명~~</p>
	        </div>
	        <div class="board_write_wrap">
	           <form action="" method="post" enctype="multipart/form-data">
		            <div class="board_write">
		                <div class="title">
		                    <dl>
		                        <dt>제목</dt>
		                        <dd><input type="text" placeholder="제목 입력"></dd>
		                    </dl>
		                </div>
		                <div class="info">
		                    <dl>
		                        <dt>카테고리</dt>
		                        <dd><input type="text" placeholder="글쓴이 입력"></dd>
		                    </dl>
		                    <dl>
		                        <dt>첨부파일</dt>
		                        <dd><input type="file" placeholder="첨부파일"  multiple></dd>
		                    </dl>
		                </div>
		                <div class="cont">
						        <textarea id="summernote" name="editordata"></textarea>
				                  
		                </div>
		            </div>
		            <div class="bt_wrap">
		                <a href="view.html" class="on">등록</a>
		                <a href="/md/board/main">취소</a>
		            </div>
	            </form>
	        </div>
	    </div>
   	
   	<script src="../resources/summernote/summernote-lite.js"></script>
	<script src="../resources/summernote/summernote-ko-KR.js"></script>
	
	<script type="text/javascript">


		$(document).ready(function() {
		//여기 아래 부분
		$('#summernote').summernote({
			  height: 400,                 // 에디터 높이
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
				fontSizes: ['8','9','10','11','12','14','16','18','20','22','24','28','30','36','50','72'],
				callbacks: {	//여기 부분이 이미지를 첨부하는 부분
					onImageUpload : function(files) {
						uploadSummernoteImageFile(files[0],this);
					},
					onPaste: function (e) {
						var clipboardData = e.originalEvent.clipboardData;
						if (clipboardData && clipboardData.items && clipboardData.items.length) {
							var item = clipboardData.items[0];
							if (item.kind === 'file' && item.type.indexOf('image/') !== -1) {
								e.preventDefault();
							}
						}
					}
				}
		      	
			});
		});
	</script>
	

