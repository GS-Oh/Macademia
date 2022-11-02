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
		        <c:forEach items="${boardList}" var="x" >
			    	<div class="num" >${x.no}</div>
			    	<div class="title title-center" style="text-align: center;"><a href="${root}/board/detail/${x.no}">${x.title}</a></div>
			    	<div class="writer">${x.userNo}</div>
			    	<div class="date">${x.regdate}</div>
			    	<div class="count">${x.hit}</div>
			    </c:forEach>
    		</div>
	    </div>
	    
	    <div class="board_page">
	    <c:set var="URL" value="${pageContext.request.requestURL}" />
	       <c:if test="${pageVo.startPage ne 1}">
	    	<a href="/md/board?${queryString}page=${pageVo.startPage - 1}" class="bt prev"><</a>    	
    		</c:if>
    	<c:forEach begin="${pageVo.startPage}" end="${pageVo.endPage}" var="i">    		    		    	
	    	<a href="/md/board?${queryString}page=${i}" class="num">${i}</a>
    	</c:forEach>
	    <c:if test="${pageVo.endPage ne pageVo.maxPage}">
	    	<a href="/md/board?${queryString}page=${pageVo.endPage + 1}" class="bt next">></a>	    
	    </c:if>	
	       
	    </div>
	    
	    <div class="Search-area">
	        <div class="Search-area-content">
         	<form id="searchForm" onsubmit="return false;">
		        <select id="condition">
	        		<option value="title">제목</option>
		        	<option value="content">내용</option>
		        	<option value="writer">글쓴이</option>	
		        </select >
		        <input id="keyword" type="text" placeholder="입력해 주세요">
		        <button id="send">검색하기</button>	
	        </form>
	        </div>
	    </div>
	   
	    <div class="bt_wrap">
	        <a href="/md/board/write" class="on">등록</a>
	    </div>
	</div>
</div>

<script>
	const send = document.getElementById("send");
	send.addEventListener("click", function () {
		var condition  = document.getElementById("condition");
		const conditionValue = (condition.options[condition.selectedIndex].value);
		const keywordValue = document.getElementById('keyword').value;
		alert(conditionValue);
		alert(keywordValue);
	 	location.href = "/md/board?" + conditionValue + "=" + keywordValue;
    });
</script>
