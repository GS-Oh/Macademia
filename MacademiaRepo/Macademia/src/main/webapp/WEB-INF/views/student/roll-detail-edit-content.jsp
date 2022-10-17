<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<style>
    #roll-detail-content-wrap>div{
        border: 1px solid rebeccapurple;
    }
    
    #roll-detail-content-wrap{
        width: 80vw;
        border: 3px solid black;
        padding: 2vw;
        display: grid;
        grid-template-rows: 10vh 10vh;
        row-gap: 10px;
    }
    #roll-detail-content-wrap>div:nth-child(1){
        display: flex;
        justify-content: flex-start;
        align-items: center;
    }
    #roll-detail-content-wrap>div:nth-child(2){
        display: grid;
        grid-template-columns: 1fr 1fr 1fr;
        justify-items: center;
        align-items: center;
    }
    #roll-detail-content-wrap>div:nth-child(2)>div:nth-child(3){
        display: grid;
        grid-template-columns: repeat(9, 1fr);
    }
    #roll-detail-content-wrap>div:nth-child(2)>div:nth-child(3)>div{
        border: 1px solid black;
    }

    #table{
        display: grid;
    }
    #table-head{
        font-weight: bolder;
        font-size: 13px;
        border-bottom: 1px double black;
        height: 30px;
    }
    #table-head>div:nth-child(1), .table-row>div:nth-child(1){
        padding: 3px;
    }
    #table>div{
        display: grid;
        grid-template-columns: repeat(34, 1fr);
    }
    #table>div>div{
        border: 1px solid black;
        text-align: center;
    }

    #edit-btn-area{
        height: 4vh;
        display: flex;
        justify-content: center;
        align-items: center;
    }
    #edit-btn-area>button{
        width: 100px;
        height: 30px;
        background-color: #6667AB;
        color: white;
        border: none;
        margin: 0px 5px 0px 5px;
    }
    #edit-btn-area>button>a{
        color: white;
    }
    #edit-btn-area>button:hover{
        font-weight: bolder;
    }

    input[type='checkbox']{
        /* width: 100%; */
        /* height: 100%; */
    }
</style>

<script>

    $(function(){
        
        
        
    });
        
</script>

