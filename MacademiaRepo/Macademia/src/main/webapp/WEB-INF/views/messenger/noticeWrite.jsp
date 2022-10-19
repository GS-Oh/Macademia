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

            <!--  -->
            <form action="" method="post">
                <div id="detail-header">
                    <div><span  class="badge bg-info" >공지</span></div>
                    <div><h3 style="width:100%; height: 100%;"><input type="text" style="width: 100%; height: 100%;"></h3></div>
                </div>

                <!--  -->
                <div id="detail-content">

                    <textarea name="" id="" cols="30" rows="10"></textarea>

                    <input type="submit" class="btn btn-info btn-lg" value="작성하기" style="text-align:right;">
                    <a href="/md/messenger/notice/" class="btn btn-light btn-lg">돌아가기</a>
                </div>
            </form>


			
			

        </main>


    </div>

</html>