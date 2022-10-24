<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <link rel="stylesheet" href="../resources/summernote/summernote-lite.css">
		
		<article id="content">
				<section class="mail-section">
					<div class="mail-content">
						<div class="mail-title">메일읽기</div>
						<div class="mail-write">
							<div class="form-group input-group">
								<label for="">보낸 사람</label>
								<input type="text" class='form-control' value="보낸 사람 이름" readonly="readonly">
							</div>
							<div class="form-group input-group">
								<label for="">제목</label>
								<input type="text" class='form-control' value="클릭한 제목" readonly="readonly">
							</div>
							<div class="form-group input-group">
								<label for="">파일첨부</label>
								<input type="file" class='form-control' multiple>
							</div>
							<div class="form-group">
								<textarea readonly="readonly">여기엔 내용이 가득</textarea>
							</div>
						</div>
					</div>
				</section>
				<aside class="search-aside">
				</aside>
			</article>
		</script>