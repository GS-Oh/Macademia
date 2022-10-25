<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<style>
    body{
        font-family: 'AppleSDGothicNeo', 'Noto Sans KR', sans-serif;
        font-size: 12px;
    }
    #search-content-wrap{
        width: 60vw;
        /* border: 3px solid black; */
        padding: 2vw;
        display: grid;
        grid-template-rows: 10vh 10vh;
        row-gap: 10px;
    }
    #search-content-wrap>div:nth-child(1){
        display: flex;
        justify-content: flex-start;
        align-items: center;
    }

    /*  */
    #search-area{
        display: grid;
        align-items: center;
    }
    #search-area>form{
        display: grid;
        grid-template-columns: 6fr 1fr;
        justify-items: flex-start;
    }
    #search-area>form>div:nth-child(1){
        display: grid;
        grid-template-columns: 1fr 1fr 1fr;
        column-gap: 5px;
    }
    #add-new-btn{
        background-color: #6667AB;
    }
    #add-new-btn i{
        color: white;
        font-weight: 100;
    }
    #add-new-btn>a{
        display: grid;
        grid-template-columns: 100px;
        justify-items: center;
        align-items: center;
        color: white;
        width: 100%;
        height: 100%;
    }
    #add-new-btn>a:hover i{
        font-weight: bolder;
    }
    #search-area select{
        width: 120px;
        height: 30px;
    }
    #search-area input[type='text']{
        padding-left: 5px;
        width: 120px;
        height: 30px;
    }
    #search-area input[type='submit']{
        width: 100px;
        height: 30px;
        border: none;
        background-color: #6667AB;
        color: white;
    }
    #search-area input[type='submit']:hover{
        font-weight: bolder;
    }

    /* 테이블 */
    #student-list{
        margin-bottom: 50px;
    }
    #student-list-head{
        display: grid;
        grid-template-columns: 0.4fr 0.7fr 1fr 2fr 2fr 3fr;
        grid-template-rows: 50px;
        justify-items: center;
        align-items: center;
        border-top: 1px solid gray;
        border-bottom: 1px solid gray;
        font-size: 13px;
    }
    .select-student-list{
        display: grid;
        grid-template-columns: 0.4fr 0.7fr 1fr 2fr 2fr 3fr;
        grid-template-rows: 50px;
        justify-items: center;
        align-items: center;
        border-bottom: 1px solid lightgray;
    }
    .select-student-list>div{
        text-align: center;
    }
   

    /*  */
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
        $('.select-student-list').click(function(){
            console.log(this);
            location.href="/md/student/search/detail";
        });
    });
</script>

<div id="search-content-wrap">
    <div><h4>수강생 정보조회</h4></div>

    <div id="search-area">
        <form action="">
            <div>
                <select name="" id="">
                    <option value="">강의 전체</option>
                    <option value="">자바(JAVA)기반 클라우드 융합 개발자 양성과정A</option>
                    <option value="">Python 활용 빅데이터 기반 금융 솔루션 UI 개발자 양성과정</option>
                    <option value="">(스마트웹&콘텐츠개발)반응형 UI/UX 웹콘텐츠 개발자 양성과정A7</option>
                </select>
                <input type="text" placeholder="이름을 입력해주세요">
                <input type="submit" value="조회">
            </div>
            <div>
                <div id="add-new-btn"><a href="${root}/student/search/add"><i class="fa-solid fa-plus fa-1x"></i></a></div>
            </div>
        </form>
    </div>

    <div id="student-list">
        <div id="student-list-head">
            <div><b>번호</b></div>
            <div><b>이름</b></div>
            <div><b>휴대폰</b></div>
            <div><b>이메일</b></div>
            <div><b>주소</b></div>
            <div><b>수강내역</b></div>
        </div>

        <div class="select-student-list">
            <div>1</div>
            <div>김길동</div>
            <div>010-1234-5678</div>
            <div>youcrazy@naver.com</div>
            <div>서울시 광진구 자양동</div>
            <div>자바(JAVA)기반 클라우드 융합 개발자 양성과정A</div>
        </div>
        <div class="select-student-list">
            <div>2</div>
            <div>김길동</div>
            <div>010-6666-2222</div>
            <div>helloheloo@hanmai.net</div>
            <div>서울시 송파구 문정동</div>
            <div>(스마트웹&콘텐츠개발)반응형 UI/UX 웹콘텐츠 개발자 양성과정A7</div>
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