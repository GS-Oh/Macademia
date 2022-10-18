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
            grid-template-columns: 50px auto;
            align-items: center;
            

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
				<button id="fileBox-header-image"><a href="/md/messenger/fileBox">이미지</a></button> 
				<button id="fileBox-header-etc"> <a href="/md/messenger/fileBox/etc">기타</a> </button>
			</div>
			
			<div id="fileBox-etc-content">

				<div  class="etc-content-file" data-bs-toggle="modal" data-bs-target="#myModal">
                    <div> <img src="" alt="" width="40px" height="40px"></div> 
                    <div> <span>파일명</span></div> 
                </div>

                <div  class="etc-content-file" data-bs-toggle="modal" data-bs-target="#myModal">
                    <div> <img src="" alt="" width="40px" height="40px"></div> 
                    <div> <span>파일명</span></div> 
                </div>

                <div  class="etc-content-file" data-bs-toggle="modal" data-bs-target="#myModal">
                    <div> <img src="" alt="" width="40px" height="40px"></div> 
                    <div> <span>파일명</span></div> 
                </div>

                <div  class="etc-content-file" data-bs-toggle="modal" data-bs-target="#myModal">
                    <div> <img src="" alt="" width="40px" height="40px"></div> 
                    <div> <span>파일명</span></div> 
                </div>

                <div  class="etc-content-file" data-bs-toggle="modal" data-bs-target="#myModal">
                    <div> <img src="" alt="" width="40px" height="40px"></div> 
                    <div> <span>파일명</span></div> 
                </div>

                <div  class="etc-content-file" data-bs-toggle="modal" data-bs-target="#myModal">
                    <div> <img src="" alt="" width="40px" height="40px"></div> 
                    <div> <span>파일명</span></div> 
                </div>

                <div  class="etc-content-file" data-bs-toggle="modal" data-bs-target="#myModal">
                    <div> <img src="" alt="" width="40px" height="40px"></div> 
                    <div> <span>파일명</span></div> 
                </div>

                <div  class="etc-content-file" data-bs-toggle="modal" data-bs-target="#myModal">
                    <div> <img src="" alt="" width="40px" height="40px"></div> 
                    <div> <span>파일명</span></div> 
                </div>

                <div  class="etc-content-file" data-bs-toggle="modal" data-bs-target="#myModal">
                    <div> <img src="" alt="" width="40px" height="40px"></div> 
                    <div> <span>파일명</span></div> 
                </div>

             
				
			</div>

		


        </main>


    </div>
  
    <!-- The Modal -->
    <div class="modal" id="myModal">
        <div class="modal-dialog modal-sm modal-dialog-centered">
        
            <div class="modal-content">
    
                <div class="modal-content">
                    <a class="btn btn-outline-dark" href="">보내기</a>
                </div>
                <div class="modal-content">
                    <a class="btn btn-outline-dark" href="">삭제하기</a>
                </div>
     
             </div>
             
        </div>
    </div>




</html>