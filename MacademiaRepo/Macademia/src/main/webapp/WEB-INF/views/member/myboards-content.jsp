<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <style>
        #myboards-content{
            height: 90vh;
            width: 60vw;
            border: 1px solid black;
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

    </style>
    
    <div id="myboards-content">
        <table class="table">
            <thead>
              <tr>
                <th>번호</th>
                <th>제목</th>
                <th>글쓴이</th>
                <th>작성일</th>
                <th>조회</th>
              </tr>
            </thead>
            
            <tbody>
              <c:forEach begin="1" end="5">
              <tr>
                <td>5</td>
                <td>제목제목제목</td>
                <td>본인</td>
                <td>2022-10-19</td>
                <td>50</td>
              </tr>
              </c:forEach>
            </tbody>
        </table>
        <form action="">
            <select name="board">
                <option>자유게시판</option>
                <option>1게시판</option>
                <option>2게시판</option>
                <option>3게시판</option>
            </select>
            <input type="text" name="search-query">
            <button id="search-btn" type="submit">검색</button>
        </form>
        <div id="pagination-area">
            <a href="" class="btn btn-outline-primary">&lt;&lt;</a>
            <a href="" class="btn btn-outline-primary">&lt;</a>
            <a href="" class="btn btn-outline-primary">1</a>
            <a href="" class="btn btn-outline-primary">2</a>
            <a href="" class="btn btn-outline-primary">3</a>
            <a href="" class="btn btn-outline-primary">4</a>
            <a href="" class="btn btn-outline-primary">5</a>
            <a href="" class="btn btn-outline-primary">&gt;</a>
            <a href="" class="btn btn-outline-primary">&gt;&gt;</a>
        </div>


    </div>