<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
 
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
					        <textarea name="weditor" id="weditor" 
			                  placeholder="내용을 입력해주세요"></textarea>
	                </div>
	            </div>
	            <div class="bt_wrap">
	                <a href="view.html" class="on">등록</a>
	                <a href="/md/board/main">취소</a>
	            </div>
            </form>
        </div>
    </div>
   	
   	<script src="../resources/smarteditor/js/HuskyEZCreator.js" charset="utf-8"></script>
	<script type="text/javascript">
		var oEditors = [];

		nhn.husky.EZCreator.createInIFrame({

		    oAppRef: oEditors,

		    elPlaceHolder: "weditor",

		    sSkinURI: "../resources/smarteditor/SmartEditor2Skin.html",

		    fCreator: "createSEditor2"

		});
		
		submitPost = function() {
			  oEditors.getById["editorTxt"].exec("UPDATE_CONTENTS_FIELD", [])
			  let content = document.getElementById("weditor").value

			  if(content == '') {
			    alert("내용을 입력해주세요.")
			    oEditors.getById["editorTxt"].exec("FOCUS")
			    return
			  } else {
			    console.log(content)
			  }
			}
	</script>
	 

	

