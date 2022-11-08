<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width,initial-scale=1">
<title>대시보드</title>
<!-- Favicon icon -->
<link rel="icon" type="image/png" sizes="16x16" href="${contextPath}/assets/resources/images/favicon.png">
<!-- Custom Stylesheet -->
<link href="${contextPath}/resources/assets/css/style.css" rel="stylesheet">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.7.2/font/bootstrap-icons.css">
<!-- Google fonts - Noto Sans Korean -->
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Nanum+Gothic&family=Noto+Sans+KR:wght@300;400&family=Open+Sans&display=swap" rel="stylesheet">
<style>
	 body, h1, h2, h3, h4, h5, h6, p, span {
   	 	font-family: 'Noto Sans KR', sans-serif;
  	 }
</style>
</head>
<body>

	<c:set var="contextPath" value="${ pageContext.servletContext.contextPath }" scope="application"/>

    <!-- Preloader start --> 
    <div id="preloader">
        <div class="sk-three-bounce">
            <div class="sk-child sk-bounce1"></div>
            <div class="sk-child sk-bounce2"></div>
            <div class="sk-child sk-bounce3"></div>
        </div>
    </div>
    <!-- Preloader end --> 

        <!-- Nav header start -->
        <div class="nav-header">
            <a href="${contextPath}" class="brand-logo">
                <img class="logo-abbr" src="${contextPath}/resources/img/logo/logo_temp1.png" alt="마카데미아" alt="" style="border-radius: 50%;">
                <b class="logo-compact" style="font-size: x-large;">MacademiA</b>
               	<b class="brand-title" style="font-size: x-large;">MacademiA</b>
            </a>

            <div class="nav-control">
                <div class="hamburger">
                    <span class="line"></span><span class="line"></span><span class="line"></span>
                </div>
            </div>
        </div>
        <!-- Nav header end -->

        <!-- Header start -->
        <div class="header">
            <div class="header-content">
                <nav class="navbar navbar-expand">
                    <div class="collapse navbar-collapse justify-content-between">
                        <div class="header-left">
                        </div>
                        
                        <ul class="navbar-nav header-right">
                            <li class="nav-item dropdown header-profile">
                                <a class="nav-link" href="#" role="button" data-toggle="dropdown">
                                    <i class="mdi mdi-account"></i>
                                </a>
                                <div class="dropdown-menu dropdown-menu-right">
                                    <a href="myInfo" class="dropdown-item">
                                        <i class="icon-user"></i>
                                        <span class="ml-2">Profile </span>
                                    </a>
<!--                                     <a href="./email-inbox.html" class="dropdown-item"> -->
<!--                                         <i class="icon-envelope-open"></i> -->
<!--                                         <span class="ml-2">Chat </span> -->
<!--                                     </a> -->
                                    <c:if test="${ loginUser.grade == 'A' }">
	                                    <a href="#" class="dropdown-item">
	                                        <i class="fa fa-mail-forward"></i>
	                                        <span class="ml-2">Admin Page </span>
	                                    </a>
                                    </c:if>
                                     <c:if test="${ loginUser != null }">
	                                    <a href="logout" class="dropdown-item">
	                                        <i class="icon-key"></i>
	                                        <span class="ml-2">Logout </span>
                                    	</a>
                                    </c:if>                                    
                                    <c:if test="${ loginUser == null }">
	                                    <a href="${ contextPath }" class="dropdown-item">
	                                        <i class="icon-key"></i>
	                                        <span class="ml-2">Login </span>
                                    	</a>
                                    </c:if>  
                                </div>
                            </li>
                        </ul>
                    </div>
                </nav>
            </div>
        </div>
        <!-- Header end ti-comment-alt -->

        <!-- Sidebar start -->
        <div class="quixnav"  style="background: #292B48;">
            <div class="quixnav-scroll">
                <ul class="metismenu" id="menu">
                	<li class="nav-label first"></li>
                    <li><a href="#" aria-expanded="false">
                         <i class="bi bi-house"></i><span class="nav-text">대시보드</span></a>
                    </li>
                    <li><a class="has-arrow" href="javascript:void()" aria-expanded="false">
                    		<i class="bi bi-chat-dots"></i><span class="nav-text">채팅</span></a>
						<ul aria-expanded="false">
		                    <li><a href="#">채팅방 목록</a></li>
                            <li><a href="#">채팅방 검색</a></li>
                       	</ul>
                    </li>
