<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
 <!-- 루트 경로 지정 -->
 <c:set var="root" value="${pageContext.request.contextPath}" />
 
<!-- 제이쿼리 -->    
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>    

<!-- 부트스트랩 -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/js/bootstrap.bundle.min.js"></script>


    
    <div id="side_menu">

	    <ul id="menu-top">
	        <li><i class="fa-regular fa-credit-card fa-2x"></i></li>
	        <li class="">급여 내역</li>
	    </ul>
	
	    <ul id="menu">
	        <a href="${root}/payroll/history"><li>급여지급내역</li></a>
            <a href="${root}/payroll/account"><li>지급계좌 관리</li></a>
            <a href=""><li>소득세 상세조회</li></a>
	    </ul>
	
	    <ul id="menu-top">
	        <li><i class="fa-regular fa-credit-card fa-2x"></i></li>
	        <li class="">급여 대장 관리</li>
	    </ul>
	    <ul id="menu">
            <a href="${root}/payroll/create"><li>급여대장 작성</li></a>
            <a href="${root}/payroll/management"><li>급여대장 관리</li></a>
	    </ul>
	        
	</div>