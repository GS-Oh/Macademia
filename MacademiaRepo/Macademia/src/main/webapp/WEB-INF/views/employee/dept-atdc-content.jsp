<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<style>
    #main-content-wrap>div{
        /* border: 1px solid rebeccapurple; */
    }
    #main-content-wrap{
        width: 60vw;
        border: 3px solid black;
        padding: 2vw;
        display: grid;
        grid-template-rows: 10vh 10vh 10vh;
        row-gap: 10px;
    }
    #main-content-wrap>div:nth-child(1){
        display: flex;
        justify-content: flex-start;
        align-items: center;
    }
    #main-content-wrap>div:nth-child(2){
        display: flex;
        justify-content: center;
        align-items: flex-start;
    }

    #select-dept{
        display: grid;
        justify-items: flex-start;
        align-content: center;
    }

    /*  */
    #atdc-table>div{
        width: 100%;
        display: grid;
        grid-template-columns: repeat(8, 1fr);
        grid-template-rows: 3vh;
    }
    #atdc-table>div{
        /* border-bottom: 1px solid gray; */
    }
    #atdc-table>div>div{
        border: 1px solid red;
    }
</style>



<div id="main-content-wrap">
    <div><h4>부서별 근태 현황</h4></div>
    <div>
        <h4><input type="month" value="2022-10"></h4>
        <input type="submit">
    </div>

    <div id="select-dept">

        <div>
            <select name="" id="">
                <option value="">전체</option>
                <option value="">행정부</option>
                <option value="">기획부</option>
                <option value="">홍보부</option>
            </select>
        </div>

    </div>

    <div id="atdc-table">
        <div>
            <div><b>이름</b></div>
            <div><b>부서</b></div>
            <div><b>직급</b></div>
            <div><b>업무시작</b></div>
            <div><b>업무종료</b></div>
            <div><b>총 근무시간</b></div>
            <div><b>비고</b></div>
        </div>
        
        <div>
            <div>13일</div>
            <div>홍길동</div>
            <div>인사</div>
            <div>대리</div>
            <div>08:50:09</div>
            <div>18:00:23</div>
            <div>9h 12m 33s</div>
            <div>칼퇴</div>
        </div>
        
        
    </div>

</div>