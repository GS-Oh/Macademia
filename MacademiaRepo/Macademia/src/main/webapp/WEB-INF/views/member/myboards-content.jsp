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
    }
    form, #pagination-area{
        width: 300px;
        margin:20px auto;
        display: flex;
        justify-content: center;
    }
    #pagination-area{
        justify-content: space-between;
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

</style>

<div id="myboards-content">
    <h1>내가 쓴 게시글</h1>
    <hr>
    <table class="table table-hover">
        <thead id="signature-color">
            <tr>
            <th>번호</th>
            <th class="title">제목</th>
            <th>글쓴이</th>
            <th>작성일</th>
            <th>조회</th>
            </tr>
        </thead>
        
        <tbody class="table-light table-hover">
            <c:forEach begin="1" end="10">
                <tr>
                <td>5</td>
                <td class="title">F-35 Lightning II, 미국의 5세대 스텔스 다목적 전투기.</td>
                <td>록히드마틴</td>
                <td>2022-10-19</td>
                <td>50</td>
                </tr>
            </c:forEach>
        </tbody>
    </table>
    <form action="">
        <select name="board">
            <option>===선택===</option>
            <option>자유게시판</option>
            <option>1게시판</option>
            <option>2게시판</option>
            <option>3게시판</option>
        </select>
        <input type="text" name="search-query">
        <button id="search-btn" type="submit">검색</button>
    </form>
    <div id="pagination-area">
    	<c:if test="${pv.startPage > 1 }">
	        <a class="btn btn-outline-secondary" onclick="page(1)">&lt;&lt;</a>
	        <a class="btn btn-outline-secondary" onclick="page('${pv.startPage-1 }')">&lt;</a>
        </c:if>
        <c:forEach begin="${pv.startPage }" end="${pv.endPage}" varStatus="status">
        	<a  class="btn btn-outline-secondary" onclick="page('${status.index }')">${status.index }</a>
        </c:forEach>
        <c:if test="${pv.endPage < pv.maxPage }">
        	<a class="btn btn-outline-secondary" onclick="page('${pv.endPage+1 }')">&gt;</a>
        	<a class="btn btn-outline-secondary" onclick="page('${pv.maxPage}')">&gt;&gt;</a>
        </c:if>
    </div>


</div>

<!-- 페이지버튼 클릭시 리스트 보여주기(ajax) -->
<script>
    function page(pno){
        currentPage = pno;
        let searchName = document.querySelector('#search-input').value.trim();
        $.ajax({
            type: "post",
            url: "/md/myfile/list/"+pno,
            data:{
                'searchName' : searchName
            },
            success: function(response) {
                $('#myfile-content').replaceWith(response);
                makeShortName();
                pageBtnColor(pno);
                $('#search-input').focus();
            },
            error: function (response) {
                Swal.fire(
                '통신에러',
                '서버와의 통신에 문제가 있네요',
                'warning'
                )
            }
        });
    };
</script>
