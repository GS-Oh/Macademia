<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<style>
    #roll-content-wrap{
        width: 60vw;
        /* border: 3px solid black; */
        padding: 2vw;
        display: grid;
        grid-template-rows: 10vh 5vh;
        row-gap: 10px;
    }
    #roll-content-wrap>div:nth-child(1){
        display: flex;
        justify-content: flex-start;
        align-items: center;
    }
    #roll-content-wrap>div:nth-child(2){
        display: flex;
        justify-content: flex-start;
        align-items: center;
    }
    #roll-content-wrap>div:nth-child(2)>input[type='text']{
        width: 300px;
        height: 30px;
        border: none;
        border: 1px solid black;
        margin-right: 5px;
        padding-left: 10px;
    }
    #roll-content-wrap>div:nth-child(2)>input[type='submit']{
        width: 100px;
        height: 30px;
        border: none;
        background-color: #6667AB;
        color: white;
    }
    #roll-content-wrap>div:nth-child(2)>input[type='submit']:hover{
        font-weight: bolder;
    }
    
    #class-list{
        border-top: 1px solid gray;
        width: 100%;
        display: grid;
        row-gap: 10px;
        padding-top: 10px;
    }
    #class-list>div:nth-child(1)>div{
        font-size: 13px;
    }
    #class-list>div{
        border-bottom: 1px solid gray;
        padding-left: 20px;
        padding-bottom: 10px;
        display: grid;
        grid-template-columns: 1fr 1.5fr 3fr 1fr 1fr 1fr 1.3fr 0.7fr;
        column-gap: 1vw;
    }

    #page-area{
        height: 4vh;
        display: grid;
        grid-template-columns: repeat(9, 3vh);
        grid-template-rows: 3vh;
        justify-content: center;
        align-content: center;
        justify-items: center;
        align-items: center;
        column-gap: 5px;
    }
    #page-area>div{
        border: 1px solid gray;
        width: 100%;
        height: 100%;
    }
    #page-area a{
        display: flex;
        width: 100%;
        height: 100%;
        justify-content: center;
        align-items: center;
    }
</style>

<script>
    $(function(){
        $('.select-one-class').click(function(){
            console.log(this);
            location.href="/md/student/roll/detail";
        });
    });
</script>

