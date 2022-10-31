<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    
	<!DOCTYPE html>
	<html>
		<head>



<meta charset="UTF-8">
<title>Insert title here</title>

	<%@ include file="/resources/css/common/common.css" %>
	
	<style>
	    <%@ include file="/resources/css/messenger/commonAside.css" %>


		main{
			display: grid;
			grid-template-rows: 5% 90% ;
			border-radius : 10px;
		}

        main>form{
            display: grid;
            grid-template-rows: 20% 70%;
            margin-top: 30px;
        }


		#edit-title{
			display: grid;
			align-items: center;
		}

		#edit-title>h1{
			border-left: 5px solid lightseagreen;
			padding-left : 15px;
			margin-top: 3%;
		}

		#detail-header{
			font-size: 1.5rem;
			display: grid;
			grid-template-columns: 6% 74% 10% 10%;
			align-items: center;
		}

		#detail-header > div{
			display: grid;
			justify-items: center;
		}


		#detail-content > a{
			text-decoration: none;
			margin-right: 20px;
		}

		#detail-content > textarea{
			border: 3px solid lightseagreen;
			width: 100%;
			height: 90%;
		}


		
    </style>
</head>
<body>
		


    <div id="wrap">

		<header>
			<%@include file="/WEB-INF/views/common/header.jsp" %>
        </header>
		<aside>		
			<%@ include file="/WEB-INF/views/messenger/commonAside.jsp" %>
		</aside>        

        <main>

			<div id="edit-title"><h1>공지글 작성하기</h1></div>

            <link rel="stylesheet" href="${root}/resources/summernote/summernote-lite.css">
		    <script src="${root}/resources/summernote/summernote-lite.js"></script>
			<script src="${root}/resources/summernote/summernote-ko-KR.js"></script>
			
			
            <form action="" method="post"> 
            
	            <div id="detail-header">
                    <div><span  class="badge bg-info" >공지</span></div>
                    <div><h3 style="width:100%; height: 100%;"><input type="text" name="title" style="width: 100%; height: 100%;" required></h3></div>
                </div>
				<div id="detail-content">
					<textarea placeholder="내용 입력" id="summernote" name="content"></textarea>
					
					<input type="submit" class="btn btn-info btn-lg" value="작성하기" style="margin-top: 20px;">
					<a href="/md/messenger/notice/1" class="btn btn-light btn-lg" style="margin-top: 20px;">돌아가기</a>
	            </div>

			</form>

            
            
            
			</div>
        </main>

    </div>
	
	<script>
		$(document).ready(function() {
			//여기 아래 부분
			$('#summernote').summernote({
				  height: 500,                 // 에디터 높이
				  minHeight: 500,             // 최소 높이
				  maxHeight: 800,             // 최대 높이
				  focus: true,                  // 에디터 로딩후 포커스를 맞출지 여부
				  lang: "ko-KR",					// 한글 설정
				  toolbar: [
					    // [groupName, [list of button]]
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
					placeholder: '최대 2048자까지 쓸 수 있습니다'	//placeholder 설정
			});
		});
		
		
	</script>
</html>