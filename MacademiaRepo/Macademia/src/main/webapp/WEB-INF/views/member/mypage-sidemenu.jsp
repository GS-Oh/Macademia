<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<style>
    @import url('https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@700&display=swap');

    #mypage-sidemenu{
        width: 17vw;
        height: 90vh;
        background-color: rgb(133, 133, 200);
        font-size: 20px;
        text-align: end;
        font-family: 'Noto Sans KR', sans-serif;
        border-top-left-radius: 15px;
        border-bottom-left-radius: 15px;
    }
    #mypage-sidemenu > div{
        border-top: 1px solid rgb(222, 222, 222);
        color: white;
        width: 100%;
        height: 80px;
        text-align: center;
        
    }
    #logout-btn{
        display: inline-block;
        width: 140px;
        height: 40px;
        animation: warning 1s ease;
        animation-iteration-count: 1;
        margin-top: 10px;
        margin-bottom: 30px;  
        border: none;
        border-bottom-left-radius: 25px;
        border-top-left-radius: 25px;
        background-color: white;
        color: rgb(111, 111, 111);
        
    }
    #logout-btn:hover{
        background-color: rgb(111, 111, 111);
        color: white;
        transition: 0.4s;
    }
    @keyframes warning{
        0% {transform: translateX(100px);}
        50% {transform: translateX(0px); width: 170px;}
    }
    .menu:hover{
        cursor: pointer; 
        background-color: rgb(98, 92, 161);
        transition: 0.5s;
    }
</style>

<div id="mypage-sidemenu">
    <button id="logout-btn" onclick="location.href='${root}/member/logout'"><i class="fa-solid fa-arrow-right-from-bracket"></i> 로그아웃</button>
    <div class="menu" onclick="location.href='${root}/member/edit'">사원정보수정</div>
    <div class="menu" onclick="location.href='${root}/member/myboards'">내가쓴게시글</div>
    <div class="menu" onclick="location.href='${root}/member/myfiles'">개인자료실</div>
    <div class="menu" onclick="">조직도</div>
    <div></div>

</div>