<div id="roll-content-wrap">
    <div><h4>수강생 출결관리</h4></div>

    <div>
        <input type="text" placeholder="강의명을 입력해주세요">
        <input type="submit" value="강의 검색">
    </div>
    
    <div id="class-list">
        <div>
            <div><b>개강일자</b></div>
            <div><b>카테고리</b></div>
            <div><b>강의명</b></div>
            <div><b>담당강사</b></div>
            <div><b>강의실</b></div>
            <div><b>종강일자</b></div>
            <div><b>수업 시간</b></div>
            <div><b>인원</b></div>
        </div>

        <div class="select-one-class">
            <div>22.10.17</div>
            <div>디지털 컨버전스</div>
            <div>자바(JAVA)기반 클라우드 융합 개발자 양성과정A</div>
            <div>심투용</div>
            <div>20-D</div>
            <div>22.11.24</div>
            <div>15:30 ~ 22:00</div>
            <div>30명</div>
        </div>

        <div class="select-one-class">
            <div>22.10.17</div>
            <div>디지털 컨버전스</div>
            <div>자바(JAVA)기반 클라우드 융합 개발자 양성과정A</div>
            <div>심투용</div>
            <div>20-D</div>
            <div>22.11.24</div>
            <div>15:30 ~ 22:00</div>
            <div>30명</div>
        </div>

        <div class="select-one-class">
            <div>22.10.17</div>
            <div>디지털 컨버전스</div>
            <div>자바(JAVA)기반 클라우드 융합 개발자 양성과정A</div>
            <div>심투용</div>
            <div>20-D</div>
            <div>11.24</div>
            <div>15:30 ~ 22:00</div>
            <div>30명</div>
        </div>

        <div class="select-one-class">
            <div>22.10.17</div>
            <div>디지털 컨버전스</div>
            <div>자바(JAVA)기반 클라우드 융합 개발자 양성과정A</div>
            <div>심투용</div>
            <div>20-D</div>
            <div>11.24</div>
            <div>15:30 ~ 22:00</div>
            <div>30명</div>
        </div>

        <div class="select-one-class">
            <div>22.10.17</div>
            <div>디지털 컨버전스</div>
            <div>자바(JAVA)기반 클라우드 융합 개발자 양성과정A</div>
            <div>심투용</div>
            <div>20-D</div>
            <div>11.24</div>
            <div>15:30 ~ 22:00</div>
            <div>30명</div>
        </div>

        <div class="select-one-class">
            <div>22.10.17</div>
            <div>디지털 컨버전스</div>
            <div>자바(JAVA)기반 클라우드 융합 개발자 양성과정A</div>
            <div>심투용</div>
            <div>20-D</div>
            <div>11.24</div>
            <div>15:30 ~ 22:00</div>
            <div>30명</div>
        </div>

        <div class="select-one-class">
            <div>22.10.17</div>
            <div>디지털 컨버전스</div>
            <div>자바(JAVA)기반 클라우드 융합 개발자 양성과정A</div>
            <div>심투용</div>
            <div>20-D</div>
            <div>11.24</div>
            <div>15:30 ~ 22:00</div>
            <div>30명</div>
        </div>

        <div class="select-one-class">
            <div>22.10.17</div>
            <div>디지털 컨버전스</div>
            <div>자바(JAVA)기반 클라우드 융합 개발자 양성과정A</div>
            <div>심투용</div>
            <div>20-D</div>
            <div>11.24</div>
            <div>15:30 ~ 22:00</div>
            <div>30명</div>
        </div>

        <div class="select-one-class">
            <div>22.10.17</div>
            <div>디지털 컨버전스</div>
            <div>자바(JAVA)기반 클라우드 융합 개발자 양성과정A</div>
            <div>심투용</div>
            <div>20-D</div>
            <div>11.24</div>
            <div>15:30 ~ 22:00</div>
            <div>30명</div>
        </div>

        <div class="select-one-class">
            <div>22.10.17</div>
            <div>디지털 컨버전스</div>
            <div>자바(JAVA)기반 클라우드 융합 개발자 양성과정A</div>
            <div>심투용</div>
            <div>20-D</div>
            <div>11.24</div>
            <div>15:30 ~ 22:00</div>
            <div>30명</div>
        </div>

        <div class="select-one-class">
            <div>22.10.17</div>
            <div>디지털 컨버전스</div>
            <div>자바(JAVA)기반 클라우드 융합 개발자 양성과정A</div>
            <div>심투용</div>
            <div>20-D</div>
            <div>11.24</div>
            <div>15:30 ~ 22:00</div>
            <div>30명</div>
        </div>

        <div class="select-one-class">
            <div>22.10.17</div>
            <div>디지털 컨버전스</div>
            <div>자바(JAVA)기반 클라우드 융합 개발자 양성과정A</div>
            <div>심투용</div>
            <div>20-D</div>
            <div>11.24</div>
            <div>15:30 ~ 22:00</div>
            <div>30명</div>
        </div>
        
    </div>

    <div id="page-area">
        <div><a href=""><i class="fa-solid fa-angles-left"></i></a></div>
        <div><a href=""><i class="fa-solid fa-angle-left"></i></a></div>
        <div><a href="">1</a></div>
        <div><a href="">2</a></div>
        <div><a href="">3</a></div>
        <div><a href="">4</a></div>
        <div><a href="">5</a></div>
        <div><a href=""><i class="fa-solid fa-angle-right"></i></a></div>
        <div><a href=""><i class="fa-solid fa-angles-right"></i></a></div>
    </div>

</div>