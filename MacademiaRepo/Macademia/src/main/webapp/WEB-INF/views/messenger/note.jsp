<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
	<style>
	    /* 공통 */
	    html, body{
	        padding: 0px;
	        margin: 0px;
	    }
	    div, aside, main, header, input {
	        box-sizing: border-box;
	    }
	
	    #wrap{
	        border: 3px solid black;
	        width: 80vw;
	        height: 80vh;
	        display: grid;
	        grid-template-columns: 2fr 8fr;
	        grid-template-rows: 1fr 9fr;
	    }
	    
	    header{
	        border: 1px solid black;
	        grid-column: span 2;
	        display: flex;
	        justify-content: space-between;
	    }
	    
	    header > div{
	        border: 1px solid pink;
	        width: 30%;
	        height: 100%;
	        display: flex;
	        text-align: center;
	        align-items: center;
	    }
	
		#header-search-area{
			display: flex;
		}

	    .header-img-outer{
	        height: 100%;
	        width: 30%;
	        border: 1px solid pink;
	    }
	
	    aside{
	        border: 1px solid black;
	        padding-top: 50px;
	        display: grid;
	        grid-template-rows: repeat(6, 1fr) 2fr 1fr 1fr;
	        place-content: center;
	        justify-items: center;
	    }
	
	    aside div {
	        font-size: 1.2rem;
	    }
	
	    aside div a{
	        text-decoration: none;
	        color: blue;
	    }
	
		/* 공통 끝 */



		main{
			display: grid;
			grid-template-rows: 20% 7% 40% 30%;
		}

		#note-header-area{
			display: grid;
			grid-template-columns: repeat(4, 1fr);
			justify-items: center;
		}

		#note-header-area > a{
			width: 90%;
			height: 90%;
			text-align: center;
			margin-top: 5%;
			border: 1px solid #6667AB;
		}

		.header-area-content{
			display: grid;
			height: 100%;
			grid-template-rows: 1.5fr 0.5fr;
		}

		#note-search-area > form{
			height: 100%;
			border: 1px solid black;
			display: grid;
			grid-template-columns: 10% 70% 20%;
			justify-items: center;
		}

		#note-search-area > form > div > *{
			height: 100%;	
			border: 1px solid black;
		}


		#note-info-area{
			display: grid;
			grid-template-columns: 1fr 1fr 1fr 2fr 1fr;
			grid-template-rows: repeat(6, 1fr);
			justify-items: center;
			border: 1px solid #6667AB;
		}

		#note-detail-area{
			display: grid;
			grid-template-columns: 2fr 8fr;
			grid-template-rows: repeat(5,1fr) 2fr;
		}

		/* #1315a6 #6667AB */
    </style>
</head>
<body>


    <div id="wrap">

        <header>
            
            <!-- 로고 / 급여관리 -->
            <div>
                <div class="header-img-outer">
                    <img alt="로고" src="">
                </div>
                <div>
                    <h1><a href="/md/messenger/main">메신저</a></h1>
                </div>
            </div>

            <!-- 프로필 사진, 직원명 부서명 직책 -->
            <div style="width: 50%;">
				<div id="header-search-area">
					<input type="text" name="">
					<input type="submit" value="검색">
				</div>
                <div class="header-img-outer">
                    <img alt="프로필 사진" src="">
                </div>
                <div>
                    <h4>직원명</h4>
                    <h4>부서명-직책</h4>
                </div>
            </div>

        </header>

        <aside>
            <div><a href="">홈</a></div>
            <div><a href="/md/messenger/profile">나의 프로필</a></div>
            <div><a href="">채팅</a></div>
            <div><a href="">쪽지</a></div>
            <div><a href="">파일보관함</a></div>
            <div><a href="">공지톡</a></div>
			<div></div>
            <div><a href="">메신저 알림</a></div>
            <div><a href="">메신저 환경설정</a></div>
        </aside>

        <main>

           <!--  -->
			<div id="note-header-area">
				
				<a href="/md/messenger/note/write">
					<div class="header-area-content">
						<img src="" alt="">
						<h5>쪽지</h5>
					</div>
				</a>

				<a href="">
					<div class="header-area-content">
						<img src="" alt="">
						<h5>회신</h5>
					</div>
				</a>
				
				<a href="">
					<div class="header-area-content">
						<img src="" alt="">
						<h5>새로고침</h5>
					</div>
				</a>

				<a href="">
					<div class="header-area-content">
						<img src="" alt="">
						<h5>삭제</h5>
					</div>
				</a>

			</div>

			<!--  -->
			<div id="note-search-area">
				<form action="">
					<div>
						<select name="" id="">
							<option value="msgNo">보낸사람</option>
							<option value="recipientNo">받은사람</option>
							<option value="comment">내용</option>
						</select>
					</div>
					<div style="width: 100%;">
						<input type="text" name="" style="width: 100%;" >
					</div>
					<div>
						<input type="submit" value="검색하기">
					</div>
				</form>
			</div>


			<!--  -->
			<div id="note-info-area">
				<div>보낸사람</div>
				<div>받은사람</div>
				<div>첨부종류</div>
				<div>내용</div>
				<div>날짜</div>

				<div>보낸사람</div>
				<div>받은사람</div>
				<div>첨부종류</div>
				<div>내용</div>
				<div>날짜</div>

			</div>

			<!--  -->
			<div id="note-detail-area">
				<div>보낸 사람</div>
				<div>2</div>
				<div>받은 사람</div>
				<div>4</div>
				<div>제목</div>
				<div>6</div>
				<div>보낸 날짜</div>
				<div>8</div>
				<div>받은 날짜</div>
				<div>1</div>
				<div>내용</div>
				<div>3</div>
			</div>




        </main>


    </div>

</html>