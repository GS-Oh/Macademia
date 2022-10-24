<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<style>
    @font-face {
        font-family: 'GangwonEdu_OTFBoldA';
        src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2201-2@1.0/GangwonEdu_OTFBoldA.woff') format('woff');
        font-weight: normal;
        font-style: normal;
    }

    ul, li{
        list-style:none;
    }
    #side_menu{
        width:13vw;
        height:100vh;
        border-radius:0 7px 7px 0 ;
        background-color:#6667AB;
    }
    #center_menu{
        width:70vw;
        height:100vh;
        border: 1px solid white;
    }
    #right_menu{
        width:20vw;
        height:80vh;

    }
    #test{
        width: 100px;
        height: 100px;
        border: 1px solid red;
    }
    #menu{
        width:100%;
        margin:0;
        padding:0;
        border-top:1px solid #ffffff6e;;
    }
    #menu li {
        text-align: center;
        width: 100%;
        height: 8%;
        color: white;
        border-bottom: 1px solid #ffffff6e;;
        cursor: pointer;
        padding-top: 10px;
        font-weight:100;
        font-size:15px;
        /* font-family: 'Gowun Dodum', sans-serif;} */
        font-family: 'AppleSDGothicNeo', 'Noto Sans KR', sans-serif;
    }
    #menu li:hover{
        background-color:#fff;
        color:#6667AB;

    }
    #right_menu{
    }
    #menu-top{
        height:8%;
        display:flex;
        color:#fff;
        font-size:14px;
        margin-left:-8px;
    }
    #menu-top li{
        font-size:19px;
        margin-top:15px;
    }
    #menu-top li:nth-child(2){
        width:100%;
        height:10%;
        margin: 0 auto;
        margin-top:5px;
        margin-left:20px;
        font-family: 'GangwonEdu_OTFBoldA';
        margin-top:15px;
    }
    #menu-top li:nth-child(1){
        font-size:13px;
    }
</style>

<div id="side_menu">

    <ul id="menu-top">
        <li><i class="fa-solid fa-clock fa-2x"></i></li>
        <li class="">근태 관리</li>
    </ul>

    <ul id="menu">
        <a href="${root}/employee/myAtdc"><li>나의 근태현황</li></a>
        <a href="${root}/employee/deptAtdc"><li>부서별 근태현황</li></a>
    </ul>

    <ul id="menu-top">
        <li><i class="fa-regular fa-calendar-check fa-2x"></i></li>
        <li class="">휴가 관리</li>
    </ul>

    <ul id="menu">
        <a href="${root}/employee/myDayoff"><li>나의 휴가현황</li></a>
        <a href="${root}/employee/deptDayoff"><li>부서별 휴가현황</li></a>
    </ul>
        
</div>
