<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<style>
    @font-face {
	    font-family: 'AppleSDGothicNeo';
	    src: url('/md/resources/font/apple/AppleSDGothicNeoUL.ttf') format('truetype');
	}
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
        grid-template-rows: 10vh 40vh 10vh 50px;
        row-gap: 10px;
    }
    #main-content-wrap>div:nth-child(1), #main-content-wrap>div:nth-child(3){
        display: flex;
        justify-content: flex-start;
        align-items: center;
    }

    /* 2번째 */
    #my-do-info-area{
        border: 1px solid #6667AB;
        border-radius: 10px;
        padding: 10px;
        display: grid;
        grid-template-columns: 2fr 1fr 1fr 1fr;
        margin-bottom: 50px;
    }
    #my-do-emp-info{
        grid-row: span 2;
        display: grid;
        grid-template-columns: 1fr 1fr;
    }
    #my-do-emp-info-profile{
        display: flex;
        justify-content: center;
        align-items: center;
    }
    #my-do-emp-info-detail{
        display: grid;
        grid-template-rows: repeat(5, 1fr);
        padding-right: 20px;
    }
    #emp-info-name{
        display: flex;
        justify-content: space-evenly;
        align-items: center;
    }
    #emp-info-name>div:nth-child(1){
        font-size: 18px;
        font-weight: bolder;
    }
    #emp-info-name>div:nth-child(2){
        padding: 4px;
        border-radius: 50px;
        background-color: #6667AB;
        color: white;
    }
    #emp-info-lvl{
        display: flex;
        justify-content: space-evenly;
    }
    #emp-info-ent-date{
        display: grid;
        justify-items: center;
    }

    .do-cnt{
        padding: 10px;
        border-left: 1px solid lightgray;
        font-weight: bolder;
    }
    .do-cnt-border-top{
        border-top: 1px solid lightgray;
    }
    .do-cnt-head{
        height: 40%;
        display: grid;
        grid-template-columns: repeat(3, 1fr);
        justify-items: center;
        align-items: center;
    }
    .do-cnt-body{
        height: 60%;
        display: flex;
        justify-content: center;
        align-items: center;
        font-size: 18px;
    }
    .do-cnt-gvn{
        color: gray;
    }
    .do-cnt-tot{
        color: #6667AB;
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

    /* 이번달 휴가 테이블 */
    #dept-dayoff-table>div{
        display: grid;
        grid-template-columns: repeat(6, 1fr);
        border-bottom: 1px solid lightgray;
        justify-items: center;
        align-items: center;
        column-gap: 20px;
        grid-template-rows: 40px;
    }
    #dept-dayoff-title{
        border-top: 1px solid gray;
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


    <div id="dept-dayoff-table">
        <div id="dept-dayoff-title">
            <div><b>신청일자</b></div>
            <div><b>연차시작</b></div>
            <div><b>연차종료</b></div>
            <div><b>연차기간</b></div>
            <div><b>종류</b></div>
            <div><b>처리</b></div>
        </div>

        <div class="dept-dayoff-body">
            <div>2022-10-24</div>
            <div>2022-11-24</div>
            <div>2022-11-26</div>
            <div>3</div>
            <div>기본연차</div>
            <div>처리중</div>
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