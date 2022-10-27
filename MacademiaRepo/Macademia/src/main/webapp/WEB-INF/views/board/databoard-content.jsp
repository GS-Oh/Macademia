<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

 <div class="board_wrap">
	<div class="board_title">
	    <strong>자료공유 게시판</strong>
	    <p>특정 게시판에 대한 간단한 설명~~</p>
	</div>
	<div class="board_list_wrap">
	    <div class="board_list">
	        <div class="top">
	            <div class="num">번호</div>
	            <div class="title">제목</div>
	            <div class="writer">글쓴이</div>
	            <div class="date">작성일</div>
	            <div class="count">조회</div>
	        </div>
	        <div>
	            <div class="num">5</div>
	            <div class="title"><a href="/md/board/detail">글 제목이 들어갑니다.</a></div>
	            <div class="writer">김이름</div>
	            <div class="date">2022.10.13</div>
	            <div class="count">33</div>
	        </div>
	        <div>
	            <div class="num">4</div>
	            <div class="title"><a href="/md/board/detail">글 제목이 들어갑니다.</a></div>
	            <div class="writer">김이름</div>
	             <div class="date">2022.10.13</div>
	            <div class="count">33</div>
	        </div>
	        <div>
	            <div class="num">3</div>
	            <div class="title"><a href="/md/board/detail">글 제목이 들어갑니다.</a></div>
	            <div class="writer">김이름</div>
	             <div class="date">2022.10.13</div>
	            <div class="count">33</div>
	        </div>
	        <div>
	            <div class="num">2</div>
	            <div class="title"><a href="/md/board/detail">글 제목이 들어갑니다.</a></div>
	            <div class="writer">김이름</div>
	             <div class="date">2022.10.13</div>
	            <div class="count">33</div>
	        </div>
	        <div>
	            <div class="num">1</div>
	            <div class="title"><a href="/md/board/detail">글 제목이 들어갑니다.</a></div>
	            <div class="writer">김이름</div>
	             <div class="date">2022.10.13</div>
	            <div class="count">33</div>
	        </div>
	    </div>
	    
	    <div class="board_page">
	        <a href="#" class="bt first"><<</a>
	        <a href="#" class="bt prev"><</a>
	        <a href="#" class="num on">1</a>
	   	     <a href="#" class="num">2</a>
	        <a href="#" class="num">3</a>
	        <a href="#" class="num">4</a>
	        <a href="#" class="num">5</a>
	        <a href="#" class="bt next">></a>
	        <a href="#" class="bt last">>></a>
	    </div>
	    
	    <div class="Search-area">
	        <div class="Search-area-content">
		        <select>
	        		<option value="">제목</option>
		        	<option value="">내용</option>
		        	<option value="">글쓴이</option>
		        	<option value="" selected="selected">전체</option>		
		        </select>
		        <input type="text" name="keyword" placeholder="입력해 주세요">
		        <input type="submit" value="검색하기">  	
	        </div>
	    </div>
	   
	    <div class="bt_wrap">
	        <a href="/md/board/write" class="on">등록</a>
	    </div>
	</div>
</div>
