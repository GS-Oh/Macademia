<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<style>
    #main-content-wrap{
        width: 60vw;
        border: 3px solid black;
        padding: 2vw;
        display: grid;
        grid-template-rows: 10vh 10vh 10vh;
        row-gap: 10px;
    }
    #main-content-wrap>div:nth-child(2){
        display: flex;
        justify-content: center;
        align-items: flex-start;
    }
    #monthly-atdc{
        display: grid;
        grid-template-columns: 1fr 1fr;
        justify-items: center;
    }
    #main-content-wrap>div{
        /* border: 1px solid red; */
    }
    #class-list{
        border-top: 1px solid gray;
        width: 100%;
        display: grid;
        grid-template-columns: 1fr 2fr 1fr 1fr 1fr 1fr 1fr;
        grid-template-rows: 3vh;
        row-gap: 10px;
    }
    #class-list>div{
        border-bottom: 1px solid gray;
        padding-left: 10px;
    }
</style>



<div id="main-content-wrap">
    <div><h4>학생 출결 관리</h4></div>
    <div>
        <input type="text" placeholder="강의명을 입력해주세요">
        <input type="submit" value="강의 검색">
    </div>
    <div id="monthly-atdc">

        <div>
            <div>
                <h4>이번달 총 근무일자</h4>
            </div>
            <div>
                <h4>19D</h4>
            </div>
        </div>

        <div>
            <div>
                <h4>이번달 총 근무시간</h4>
            </div>
            <div>
               <h4>72h 30m 89s</h4>
            </div>
        </div>

    </div>

    <div id="class-list">
        <div><b>카테고리</b></div>
        <div><b>강의명</b></div>
        <div><b>담당강사</b></div>
        <div><b>강의실</b></div>
        <div><b>강의 기간</b></div>
        <div><b>수업 시간</b></div>
        <div><b>수강 인원</b></div>

        <div>디지털 컨버전스</div>
        <div>자바(JAVA)기반 클라우드 융합 개발자 양성과정A</div>
        <div>심투용</div>
        <div>20-D</div>
        <div>10.17 ~ 11.24</div>
        <div>15:30 ~ 22:00</div>
        <div>30명</div>
        
    </div>

</div>