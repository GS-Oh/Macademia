<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<style>
    @font-face {
	    font-family: 'AppleSDGothicNeo';
	    src: url('/md/resources/font/apple/AppleSDGothicNeoUL.ttf') format('truetype');
	}
    body{
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
    #main-content-wrap>div:nth-child(1){
        display: flex;
        justify-content: flex-start;
        align-items: center;
    }

    /*  */
    #main-content-wrap>div:nth-child(2){
        border: 1px solid #6667AB;
        border-radius: 10px;
        box-shadow: 100px;
        display: grid;
        grid-template-rows: 2fr 1fr;
        /* justify-items: flex-end; */
        align-items: center;
        margin-bottom: 50px;
    }
    #main-content-wrap>div:nth-child(2)>div:nth-child(1){
        display: grid;
        grid-template-columns: 1fr 1fr 1fr 1fr;
        justify-content: flex-end;
        align-items: center;
        margin-right: 6vw;
        margin-left: 6vw;
    }

    #off-duty-detail{
        background-color: #6667AB;
        display: grid;
        grid-template-columns: 100%;
        grid-template-rows: 1fr 1fr 1fr;
        justify-content: center;
        align-items: center;
        width: 150px;
        border-top-right-radius: 10px;
        border-bottom-right-radius: 10px;
    }
    #off-duty-detail>div{
        height: 100%;
        display: grid;
        width: 100%;
        align-content: center;
        color: white;
        padding-left: 0.2vw;
        font-size: 16px;
        text-align: center;
        letter-spacing: 1em;
    }
    #off-duty-detail>div:hover{
        cursor: pointer;
        border: 1px solid #6667AB;
        border-top-right-radius: 10px;
        border-bottom-right-radius: 10px;
        background-color: white;
        color: #6667AB;
    }

    #main-content-wrap>div:nth-child(2)>div:nth-child(1)>div{
        width: 100%;
        height: 100%;
    }
    #main-content-wrap>div:nth-child(2)>div{
        height: 100px;
    }
    #btn-area div>a{
        display: grid;
        grid-template-rows: 40px;
        justify-items: center;
        width: 100%;
    }
    #btn-area div>a:hover{
        scale: 1.1;
        /* transition: 0.5s; */
    }
    #btn-area div i{
        color: white;
    }
    .btn-border{
        background-color: #6667AB;
        width: 50px;
        height: 50px;
        border-radius: 50px;
        display: flex;
        justify-content: center;
        align-items: center;
    }
    .time-check-text{
        color: #6667AB;
        font-size: 14px;
    }
    #main-content-wrap>div:nth-child(2)>div>div{
        display: grid;
        justify-items: center;
    }
    

    #total-work-area{
        display: grid;
        grid-template-columns: 150px 150px;
        justify-content: center;
        column-gap: 50px;
    }
    #total-work-area>div{
        color: #6667AB;
        /* border: 1px solid red; */
        align-items: center;
    }
    .total-work-area-underbar{
        border-bottom: 1px solid blue;
        width: 100%;
        height: 100%;
        display: grid;        
        justify-items: center;
        align-content: center;
        font-weight: bolder;
        color: black;
    }
    .total-hr{
        color:#6667AB;
        font-size: 20px;
        font-weight: bolder;
    }
    
    /*  */
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

        //퇴근 상세버튼 보여주기
        $('#off-duty-detail').attr('style', 'visibility:hidden')

        $('#off-duty-btn').click(function(){
            if($('#off-duty-detail').css('visibility') == 'hidden'){
                $('#off-duty-detail').attr('style', 'visibility:visible')
                $('#off-duty-detail').attr('style', 'transition:1s')
            }else {
                $('#off-duty-detail').attr('style', 'visibility:hidden')
            }
        });

        //이번주 월요일 , 일요일 날짜 구하기
        // let startDate = today - day + (day == 0 ? -6 : 1);
        // let endDate = today - day + (day == 0 ? 0 : 7);
        // console.log(startDate)

        // 검색하려는 월요일과 일요일 출력
        // $('#start-date').append(year+'.'+month+'.'+startDate)
        // $('#end-date').append(year+'.'+month+'.'+endDate)

        /* 캘린더 관련 */ 
        let date = new Date();
        let yyyy = date.getFullYear();
        let mm = date.getMonth() + 1;
        let dd = date.getDate();

        console.log(new Date(2022,2,0));

        //이번주 월요일 날짜 구하기
        // console.log(.getDay())

        //이번주 일요일 날짜 구하기

        //매월 마지막 일자 구하기
        
        $('#selected-date').append(yyyy+'.'+mm+'.'+dd);
        
        //오른쪽 버튼 클릭 이벤트
        $('#next-week').on('click', function(){
            let today = new Date();

            //오늘부터 1주일 뒤
            let wklater = today.getDate() + 7;
            let lastDate = new Date(today.getFullYear(), today.getMonth(), 0).getDate();
            
            if(wklater > lastDate){
                date = new Date(today.getFullYear(), today.getMonth() + 1);
                month = date.getMonth();
                today = date.getDate();
                
                today + (7 - (lastDate - today));
                console.log(month);
                console.log(lastDate);
            } else if(wklater <= lastDate){
                date = new Date(today.getFullYear(), today.getMonth());
                month = date.getMonth();
                today = date.getDate();
                today += 7;
                console.log(month);
                console.log(lastDate);
            }

            $('#selected-date').replaceWith
            ('<div id="selected-date"><span id="end-date">'+year+'.'+month+'.'+today+'</span></div>')
        
        });

        //왼쪽 버튼 클릭 이벤트
        $('#prev-week').click(function(){
           //오늘부터 1주일 전
        //    let wkbefore = today - 7;
        //    let lastDate = new Date(year, month, 0).getDate();
            
        //     if(wkbefore < 1){
        //         date = new Date(year, month, 0);
        //         month = date.getMonth();
        //         today = date.getDate();
                
        //         today + (7 - (lastDate - today));
        //         console.log(month);
        //         console.log(lastDate);
        //     } else if(wkbefore <= lastDate){
        //         date = new Date(year, month, today);
        //         month = date.getMonth();
        //         today = date.getDate();
        //         today -= 7;
        //         console.log(month);
        //         console.log(lastDate);
        //     }
            

        //     $('#selected-date').replaceWith
        //     ('<div id="selected-date"><span id="end-date">'+year+'.'+month+'.'+today+'</span></div>')
        });
    });
