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
        margin: 30px 0;
        font-size: 35px;
        font-weight: 600;
        color: rgb(67, 67, 67);
    }
    table{
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
        <a href="" class="btn btn-outline-secondary">&lt;&lt;</a>
        <a href="" class="btn btn-outline-secondary">&lt;</a>
        <a href="" class="btn btn-outline-secondary">1</a>
        <a href="" class="btn btn-outline-secondary">2</a>
        <a href="" class="btn btn-outline-secondary">3</a>
        <a href="" class="btn btn-outline-secondary">4</a>
        <a href="" class="btn btn-outline-secondary">5</a>
        <a href="" class="btn btn-outline-secondary">&gt;</a>
        <a href="" class="btn btn-outline-secondary">&gt;&gt;</a>
    </div>


</div>