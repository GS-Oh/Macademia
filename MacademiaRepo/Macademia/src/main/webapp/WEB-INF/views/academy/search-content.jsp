<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<style>
    body{
        font-family: 'AppleSDGothicNeo', 'Noto Sans KR', sans-serif;
        font-size: 12px;
    }
    #search-content-wrap{
        width: 60vw;
        /* border: 3px solid black; */
        padding: 2vw;
        display: grid;
        grid-template-rows: 10vh 10vh;
        row-gap: 10px;
    }
    #search-content-wrap>div:nth-child(1){
        display: flex;
        justify-content: flex-start;
        align-items: center;
    }

    /*  */
    #search-area{
        display: grid;
        align-items: center;
    }
    #search-area>form{
        display: grid;
        grid-template-columns: 6fr 1fr;
        justify-items: flex-start;
    }
    #search-area>form>div:nth-child(1){
        display: flex;
        column-gap: 5px;
    }
    #add-new-btn{
        background-color: #6667AB;
    }
    #add-new-btn i{
        color: white;
        font-weight: 100;
    }
    #add-new-btn>a{
        display: grid;
        grid-template-columns: 100px;
        justify-items: center;
        align-items: center;
        color: white;
        width: 100%;
        height: 100%;
    }
    #add-new-btn>a:hover i{
        font-weight: bolder;
    }
    #search-area select{
        width: 80px;
        height: 30px;
    }
    #search-area input[type='text']{
        padding-left: 5px;
        width: 200px;
        height: 30px;
    }
    #search-area input[type='submit']{
        width: 100px;
        height: 30px;
        border: none;
        background-color: #6667AB;
        color: white;
    }
    #search-area input[type='submit']:hover{
        font-weight: bolder;
    }

    /* 테이블 */
    #student-list{
        margin-bottom: 50px;
    }
    #student-list-head{
        display: grid;
        grid-template-columns: 0.4fr 0.7fr 1fr 2fr 2fr 3fr;
        grid-template-rows: 50px;
        justify-items: center;
        align-items: center;
        border-top: 1px solid gray;
        border-bottom: 1px solid gray;
        font-size: 13px;
    }
    .select-student-list{
        display: grid;
        grid-template-columns: 0.4fr 0.7fr 1fr 2fr 2fr 3fr;
        grid-template-rows: 50px;
        justify-items: center;
        align-items: center;
        border-bottom: 1px solid lightgray;
    }
    .select-student-list>div{
        text-align: center;
    }
   

    /*  */
    #page-area{
        height: 4vh;
        display: flex;
        flex-wrap: nowrap;
        justify-content: center;
        align-content: center;
        justify-items: center;
        align-items: center;
        column-gap: 5px;
    }
    #page-area>div{
        border: 1px solid gray;
        width: 3vh;
        height: 3vh;
    }
    #page-area a{
        display: flex;
        width: 100%;
        height: 100%;
        justify-content: center;
        align-items: center;
    }
</style>

<script>
    $(function(){
               
        <c:if test="${not empty msg}">
	    	Swal.fire({
	    		icon: 'success',
	    		title: '${msg}'
	    	});
	   	</c:if>
        
    });
</script>

<div id="search-content-wrap">
    <div><h4>수강생 정보조회</h4></div>

    <div id="search-area">
        <form action="" method="post">
            <div>
                <select name="" id="">
                    <option value="">강의검색</option>
                    <option value="">이름검색</option>
                </select>
                <input type="text" value="" placeholder="검색어를 입력해주세요">
                <input type="submit" value="조회">
            </div>
            <div>
                <div id="add-new-btn"><a href="${root}/academy/addStd"><i class="fa-solid fa-plus fa-1x"></i></a></div>
            </div>
        </form>
    </div>

    <div id="student-list">
        <div id="student-list-head">
            <div><b>번호</b></div>
            <div><b>이름</b></div>
            <div><b>휴대폰</b></div>
            <div><b>이메일</b></div>
            <div><b>주소</b></div>
            <div><b>수강내역</b></div>
        </div>

		<c:forEach items="${stdList}" var="l">
	        <div onclick="location.href='${root}/academy/search/detail/${l.no}'" class="select-student-list">
	            <div>${l.no}</div>
	            <div>${l.name}</div>
	            <div>${l.phone}</div>
	            <div>${l.email}</div>
	            <div>${l.oldAddress}</div>
	            <div>${l.enrolledClass}</div>
	        </div>
        </c:forEach>
        
    </div>

    <div id="page-area">
        <c:if test="${pvo.startPage gt 5}">
        	<div><a href="${root}/academy/search/1"><i class="fa-solid fa-angles-left"></i></a></div>
        </c:if>
        
        <c:if test="${pvo.startPage ne 1}">
	        <div><a href="${root}/academy/search/${pvo.startPage-1}"><i class="fa-solid fa-angle-left"></i></a></div>
        </c:if>
        
        <c:forEach begin="${pvo.startPage}" end="${pvo.endPage}" var="i">
	        <div><a href="${root}/academy/search/${i}">${i}</a></div>
        </c:forEach>
        
        <c:if test="${pvo.endPage ne pvo.maxPage}">
        	<div><a href="${root}/academy/search/${pvo.endPage+1}"><i class="fa-solid fa-angle-right"></i></a></div>
        </c:if>
        <c:if test="${pvo.endPage ne pvo.maxPage}">
        	<div><a href="${root}/academy/search/${pvo.maxPage}"><i class="fa-solid fa-angles-right"></i></a></div>
        </c:if>	
    </div>

</div>