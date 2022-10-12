<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<style>
	#dashbrd-greeting{
		text-align: center;
	}
	#home-content-wrap{
		width: 60vw;
		display: grid;
		grid-template-columns: 2fr 1fr;
	}
	#home-content-wrap>div>div{
		box-sizing: border-box;
		padding: 10px;
		margin: 10px;
		border-radius: 15px;
		box-shadow: gray 1px 1px 3px 1px;
	}
	#home-content-wrap>div>div>div{
		margin: 10px;
	}
	#home-content-wrap>div>div>div:last-child{
		background-color: aliceblue;
		border-radius: 15px;
		height: 100px;
		padding: 10px;
	}
	
	#dash-emp-today-area{
	}
	#dash-notice-area{
	}
	#today-to-do{
	}
	#today-to-check{
	}
	#today-to-sign{
	}
</style>

<div id="dashbrd-greeting">
	<h3>님, 힘찬하루보내세요 :-)</h3>
	<button>출근하기</button><button>퇴근하기</button>
</div>

<div id="home-content-wrap">
	<div id="dashbrd-left">
		<div id="dash-emp-today-area">
			<div>
				<b>출근현황</b>
			</div>
			<div>
				현재 출근한 직원이 없습니다.
			</div>
		</div>
		<div id="dash-notice-area">
			<div>
				<b>공지사항</b>
			</div>
			<div>
				작성된 공지가 없습니다.
			</div>
		</div>	
	</div>

	<div id="dashbrd-right">
		<div id="today-to-do">
			<div>
				<b>오늘 할 일</b>
			</div>
			<div>
				오늘 할 일이 없습니다.
			</div>
		</div>
		<div id="today-to-check">
			<div>
				<b>결재 할 것</b>
			</div>
			<div>
				결재할 항목이 없습니다.
			</div>
		</div>
		<div id="today-to-sign">
			<div>
				<b>서명 할 것</b>
			</div>
			<div>
				서명할 항목이 없습니다.
			</div>
		</div>
	</div>
</div>