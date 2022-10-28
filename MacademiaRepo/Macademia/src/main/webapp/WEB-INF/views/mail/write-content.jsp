<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <link rel="stylesheet" href="../resources/summernote/summernote-lite.css">
		
		<article id="content">
				<section class="mail-section">
					<div class="mail-content">
						<div class="mail-title">메일쓰기</div>
						
						<div class="mail-write">
							<div class="form-group input-group">
								<label for="">받는 사람</label>
								<input type="text" class='form-control'>
							</div>
							<div class="form-group input-group">
								<label for="">제목</label>
								<input type="text" class='form-control'>
							</div>
							<div class="form-group input-group">
								<label for="">파일첨부</label>
								<input type="file" class='form-control' multiple>
							</div>
							<div class="form-group">
								<textarea class="summernote" id="summernote"></textarea>
							</div>
						</div>
						<div class="bt_wrap">
			                <a href="/md/mail/main" class="on">등록</a>
			                <a href="/md/mail/main">취소</a>
		           		</div>
					</div>
				</section>
				<aside class="search-aside">
				</aside>
			</article>
			
			<script src="../resources/summernote/summernote-lite.js"></script>
			<script src="../resources/summernote/summernote-ko-KR.js"></script>	
			<script>
			$(document).ready(function() {
			var toolbar = [
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
				  ];
			
			var setting = {
			           height : 300,
			           minHeight : null,
			           maxHeight : null,
			           focus : true,
			           lang : 'ko-KR',
			           toolbar : toolbar,
			           fontNames: ['Arial', 'Arial Black', 'Comic Sans MS', 'Courier New','맑은 고딕','궁서','굴림체','굴림','돋음체','바탕체'],
			      		fontSizes: ['8','9','10','11','12','14','16','18','20','22','24','28','30','36','50','72'],
			           //콜백 함수
			           callbacks : { 
			           	onImageUpload : function(files, editor, welEditable) {
			           // 파일 업로드(다중업로드를 위해 반복문 사용)
				            for (var i = files.length - 1; i >= 0; i--) {
				            	uploadSummernoteImageFile(files[i], this);
			           		}
			           	}
			           }
			        };
			       	$('#summernote').summernote(setting);
			       });
			       
					function readURL(file) {
					    return URL.createObjectURL(file);
					}
					
					function uploadSummernoteImageFile(file, el) {
			        	console.log(file);
			        	$(el).summernote('editor.insertImage', readURL(file));
						data = new FormData();
						data.append("file", file);
					}
			</script>