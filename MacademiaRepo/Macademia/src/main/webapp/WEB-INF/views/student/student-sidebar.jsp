<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<style>
    #side-wrap{
        font-size: 16px;
        color: white;
        background-color: #6667AB;
        width: 20vw;
        height: 90vh;
        padding: 10px;
    }
    #side-wrap a{
        color: white;
    }
    #side-wrap div{
        border: 1px solid black;
        margin: 10px;
    }
    .side-main-category>div{
        /* display: none; */
        font-size: 14px;
    }
</style>


<div id="side-wrap">
    
    <div class="side-main-category"><a href="${root}/student/main">수강생 관리</a>
    
        <div class="side-sub-category"><a href="${root}/student/roll">수강생 출결관리</a></div>
        <div class="side-sub-category"><a href="${root}/student/search">수강생 정보조회</a></div>

    </div>

    <div class="side-main-category">학사 관리

        <div class="side-sub-category"><a href="">커리큘럼 조회</a></div>
        <div class="side-sub-category"><a href="">수강생 평가</a></div>

    </div>
    
</div>
