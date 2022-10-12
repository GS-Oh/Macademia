<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<style>
    <%@ include file="/WEB-INF/views/payroll/main.css" %>
    
</style>


</head>
<body>


    <div id="wrap">

        <header>
            
            <!-- 로고 / 급여관리 -->
            <div>
                <div class="header-img-outer">
                    <img alt="로고" src="">
                </div>
                <div>
                    <h1><a href="/md/payroll/main">급여관리</a></h1>
                </div>
            </div>

            <!-- 프로필 사진, 직원명 부서명 직책 -->
            <div>
                <div class="header-img-outer">
                    <img alt="프로필 사진" src="">
                </div>
                <div>
                    <h4>직원명</h4>
                    <h4>부서명-직책</h4>
                </div>
            </div>

        </header>

        <aside>
            <div><a href="/md/payroll/history">급여지급내역</a></div>
            <div><a href="">소득세 상세조회</a></div>
            <div><a href="/md/payroll/account">지급계좌 관리</a></div>
            <div><a href="/md/payroll/management">급여대장 관리</a></div>
            <div><a href="/md/payroll/create">급여대장 작성</a></div>
        </aside>

        <main>
            <h1>메인</h1>
        </main>


    </div>













</body>
</html>