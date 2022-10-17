<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<style>
    #roll-detail-content-wrap>div{
        /* border: 1px solid rebeccapurple; */
    }
    
    #roll-detail-content-wrap{
        width: 60vw;
        /* border: 3px solid black; */
        padding: 2vw;
        display: grid;
        grid-template-rows: 10vh 10vh 10vh;
        row-gap: 10px;
    }
    #roll-detail-content-wrap>div:nth-child(1){
        display: flex;
        justify-content: flex-start;
        align-items: center;
    }
    #roll-detail-content-wrap>div:nth-child(2){
        padding: 0px 20vh 0px 20vh;
        display: flex;
        justify-content: space-evenly;
        align-items: center;
    }
    #roll-detail-content-wrap>div:nth-child(2)>div:nth-child(1),
    #roll-detail-content-wrap>div:nth-child(2)>div:nth-child(3){
        border: 1px solid #6667AB;
        width: 30px;
        height: 30px;
    }
    #roll-detail-content-wrap>div:nth-child(2)>div:nth-child(1)>a,
    #roll-detail-content-wrap>div:nth-child(2)>div:nth-child(3)>a{
        display: flex;
        justify-content: center;
        align-items: center;
        width: 100%;
        height: 100%;
    }
    #roll-detail-content-wrap>div:nth-child(2)>div:nth-child(1)>a>i,
    #roll-detail-content-wrap>div:nth-child(2)>div:nth-child(3)>a>i{
        color: #6667AB;
    }
    #roll-detail-content-wrap>div:nth-child(3)>div:nth-child(1){
        display: grid;
        grid-template-columns: repeat(9, 50px);
    }
    #roll-detail-content-wrap>div:nth-child(3)>div:nth-child(1)>div{
        border: 1px solid black;
    }
    
    /*  */
    #table{
        box-sizing: border-box;
        display: grid;
        grid-template-rows: 30px;
        overflow-x: scroll;
    }
    #table-head{
        font-weight: bolder;
        font-size: 13px;
        display: grid;
        grid-template-columns: repeat(33, 50px);
        border-bottom: 1px double black;
    }
    #table>div{
        display: grid;
        grid-template-columns: repeat(33, 50px);
    }
    #table>div>div{
        border: 1px solid black;
        text-align: center;
    }

    /*  */
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
        /* display: inline-block; */
        width: 100%;
        height: 100%;
    }
    #edit-btn-area>button:hover{
        font-weight: bolder;
    }

    /*  */
    .online{
        background-color: skyblue;
    }
    .offline{
        background-color: greenyellow;
    }
    .dayoff{
        background-color: red;
    }
</style>

<script>

    $(function(){
        
        const box = $('.roll-check-box').get();

        for(i = 0; i < box.length; i++){
            
            if(box[i].innerText == 'FP' || box[i].innerText == 'FT' || box[i].innerText == 'FA' || box[i].innerText == 'FL'){
                $(box[i]).addClass('online');
            }else if(box[i].innerText == 'OP' || box[i].innerText == 'OT' || box[i].innerText == 'OA' || box[i].innerText == 'OL'){
                $(box[i]).addClass('offline');
            }else if(box[i].innerText == 'DO'){
                $(box[i]).addClass('dayoff');
            }
    
        }
        
    });
        
</script>

<div id="roll-detail-content-wrap">
    
    <div><h4>자바(JAVA)기반 클라우드 융합 개발자 양성과정A</h4></div>

    <div>
        <div><a href=""><i class="fa-solid fa-angle-left"></i></a></div>
        <h4>10월</h4>
        <div><a href=""><i class="fa-solid fa-angle-right"></i></a></div>
    </div>

    <div>
        
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
        <div></div>

    </div>

    <div id="table">

        <div id="table-head">
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

        <div>
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

        <div>
            <div>1</div>
            <div>김고니</div>
            <div>FP</div>
            <div>FP</div>
            <div>FP</div>
            <div>FP</div>
            <div>FP</div>
            <div>FP</div>
            <div>FP</div>
            <div>FP</div>
            <div>FP</div>
            <div>FP</div>
            <div>FP</div>
            <div>FP</div>
            <div>FP</div>
            <div>FP</div>
            <div>FP</div>
            <div>FP</div>
            <div>FP</div>
            <div>FP</div>
            <div>FP</div>
            <div>FP</div>
            <div>FP</div>
            <div>FP</div>
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

        <div>
            <div>1</div>
            <div>김광렬</div>
            <div>FP</div>
            <div>FP</div>
            <div>FP</div>
            <div>FP</div>
            <div>FP</div>
            <div>FP</div>
            <div>FP</div>
            <div>FP</div>
            <div>FP</div>
            <div>FP</div>
            <div>FP</div>
            <div>FP</div>
            <div>FP</div>
            <div>FP</div>
            <div>FP</div>
            <div>FP</div>
            <div>FP</div>
            <div>FP</div>
            <div>FP</div>
            <div>FP</div>
            <div>FP</div>
            <div>FP</div>
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

        <div>
            <div>1</div>
            <div>김철용</div>
            <div>FP</div>
            <div>FP</div>
            <div>FP</div>
            <div>FP</div>
            <div>FP</div>
            <div>FP</div>
            <div>FP</div>
            <div>FP</div>
            <div>FP</div>
            <div>FP</div>
            <div>FP</div>
            <div>FP</div>
            <div>FP</div>
            <div>FP</div>
            <div>FP</div>
            <div>FP</div>
            <div>FP</div>
            <div>FP</div>
            <div>FP</div>
            <div>FP</div>
            <div>FP</div>
            <div>FP</div>
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

        <div>
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

        <div>
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

        <div>
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

        <div>
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

        <div>
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

        <div>
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

        <div>
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

        <div>
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

        <div>
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

        <div>
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

        <div>
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

        <div>
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

        <div>
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
        <button><a href="${root}/student/roll">뒤로가기</a></button>
        <button><a href="${root}/student/roll/detail/edit">수정하기</a></button>
    </div>

</div>