<!--                     <li><a class="has-arrow" href="javascript:void()" aria-expanded="false"> -->
<!--                     		<i class="bi bi-file-text"></i><span class="nav-text">전자결재</span></a> -->
<!--                         <ul aria-expanded="false"> -->
<!--                             <li><a href="#">내 문서함</a></li> -->
<!--                             <li><a href="#">부서 문서함</a></li> -->
<!--                             <li><a href="#">문서 기안</a></li> -->
<!--                             <li><a href="#">문서 전체 목록</a></li> -->
<!--                         </ul> -->
<!--                     </li> -->
                    <li><a class="has-arrow" href="javascript:void()" aria-expanded="false">
                    		<i class="bi bi-people"></i><span class="nav-text">커뮤니티</span></a>
                        <ul aria-expanded="false">
                            <li><a href="#">자유게시판</a></li>
                            <li><a href="#">아무게시판</a></li>
                        </ul>
                    </li>
                    <li><a href="${contextPath}/notice/main" aria-expanded="false">
                    	<i class="bi bi-megaphone"></i><span class="nav-text">공지사항</span></a>
                    </li>
                    <li><a href="#" aria-expanded="false">
                    	<i class="bi bi-cloud-arrow-down"></i><span class="nav-text">자료실</span></a>
                    </li>
                    <li><a class="has-arrow" href="javascript:void()" aria-expanded="false">
                    		<i class="bi bi-telephone-plus"></i><span class="nav-text">주소록</span></a>
                    	<ul aria-expanded="false">
		                    <li><a href="${contextPath}/addr/list">주소록 목록</a></li>
                            <li><a href="${contextPath}/addr/main">주소록 검색</a></li>
                       	</ul>
                    </li>
                    <li><a class="has-arrow" href="javascript:void()" aria-expanded="false">
                                <i class="bi bi-pencil-square"></i><span class="nav-text">회의실 예약</span></a>
                        <ul aria-expanded="false">
							<li><a href="#">예약 목록</a></li>
							<li><a href="#">예약 캘린더</a></li>
                            <li><a href="#">예약 신청</a></li>
                        </ul>
                    </li>
                    <li><a class="has-arrow" href="javascript:void()" aria-expanded="false"><i
                                class="bi bi-briefcase"></i><span class="nav-text">근태관리</span></a>
                        <ul aria-expanded="false">
                           <li><a href="#">근태 현황</a></li>
                            <li><a href="#">연차현황</a></li>
                        </ul>
                    </li>
                    <li><a class="has-arrow" href="javascript:void()" aria-expanded="false"><i
                                class="bi bi-calendar4-week"></i><span class="nav-text">캘린더</span></a>
                        <ul aria-expanded="false">
                            <li><a href="#">사내 일정 캘린더</a></li>
                            <li><a href="#">내 일정 캘린더</a></li>
                        </ul>
                    </li>                    
                    <li><a class="has-arrow" href="javascript:void()" aria-expanded="false"><i
                                class="bi bi-person-circle"></i><span class="nav-text">마이페이지</span></a>
                        <ul aria-expanded="false">
                            <li><a href="#">내 정보</a></li>
                            <li><a href="#">스크랩 관리</a></li>
                        </ul>
                    </li>
                </ul>
            </div>
        </div>
        <!-- Sidebar end -->
 		<script>
	 		// sweet alert customize
			var alert = function(msg, title, icon) {
				Swal.fire({
					position: 'top',
					background: '#292B30',
	   				color: 'white',
					title : title,
					text : msg,
					icon: icon,
					timer : 1500,
					showConfirmButton : false
				});
			}
 		</script>

	    <!-- vendors -->
	    <script src="${contextPath}/resources/assets/vendor/global/global.min.js"></script>
	    <script src="${contextPath}/resources/assets/js/quixnav-init.js"></script>
	    <script src="${contextPath}/resources/assets/js/custom.min.js"></script>   
	    
	    <script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>   
</body>
</html>