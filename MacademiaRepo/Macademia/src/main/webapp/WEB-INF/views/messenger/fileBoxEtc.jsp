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
			grid-template-rows: 40px auto;
		}

		#fileBox-header{
			display: grid;
			grid-template-columns: 1fr 1fr 1fr repeat(4, 1fr);
		}

		#fileBox-header a{
			text-decoration: none;
			color: white;
		}

		#fileBox-header>button{
			border: 1px solid darkgray;
			border-top-right-radius: 20px;
			border-top-left-radius: 20px;
			margin: 5px 5px 0px 0px;
			
		}


		#fileBox-header-image{
            background-color: gray;
        }
        
		#fileBox-header-etc{
            background-color: #1315a6;
		}


        /*  */

        #fileBox-etc-content{
            display: grid;
            grid-template-rows: repeat(5, 50px);
            grid-auto-rows: 50px;
            row-gap: 10px;

            padding-top: 30px;
            border-top: 3px solid gray;
        }
        
        .etc-content-file{
            
            display: grid;
            grid-template-columns: 50px auto auto;
            align-items: center;
        }

        .etc-content-file > div > span {
            font-size: 1.5rem;
        }

        .etc-content-file:hover{
            border-bottom: 2px solid #1315a6;
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
            
			<div id="fileBox-header">
				<!-- a링크 버튼 클릭 ajax활용해서 바꿔서 fileBox-Content 내용 바꿔주기 -->
				<button id="fileBox-header-image"><a href="/md/messenger/imgFileBox">이미지</a></button> 
				<button id="fileBox-header-etc"> <a href="/md/messenger/etcFileBox">기타</a> </button>
			</div>
			
			
			<div id="fileBox-etc-content">

				<c:forEach items="${FileVoList}" var="fileVo">
					
					<div  class="etc-content-file" data-bs-toggle="modal" data-bs-target="#myModal">
						
	                    
	                    <i class="file-img-area" style="font-size:36px"></i>
	                    
	                    
	                    <div style="display: none;" class="fileBox-fileNo">${fileVo.fileNo}</div>
	                    <div style="display: none;" class="fileBox-fileName">${fileVo.fileName}</div>
	                    <div> <span class="fileBox-originName">${fileVo.originName}</span></div> 
	                    <div style="text-align:right;"> <span class="" >${fileVo.enrollDate}</span></div> 
	                </div>
	                
					
				</c:forEach>
             
			</div>

		


        </main>


    </div>
  
    <!-- The Modal -->
    <div class="modal" id="myModal">
        <div class="modal-dialog modal-lg modal-dialog-centered">
        
            <div class="modal-content" style="width: 500px; text-align: center; background-color: #6667AB; color: white; border: 5px solid #6667AB;">
				
				<div style="margin: 20px;"><h1 id="modal-origin-name">스크립트로 여기에 파일원본명 들어오게 해놓음</h1></div>
				
				
                <div class="modal-content" style="padding: 30px;">
                    <a id="modal-fileName" class="btn btn-outline-dark" href=""><h3>전달하기</h3></a>
                    <a id="modal-delete" class="btn btn-outline-dark" href=""><h3>삭제하기</h3></a>
                </div>
             </div>
             
        </div>
    </div>



	<script>
	
			const fileBox = document.querySelectorAll('.etc-content-file');
	
			const fileNo = document.querySelectorAll('.fileBox-fileNo');
			const changeFileName = document.querySelectorAll('.fileBox-fileName');
			const originFileName = document.querySelectorAll('.fileBox-originName');
			
			const modalFileName = document.querySelector('#modal-fileName');
			const modalDelete = document.querySelector('#modal-delete');
			const modalOriginName = document.querySelector('#modal-origin-name');
			
			const fileImgArea = document.querySelectorAll('.file-img-area')
	
	
			for(let i=0; i<fileBox.length; ++i){
				
				// 확장자 명에 따른 아이콘 보여주기
				var checkEtc = (originFileName[i].innerText).slice(-3);
				switch(checkEtc){
					case 'pdf' : fileImgArea[i].className = "fa fa-file-pdf-o"; break;
					case 'ptx' : fileImgArea[i].className = "fa fa-file-powerpoint-o"; break;
					case 'hwp' : fileImgArea[i].className = "fa fa-file-word-o"; break;
					case 'zip' : fileImgArea[i].className = "fa fa-file-zip-o"; break;
					case 'lsx' : fileImgArea[i].className = "fa fa-file-excel-o"; break;
					case 'ell' : fileImgArea[i].className = "fa fa-file-excel-o"; break;
					default : fileImgArea[i].className = "fa fa-file-o"; 
				}


				fileBox[i].addEventListener('click',function(){
					
					modalFileName.href = '/md/messenger/fileSend/' + originFileName[i].innerText + '/' + changeFileName[i].innerText;
					modalDelete.href = '/md/messenger/fileBox/delete/'+ fileNo[i].innerText +'/'+ changeFileName[i].innerText;

					modalOriginName.innerText = originFileName[i].innerText;


				})
	
	
	
			}



	</script>


</html>