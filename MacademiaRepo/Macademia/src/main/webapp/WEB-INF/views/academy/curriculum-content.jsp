<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<style>
    body{
        font-family: 'AppleSDGothicNeo', 'Noto Sans KR', sans-serif;
        font-size: 12px;
    }
    #roll-content-wrap{
        width: 60vw;
        padding: 2vw;
        display: grid;
        grid-template-rows: 10vh 10vh;
        row-gap: 10px;
    }
    #roll-content-wrap>div:nth-child(1){
        display: flex;
        justify-content: flex-start;
        align-items: center;
    }

    #search-create-curriculum{
        display: flex;
        justify-content: space-between;
        align-items: center;
    }
    #class-list-search-area{
        display: flex;
        justify-content: flex-start;
        align-items: center;
    }
    #class-list-search-area>select{
        height: 30px;
        margin-right: 5px;
    }
    #class-list-search-area>input[type='text']{
        width: 200px;
        height: 30px;
        border: none;
        border: 1px solid black;
        margin-right: 5px;
        padding-left: 10px;
    }
    #class-list-search-area>input[type='submit']{
        width: 70px;
        height: 30px;
        border: none;
        background-color: #6667AB;
        color: white;
    }
    #class-list-search-area>input[type='submit']:hover{
        font-weight: bolder;
    }
    #create-new-curriculum{
        width: 130px;
        height: 40px;
        background-color: #6667AB;
    }
    #create-new-curriculum>a{
        width: 100%;
        height: 100%;
        color: white;
        display: flex;
        justify-content: center;
        align-items: center;
    }
    #create-new-curriculum:hover{
        font-weight: bolder;
        cursor: pointer;
    }
    
    /* 테이블 */
    #class-list{
        border-top: 1px solid gray;
        margin-bottom: 50px;
    } 
    #class-list-head{
        display: grid;
        grid-template-columns: 1fr 1.5fr 3fr 1fr 1fr 1fr 1.3fr 0.7fr 0.7fr;
        grid-template-rows: 50px;
        justify-items: center;
        align-items: center;
        border-bottom: 1px solid gray; 
        font-size: 13px;
    }
    .select-one-class{
        display: grid;
        grid-template-columns: 1fr 1.5fr 3fr 1fr 1fr 1fr 1.3fr 0.7fr 0.7fr;
        grid-template-rows: 50px;
        justify-items: center;
        align-items: center;
        border-bottom: 1px solid gray;
        padding-top: 10px;
        padding-bottom: 10px;
    }
    #class-status{
        border: none;
        font-weight: bolder;
    }
        
    /* 페이징 */
    #page-area{
        height: 4vh;
        display: grid;
        grid-template-columns: repeat(9, 3vh);
        grid-template-rows: 3vh;
        justify-content: center;
        align-content: center;
        justify-items: center;
        align-items: center;
        column-gap: 5px;
    }
    #page-area>div{
        border: 1px solid gray;
        width: 100%;
        height: 100%;
    }
    #page-area a{
        display: flex;
        width: 100%;
        height: 100%;
        justify-content: center;
        align-items: center;
        color: #6667AB;
    }
</style>

<script>
    $(function(){
        // $('.select-one-class').click(function(){
        //     console.log(this);
        //     location.href="/md/student/curriculum/detail";
        // });
        
    });
        	
	<c:if test="${not empty msg}">
    	Swal.fire({
    		icon: 'success',
    		title: '${msg}'
    	});
   	</c:if>
   	
</script>



<div id="roll-content-wrap">
    <div><h4>커리큘럼 조회</h4></div>

    <div id="search-create-curriculum">
        <div id="class-list-search-area">
            <select name="" id="">
                <option value="">카테고리 전체</option>
                <option value="">디지털 컨버전스</option>
                <option value="">정보시스템 구축</option>
            </select>
            <input type="text" placeholder="강의명을 입력해주세요">
            <input type="submit" value="강의 검색">
        </div>
        <div id="create-new-curriculum-area">
            <div id="create-new-curriculum">
                <a href="${root}/academy/addCurr">커리큘럼 추가하기</a>
            </div>
        </div>
    </div>
    
    <div id="class-list">
        <div id="class-list-head">
            <div><b>개강일자</b></div>
            <div><b>카테고리</b></div>
            <div><b>강의명</b></div>
            <div><b>담당강사</b></div>
            <div><b>강의실</b></div>
            <div><b>종강일자</b></div>
            <div><b>수업 시간</b></div>
            <div><b>인원</b></div>
            <div>
                <select name="" id="class-status">
                    <option value="">상태</option>
                    <option value="">개강</option>
                    <option value="">예정</option>
                    <option value="">종강</option>
                </select>
            </div>
        </div>

        <c:forEach items="${classList}" var="l">
            <div class="select-one-class">
                <div>${l.beginDate}</div>
                <div>${l.categoryNo}</div>
                <div>${l.name}</div>
                <div>${l.memberNo}</div>
                <div>${l.classroom}</div>
                <div>${l.endDate}</div>
                <div>${l.startTime} ~ ${l.finishTime}</div>
                <div>${l.max}명</div>
                <c:if test="${l.status eq 'O'}">
                    <div>예정</div>
                </c:if>
                <c:if test="${l.status eq 'P'}">
                    <div>개강</div>
                </c:if>
                <c:if test="${l.status eq 'F'}">
                    <div>종강</div>
                </c:if>
            </div>
        </c:forEach>
        
        
    </div>

    <div id="page-area">
        <c:if test="${pvo.startPage gt 5}">
        	<div><a href="${root}/academy/curriculum/1"><i class="fa-solid fa-angles-left"></i></a></div>
        </c:if>
        
        <c:if test="${pvo.startPage ne 1}">
	        <div><a href="${root}/academy/curriculum/${pvo.startPage-1}"><i class="fa-solid fa-angle-left"></i></a></div>
        </c:if>
        
        <c:forEach begin="${pvo.startPage}" end="${pvo.endPage}" var="i">
	        <div><a href="${root}/academy/curriculum/${i}">${i}</a></div>
        </c:forEach>
        
        <c:if test="${pvo.endPage ne pvo.maxPage}">
        	<div><a href="${root}/academy/curriculum/${pvo.endPage+1}"><i class="fa-solid fa-angle-right"></i></a></div>
        </c:if>
        <c:if test="${pvo.endPage ne pvo.maxPage}">
        	<div><a href="${root}/academy/curriculum/${pvo.maxPage}"><i class="fa-solid fa-angles-right"></i></a></div>
        </c:if>	
    </div>

</div>