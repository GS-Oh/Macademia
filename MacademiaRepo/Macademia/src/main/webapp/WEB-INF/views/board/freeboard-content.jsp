<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<div class="board_wrap">
	 <div class="main">
		<div class="board_title">
		    <strong>자유게시판</strong>
		    
		</div>
	  <ul class="cards"> 
	    <c:if test="${empty boardList}">
	    	<h1>현재 게시글이 없습니다. 게시글을 작성해 주세요</h1>
	    </c:if>
	    
	    <c:forEach items="${boardList}" var="x" >
	    <li class="cards_item">
	      <div class="card">
	        <div class="card_image">
	        <c:if test= "${!empty x.thumbnail }">
	        	<img src="../resources/upload/board/free/${x.thumbnail}" style="width: 500px; height: 300px;"></div>
	        </c:if>
	        <c:if test= "${empty x.thumbnail }">
	        	<img src="../resources/upload/board/썸네일.jpg" style="width: 500px; height: 300px;"></div>
	        </c:if>
	        <div class="card_content">
	          <h2 class="card_title">${x.userNo}</h2>
	          <p class="card_text">${x.title}
	          </p>
      	      <button class="btn card_btn" onClick="location.href='/md/board/free/detail/${x.no}'">Read More</button>
	        </div>
	      </div>
	    </li>
	    </c:forEach>
	  </ul>
		
		<div class="board_page">
	    <c:set var="URL" value="${pageContext.request.requestURL}" />
	       <c:if test="${pageVo.startPage ne 1}">
	    	<a href="/md/board/free?${queryString}page=${pageVo.startPage - 1}" class="bt prev"><</a>    	
    		</c:if>
    	<c:forEach begin="${pageVo.startPage}" end="${pageVo.endPage}" var="i">    		    		    	
	    	<a href="/md/board/free?${queryString}page=${i}" class="num">${i}</a>
    	</c:forEach>
	    <c:if test="${pageVo.endPage ne pageVo.maxPage}">
	    	<a href="/md/board/data?${queryString}page=${pageVo.endPage + 1}" class="bt next">></a>	    
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
		        <button id="send" style="background-color: #6667AB; color: white; border-radius: 4px 4px 4px 4px">검색하기</button>	
	        </form>
	        </div>
	    </div>
	  
	   <div class="bt_wrap">
	       <c:if test="${!empty loginMember}">
	       <a href="/md/board/free/write" class="on">등록</a>
	        </c:if>
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
	 	location.href = "/md/board/free?" + conditionValue + "=" + keywordValue;
    });
</script>
 