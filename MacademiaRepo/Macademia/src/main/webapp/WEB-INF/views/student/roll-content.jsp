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
    #atdc-table{
        border-top: 1px solid gray;
        width: 100%;
        display: grid;
        grid-template-columns: repeat(8, 1fr);
        grid-template-rows: 3vh;
        row-gap: 10px;
    }
    /* #atdc-table>div{
        border-bottom: 1px solid gray;
    } */
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

    <div id="atdc-table">
        <div><b>개강일자</b></div>
        <div><b>카테고리</b></div>
        <div><b>강의명</b></div>
        <div><b>강의실</b></div>
        <div><b>담당강사</b></div>
        <div><b>업무종료</b></div>
        <div><b>총 근무시간</b></div>
        <div><b>비고</b></div>
        <div>13일</div>
        <div>홍길동</div>
        <div>인사</div>
        <div>대리</div>
        <div>08:50:09</div>
        <div>18:00:23</div>
        <div>9h 12m 33s</div>
        <div>칼퇴</div>
        <div>13일</div>
        <div>홍길동</div>
        <div>인사</div>
        <div>대리</div>
        <div>08:50:09</div>
        <div>18:00:23</div>
        <div>9h 12m 33s</div>
        <div>칼퇴</div>
        <div>13일</div>
        <div>홍길동</div>
        <div>인사</div>
        <div>대리</div>
        <div>08:50:09</div>
        <div>18:00:23</div>
        <div>9h 12m 33s</div>
        <div>칼퇴</div>
        <div>13일</div>
        <div>홍길동</div>
        <div>인사</div>
        <div>대리</div>
        <div>08:50:09</div>
        <div>18:00:23</div>
        <div>9h 12m 33s</div>
        <div>칼퇴</div>
        <div>13일</div>
        <div>홍길동</div>
        <div>인사</div>
        <div>대리</div>
        <div>08:50:09</div>
        <div>18:00:23</div>
        <div>9h 12m 33s</div>
        <div>칼퇴</div>
        <div>13일</div>
        <div>홍길동</div>
        <div>인사</div>
        <div>대리</div>
        <div>08:50:09</div>
        <div>18:00:23</div>
        <div>9h 12m 33s</div>
        <div>칼퇴</div>
        <div>13일</div>
        <div>홍길동</div>
        <div>인사</div>
        <div>대리</div>
        <div>08:50:09</div>
        <div>18:00:23</div>
        <div>9h 12m 33s</div>
        <div>칼퇴</div>
        <div>13일</div>
        <div>홍길동</div>
        <div>인사</div>
        <div>대리</div>
        <div>08:50:09</div>
        <div>18:00:23</div>
        <div>9h 12m 33s</div>
        <div>칼퇴</div>
        <div>13일</div>
        <div>홍길동</div>
        <div>인사</div>
        <div>대리</div>
        <div>08:50:09</div>
        <div>18:00:23</div>
        <div>9h 12m 33s</div>
        <div>칼퇴</div>
        <div>13일</div>
        <div>홍길동</div>
        <div>인사</div>
        <div>대리</div>
        <div>08:50:09</div>
        <div>18:00:23</div>
        <div>9h 12m 33s</div>
        <div>칼퇴</div>
        <div>13일</div>
        <div>홍길동</div>
        <div>인사</div>
        <div>대리</div>
        <div>08:50:09</div>
        <div>18:00:23</div>
        <div>9h 12m 33s</div>
        <div>칼퇴</div>
        <div>13일</div>
        <div>홍길동</div>
        <div>인사</div>
        <div>대리</div>
        <div>08:50:09</div>
        <div>18:00:23</div>
        <div>9h 12m 33s</div>
        <div>칼퇴</div>
        <div>13일</div>
        <div>홍길동</div>
        <div>인사</div>
        <div>대리</div>
        <div>08:50:09</div>
        <div>18:00:23</div>
        <div>9h 12m 33s</div>
        <div>칼퇴</div>
        <div>13일</div>
        <div>홍길동</div>
        <div>인사</div>
        <div>대리</div>
        <div>08:50:09</div>
        <div>18:00:23</div>
        <div>9h 12m 33s</div>
        <div>칼퇴</div>
        <div>13일</div>
        <div>홍길동</div>
        <div>인사</div>
        <div>대리</div>
        <div>08:50:09</div>
        <div>18:00:23</div>
        <div>9h 12m 33s</div>
        <div>칼퇴</div>
        <div>13일</div>
        <div>홍길동</div>
        <div>인사</div>
        <div>대리</div>
        <div>08:50:09</div>
        <div>18:00:23</div>
        <div>9h 12m 33s</div>
        <div>칼퇴</div>
        <div>13일</div>
        <div>홍길동</div>
        <div>인사</div>
        <div>대리</div>
        <div>08:50:09</div>
        <div>18:00:23</div>
        <div>9h 12m 33s</div>
        <div>칼퇴</div>
        <div>13일</div>
        <div>홍길동</div>
        <div>인사</div>
        <div>대리</div>
        <div>08:50:09</div>
        <div>18:00:23</div>
        <div>9h 12m 33s</div>
        <div>칼퇴</div>
        <div>13일</div>
        <div>홍길동</div>
        <div>인사</div>
        <div>대리</div>
        <div>08:50:09</div>
        <div>18:00:23</div>
        <div>9h 12m 33s</div>
        <div>칼퇴</div>
        <div>13일</div>
        <div>홍길동</div>
        <div>인사</div>
        <div>대리</div>
        <div>08:50:09</div>
        <div>18:00:23</div>
        <div>9h 12m 33s</div>
        <div>칼퇴</div>
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