<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<c:set var="root" value="${pageContext.request.contextPath}" />
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

		.main-content-wrap{
			border: 1px solid black;
			display: flex;
			flex-wrap: wrap;
			height: auto;
		}

		.messenger-main-content{
			height: 15%;
			width: 30%;
			display: grid;
			grid-template-columns: 1.5fr 1fr;
			border: 2px dashed lightblue;
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
            
			<!-- 부서 수 만큼 div 추가하기 (5개라고 생각하고 작성)-->
			<div><h2>개발부( 3명 )</h2></div>

			<!-- 얘로 감싸고 -->
			<div class="main-content-wrap">

				<!-- 직원 수 만큼 얘 반복 -->
				<div class="messenger-main-content">
					<div>
						<img alt="프로필사진" src="">
					</div>
					<div style="display: grid; grid-template-rows: 1fr 1fr 1fr;">
						<div>직원명</div>
						<div>부서명</div>
						<div>직책</div>
					</div>
				</div>

				<div class="messenger-main-content">
					<div>
						<img alt="프로필사진" src="">
					</div>
					<div style="display: grid; grid-template-rows: 1fr 1fr 1fr;">
						<div>직원명</div>
						<div>부서명</div>
						<div>직책</div>
					</div>
				</div><div class="messenger-main-content">
					<div>
						<img alt="프로필사진" src="">
					</div>
					<div style="display: grid; grid-template-rows: 1fr 1fr 1fr;">
						<div>직원명</div>
						<div>부서명</div>
						<div>직책</div>
					</div>
				</div><div class="messenger-main-content">
					<div>
						<img alt="프로필사진" src="">
					</div>
					<div style="display: grid; grid-template-rows: 1fr 1fr 1fr;">
						<div>직원명</div>
						<div>부서명</div>
						<div>직책</div>
					</div>
				</div>

			</div>

			<!--  -->
			<div><h2>영업부( 3명 )</h2></div>
			<div class="main-content-wrap">

				<div class="messenger-main-content">
					<div>
						<img alt="프로필사진" src="">
					</div>
					<div style="display: grid; grid-template-rows: 1fr 1fr 1fr;">
						<div>직원명</div>
						<div>부서명</div>
						<div>직책</div>
					</div>
				</div>

				<div class="messenger-main-content">
					<div>
						<img alt="프로필사진" src="">
					</div>
					<div style="display: grid; grid-template-rows: 1fr 1fr 1fr;">
						<div>직원명</div>
						<div>부서명</div>
						<div>직책</div>
					</div>
				</div><div class="messenger-main-content">
					<div>
						<img alt="프로필사진" src="">
					</div>
					<div style="display: grid; grid-template-rows: 1fr 1fr 1fr;">
						<div>직원명</div>
						<div>부서명</div>
						<div>직책</div>
					</div>
				</div><div class="messenger-main-content">
					<div>
						<img alt="프로필사진" src="">
					</div>
					<div style="display: grid; grid-template-rows: 1fr 1fr 1fr;">
						<div>직원명</div>
						<div>부서명</div>
						<div>직책</div>
					</div>
				</div>

			</div>
			<div><h2>개발부( 3명 )</h2></div>
			<div class="main-content-wrap">

				<div class="messenger-main-content">
					<div>
						<img alt="프로필사진" src="">
					</div>
					<div style="display: grid; grid-template-rows: 1fr 1fr 1fr;">
						<div>직원명</div>
						<div>부서명</div>
						<div>직책</div>
					</div>
				</div>

				<div class="messenger-main-content">
					<div>
						<img alt="프로필사진" src="">
					</div>
					<div style="display: grid; grid-template-rows: 1fr 1fr 1fr;">
						<div>직원명</div>
						<div>부서명</div>
						<div>직책</div>
					</div>
				</div><div class="messenger-main-content">
					<div>
						<img alt="프로필사진" src="">
					</div>
					<div style="display: grid; grid-template-rows: 1fr 1fr 1fr;">
						<div>직원명</div>
						<div>부서명</div>
						<div>직책</div>
					</div>
				</div><div class="messenger-main-content">
					<div>
						<img alt="프로필사진" src="">
					</div>
					<div style="display: grid; grid-template-rows: 1fr 1fr 1fr;">
						<div>직원명</div>
						<div>부서명</div>
						<div>직책</div>
					</div>
				</div>

			</div>
			<div><h2>개발부( 3명 )</h2></div>
			<div class="main-content-wrap">

				<div class="messenger-main-content">
					<div>
						<img alt="프로필사진" src="">
					</div>
					<div style="display: grid; grid-template-rows: 1fr 1fr 1fr;">
						<div>직원명</div>
						<div>부서명</div>
						<div>직책</div>
					</div>
				</div>

				<div class="messenger-main-content">
					<div>
						<img alt="프로필사진" src="">
					</div>
					<div style="display: grid; grid-template-rows: 1fr 1fr 1fr;">
						<div>직원명</div>
						<div>부서명</div>
						<div>직책</div>
					</div>
				</div><div class="messenger-main-content">
					<div>
						<img alt="프로필사진" src="">
					</div>
					<div style="display: grid; grid-template-rows: 1fr 1fr 1fr;">
						<div>직원명</div>
						<div>부서명</div>
						<div>직책</div>
					</div>
				</div><div class="messenger-main-content">
					<div>
						<img alt="프로필사진" src="">
					</div>
					<div style="display: grid; grid-template-rows: 1fr 1fr 1fr;">
						<div>직원명</div>
						<div>부서명</div>
						<div>직책</div>
					</div>
				</div>

			</div>

        </main>


    </div>

</html>