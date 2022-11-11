<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<c:set var="root" value="${pageContext.request.contextPath}"/>

<!-- 부트스트랩 -->
<!-- CSS only -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">
<!-- JavaScript Bundle with Popper -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3" crossorigin="anonymous"></script>

<style>
    /* 헤더 공통 */
    #header-wrap{
        width: 100%;
        height: 100%;
        padding: 1vw;
        box-sizing: border-box;
        display: flex;
    }
    a{
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
	#log{
	width:150px;
	height:59px;
	margin-right:70px;
	}
    #logo-area{
        width: 15vw;
        display: flex;
        justify-content: center;
        align-items: center;
    }
/* 헤더 메뉴 */
    #nav-area{
        width: 60vw;
        padding: 0vw 6vw;
        display: grid;
        grid-template-columns: repeat(11, 4vw);
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
        <a href="${root}/member/login">
            <img src="${root}/resources/img/logo/logo1.png"id="log" width="100%" alt="로고">
        </a>
    </div>
    <div id="nav-area">
        <div id="nav-menu1">
            <a href="${root}/member/login">
                <i class="fa-solid fa-house fa-2x"></i><br>
                <label for="">홈</label>
            </a>
        </div>
        <%-- <div id="nav-menu2">
            <a href="${root}/employee/myAtdc">
                <i class="fa-solid fa-business-time fa-2x"></i><br>
                <label for="">근무</label>
            </a>
        </div> --%>
        <div id="nav-menu3">
            <a href="${root}/academy/roll/1">
                <i class="fa-solid fa-chalkboard-user fa-2x"></i><br>
                <label for="">학사</label>
            </a>
        </div>
        <div id="nav-menu4">
            <a href="${root}/organization/tree">
            	<i class="fa-solid fa-sitemap fa-2x"></i><br>
                <label for="">조직도</label>
            </a>
        </div>
        <div id="nav-menu5">
            <a href="${root}/plan/list">
                <i class="fa-regular fa-calendar-days fa-2x"></i><br>
                <label for="">일정</label>
            </a>
        </div>
        <div id="nav-menu6">
            <a href="${root}/work/list/1">
                <i class="fa-solid fa-list-check fa-2x"></i><br>
                <label for="">업무</label>
            </a>
        </div>
        <div id="nav-menu7">
            <a href="${root}/sign/list/1">
                <i class="fa-solid fa-clipboard-check fa-2x"></i><br>
                <label for="">결재</label>
            </a>
        </div>
        <div id="nav-menu8">
            <a href="${root}/board/free">
                <i class="fa-regular fa-note-sticky fa-2x"></i><br>
                <label for="">게시판</label>
            </a>
        </div>
        <div id="nav-menu9">
            <a href="${root}/payroll/history">
                <i class="fa-regular fa-credit-card fa-2x"></i><br>
                <label for="">급여</label>
            </a>
        </div>
        <div id="nav-menu10">
            <a href="${root}/messenger/main">
                <i class="fa-solid fa-comments fa-2x"></i><br>
                <label for="">메신저</label>
            </a>
        </div>
        <div id="nav-menu11">
            <a href="${root}/mail/main">
                <i class="fa-solid fa-envelope fa-2x"></i><br>
                <label for="">메일</label>
            </a>
        </div>
        <div id="nav-menu12">
            <a href="${root}/admin/main">
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
            <a href="${root}/member/mypage">
                <i class="fa-solid fa-circle-user fa-2x"></i>
            </a>
        </div>
    </div>
</div>