</script>

<div id="main-content-wrap">
    <div>
        <h4>근무 관리</h4>
    </div>

    <div>
        <div id="btn-area">
            <div></div>
            <div>
                <div><a href=""><div class="btn-border"><i class="fa-solid fa-arrow-right-to-bracket fa-2xl"></i></div><br><b class="time-check-text">출근하기</b></a></div>
                <div>08:57:34</div>
            </div>

            <div>
                <div id="off-duty-btn"><a><div class="btn-border"><i class="fa-solid fa-arrow-right-from-bracket fa-2xl"></i></div><br><b class="time-check-text">퇴근하기</b></a></div>
                <div>18:37:14</div>
            </div>
            <div id="off-duty-detail">
                <div class="off-duty-detail-btn">퇴근</div>
                <div class="off-duty-detail-btn">반차</div>
                <div class="off-duty-detail-btn">외근</div>
            </div>
        </div>
        
        <div id="total-work-area">
            <div>
                <div class="total-work-area-underbar">
                    <span>이번 주 누적근무</span>
                </div>
                <div>
                    <span class="total-hr">45h 30m 89s</span>
                </div>
            </div>
            
            <div>
                <div class="total-work-area-underbar">
                    <span>이번 달 누적근무</span>
                </div>
                <div>
                    <span class="total-hr">172h 30m 89s</span>
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
            <!-- <span id="start-date"></span> ~ 
            <span id="end-date"></span> -->
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