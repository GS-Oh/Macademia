<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<style>
    #main-content-wrap>div{
        /* border: 1px solid rebeccapurple; */
    }
    #main-content-wrap{
        width: 60vw;
        /* border: 3px solid black; */
        padding: 2vw;
        display: grid;
        grid-template-rows: 10vh 30vh 10vh 10vh;
        row-gap: 10px;
    }
    #main-content-wrap>div:nth-child(1){
        display: flex;
        justify-content: flex-start;
        align-items: center;
    }
    #main-content-wrap>div:nth-child(2){
        border: 1px solid blue;
        display: flex;
        justify-content: center;
        align-items: center;
    }
    #main-content-wrap>div:nth-child(3){
        /* border: 1px solid blue; */
        display: flex;
        justify-content: flex-start;
        align-items: center;
    }
    #main-content-wrap>div:nth-child(4){
        display: flex;
        justify-content: center;
        align-items: flex-start;
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



<div id="main-content-wrap">
    <div>
        <h4>근무 관리</h4>
    </div>

    <div>
        <form action="">
            <div>
                <div>
                    <button></button>
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
        </form>
    </div>

    <div>
        <h4>나의 근태 현황</h4>
    </div>

    <div>
        <h4><input type="date" value="2022-10-20"></h4>
    </div>

    <div id="atdc-table">
        <div id="atdc-table-title">
            <div><b>일자</b></div>
            <div><b>업무시작</b></div>
            <div><b>업무종료</b></div>
            <div><b>총 근무시간</b></div>
            <div><b>상태</b></div>
        </div>

        <div>
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