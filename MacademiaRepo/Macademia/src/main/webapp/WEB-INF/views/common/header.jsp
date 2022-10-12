<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<style>
    /* 헤더 공통 */
    #header-wrap{
        width: 100%;
        height: 100%;
        padding: 1vw;
        box-sizing: border-box;
        display: flex;
    }
    #header-wrap a{
        text-decoration: none;
    }
    #header-wrap i, #header-wrap label{
        color: #6667AB;
    }
    #header-wrap a:hover i, #header-wrap a:hover label{
        color:#1315a6;
        font-weight: bolder;
        cursor: pointer;
    }
/* 헤더 로고부분 */
    #logo-area{
        width: 19vw;
        display: flex;
        justify-content: center;
        align-items: center;
    }
/* 헤더 메뉴 */
    #nav-area{
        width: 60vw;
        padding: 0vw 6vw;
        display: grid;
        grid-template-columns: repeat(10, 4vw);
        justify-content: center;
    }
    #nav-area a, #alert-area a{
        width: 100%;
        height: 100%;
        display: flex;
        flex-wrap: wrap;
        align-items: center;
        justify-content: center;
    }
    #nav-area a>i, #nav-area a>label{
        width: 100%;
        text-align: center;
    }
/* 헤더 우측 */
    #alert-area{
        width: 19vw;
        display: grid;
        grid-template-columns: repeat(2, 3vw);
        grid-template-rows: 3vw;
        justify-content: end;
    }
    #alert-icon, #mypage-icon{
        margin: 10px;
       
    }
</style>

<div id="header-wrap">
    <div id="logo-area">
        <a href="">
            <img src="" alt="로고">
        </a>
    </div>
    <div id="nav-area">
        <div id="nav-menu1">
            <a href="">
                <i class="fa-solid fa-house fa-2x"></i><br>
                <label for="">홈</label>
            </a>
        </div>
        <div id="nav-menu2">
            <a href="">
                <i class="fa-solid fa-people-group fa-2x"></i><br>
                <label for="">직원</label>
            </a>
        </div>
        <div id="nav-menu3">
            <a href="">
                <i class="fa-solid fa-chalkboard-user fa-2x"></i><br>
                <label for="">학생</label>
            </a>
        </div>
        <div id="nav-menu4">
            <a href="">
                <i class="fa-regular fa-calendar-days fa-2x"></i><br>
                <label for="">일정</label>
            </a>
        </div>
        <div id="nav-menu5">
            <a href="">
                <i class="fa-solid fa-list-check fa-2x"></i><br>
                <label for="">업무</label>
            </a>
        </div>
        <div id="nav-menu6">
            <a href="">
                <i class="fa-solid fa-clipboard-check fa-2x"></i><br>
                <label for="">결재</label>
            </a>
        </div>
        <div id="nav-menu7">
            <a href="">
                <i class="fa-regular fa-note-sticky fa-2x"></i><br>
                <label for="">게시판</label>
            </a>
        </div>
        <div id="nav-menu8">
            <a href="">
                <i class="fa-regular fa-credit-card fa-2x"></i><br>
                <label for="">급여</label>
            </a>
        </div>
        <div id="nav-menu9">
            <a href="">
                <i class="fa-solid fa-comments fa-2x"></i><br>
                <label for="">메신저</label>
            </a>
        </div>
        <div id="nav-menu10">
            <a href="">
                <i class="fa-solid fa-user-gear fa-2x"></i><br>
                <label for="">관리자</label>
            </a>
        </div>
    </div>
    <div id="alert-area">
        <div id="alert-icon">
            <a href="">
                <i class="fa-solid fa-bell fa-2x"></i>
            </a>
        </div>
        <div id="mypage-icon">
            <a href="">
                <i class="fa-solid fa-circle-user fa-2x"></i>
            </a>
        </div>
    </div>
</div>