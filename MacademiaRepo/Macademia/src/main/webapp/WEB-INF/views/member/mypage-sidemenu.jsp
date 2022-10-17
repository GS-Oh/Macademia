<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<style>
    #mypage-sidemenu{
        width: 20vw;
        height: 100vh;
        background-color: rgb(133, 135, 203);
        font-size: 25px;
        padding: 10px;
    }
    #mypage-sidemenu > div{
        border: 1px solid black;
        width: 80%;
        text-align: center;
        margin: 40px;
    }
</style>

<div id="mypage-sidemenu">
    <div onclick="location.href='${root}/member/edit'">사원정보수정</div>
    <div onclick="location.href='${root}/member/myboards'">내가쓴게시글</div>
    <div onclick="location.href='${root}/member/myfiles'">개인자료실</div>

</div>

