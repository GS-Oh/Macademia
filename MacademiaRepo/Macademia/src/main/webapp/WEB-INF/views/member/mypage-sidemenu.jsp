<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<style>
    #mypage-sidemenu{
        width: 20vw;
        height: 100vh;
        background-color: rgb(133, 135, 203);
        font-size: 25px;
        padding-top: 20px;
    }
    #mypage-sidemenu > div{
        border: 1px solid black;
        width: 100%;
        text-align: center;
        
    }
    #logout-btn{
        
    }
</style>

<div id="mypage-sidemenu">
    <button id="logout-btn" onclick="">로그아웃</button>
    <div onclick="location.href='${root}/member/edit'">사원정보수정</div>
    <div onclick="location.href='${root}/member/myboards'">내가쓴게시글</div>
    <div onclick="location.href='${root}/member/myfiles'">개인자료실</div>

</div>

