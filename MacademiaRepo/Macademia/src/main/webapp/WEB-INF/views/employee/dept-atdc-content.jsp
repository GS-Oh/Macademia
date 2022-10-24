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

    #main-content-wrap>div{
        /* border: 1px solid rebeccapurple; */
    }
    #main-content-wrap{
        width: 60vw;
        /* border: 3px solid black; */
        padding: 2vw;
        display: grid;
        grid-template-rows: 10vh 50px 5vh;
        row-gap: 10px;
    }
    #main-content-wrap>div:nth-child(1){
        display: flex;
        justify-content: flex-start;
        align-items: center;
    }

    /*  */
    #select-dept{
        display: flex;
        flex-wrap: nowrap;
        justify-content: space-between;
        align-items: center;
    }
    #week-month-btn-area{
        display: flex;
        flex-wrap: nowrap;
    }
    .week-month-btn{
        margin-left: 5px;
        width: 50px;
        height: 25px;
        display: flex;
        justify-content: center;
        align-items: center;
        border: 1px solid #6667AB;
        color: #6667AB;
    }
    .week-month-btn:hover{
        color: white;
        background-color: #6667AB;
        font-weight: bolder;
        cursor: pointer;
    }

    /*  */
    #week-select{
        display: grid;
        grid-template-columns: 30px 200px 30px;
        grid-template-rows: 30px;
        justify-content: center;
        align-content: center;
    }
    #month-select{
        display: grid;
        grid-template-columns: 30px 150px 30px;
        grid-template-rows: 30px;
        justify-content: center;
        align-content: center;
    }
    .go-prev,.go-next{
        background-color: #6667AB;
        display: flex;
        justify-content: center;
        align-items: center;
        color: white;
    }
    .go-prev,.go-next:hover{
        cursor: pointer;
    }
    #selected-month, #selected-date{
        display: flex;
        justify-content: space-evenly;
        align-items: center;
        font-size: 16px;
    }

    /* 월간달력 */
    #atdc-table-monthly>div{
        display: grid;
        grid-template-columns: repeat(3, 1fr);
    }
    #atdc-table-head{
        height: 50px;
        justify-items: center;
        align-items: center;
        border-top: 1px solid gray;
        border-bottom: 1px solid gray;
        font-size: 13px;
    }
    #monthly-table-head-name{
        width: 210px;
        padding-left: 20px;
        text-align: center;
    }
    .atdc-table-body{
        padding-top: 10px;
        row-gap: 10px;
    }
    .atdc-table-body{ 
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
    .atdc-table-body>div:nth-child(1)>div:nth-child(1)>img{
        width: 100%;
        height: 100%;
    }
    .dept-emp-name{
        font-size: 13px;
        font-weight: bolder;
        color: black;
    }
    .dept-get-total{
        display: grid;
        justify-content: center;
        align-items: center;
        font-weight: bolder;
    }

    /* 주간달력 */
    #weekly-atdc-table-head{
        height: 50px;
        display: grid;
        grid-template-columns: repeat(8, 1fr);
        justify-items: center;
        align-items: center;
        border-top: 1px solid gray;
        border-bottom: 1px solid gray;
        font-size: 13px;
    }
    #weekly-table-head-name{
        width: 210px;
        padding-left: 20px;
        text-align: center;
    }
    .weekly-atdc-table-body{
        display: grid;
        grid-template-columns: repeat(8, 1fr);
        padding-top: 10px;
        padding-bottom: 10px;
        row-gap: 10px;
        justify-items: center;
        align-items: center;
        border-bottom: 1px solid lightgray;
    }
    .table-sat{
        color: red;
    }
    .table-sun{
        color: lightgray;
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

        /* 주간 <-> 월간 */
        $('#atdc-table-monthly').attr('style', 'display:none')
        $('#month-select').attr('style', 'display:none')

        $('#monthly-view-btn').click(function(){
            $('#atdc-table-monthly').attr('style', 'display:grid')
            $('#atdc-table-weekly').attr('style', 'display:none')
            $('#month-select').attr('style', 'display:grid')
            $('#week-select').attr('style', 'display:none')
        })
        $('#weekly-view-btn').click(function(){
            $('#atdc-table-monthly').attr('style', 'display:none')
            $('#atdc-table-weekly').attr('style', 'display:grid')
            $('#month-select').attr('style', 'display:none')
            $('#week-select').attr('style', 'display:grid')
        })


    })
</script>

