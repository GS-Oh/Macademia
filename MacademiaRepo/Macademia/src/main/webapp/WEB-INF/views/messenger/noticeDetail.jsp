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
			grid-template-rows: 10% 50% ;
		}

		#detail-header{
			display: grid;
			grid-template-columns: 10% 60% 15% 15%;
		}


		#reply-list{
			display: grid;
			grid-template-columns: 2fr 9fr;
			grid-template-rows: repeat(3, 1fr);
		}

		#reply-insert{
			height: 200px;
			margin-top: 30px;
			display: grid;
			grid-template-rows: 50px 100px 50px;
			border: 1px solid gray;
			border-radius: 10px;
		}

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
            <div><a href="/md/messenger/note">채팅</a></div>
            <div><a href="/md/messenger/note">쪽지</a></div>
            <div><a href="/md/messenger/fileBox">파일보관함</a></div>
            <div><a href="/md/messenger/notice">공지톡</a></div>
			<div></div>
            <div><a href="">메신저 알림</a></div>
            <div><a href="">메신저 환경설정</a></div>
        </aside>

        <main>
            <!--  -->
			<div id="detail-header">
				<div>공지</div>
				<div>[스팸대전 그후] 그 많던 스팸은 어디로 갔을까요?</div>
				<div>조회 수 : 3</div>
				<div>댓글 수 : 3</div>
			</div>

			<!--  -->
			<div id="detail-content">

				<textarea name="" id="" cols="30" rows="10" style="width: 90%; height: 90%;">

				</textarea>

			</div>

			<!--  -->
			<div style="text-align: right;">
				<a href="">수정하기</a>
				<a href="">삭제하기</a>
			</div>

			<!--  -->
			<div id="reply-area">

				<h3>댓글</h3>

				<div id="reply-list">

					<div style="grid-row: span 3;"><img src="" alt="">1</div>
					<div>작성자닉네임</div>
					<div>내용</div>
					<div>작성일자</div>

				</div>


				<div id="reply-insert">

					<h5>로그인한사람닉네임</h5>
					<textarea name="" id="" cols="30" rows="10">

					</textarea>
					<button style="width: 50%; ">댓글작성</button>

				</div>




			</div>

        </main>


    </div>

</html>