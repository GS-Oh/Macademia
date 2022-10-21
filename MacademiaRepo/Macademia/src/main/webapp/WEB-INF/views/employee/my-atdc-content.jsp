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
        grid-template-rows: 10vh 30vh 10vh 50px;
        row-gap: 10px;
    }
    #main-content-wrap>div:nth-child(1){
        display: flex;
        justify-content: flex-start;
        align-items: center;
    }

    /*  */
    #main-content-wrap>div:nth-child(2){
        border: 1px solid blue;
        display: grid;
        justify-items: center;
        align-items: center;
    }
    #main-content-wrap>div:nth-child(2)>div:nth-child(1){
        display: grid;
        grid-template-columns: 100px 100px;
        /* column-gap: 20px; */
        grid-template-rows: 10vh;
        margin-bottom: 50px;
        justify-items: center;
        align-items: center;
    }
    #main-content-wrap>div:nth-child(2)>div:nth-child(1)>div{
        width: 100%;
        height: 100%;
    }
    #main-content-wrap>div:nth-child(2)>div:nth-child(1)>div>div:nth-child(1){
        border: 1px solid green;
        justify-items: center;
    }
    #main-content-wrap>div:nth-child(2)>div:nth-child(1)>div:nth-child(2){
        border-left: 1px solid blue;
    }
    #main-content-wrap>div:nth-child(2)>div{
        border: 1px solid red;
    }
    #main-content-wrap>div:nth-child(2) div:nth-child(1)>div:nth-child(2){
        /* margin-left: 10px; */
    }
    #total-work-area{
        display: grid;
        grid-template-columns: 1fr 1fr;
    }
    

    #main-content-wrap>div:nth-child(3){
        display: flex;
        justify-content: flex-start;
        align-items: center;
    }


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


    /*  */
    #atdc-table>div>div{
        /* border: 1px solid red; */
    }
    #atdc-table>div{
        display: grid;
        grid-template-columns: repeat(5, 1fr);
        border-bottom: 1px solid lightgray;
        justify-items: center;
        align-items: center;
        column-gap: 20px;
        grid-template-rows: 30px;
    }
    #atdc-table-title{
        border-top: 1px solid gray;
        border-bottom: 1px solid red;
    }
    #atdc-table{
    }
</style>

<script>
    $(function(){

        const dateObj = new Date();
        let year = dateObj.getFullYear();
        let month = dateObj.getMonth()+1;  
        let date = dateObj.getDate(); 
        let day = dateObj.getDay();

        //월요일~일요일 구하기
        let startDate = date - day + (day == 0 ? -6 : 1);
        let endDate = date - day + (day == 0 ? -6 : 7);
                         
        // 검색하려는 시작일자와 마지막일자 출력
        $('#start-date').append(year+'-'+month+'-'+startDate)
        $('#end-date').append(year+'-'+month+'-'+endDate)

        //오른쪽 버튼 클릭 이벤트
        $('#next-week').on('click', function(){

            startDate += 7
            endDate += 7
            $('#selected-date').replaceWith
            ('<div id="selected-date"><span id="start-date">'+year+'-'+month+'-'+startDate+'</span> ~ <span id="end-date">'+year+'-'+month+'-'+endDate+'</span></div>')
        
        });

        //왼쪽 버튼 클릭 이벤트
        $('#prev-week').click(function(){
           
            startDate -= 7
            endDate -= 7
            // $('#start-date').text(year+'-'+month+'-'+parseInt(startDate-7))
            // $('#end-date').text(year+'-'+month+'-'+parseInt(endDate-7))
        });
    });
</script>