<div id="main-content-wrap">
    <div><h4>부서별 근태 현황</h4></div>

    <div>
        <div id="week-select">
            <div class="go-prev"><i class="fa-solid fa-angle-left"></i></div>
            <div id="selected-date">
                <span id="start-date"></span> ~ 
                <span id="end-date"></span>
            </div>
            <div class="go-next"><i class="fa-solid fa-angle-right"></i></div>
        </div>
        <div id="month-select">
            <div id="prev-month" class="go-prev"><i class="fa-solid fa-angle-left"></i></div>
            <div id="selected-month">
                <span id="start-month"></span>
            </div>
            <div id="next-month" class="go-next"><i class="fa-solid fa-angle-right"></i></div>
        </div>
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

        <div id="week-month-btn-area">
            <div id="weekly-view-btn" class="week-month-btn">주간</div>
            <div id="monthly-view-btn" class="week-month-btn">월간</div>
        </div>

    </div>

    <div id="atdc-table-monthly">
        <div id="atdc-table-head">
            <div id="monthly-table-head-name"><b>이름</b></div>
           
            <div><b>총 근무시간</b></div>

            <div><b>총 근무일자</b></div>

        </div>
        
        <div class="atdc-table-body">
            <div class="dept-emp-info">
                <div><img src="" alt="직원프사"></div>
                <div class="dept-emp-name">고니</div>
                <div>대리</div>
                <div>홍보부</div>
            </div>
            <div class="dept-get-total">49h 12m 33s</div>
            <div class="dept-get-total">20 Day(s)</div>

        </div>

        <div class="atdc-table-body">
            <div class="dept-emp-info">
                <div><img src="" alt="직원프사"></div>
                <div class="dept-emp-name">너구리</div>
                <div>부장</div>
                <div>교육사업부</div>
            </div>
            <div class="dept-get-total">49h 12m 33s</div>
            <div class="dept-get-total">15 Day(s)</div>
        </div>
        
    </div>

    <div id="atdc-table-weekly">
        <div id="weekly-atdc-table-head">
            <div id="weekly-table-head-name"><b>이름</b></div>
           
            <div><b>24 월</b></div>
            <div><b>25 화</b></div>
            <div><b>26 수</b></div>
            <div><b>27 목</b></div>
            <div><b>28 금</b></div>
            <div class="table-sat"><b>29 토</b></div>
            <div class="table-sun"><b>30 일</b></div>

        </div>
        
        <div class="weekly-atdc-table-body">
            <div class="dept-emp-info">
                <div><img src="" alt="직원프사"></div>
                <div class="dept-emp-name">고니</div>
                <div>대리</div>
                <div>홍보부</div>
            </div>
            <div class="dept-daily-total">
                <div>08:51:23</div>
                <div>19:31:12</div>
                <div>10h 12m 33s</div>
            </div>
            <div class="dept-daily-total">
                <div>08:51:23</div>
                <div>19:31:12</div>
                <div>10h 12m 33s</div>
            </div>
            <div class="dept-daily-total">
                <div>08:51:23</div>
                <div>19:31:12</div>
                <div>10h 12m 33s</div>
            </div>
            <div class="dept-daily-total">
                <div>08:51:23</div>
                <div>19:31:12</div>
                <div>10h 12m 33s</div>
            </div>
            <div class="dept-daily-total">
                <div>08:51:23</div>
                <div>19:31:12</div>
                <div>10h 12m 33s</div>
            </div>
            <div class="dept-daily-total">
                <div>08:51:23</div>
                <div>19:31:12</div>
                <div>10h 12m 33s</div>
            </div>
            <div class="dept-daily-total">
                <div>08:51:23</div>
                <div>19:31:12</div>
                <div>10h 12m 33s</div>
            </div>
            

        </div>

        <div class="weekly-atdc-table-body">
            <div class="dept-emp-info">
                <div><img src="" alt="직원프사"></div>
                <div class="dept-emp-name">장경철</div>
                <div>부장</div>
                <div>교육사업부</div>
            </div>
            <div class="dept-daily-total">
                <div>08:51:23</div>
                <div>19:31:12</div>
                <div>10h 12m 33s</div>
            </div>
            <div class="dept-daily-total">
                <div>08:51:23</div>
                <div>19:31:12</div>
                <div>10h 12m 33s</div>
            </div>
            <div class="dept-daily-total">
                <div>08:51:23</div>
                <div>19:31:12</div>
                <div>10h 12m 33s</div>
            </div>
            <div class="dept-daily-total">
                <div>08:51:23</div>
                <div>19:31:12</div>
                <div>10h 12m 33s</div>
            </div>
            <div class="dept-daily-total">
                <div>08:51:23</div>
                <div>19:31:12</div>
                <div>10h 12m 33s</div>
            </div>
            <div class="dept-daily-total">
                <div>08:51:23</div>
                <div>19:31:12</div>
                <div>10h 12m 33s</div>
            </div>
            <div class="dept-daily-total">
                <div>08:51:23</div>
                <div>19:31:12</div>
                <div>10h 12m 33s</div>
            </div>
            

        </div>

    </div>

</div>