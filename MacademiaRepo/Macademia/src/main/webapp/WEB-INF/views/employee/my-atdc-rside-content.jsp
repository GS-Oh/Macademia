<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<style>
    #rside-content-wrap{
        padding: 2vw;
    }
    #status-box{
        border: 1px solid #6667AB;
        border-radius: 20px;
        padding: 20px;
        display: grid;
        row-gap: 50px;
    }
    #status-box>div{
        /* border: 1px solid black; */
    }
    #status-box>div:nth-child(2){
        display: flex;
        justify-content: center;
    }
    #status-box>div:nth-child(2)>button{
        width: 150px;
        height: 50px;
        border-radius: 30px;
        border: 2px solid #6667AB;
        background-color: white;
        color: #6667AB;
        font-weight: bolder;
    }
    #status-box>div:nth-child(2)>button:hover{
        border: 3px solid #6667AB;
    }
    
    #monthly-atdc{
        display: grid;
        grid-template-columns: 1fr;
        row-gap: 20px;
        /* justify-items: center; */
    }
    #monthly-atdc>div{
        /* border: 1px solid blue; */
        display: grid;
        grid-template-columns: 1fr;
        justify-items: center;
        row-gap: 20px;
    }
    #monthly-atdc>div:nth-child(1){
        border-bottom: 1px dotted #6667AB;
        padding-bottom: 20px;
    }
    #monthly-atdc>div:nth-child(1){
        margin-top: 20px;
    }
    .monthly-atdc-ttl{
        font-weight: bolder;
    }
    .monthly-atdc-ctt{
        font-weight: bolder;
        font-size: 20px;
        color: #6667AB;
    }
</style>

<div id="rside-content-wrap">
    <div id="status-box">
        
        
        <div id="monthly-atdc">
            <div>
                <div class="monthly-atdc-ttl">이번 달 총 근무일자</div>
                <div class="monthly-atdc-ctt">19D</div>
            </div>
            <div>
                <div class="monthly-atdc-ttl">이번 달 총 근무시간</div>
                <div class="monthly-atdc-ctt">72h 30m 89s</div>
            </div>
        </div>
        
        <div id="">
            <button>근무상태 변경</button>
            <div></div>
        </div>
    </div>
</div>