<div id="main-content-wrap">
    <div>
        <h4>근무 관리</h4>
    </div>

    <div>
        <div id="btn-area">
            <div>
                <div><a href=""><i class="fa-solid fa-arrow-right-to-bracket"><br>출근하기</i></a></div>
                <div>08:57:34</div>
            </div>

            <div>
                <div><a href=""><i class="fa-solid fa-arrow-right-from-bracket"><br>퇴근하기</i></a></div>
                <div>18:37:14</div>
            </div>
        </div>
        
        <div id="total-work-area">
            <div>
                <div>
                    <h4>이번달 총 근무일</h4>
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
    </div>

    <div>
        <h4>나의 근태 현황</h4>
    </div>

    <div id="date-select-area">
        <div id="prev-week"><i class="fa-solid fa-angle-left"></i></div>
        <div id="selected-date">
            <span id="start-date"></span> ~ 
            <span id="end-date"></span>
        </div>
        <div id="next-week"><i class="fa-solid fa-angle-right"></i></div>
    </div>

    <div id="atdc-table">
        <div id="atdc-table-title">
            <div><b>일자</b></div>
            <div><b>업무시작</b></div>
            <div><b>업무종료</b></div>
            <div><b>총 근무시간</b></div>
            <div><b>상태</b></div>
        </div>

        <div class="atdc-table-weekly">
            <div>12</div>
            <div>08:46:37</div>
            <div>18:03:43</div>
            <div>9h 49m</div>
            <div>정상근무</div>
        </div>
        <div>
            <div>13</div>
            <div>08:46:37</div>
            <div>12:13:34</div>
            <div>9h 49m</div>
            <div>반차</div>
        </div>
        <div>
            <div>14</div>
            <div>08:46:37</div>
            <div>18:03:43</div>
            <div>9h 49m</div>
            <div>출장</div>
        </div>
        <div>
            <div>15</div>
            <div>00:00:00</div>
            <div>00:00:00</div>
            <div>0h 00m</div>
            <div>휴가</div>
        </div>
        <div>
            <div>12</div>
            <div>08:46:37</div>
            <div>18:03:43</div>
            <div>9h 49m</div>
            <div>정상근무</div>
        </div>
        <div>
            <div>12</div>
            <div>08:46:37</div>
            <div>18:03:43</div>
            <div>9h 49m</div>
            <div>정상근무</div>
        </div>
        <div>
            <div>12</div>
            <div>08:46:37</div>
            <div>18:03:43</div>
            <div>9h 49m</div>
            <div>정상근무</div>
        </div>
        <div>
            <div>12</div>
            <div>08:46:37</div>
            <div>18:03:43</div>
            <div>9h 49m</div>
            <div>정상근무</div>
        </div>
        <div>
            <div>12</div>
            <div>08:46:37</div>
            <div>18:03:43</div>
            <div>9h 49m</div>
            <div>정상근무</div>
        </div>
        <div>
            <div>12</div>
            <div>08:46:37</div>
            <div>18:03:43</div>
            <div>9h 49m</div>
            <div>정상근무</div>
        </div>
        <div>
            <div>12</div>
            <div>08:46:37</div>
            <div>18:03:43</div>
            <div>9h 49m</div>
            <div>정상근무</div>
        </div>
        <div>
            <div>12</div>
            <div>08:46:37</div>
            <div>18:03:43</div>
            <div>9h 49m</div>
            <div>정상근무</div>
        </div>
        <div>
            <div>12</div>
            <div>08:46:37</div>
            <div>18:03:43</div>
            <div>9h 49m</div>
            <div>정상근무</div>
        </div>
        <div>
            <div>12</div>
            <div>08:46:37</div>
            <div>18:03:43</div>
            <div>9h 49m</div>
            <div>정상근무</div>
        </div>
        <div>
            <div>12</div>
            <div>08:46:37</div>
            <div>18:03:43</div>
            <div>9h 49m</div>
            <div>정상근무</div>
        </div>
        <div>
            <div>12</div>
            <div>08:46:37</div>
            <div>18:03:43</div>
            <div>9h 49m</div>
            <div>정상근무</div>
        </div>
        <div>
            <div>12</div>
            <div>08:46:37</div>
            <div>18:03:43</div>
            <div>9h 49m</div>
            <div>정상근무</div>
        </div>
    </div>

</div>