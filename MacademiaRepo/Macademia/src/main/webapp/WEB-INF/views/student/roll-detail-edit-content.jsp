<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<style>
   
    body{
        font-family: 'AppleSDGothicNeo', 'Noto Sans KR', sans-serif;
        font-size: 12px;
    }
    /* 큰 아우터 */
    #roll-detail-content-wrap-total{
        display: flex;
    }
    #roll-detail-content-wrap{
        width: 70vw;
        /* border: 3px solid black; */
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
    #class-info-month-select{
        display: grid;
        grid-template-columns: 1fr 1fr 1fr;
    }
    #class-info{
        display: grid;
        grid-template-columns: 100px 100px;
        align-items: flex-end;
        padding-top: 1vh;
        padding-bottom: 1vh;
        padding-left: 5px;
    }

    /* 범례 */
    #legend{
        margin-top: 3vw;
        margin-left: 2vw;
        display: grid;
        text-align: center;
        font-weight: bolder;
        row-gap: 2px;
    }
    #legend>div{
        display: grid;
        align-content: center;
        grid-template-columns: 1fr 1fr;
        height: 20px;
    }
    #legend>div>div{
        margin-left: 10px;
    }

    /*데이트피커*/
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

    /* 테이블 */
    #student-atdc-table{
        margin-bottom: 50px;
    }
    #student-atdc-table-head{
        display: flex;
        font-weight: bolder;
        font-size: 13px;
        height: 50px;
    }
    .table-right-border{
        display: grid;
        grid-template-columns: 0.5fr 0.5fr 1fr;
        justify-items: center;
        align-items: center;
        width: 120px;
        border-right: 1px solid gray;
    }
    .st-table-head{
        border-top: 1px double gray;
        border-bottom: 1px double gray;
    }
    #student-atdc-table-days{
        display: grid;
        grid-template-columns: repeat(31, 2vw);
        justify-items: center;
        align-items: center;
    }
    .student-atdc-table-body{
        display: flex;
    }
    
    .student-atdc-check-table{
        display: grid;
        grid-template-rows: 30px;
        justify-items: center;
        align-items: center;
        grid-template-columns: repeat(31, 2vw);
        padding-top: 10px;
        padding-bottom: 10px;
    }
    .student-atdc-check-table>div{
        padding: 0.5vw;
    }
    .body-underbar{
        border-bottom: 1px double lightgray;
    }
    

    /* 하단버튼 */
    #edit-btn-area{
        display: flex;
        justify-content: center;
        align-items: center;
    }
    #edit-btn-area>button, #edit-btn-area>input[type='submit']{
        width: 100px;
        height: 30px;
        background-color: #6667AB;
        color: white;
        border: none;
        margin: 0px 5px 0px 5px;
    }
    #edit-btn-area>button>a{
        color: white;
        display: grid;
        align-items: center;
        width: 100%;
        height: 100%;
    }
    #edit-btn-area>button:hover{
        font-weight: bolder;
    }

    /*  */
    .present{
        background-color: greenyellow;
    }
    .absent{
        background-color: red;
    }
    .tardy{
        background-color: orange;
    }
    .leave{
        background-color: aqua;
    }
    .dayoff{
        background-color: yellow;
    }
</style>

