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
                    <textarea placeholder="내용 입력" id="weditor" name="weditor">
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