<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<style>
    #mypage-sidemenu{
        width: 13vw;
        height: 90vh;
        border-top-right-radius: 15px;
        font-size: 16px;
        text-align: end;
        font-family: 'AppleSDGothicNeo', 'Noto Sans KR', sans-serif;
        background-color: #6667AB;
        color: white;
    }
    #mypage-sidemenu > div{
        border-top: 1px solid #dedede;
        width: 100%;
        height: 80px;
        text-align: center;
        
    }
    .menu:hover{
        cursor: pointer; 
        background-color: white;
        color: #6667AB;
        transition: 0.5s;
    }
</style>

<div id="mypage-sidemenu">
    <div></div>
    <div class="menu" onclick="location.href='${root}/organization/tree'">조직도</div>
    <div class="menu" onclick="location.href='${root}/organization/tree'">사원검색</div>
    <div></div>
</div>

