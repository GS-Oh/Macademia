<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

 <div class="board_wrap">
	<div class="board_title">
	    <strong>자료공유 게시판</strong>
	   
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
		        <c:forEach items="${voList}" var="x" >
			    	<div class="num" >${x.no}</div>
			    	<div class="title title-center" style="text-align: center;"><a href="${root}/board/detail/${x.no}">${x.title}</a></div>
			    	<div class="writer">${x.userNo}</div>
			    	<div class="date">${x.regdate}</div>
			    	<div class="count">${x.hit}</div>
			    </c:forEach>
    		</div>
	    </div>
	    
	    <div class="board_page">
	       <c:if test="${pv.startPage ne 1}">
	    	<a href="${root}/board/data/${pv.startPage - 1}" class="bt prev"><</a>    	
    		</c:if>
    	<c:forEach begin="${pv.startPage}" end="${pv.endPage}" var="i">    		    		    	
	    	<a href="${root}/board/data/${i}" class="num">${i}</a>
    	</c:forEach>
	    <c:if test="${pv.endPage ne pv.maxPage}">
	    	<a href="${root}/board/data/${pv.endPage + 1}" class="bt next">></a>	    
	    </c:if>	
	       
	    </div>
	    
	    <div class="Search-area">
	        <div class="Search-area-content">
         	<form action="/md/board/search/${i}" method="get" >
		        <select name="condition">
	        		<option value="title">제목</option>
		        	<option value="content">내용</option>
		        	<option value="userNo">글쓴이</option>
		        	<option value="" selected="selected">전체</option>		
		        </select >
			        <input type="text" name="keyword" placeholder="입력해 주세요">
			        <input type="submit" value="검색하기">  	
       		</div>
	        </form>
	    </div>
	   
	    <div class="bt_wrap">
	        <a href="/md/board/write" class="on">등록</a>
	    </div>
	</div>
</div>
