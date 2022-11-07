<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html>
<head>
	<title>게시판 작성페이지</title>
	<%@include file="/resources/css/common/common.css" %>
	<%@include file="/resources/css/board/board.css" %>
	<link rel="stylesheet" href="/md/resources/summernote/summernote-lite.css">
	<script src="/md/resources/summernote/summernote-lite.js"></script>
	<script src="/md/resources/summernote/summernote-ko-KR.js"></script>
</head>
<body>
	<div id="wrap">
		<header>
			<%@include file="/WEB-INF/views/common/header.jsp" %>
		</header>
		<aside>
			<%@include file="/WEB-INF/views/board/board-sidebar.jsp" %>
		</aside>
		<main>
			<%@include file="/WEB-INF/views/board/write-content.jsp" %>
		</main>
	</div>
	
	<script>
	 $(document).ready(function () {
         //여기 아래 부분
         $('#board_content').val("${board_data.BOARD_CONTENT}");
         $('#summernote').summernote({
             height: 400,                     // 에디터 높이
              minHeight: null,                      // 최소 높이
              maxHeight: null,                      // 최대 높이
             focus: false,                       // 에디터 로딩후 포커스를 맞출지 여부
             lang: "ko-KR",                  // 한글 설정
             placeholder: '내용을 입력해주세요.',   //placeholder 설정
             codemirror: { // codemirror options
                 theme: 'monokai'
             },
             /*   callbacks: {	//여기 부분이 이미지를 첨부하는 부분
                      onImageUpload : function(files) {
                          uploadSummernoteImageFile(files[0],this);
                      }
                  }, */
             toolbar: [
                 // [groupName, [list of button]]
                 ['fontname', ['fontname']],
                 ['fontsize', ['fontsize']],
                 ['style', ['bold', 'italic', 'underline', 'strikethrough', 'clear']],
                 ['color', ['color']],
                 ['table', ['table']],
                 ['para', ['ul', 'ol', 'paragraph']],
                 ['height', ['height']],
                 ['insert', ['picture', 'link', 'video']],
                 ['view', ['fullscreen', 'help']]
             ],
             fontNames: ['Arial', 'Arial Black', 'Comic Sans MS', 'Courier New', '맑은 고딕', '궁서', '굴림체', '굴림', '돋음체', '바탕체'],
             fontSizes: ['8', '9', '10', '11', '12', '14', '16', '18', '20', '22', '24', '28', '30', '36', '50', '72']
         });
     });
     /**
     * 이미지 파일 업로드
     */
     function uploadSummernoteImageFile(file, editor) {
         data = new FormData();
         data.append("file", file);
         $.ajax({
             data: data,
             type: "POST",
             url: "/uploadSummernoteImageFile",
             contentType: false,
             processData: false,
             success: function (data) {
                 //항상 업로드된 파일의 url이 있어야 한다.
                 $(editor).summernote('insertImage', data.url);
             }
         });
     }
	</script>
</body>
</html>
