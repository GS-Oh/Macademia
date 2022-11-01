<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<div class="board_wrap">
	 <div class="main">
		<div class="board_title">
		    <strong>자유게시판</strong>
		    
		</div>
	  <ul class="cards"> 
	    <li class="cards_item">
	      <div class="card">
	        <div class="card_image"><img src="https://picsum.photos/500/300/?image=10"></div>
	        <div class="card_content">
	          <h2 class="card_title">글 제목</h2>
	          <p class="card_text">글 내용이 들어갈 부분
	          </p>
      	      <button class="btn card_btn" onClick="location.href='/md/board/detail'">Read More</button>
	        </div>
	      </div>
	    </li>
	    
	    <li class="cards_item">
	      <div class="card">
	        <div class="card_image"><img src="https://picsum.photos/500/300/?image=5"></div>
	        <div class="card_content">
	          <h2 class="card_title">글 제목</h2>
	          <p class="card_text">글 내용이 들어갈 부분</p>
	          <button class="btn card_btn">Read More</button>
	        </div>
	      </div>
	    </li>
	    <li class="cards_item">
	      <div class="card">
	        <div class="card_image"><img src="https://picsum.photos/500/300/?image=11"></div>
	        <div class="card_content">
	          <h2 class="card_title">글 제목</h2>
	          <p class="card_text">글 내용이 들어갈 부분</p>
	          <button class="btn card_btn" onClick="location.href='/md/board/detail'">Read More</button>
	        </div>
	      </div>
	    </li>
	    
	    <li class="cards_item">
	      <div class="card">
	        <div class="card_image"><img src="https://picsum.photos/500/300/?image=14"></div>
	        <div class="card_content">
	          <h2 class="card_title">글 제목</h2>
	          <p class="card_text">글 내용이 들어갈 부분</p>
	          	          <button class="btn card_btn" onClick="location.href='/md/board/detail'">Read More</button>
	        </div>
	      </div>
	    </li>
	    
	    <li class="cards_item">
	      <div class="card">
	        <div class="card_image"><img src="https://picsum.photos/500/300/?image=17"></div>
	        <div class="card_content">
	          <h2 class="card_title">글 제목</h2>
	          <p class="card_text">글 내용이 들어갈 부분</p>
	          	          <button class="btn card_btn" onClick="location.href='/md/board/detail'">Read More</button>
	        </div>
	      </div>
	    </li>
	    
	    <li class="cards_item">
	      <div class="card">
	        <div class="card_image"><img src="https://picsum.photos/500/300/?image=2"></div>
	        <div class="card_content">
	          <h2 class="card_title">글 제목</h2>
	          <p class="card_text">글 내용이 들어갈 부분</p>
	          	          <button class="btn card_btn" onClick="location.href='/md/board/detail'">Read More</button>
	        </div>
	      </div>
	    </li>
	  </ul>
		
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
 