<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<style>
    /* @font-face {
	    font-family: 'AppleSDGothicNeo';
	    src: url('/md/resources/font/apple/AppleSDGothicNeoUL.ttf') format('truetype');
	} */
    body{
        padding: 0px;
        margin: 0px;
        font-family: 'AppleSDGothicNeo', 'Noto Sans KR', sans-serif;
        font-size: 12px;
    }

    #main-content-wrap{
        width: 60vw;
        /* border: 3px solid black; */
        padding: 2vw;
        display: grid;
        grid-template-rows: 10vh 10vh 40vh 10vh 50px;
        row-gap: 10px;
    }
    #main-content-wrap>div:nth-child(1), #main-content-wrap>div:nth-child(4){
        display: flex;
        justify-content: flex-start;
        align-items: center;
    }

    /* 검색부분 */
    #dept-search-area{
        display: grid;
        justify-content: flex-start;
        align-items: center;
    }
    #dept-search-area select, #dept-search-area input{
        height: 30px;
    }
    #dept-search-area input[type='submit']{
        width: 70px;
        border: none;
        background-color: #6667AB;
        color: white;
    }
    #dept-search-area input[type='submit']:hover{
        font-weight: bolder;
    }

    /* 이번 달 휴가 부분 */
    #dept-dayoff-table-this-month{
        overflow-y: scroll;
    }
    #dept-dayoff-table-this-month>div{
        display: grid;
        grid-template-columns: repeat(7, 1fr);
    }
    #dept-dayoff-table-this-month-head{
        height: 50px;
        justify-items: center;
        align-items: center;
        border-top: 1px solid gray;
        border-bottom: 1px solid gray;
        font-size: 13px;
    }
    #dept-dayoff-table-this-month-head-name{
        width: 210px;
        padding-left: 20px;
        text-align: center;
    }
    .dept-dayoff-table-this-month-body{
        padding-top: 10px;
        row-gap: 10px;
    }
    .dept-dayoff-table-this-month-body{ 
        padding-bottom: 10px;
        border-bottom: 1px solid lightgray;
    }
    .dept-emp-info{
        width: 210px;
        padding-left: 20px;
        display: grid;
        grid-template-columns: 1fr 1.5fr;
        column-gap: 15px;
        row-gap: 5px;
        justify-items: flex-start;
        align-items: center;
    }
    .dept-emp-info>div:nth-child(1){
        width: 70px;
        height: 70px;
        border-radius: 50px;
        grid-row: span 3;
    }
    .dept-dayoff-table-this-month-body>div:nth-child(1)>div:nth-child(1)>img{
        width: 100%;
        height: 100%;
    }
    .dept-emp-name{
        font-size: 13px;
        font-weight: bolder;
        color: black;
    }
    .dept-dayoff-table-this-month-content{
        display: grid;
        justify-content: center;
        align-items: center;
    }

    /* date피커 */
    #date-select-area{
        display: grid;
        grid-template-columns: 30px 200px 30px;
        grid-template-rows: 30px;
        justify-content: center;
        align-content: center;
    }
    #prev-week,#next-week{
        background-color: #6667AB;
        display: flex;
        justify-content: center;
        align-items: center;
        color: white;
    }
    #prev-week,#next-week:hover{
        cursor: pointer;
    }
    #selected-date{
        display: flex;
        justify-content: space-evenly;
        align-items: center;
        font-size: 16px;
    }


    /* 휴가사용내역 테이블 */
    #my-dayoff-table>div{
        display: grid;
        grid-template-columns: repeat(6, 1fr);
        border-bottom: 1px solid lightgray;
        justify-items: center;
        align-items: center;
        column-gap: 20px;
        grid-template-rows: 40px;
    }
    #my-dayoff-title{
        border-top: 1px solid gray;
    }
   
</style>

<script>
    $(function(){
        /*  */ 
        let date = new Date()
        let year = date.getFullYear();
        let month = date.getMonth() + 1;
        let today = date.getDate();

        $('#start-month').text(year +'.' + month)

        //오른쪽 버튼 클릭 이벤트
        $('#next-month').on('click', function(){
            if(month >= 12){
                month = 0
                year += 1
            }

            month += 1
         
            $('#selected-month').replaceWith
            ('<div id="selected-month"><span id="start-month">' + year + '.' + month + '</span></div>')
        });

        //왼쪽 버튼 클릭 이벤트
        $('#prev-month').on('click', function(){
            if(month <= 1){
                month = 13
                year -= 1
            }

            month -= 1
         
            $('#selected-month').replaceWith
            ('<div id="selected-month"><span id="start-month">' + year + '.' + month + '</span></div>')
        });
    });
