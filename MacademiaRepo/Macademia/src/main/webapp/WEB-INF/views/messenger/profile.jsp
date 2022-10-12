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
			grid-template-rows: 1fr 3fr 2fr;
		}

		#profile-main-content{
			display: grid;
			grid-template-columns: 1.5fr 1.5fr 1fr;
			grid-template-rows: 1fr 1fr 1fr;
		}

		#profile-bottom-content{
			display: grid;
			grid-template-rows: repeat(3, 1fr);
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
            <div><a href="">채팅</a></div>
            <div><a href="">쪽지</a></div>
            <div><a href="">파일보관함</a></div>
            <div><a href="">공지톡</a></div>
			<div></div>
            <div><a href="">메신저 알림</a></div>
            <div><a href="">메신저 환경설정</a></div>
        </aside>

        <main>
            
			<div><h2>기본 프로필 관리</h2></div>
			<div id="profile-main-content">
				<div style="grid-row: span 2;"><img src="" alt=""> </div>
				<div>직원명</div>
				<div>3-공백</div>
				<div style="grid-row: span 2;">자기소개글</div>
				<div><button onclick="">편집</button></div>
				<div>6-공백 or 프로필사진이름</div>
				<div>7-공백</div>
			</div>
			<div id="profile-bottom-content">
				<div>부서명-직책</div>
				<div>개인정보들</div>
				<div>개인정보들</div>
			</div>
			
        </main>


    </div>

</html>