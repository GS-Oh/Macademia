<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<c:set var="root" value="${pageContext.request.contextPath}" />
<!-- 제이쿼리 -->    
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>    
<!-- Latest compiled and minified CSS -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/css/bootstrap.min.css" rel="stylesheet">

<!-- 부트스트랩 -->
<!-- Latest compiled JavaScript -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/js/bootstrap.bundle.min.js"></script>
	
      
            <div id="nav-menu9" style="border-bottom:1px solid white; padding-bottom:40%;">
	            <a href="${root}/messenger/main">
	                <i class="fa-solid fa-comments fa-2x"></i><br>
	                <label for="">메신저</label>
	            </a>
       		</div>
            <div><a href="/md/messenger/profile">나의 프로필</a></div>
            <div><a href="/md/messenger/noteReceiveBox">받은쪽지함</a></div>
            <div><a href="/md/messenger/noteSendBox">보낸쪽지함</a></div>
            <div><a href="/md/messenger/imgFileBox">파일보관함</a></div>
            <div><a href="/md/messenger/notice/1">공지톡</a></div>
			<div></div>
            <div><a href="">메신저 알림</a></div>
            <div><a href="">메신저 환경설정</a></div>
