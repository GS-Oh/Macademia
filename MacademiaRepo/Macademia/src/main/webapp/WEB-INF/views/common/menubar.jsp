<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="root" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width,initial-scale=1">
<title>마카데미아</title>
<!-- Favicon icon -->
<link rel="icon" type="image/png" sizes="16x16" href="${root}/resources/assets/resources/images/favicon.png">
<link href="${root}/resources/assets/vendor/fullcalendar/packages/core/main.css" rel='stylesheet' />
<link href="${root}/resources/assets/vendor/fullcalendar/packages/daygrid/main.css" rel='stylesheet' />
<script src="${root}/resources/assets/vendor/fullcalendar/packages/core/main.js"></script>
<script src="${root}/resources/assets/vendor/fullcalendar/packages/daygrid/main.js"></script>
<script src="${root}/resources/assets/vendor/fullcalendar/packages/interaction/main.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.24.0/moment.min.js"></script>
<!-- <script type="text/javascript" src="/resources/assets/js/jsQR.js"></script>	 -->
<!-- Custom Stylesheet -->
<link href="${root}/resources/assets/css/style.css" rel="stylesheet">
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

	<%@include file="/WEB-INF/views/common/header.jsp" %>
	
        <!-- Sidebar start -->
        <div class="quixnav"  style="background: #292B48;">
            <div class="quixnav-scroll">
                <ul class="metismenu" id="menu">
                	<li class="nav-label first"></li>
                    <li><a href="${root}/home" aria-expanded="false">
                         <i class="bi bi-house"></i><span class="nav-text"></span></a>
                    </li>
                    
                    <li><a href="noticeBoardList.nb" aria-expanded="false">
                    	<i class="bi bi-megaphone"></i><span class="nav-text">공지사항</span></a>
                    </li>
                    <li><a href="archive.arch" aria-expanded="false">
                    	<i class="bi bi-cloud-arrow-down"></i><span class="nav-text">자료실</span></a>
                    </li>
                    <li><a class="has-arrow" href="javascript:void()" aria-expanded="false">
                    		<i class="bi bi-telephone-plus"></i><span class="nav-text">주소록</span></a>
                    	<ul aria-expanded="false">
		                    <li><a href="list.addr">주소록 목록</a></li>
                            <li><a href="search.addr">주소록 검색</a></li>
                       	</ul>
                    </li>
                    <li><a class="has-arrow" href="javascript:void()" aria-expanded="false">
                                <i class="bi bi-pencil-square"></i><span class="nav-text">회의실 예약</span></a>
                        <ul aria-expanded="false">
							<li><a href="mrlist.mr">예약 목록</a></li>
							<li><a href="mrcalview.mr">예약 캘린더</a></li>
                            <li><a href="mrinsertview.mr">예약 신청</a></li>
                        </ul>
                    </li>
                    <li><a class="has-arrow" href="javascript:void()" aria-expanded="false"><i
                                class="bi bi-person-circle"></i><span class="nav-text">마이페이지</span></a>
                        <ul aria-expanded="false">
                            <li><a href="myInfo.mp">내 정보</a></li>
                            <li><a href="scrapList.mp">스크랩 관리</a></li>
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
	    <script src="${root}/resources/assets/vendor/global/global.min.js"></script>
	    <script src="${root}/resources/assets/js/quixnav-init.js"></script>
	    <script src="${root}/resources/assets/js/custom.min.js"></script>   
	    
	    <script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>   
</body>
</html>