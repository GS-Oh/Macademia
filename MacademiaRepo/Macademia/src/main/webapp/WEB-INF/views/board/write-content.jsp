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
		                        <dd><input type="text" placeholder="OO 게시판" ></dd>
		                    </dl>
		                </div>
		                <div class="cont">
						        <textarea id="summernote" class="summernote" ></textarea>
				                  
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
	
	<script>
	// 툴바생략
	var setting = {
            height : 300,
            minHeight : null,
            maxHeight : null,
            focus : true,
            lang : 'ko-KR',
            toolbar: [
    		    // 글꼴 설정
    		    ['fontname', ['fontname']],
    		    // 글자 크기 설정
    		    ['fontsize', ['fontsize']],
    		    // 굵기, 기울임꼴, 밑줄,취소 선, 서식지우기
    		    ['style', ['bold', 'italic', 'underline','strikethrough', 'clear']],
    		    // 글자색
    		    ['color', ['forecolor','color']],
    		    // 표만들기
    		    ['table', ['table']],
    		    // 글머리 기호, 번호매기기, 문단정렬
    		    ['para', ['ul', 'ol', 'paragraph']],
    		    // 줄간격
    		    ['height', ['height']],
    		    // 그림첨부, 링크만들기, 동영상첨부
    		    ['insert',['picture','link','video']],
    		    // 코드보기, 확대해서보기, 도움말
    		    ['view', ['codeview','fullscreen', 'help']]
    		  ],
    		  // 추가한 글꼴
    		fontNames: ['Arial', 'Arial Black', 'Comic Sans MS', 'Courier New','맑은 고딕','궁서','굴림체','굴림','돋음체','바탕체'],
    		 // 추가한 폰트사이즈
    		fontSizes: ['8','9','10','11','12','14','16','18','20','22','24','28','30','36','50','72'],
            //콜백 함수
            callbacks : { 
            	onImageUpload : function(files, editor, welEditable) {
            // 파일 업로드(다중업로드를 위해 반복문 사용)
            for (var i = files.length - 1; i >= 0; i--) {
            uploadSummernoteImageFile(files[i],
            this);
            		}
            	}
            }
         };
        $('#summernote').summernote(setting);
     
        function uploadSummernoteImageFile(file, el) {
			data = new FormData();
			data.append("file", file);
			$.ajax({
				data : data,
				type : "POST",
				url : "/uploadSummernoteImageFile",
				contentType : false,
				enctype : 'multipart/form-data',
				processData : false,
				success : function(data) {
					$(el).summernote('editor.insertImage', data.url);
				}
			});
		}
</script>
		
	
	
	
        
        

	