<div id="roll-detail-content-wrap">
    
    <div><h4>자바(JAVA)기반 클라우드 융합 개발자 양성과정A 수정하기</h4></div>

    <div>
        <div></div>
        <div>10월</div>
        <div>
            <div>원격출석</div>
            <div>원격지각</div>
            <div>원격조퇴</div>
            <div>원격결석</div>
            <div>등원출석</div>
            <div>등원지각</div>
            <div>등원조퇴</div>
            <div>등원결석</div>
            <div>휴가</div>
            <div class="roll-check-box">OP</div>
            <div class="roll-check-box">OT</div>
            <div class="roll-check-box">OL</div>
            <div class="roll-check-box">OA</div>
            <div class="roll-check-box">FP</div>
            <div class="roll-check-box">FT</div>
            <div class="roll-check-box">FL</div>
            <div class="roll-check-box">FA</div>
            <div class="roll-check-box">DO</div>
        </div>
    </div>
    <form action="">
    <div id="table">

        <div id="table-head">
            <div><input type="checkbox"></div>
            <div>번호</div>
            <div>이름</div>
            <div>1일</div>
            <div>2일</div>
            <div>3일</div>
            <div>4일</div>
            <div>5일</div>
            <div>6일</div>
            <div>7일</div>
            <div>8일</div>
            <div>9일</div>
            <div>10일</div>
            <div>11일</div>
            <div>12일</div>
            <div>13일</div>
            <div>14일</div>
            <div>15일</div>
            <div>16일</div>
            <div>17일</div>
            <div>18일</div>
            <div>19일</div>
            <div>20일</div>
            <div>21일</div>
            <div>22일</div>
            <div>23일</div>
            <div>24일</div>
            <div>25일</div>
            <div>26일</div>
            <div>27일</div>
            <div>28일</div>
            <div>29일</div>
            <div>30일</div>
            <div>31일</div>
        </div>

        <div class="table-row">
            <div><input type="checkbox"></div>
            <div>1</div>
            <div>김길동</div>
            <div class="roll-check-box">FP</div>
            <div class="roll-check-box">OP</div>
            <div class="roll-check-box">FL</div>
            <div class="roll-check-box">FT</div>
            <div class="roll-check-box">OP</div>
            <div class="roll-check-box">OP</div>
            <div class="roll-check-box">FP</div>
            <div class="roll-check-box">FP</div>
            <div class="roll-check-box">OT</div>
            <div class="roll-check-box">FP</div>
            <div class="roll-check-box">FP</div>
            <div class="roll-check-box">FP</div>
            <div class="roll-check-box">DO</div>
            <div class="roll-check-box">FP</div>
            <div class="roll-check-box">FP</div>
            <div class="roll-check-box">DO</div>
            <div>FP</div>
            <div>FP</div>
            <div>FP</div>
            <div>FP</div>
            <div>FP</div>
            <div>FP</div>
            <div>FP</div>
            <div>FP</div>
            <div>FP</div>
            <div>FP</div>
            <div>FP</div>
            <div>FP</div>
            <div>FP</div>
            <div>FP</div>
            <div>FP</div>
        </div>

        <div class="table-row">
            <div><input type="checkbox"></div>
            <div>1</div>
            <div>김길동</div>
            <div>FP</div>
            <div>FP</div>
            <div>FP</div>
            <div>FP</div>
            <div>FP</div>
            <div>FP</div>
            <div>FP</div>
            <div>FP</div>
            <div>FP</div>
            <div>FP</div>
            <div>FP</div>
            <div>FP</div>
            <div>FP</div>
            <div>FP</div>
            <div>FP</div>
            <div>FP</div>
            <div>FP</div>
            <div>FP</div>
            <div>FP</div>
            <div>FP</div>
            <div>FP</div>
            <div>FP</div>
            <div>FP</div>
            <div>FP</div>
            <div>FP</div>
            <div>FP</div>
            <div>FP</div>
            <div>FP</div>
            <div>FP</div>
            <div>FP</div>
            <div>FP</div>
        </div>

        <div class="table-row">
            <div><input type="checkbox"></div>
            <div>1</div>
            <div>김길동</div>
            <div>FP</div>
            <div>FP</div>
            <div>FP</div>
            <div>FP</div>
            <div>FP</div>
            <div>FP</div>
            <div>FP</div>
            <div>FP</div>
            <div>FP</div>
            <div>FP</div>
            <div>FP</div>
            <div>FP</div>
            <div>FP</div>
            <div>FP</div>
            <div>FP</div>
            <div>FP</div>
            <div>FP</div>
            <div>FP</div>
            <div>FP</div>
            <div>FP</div>
            <div>FP</div>
            <div>FP</div>
            <div>FP</div>
            <div>FP</div>
            <div>FP</div>
            <div>FP</div>
            <div>FP</div>
            <div>FP</div>
            <div>FP</div>
            <div>FP</div>
            <div>FP</div>
        </div>

        <div class="table-row">
            <div><input type="checkbox"></div>
            <div>1</div>
            <div>김길동</div>
            <div>FP</div>
            <div>FP</div>
            <div>FP</div>
            <div>FP</div>
            <div>FP</div>
            <div>FP</div>
            <div>FP</div>
            <div>FP</div>
            <div>FP</div>
            <div>FP</div>
            <div>FP</div>
            <div>FP</div>
            <div>FP</div>
            <div>FP</div>
            <div>FP</div>
            <div>FP</div>
            <div>FP</div>
            <div>FP</div>
            <div>FP</div>
            <div>FP</div>
            <div>FP</div>
            <div>FP</div>
            <div>FP</div>
            <div>FP</div>
            <div>FP</div>
            <div>FP</div>
            <div>FP</div>
            <div>FP</div>
            <div>FP</div>
            <div>FP</div>
            <div>FP</div>
        </div>

        <div class="table-row">
            <div><input type="checkbox"></div>
            <div>1</div>
            <div>김길동</div>
            <div>FP</div>
            <div>FP</div>
            <div>FP</div>
            <div>FP</div>
            <div>FP</div>
            <div>FP</div>
            <div>FP</div>
            <div>FP</div>
            <div>FP</div>
            <div>FP</div>
            <div>FP</div>
            <div>FP</div>
            <div>FP</div>
            <div>FP</div>
            <div>FP</div>
            <div>FP</div>
            <div>FP</div>
            <div>FP</div>
            <div>FP</div>
            <div>FP</div>
            <div>FP</div>
            <div>FP</div>
            <div>FP</div>
            <div>FP</div>
            <div>FP</div>
            <div>FP</div>
            <div>FP</div>
            <div>FP</div>
            <div>FP</div>
            <div>FP</div>
            <div>FP</div>
        </div>

        <div class="table-row">
            <div><input type="checkbox"></div>
            <div>1</div>
            <div>김길동</div>
            <div>FP</div>
            <div>FP</div>
            <div>FP</div>
            <div>FP</div>
            <div>FP</div>
            <div>FP</div>
            <div>FP</div>
            <div>FP</div>
            <div>FP</div>
            <div>FP</div>
            <div>FP</div>
            <div>FP</div>
            <div>FP</div>
            <div>FP</div>
            <div>FP</div>
            <div>FP</div>
            <div>FP</div>
            <div>FP</div>
            <div>FP</div>
            <div>FP</div>
            <div>FP</div>
            <div>FP</div>
            <div>FP</div>
            <div>FP</div>
            <div>FP</div>
            <div>FP</div>
            <div>FP</div>
            <div>FP</div>
            <div>FP</div>
            <div>FP</div>
            <div>FP</div>
        </div>

        <div class="table-row">
            <div><input type="checkbox"></div>
            <div>1</div>
            <div>김길동</div>
            <div>FP</div>
            <div>FP</div>
            <div>FP</div>
            <div>FP</div>
            <div>FP</div>
            <div>FP</div>
            <div>FP</div>
            <div>FP</div>
            <div>FP</div>
            <div>FP</div>
            <div>FP</div>
            <div>FP</div>
            <div>FP</div>
            <div>FP</div>
            <div>FP</div>
            <div>FP</div>
            <div>FP</div>
            <div>FP</div>
            <div>FP</div>
            <div>FP</div>
            <div>FP</div>
            <div>FP</div>
            <div>FP</div>
            <div>FP</div>
            <div>FP</div>
            <div>FP</div>
            <div>FP</div>
            <div>FP</div>
            <div>FP</div>
            <div>FP</div>
            <div>FP</div>
        </div>

        <div class="table-row">
            <div><input type="checkbox"></div>
            <div>1</div>
            <div>김길동</div>
            <div>FP</div>
            <div>FP</div>
            <div>FP</div>
            <div>FP</div>
            <div>FP</div>
            <div>FP</div>
            <div>FP</div>
            <div>FP</div>
            <div>FP</div>
            <div>FP</div>
            <div>FP</div>
            <div>FP</div>
            <div>FP</div>
            <div>FP</div>
            <div>FP</div>
            <div>FP</div>
            <div>FP</div>
            <div>FP</div>
            <div>FP</div>
            <div>FP</div>
            <div>FP</div>
            <div>FP</div>
            <div>FP</div>
            <div>FP</div>
            <div>FP</div>
            <div>FP</div>
            <div>FP</div>
            <div>FP</div>
            <div>FP</div>
            <div>FP</div>
            <div>FP</div>
        </div>

        <div class="table-row">
            <div><input type="checkbox"></div>
            <div>1</div>
            <div>김길동</div>
            <div>FP</div>
            <div>FP</div>
            <div>FP</div>
            <div>FP</div>
            <div>FP</div>
            <div>FP</div>
            <div>FP</div>
            <div>FP</div>
            <div>FP</div>
            <div>FP</div>
            <div>FP</div>
            <div>FP</div>
            <div>FP</div>
            <div>FP</div>
            <div>FP</div>
            <div>FP</div>
            <div>FP</div>
            <div>FP</div>
            <div>FP</div>
            <div>FP</div>
            <div>FP</div>
            <div>FP</div>
            <div>FP</div>
            <div>FP</div>
            <div>FP</div>
            <div>FP</div>
            <div>FP</div>
            <div>FP</div>
            <div>FP</div>
            <div>FP</div>
            <div>FP</div>
        </div>

        <div class="table-row">
            <div><input type="checkbox"></div>
            <div>1</div>
            <div>김길동</div>
            <div>FP</div>
            <div>FP</div>
            <div>FP</div>
            <div>FP</div>
            <div>FP</div>
            <div>FP</div>
            <div>FP</div>
            <div>FP</div>
            <div>FP</div>
            <div>FP</div>
            <div>FP</div>
            <div>FP</div>
            <div>FP</div>
            <div>FP</div>
            <div>FP</div>
            <div>FP</div>
            <div>FP</div>
            <div>FP</div>
            <div>FP</div>
            <div>FP</div>
            <div>FP</div>
            <div>FP</div>
            <div>FP</div>
            <div>FP</div>
            <div>FP</div>
            <div>FP</div>
            <div>FP</div>
            <div>FP</div>
            <div>FP</div>
            <div>FP</div>
            <div>FP</div>
        </div>

        <div class="table-row">
            <div><input type="checkbox"></div>
            <div>1</div>
            <div>김길동</div>
            <div>FP</div>
            <div>FP</div>
            <div>FP</div>
            <div>FP</div>
            <div>FP</div>
            <div>FP</div>
            <div>FP</div>
            <div>FP</div>
            <div>FP</div>
            <div>FP</div>
            <div>FP</div>
            <div>FP</div>
            <div>FP</div>
            <div>FP</div>
            <div>FP</div>
            <div>FP</div>
            <div>FP</div>
            <div>FP</div>
            <div>FP</div>
            <div>FP</div>
            <div>FP</div>
            <div>FP</div>
            <div>FP</div>
            <div>FP</div>
            <div>FP</div>
            <div>FP</div>
            <div>FP</div>
            <div>FP</div>
            <div>FP</div>
            <div>FP</div>
            <div>FP</div>
        </div>

        <div class="table-row">
            <div><input type="checkbox"></div>
            <div>1</div>
            <div>김길동</div>
            <div>FP</div>
            <div>FP</div>
            <div>FP</div>
            <div>FP</div>
            <div>FP</div>
            <div>FP</div>
            <div>FP</div>
            <div>FP</div>
            <div>FP</div>
            <div>FP</div>
            <div>FP</div>
            <div>FP</div>
            <div>FP</div>
            <div>FP</div>
            <div>FP</div>
            <div>FP</div>
            <div>FP</div>
            <div>FP</div>
            <div>FP</div>
            <div>FP</div>
            <div>FP</div>
            <div>FP</div>
            <div>FP</div>
            <div>FP</div>
            <div>FP</div>
            <div>FP</div>
            <div>FP</div>
            <div>FP</div>
            <div>FP</div>
            <div>FP</div>
            <div>FP</div>
        </div>

        <div class="table-row">
            <div><input type="checkbox"></div>
            <div>1</div>
            <div>김길동</div>
            <div>FP</div>
            <div>FP</div>
            <div>FP</div>
            <div>FP</div>
            <div>FP</div>
            <div>FP</div>
            <div>FP</div>
            <div>FP</div>
            <div>FP</div>
            <div>FP</div>
            <div>FP</div>
            <div>FP</div>
            <div>FP</div>
            <div>FP</div>
            <div>FP</div>
            <div>FP</div>
            <div>FP</div>
            <div>FP</div>
            <div>FP</div>
            <div>FP</div>
            <div>FP</div>
            <div>FP</div>
            <div>FP</div>
            <div>FP</div>
            <div>FP</div>
            <div>FP</div>
            <div>FP</div>
            <div>FP</div>
            <div>FP</div>
            <div>FP</div>
            <div>FP</div>
        </div>

        <div class="table-row">
            <div><input type="checkbox"></div>
            <div>1</div>
            <div>김길동</div>
            <div>FP</div>
            <div>FP</div>
            <div>FP</div>
            <div>FP</div>
            <div>FP</div>
            <div>FP</div>
            <div>FP</div>
            <div>FP</div>
            <div>FP</div>
            <div>FP</div>
            <div>FP</div>
            <div>FP</div>
            <div>FP</div>
            <div>FP</div>
            <div>FP</div>
            <div>FP</div>
            <div>FP</div>
            <div>FP</div>
            <div>FP</div>
            <div>FP</div>
            <div>FP</div>
            <div>FP</div>
            <div>FP</div>
            <div>FP</div>
            <div>FP</div>
            <div>FP</div>
            <div>FP</div>
            <div>FP</div>
            <div>FP</div>
            <div>FP</div>
            <div>FP</div>
        </div>

        <div class="table-row">
            <div><input type="checkbox"></div>
            <div>1</div>
            <div>김길동</div>
            <div>FP</div>
            <div>FP</div>
            <div>FP</div>
            <div>FP</div>
            <div>FP</div>
            <div>FP</div>
            <div>FP</div>
            <div>FP</div>
            <div>FP</div>
            <div>FP</div>
            <div>FP</div>
            <div>FP</div>
            <div>FP</div>
            <div>FP</div>
            <div>FP</div>
            <div>FP</div>
            <div>FP</div>
            <div>FP</div>
            <div>FP</div>
            <div>FP</div>
            <div>FP</div>
            <div>FP</div>
            <div>FP</div>
            <div>FP</div>
            <div>FP</div>
            <div>FP</div>
            <div>FP</div>
            <div>FP</div>
            <div>FP</div>
            <div>FP</div>
            <div>FP</div>
        </div>

        <div class="table-row">
            <div><input type="checkbox"></div>
            <div>1</div>
            <div>김길동</div>
            <div>FP</div>
            <div>FP</div>
            <div>FP</div>
            <div>FP</div>
            <div>FP</div>
            <div>FP</div>
            <div>FP</div>
            <div>FP</div>
            <div>FP</div>
            <div>FP</div>
            <div>FP</div>
            <div>FP</div>
            <div>FP</div>
            <div>FP</div>
            <div>FP</div>
            <div>FP</div>
            <div>FP</div>
            <div>FP</div>
            <div>FP</div>
            <div>FP</div>
            <div>FP</div>
            <div>FP</div>
            <div>FP</div>
            <div>FP</div>
            <div>FP</div>
            <div>FP</div>
            <div>FP</div>
            <div>FP</div>
            <div>FP</div>
            <div>FP</div>
            <div>FP</div>
        </div>

        <div class="table-row">
            <div><input type="checkbox"></div>
            <div>1</div>
            <div>김길동</div>
            <div>FP</div>
            <div>FP</div>
            <div>FP</div>
            <div>FP</div>
            <div>FP</div>
            <div>FP</div>
            <div>FP</div>
            <div>FP</div>
            <div>FP</div>
            <div>FP</div>
            <div>FP</div>
            <div>FP</div>
            <div>FP</div>
            <div>FP</div>
            <div>FP</div>
            <div>FP</div>
            <div>FP</div>
            <div>FP</div>
            <div>FP</div>
            <div>FP</div>
            <div>FP</div>
            <div>FP</div>
            <div>FP</div>
            <div>FP</div>
            <div>FP</div>
            <div>FP</div>
            <div>FP</div>
            <div>FP</div>
            <div>FP</div>
            <div>FP</div>
            <div>FP</div>
        </div>

    </div>

    <div id="edit-btn-area">
        <button><a href="${root}/student/rollDetail">취소하기</a></button>
        <button><a href="${root}/student/rollDetail/edit">수정하기</a></button>
    </div>
    </form>
</div>

