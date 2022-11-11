<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<style>
    #myboards-content{
        height: 80vh;
        width: 60vw;
        /* border: 1px solid black; */
        padding: 10px 0px;
        font-family:'AppleSDGothicNeo', 'Noto Sans KR', sans-serif;
    }
    select{
        width: 100px;
        height: 30px;
    }
    #search-btn{
        width: 50px;
        height: 30px;
        background-color: #7d7dbc;
        border: none;
        font-size: 13px;
    }
    #search-area, #pagination-area{
        width: 450px;
        margin:20px auto;
        text-align: center;
    }
    #pagination-area a{
        font-size: 20px;
        width: 40px;
        height: 40px;
        border-radius: 10px;
        margin: 0 2px;
        border: none;
        font-weight: 700;
    }
    #pagination-area a:hover{
        background-color: rgb(176, 171, 216);
        transition: 0.3s;
    }
    .page-btn{
        display: inline-block;
        border: 1px solid black;
        width: 30px;
        height: 30px;
    }
    h1{
        margin: 30px 0 10px;
        font-size: 35px;
        font-weight: 600;
        color: rgb(67, 67, 67);
    }
    table{
        margin-top : 20px;
        width: 80%;

    }
    #signature-color{
        background-color: rgb(133, 133, 200);
        color: white;
    }
    .title{
        width: 600px;
    }
    .title:hover{
        cursor: pointer;
    }
    .active{
        background-color: #7d7dbc !important;
    }

</style>

<div id="myboards-content">
    <h1>내가 쓴 게시글</h1>
    <hr>
    <table class="table table-hover">
        <thead id="signature-color">
            <tr>
                <th>번호</th>
                <th class="title">제목</th>
                <th>작성일</th>
                <th>조회</th>
            </tr>
        </thead>
        <tbody class="table-light table-hover">
            <c:forEach var="board" items="${boardList }">
                <tr>
                    <td>${board.no}</td>
                    <td class="title" onclick="detail('${board.no}','${board.categoryNo}')"><a>${board.title}</a></td>
                    <td>${board.regdate}</td>
                    <td>${board.hit}</td>
                </tr>
            </c:forEach>
        </tbody>
    </table>

    <div class="search-area">
        <form action="/md/myboard/list/1" method="get" id="searchForm">
            <div id="search-area" class="input-group mb-3">
                <select id="category-no" name="categoryNo" >
                    <option value="1">자유게시판</option>
                    <option value="2">자료공유게시판</option>
                </select>
                <input type="text" id="title" class="form-control"  name="title" value="${searchVo.title}" placeholder="파일명을 입력해주세요">
                <button type="submit" id="search-btn" class="btn btn-primary" >검색</button>
            </div>
        </form>
    </div>
    
    <div id="pagination-area">
    	<c:if test="${pageVo.startPage > 1 }">
	        <a class="btn btn-outline-secondary" onclick="page(1)">&lt;&lt;</a>
	        <a class="btn btn-outline-secondary" onclick="page('${pageVo.startPage-1 }')">&lt;</a>
        </c:if>
        <c:forEach begin="${pageVo.startPage }" end="${pageVo.endPage}" varStatus="status">
        	<a  class="btn btn-outline-secondary" onclick="page('${status.index }')">${status.index }</a>
        </c:forEach>
        <c:if test="${pageVo.endPage < pageVo.maxPage }">
        	<a class="btn btn-outline-secondary" onclick="page('${pageVo.endPage+1 }')">&gt;</a>
        	<a class="btn btn-outline-secondary" onclick="page('${pageVo.maxPage}')">&gt;&gt;</a>
        </c:if>
    </div>

</div>

<!-- 페이지버튼 클릭시 리스트 보여주기(ajax) -->
<script>

    function page(pno){
        let categeryNo = document.getElementById('category-no').value;
        let title= $('#title')[0].value.trim();
        location.href = "/md/myboard/list/"+pno+"?categoryNo="+categeryNo+"&title="+title;
    };

</script>



<!-- 게시판 카테고리 유지 -->
<script>
  let categeryNo = document.getElementById('category-no');
  let length = categeryNo.options.length; 
  for (let i=0; i<length; i++){  
    if(categeryNo.options[i].value == '${searchVo.categoryNo}'){
    	categeryNo.options[i].selected = true;
    }
  }  
</script>

<!-- 현재 페이지버튼에 색상추가 -->
<script>
    $(window).ready(pageBtnColor('${pageVo.currentPage}'));

    function pageBtnColor(pno){
        let pageBtns = $('#pagination-area > a');
        for(let i = 0 ; i<pageBtns.length ; i++){
            if(pageBtns[i].innerText==pno){
                $(pageBtns[i]).addClass('active');
            }
        }
    }
</script>

<!-- 게시글 상세보기 이동 -->
<script>
    function detail(boardNo,category){
        console.log(boardNo);
        console.log(category);
        if(category==1){
            location.href = '/md/board/free/detail/'+boardNo;
        }else{
            location.href = '/md/board/data/detail/'+boardNo;
        }
        
    }
</script>