</script>

<div id="main-content-wrap">

    <div>
        <h4>이번 달 휴가</h4>
    </div>

    <div id="dept-search-area">
        <form action="">
            <select name="" id="">
                <option value="">전체</option>
                <option value="">홍보/마케팅</option>
                <option value="">전체</option>
                <option value="">전체</option>
                <option value="">전체</option>
            </select>
            <input type="text" placeholder="부서를 검색하세요">
            <input type="submit" value="검색">
        </form>
    </div>


    <div id="dept-dayoff-table-this-month">
        <div id="dept-dayoff-table-this-month-head">
            <div id="dept-dayoff-table-this-month-head-name"><b>이름</b></div>
           
            <div><b>신청일자</b></div>
            <div><b>연차시작</b></div>
            <div><b>연차종료</b></div>
            <div><b>연차기간</b></div>
            <div><b>종류</b></div>
            <div><b>처리현황</b></div>
        </div>
        
        <div class="dept-dayoff-table-this-month-body">
            <div class="dept-emp-info">
                <div><img src="" alt="직원프사"></div>
                <div class="dept-emp-name">고니</div>
                <div>대리</div>
                <div>홍보부</div>
            </div>
            <div class="dept-dayoff-table-this-month-content">2022.10.24</div>
            <div class="dept-dayoff-table-this-month-content">2022.11.24</div>
            <div class="dept-dayoff-table-this-month-content">2022.11.26</div>
            <div class="dept-dayoff-table-this-month-content">3</div>
            <div class="dept-dayoff-table-this-month-content">기본연차</div>
            <div class="dept-dayoff-table-this-month-content">완료</div>
        </div>

        <div class="dept-dayoff-table-this-month-body">
            <div class="dept-emp-info">
                <div><img src="" alt="직원프사"></div>
                <div class="dept-emp-name">고니</div>
                <div>대리</div>
                <div>홍보부</div>
            </div>
            <div class="dept-dayoff-table-this-month-content">2022.10.24</div>
            <div class="dept-dayoff-table-this-month-content">2022.11.24</div>
            <div class="dept-dayoff-table-this-month-content">2022.11.26</div>
            <div class="dept-dayoff-table-this-month-content">3</div>
            <div class="dept-dayoff-table-this-month-content">기본연차</div>
            <div class="dept-dayoff-table-this-month-content">완료</div>
        </div>
        
    </div>

    <div>
        <h4>휴가 사용 내역</h4>
    </div>

    <div id="date-select-area">
        <div id="prev-week"><i class="fa-solid fa-angle-left"></i></div>
        <div id="selected-date">
            <span id="start-date"></span> ~ 
            <span id="end-date"></span>
        </div>
        <div id="next-week"><i class="fa-solid fa-angle-right"></i></div>
    </div>

    <div id="my-dayoff-table">
        <div id="my-dayoff-title">
            <div><b>신청일자</b></div>
            <div><b>연차시작</b></div>
            <div><b>연차종료</b></div>
            <div><b>연차기간</b></div>
            <div><b>종류</b></div>
            <div><b>처리</b></div>
        </div>

        <div class="my-dayoff-table-weekly">
            <div>2022-10-24</div>
            <div>2022-11-24</div>
            <div>2022-11-26</div>
            <div>3</div>
            <div>기본연차</div>
            <div>완료</div>
        </div>
        <div>
            <div>2022-10-24</div>
            <div>2022-11-24</div>
            <div>2022-11-26</div>
            <div>3</div>
            <div>기본연차</div>
            <div>완료</div>
        </div>
        <div>
            <div>2022-10-24</div>
            <div>2022-11-24</div>
            <div>2022-11-26</div>
            <div>3</div>
            <div>기본연차</div>
            <div>완료</div>
        </div>
        <div>
            <div>2022-10-24</div>
            <div>2022-11-24</div>
            <div>2022-11-26</div>
            <div>3</div>
            <div>기본연차</div>
            <div>완료</div>
        </div>
        
    </div>

</div>