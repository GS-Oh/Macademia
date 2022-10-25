<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<style>
    @font-face {
        font-family: 'GangwonEdu_OTFBoldA';
        src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2201-2@1.0/GangwonEdu_OTFBoldA.woff') format('woff');
        font-weight: normal;
        font-style: normal;
    }
    #side_menu > ul, #side_menu > li{
        list-style:none;
    }
    #side_menu{
        width:13vw;
        height:100vh;
        border-radius:0 7px 7px 0 ;
        background-color:#6667AB;
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
    #tree{
        border-top: 1px solid rgb(187, 187, 187);
		color:white;
		position: fixed;
		height: 90vh;
		width: 250px;
		font-size: 17px;
        padding-top: 20px;
    }
    .jstree-default .jstree-clicked{
        background-color:rgb(220, 217, 236) !important;

        color: black !important;
    }
    .jstree-default .jstree-hovered{
        background-color:white !important;
        color: black !important;
    }
</style>

<div id="side_menu">

    <ul id="menu-top">
        <li><i class="fa-solid fa-sitemap fa-2x"></i></li>
        <li class="">조직도</li>
    </ul>
    <div id="tree"></div>
        
</div>

<div id="mypage-sidemenu">
    <div id="tree"></div>
</div>

