<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<style>
	/* Font */
@import url('https://fonts.googleapis.com/css?family=Quicksand:400,700');

/* Design */
*,
*::before,
*::after {
  box-sizing: border-box;
}

html {
  background-color: #ecf9ff;
}

body {
  color: #272727;
  font-family: 'Quicksand', serif;
  font-style: normal;
  font-weight: 400;
  letter-spacing: 0;
}

.main{
  max-width: 1200px;
  margin: 0 auto;
}

h1 {
    font-size: 24px;
    font-weight: 400;
    text-align: center;
}

img {
  height: auto;
  max-width: 100%;
  vertical-align: middle;
}

.btn {
  color: #ffffff;
  padding: 0.8rem;
  font-size: 14px;
  text-transform: uppercase;
  border-radius: 4px;
  font-weight: 400;
  display: block;
  width: 100%;
  cursor: pointer;
  border: 1px solid rgba(255, 255, 255, 0.2);
  background: transparent;
}

.btn:hover {
  background-color: rgba(255, 255, 255, 0.12);
}

.cards {
  display: flex;
  flex-wrap: wrap;
  list-style: none;
  margin: 0;
  padding: 0;
}

.cards_item {
  display: flex;
  padding: 1rem;
}

@media (min-width: 40rem) {
  .cards_item {
    width: 50%;
  }
}

@media (min-width: 56rem) {
  .cards_item {
    width: 33.3333%;
  }
}

.card {
  background-color: white;
  border-radius: 0.25rem;
  box-shadow: 0 20px 40px -14px rgba(0, 0, 0, 0.25);
  display: flex;
  flex-direction: column;
  overflow: hidden;
}

.card_content {
  padding: 1rem;
  background: linear-gradient(to bottom left, #6667AB 40%, #FFC39E 100%);
}

.card_title {
  color: #ffffff;
  font-size: 1.1rem;
  font-weight: 700;
  letter-spacing: 1px;
  text-transform: capitalize;
  margin: 0px;
}

.card_text {
  color: #ffffff;
  font-size: 0.875rem;
  line-height: 1.5;
  margin-bottom: 1.25rem;    
  font-weight: 400;
}
.made_by{
  font-weight: 400;
  font-size: 13px;
  margin-top: 35px;
  text-align: center;
}
</style>
<div class="board_wrap">
	 <div class="main">
		<div class="board_title">
		    <strong>자유게시판</strong>
		    <p>특정 게시판에 대한 간단한 설명~~</p>
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
 