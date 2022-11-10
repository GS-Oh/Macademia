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

</style>

<div id="myboards-content">
    <h1>내가 쓴 게시글</h1>
    <hr>
    <table class="table table-hover">
        <thead id="signature-color">
            <tr>
            <th>번호</th>
            <th>제목</th>
            <th>글쓴이</th>
            <th>작성일</th>
            <th>조회</th>
            </tr>
        </thead>
        <tbody class="table-light table-hover">
            <c:forEach var="board" items="${boardList }">
                <tr>
                    <td></td>
                    <td class="title">F-35 Lightning II, 미국의 5세대 스텔스 다목적 전투기.</td>
                    <td class="writer">록히드마틴</td>
                    <td class="regdate">2022-10-19</td>
                    <td class="hit">12</td>
                </tr>
            </c:forEach>
        </tbody>
    </table>

    <div class="search-area">
        <form action="/md/myboard/list" method="get" id="searchForm"></form>
            <div id="search-area" class="input-group mb-3">
                <input type="text" id="search-input" class="form-control"  name="searchName" value="${searchName}" onkeyup="if(window.event.keyCode==13){page(1)}" placeholder="파일명을 입력해주세요">
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
        let title= document.querySelector('#title').value.trim();
        $.ajax({
            type: "get",
            url: "/md/myboard/list",
            data:{
                "page" : pno,
                "title" : title
            },
            success: function(response) {
                console.log("great!");
                // $('#myfile-content').replaceWith(response);
                // pageBtnColor(pno);
                // $('#title').focus();
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

<script>
    
</script>