<script>

    $(function(){
        
        const box = $('.roll-check-box').get();

        for(i = 0; i < box.length; i++){
            
            if(box[i].innerText == 'FP' || box[i].innerText == 'NP'){
                $(box[i]).addClass('present');
            }else if(box[i].innerText == 'FA' || box[i].innerText == 'NA'){
                $(box[i]).addClass('absent');
            }else if(box[i].innerText == 'FT' || box[i].innerText == 'NT'){
                $(box[i]).addClass('tardy');
            }else if(box[i].innerText == 'FL' || box[i].innerText == 'NL'){
                $(box[i]).addClass('leave');
            }else if(box[i].innerText == 'DO'){
                $(box[i]).addClass('dayoff');
            }
    
        }

        /* month피커 */ 
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
<div id="roll-detail-content-wrap-total">
<div id="roll-detail-content-wrap">
    
    <div><h4>자바(JAVA)기반 클라우드 융합 개발자 양성과정A</h4></div>

    <div id="class-info-month-select">
        <div id="class-info">
            <div>강사님</div>
            <div><b>심삼용</b></div>
            <div>강의실</div>
            <div><b>201-D</b></div>
        </div>
        <div id="month-select">
            <div id="prev-month" class="go-prev"><i class="fa-solid fa-angle-left"></i></div>
            <div id="selected-month">
                <span id="start-month"></span>
            </div>
            <div id="next-month" class="go-next"><i class="fa-solid fa-angle-right"></i></div>
        </div>
        <div></div>
    </div>

    <div id="student-atdc-table">

        <div id="student-atdc-table-head">
            <div class="table-right-border st-table-head">
                <input type="checkbox">
                <div>번호</div>
                <div>이름</div>
            </div>

            <div id="student-atdc-table-days" class="st-table-head">
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
        </div>

        <div class="student-atdc-table-body">
            <div class="table-right-border body-underbar">
                <input type="checkbox">
                <div>1</div>
                <div>최형배</div>
            </div>
            
            <div class="student-atdc-check-table body-underbar">
                <div class="roll-check-box">FP</div>
                <div class="roll-check-box">NP</div>
                <div class="roll-check-box">FL</div>
                <div class="roll-check-box">FT</div>
                <div class="roll-check-box">NP</div>
                <div class="roll-check-box">NP</div>
                <div class="roll-check-box">FP</div>
                <div class="roll-check-box">FP</div>
                <div class="roll-check-box">NT</div>
                <div class="roll-check-box">FP</div>
                <div class="roll-check-box">FP</div>
                <div class="roll-check-box">FP</div>
                <div class="roll-check-box">DO</div>
                <div class="roll-check-box">FP</div>
                <div class="roll-check-box">FP</div>
                <div class="roll-check-box">DO</div>
                <div class="roll-check-box">FP</div>
                <div class="roll-check-box">FP</div>
                <div class="roll-check-box">FP</div>
                <div class="roll-check-box">FP</div>
                <div class="roll-check-box">FP</div>
                <div class="roll-check-box">FP</div>
                <div class="roll-check-box">FP</div>
                <div class="roll-check-box">FP</div>
                <div class="roll-check-box">FA</div>
                <div class="roll-check-box">FP</div>
                <div class="roll-check-box">FP</div>
                <div class="roll-check-box">FP</div>
                <div class="roll-check-box">FP</div>
                <div class="roll-check-box">FP</div>
                <div class="roll-check-box">FP</div>
            </div>
        </div>

        <div class="student-atdc-table-body">
            <div class="table-right-border body-underbar">
                <input type="checkbox">
                <div>2</div>
                <div>최익현</div>
            </div>
            
            <div class="student-atdc-check-table body-underbar">
                <div class="roll-check-box">FP</div>
                <div class="roll-check-box">NP</div>
                <div class="roll-check-box">FL</div>
                <div class="roll-check-box">FT</div>
                <div class="roll-check-box">NP</div>
                <div class="roll-check-box">NP</div>
                <div class="roll-check-box">FP</div>
                <div class="roll-check-box">FP</div>
                <div class="roll-check-box">NT</div>
                <div class="roll-check-box">FP</div>
                <div class="roll-check-box">FP</div>
                <div class="roll-check-box">FP</div>
                <div class="roll-check-box">DO</div>
                <div class="roll-check-box">FP</div>
                <div class="roll-check-box">FP</div>
                <div class="roll-check-box">DO</div>
                <div class="roll-check-box">FP</div>
                <div class="roll-check-box">FP</div>
                <div class="roll-check-box">FP</div>
                <div class="roll-check-box">FP</div>
                <div class="roll-check-box">FP</div>
                <div class="roll-check-box">FP</div>
                <div class="roll-check-box">FP</div>
                <div class="roll-check-box">FP</div>
                <div class="roll-check-box">FP</div>
                <div class="roll-check-box">FP</div>
                <div class="roll-check-box">FP</div>
                <div class="roll-check-box">FP</div>
                <div class="roll-check-box">FP</div>
                <div class="roll-check-box">NA</div>
                <div class="roll-check-box">FP</div>
            </div>
        </div>

    </div>

    <form action="">
        <div id="edit-btn-area">
            <button><a href="${root}/student/roll//detail">뒤로가기</a></button>
            <input type="submit" value="저장하기">
        </div>
    </form>

</div>

<div id="">
        
    <div id="legend">
        <div>
            <div>온라인</div>
            <div>N-</div>
        </div>
        <div>
            <div>오프라인</div>
            <div>F-</div>
        </div>
        <div>
            <div>원격출석</div>
            <div class="roll-check-box">NP</div>
        </div>
        <div>
            <div>등원출석</div>
            <div class="roll-check-box">FP</div>
        </div>
        <div>
            <div>원격지각</div>
            <div class="roll-check-box">NT</div>
        </div>
        <div>
            <div>등원지각</div>
            <div class="roll-check-box">FT</div>
        </div>
        <div>
            <div>원격조퇴</div>
            <div class="roll-check-box">NL</div>
        </div>
        <div>
            <div>등원조퇴</div>
            <div class="roll-check-box">FL</div>
        </div>
        <div>
            <div>원격결석</div>
            <div class="roll-check-box">NA</div>
        </div>
        <div>
            <div>등원결석</div>
            <div class="roll-check-box">FA</div>
        </div>
        <div>
            <div>휴가</div>
            <div class="roll-check-box">DO</div>
        </div>
        
        
    </div>

</div>

</div>
