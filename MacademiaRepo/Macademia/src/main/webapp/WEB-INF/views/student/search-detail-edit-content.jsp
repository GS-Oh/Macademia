<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!-- 도로명주소 검색 api -->
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script type="text/javascript" src="${root}/resources/js/search-address/search-address.js"></script> 

<style>
    #search-detail-edit-content-wrap div{
        /* border: 1px solid red; */
    }
    #search-detail-edit-content-wrap>form{
        width: 60vw;
        /* border: 3px solid black; */
        padding: 2vw;
        display: grid;
        grid-template-rows: 10vh;
        row-gap: 10px;
    }
    #search-detail-edit-content-head{
        display: flex;
        justify-content: flex-start;
        align-items: center;
    }

    /* 정보부분 */
    #student-info-area{
        display: grid;
        grid-template-columns: 1fr 4fr;
        grid-auto-rows: 60px;
        align-content: center;
        border-top: 1px solid black;
    }
    #student-profile, .comment-area{
        grid-row: span 4;
    }
    #student-profile>img{
        margin-bottom: 10px;
    }
    #student-name{
        grid-row: span 2;
        margin-top: 20px;
    }
    .info-title{
        border-right: 1px solid lightgray;
        border-top: 1px solid lightgray;
    }
    .info-border-top{
        border-top: 1px solid lightgray;
    }
    #student-info-area>div{
        padding: 15px 0px 0px 10px;
    }
    textarea{
        resize: none;
        padding-left: 10px;
        border-radius: 0px;
    }
    #student-info-area i{
        color: #6667AB;
        width: 30px;
    }
    #search-detail-edit-content-wrap>form input{
        border-radius: 0px;
        height: 30px;
        border: 1px solid gray;
    }
    #search-detail-edit-content-wrap>form input[type='file']{
        width: 160px;
        border: 0px;
    }
    #student-dob>input{
        width: 140px;
        text-align: center;
    }
    #student-gender>input{
        margin-right: 10px;
    }
    #student-gender{
        display: grid;
        grid-template-columns: repeat(4, 30px);
        grid-auto-rows: 30px;
        align-items: center;
    }
    #student-addr-title{
        grid-row: span 2;
    }
    #student-addr{
        display: grid;
        grid-template-columns: 200px 100px 100px;
        column-gap: 10px;
        grid-row: span 2;
        text-align: center;
    }
    #sample4_jibunAddress{
        grid-column: span 2;
    }
    #student-addr>input{
        padding-left: 10px;
    }
    #addr-search-btn{
        background-color: #6667AB;
        color: white;
    }
    #student-degree>input, #student-major>input{
        width: 200px;
        padding-left: 10px;
    }
    #student-class>input{
        width: 400px;
        padding-left: 10px;
    }

    /* 하단버튼 */
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
</style>

<div id="search-detail-edit-content-wrap">

    <form action="">

        <div id="search-detail-edit-content-head"><h4>수강생 정보수정</h4></div>

        <div id="student-info-area">
            <div id="student-profile">
                <img src="" width="160px" height="180px" alt="수강생 프로필">
                <input type="file">
            </div>
            <div id="student-name"><h3>김곤</h3></div>
            <div>
                <i class="fa-solid fa-mobile-screen-button fa-2xl"></i>
                <b><input type="text" value="010-9876-5432"></b>
            </div>
            <div>
                <i class="fa-solid fa-envelope fa-xl"></i>
                <b><input type="text" value="hellohi@gmail.com"></b>
            </div>
            <div class="info-title"><b>생년월일</b></div>
            <div class="info-border-top" id="student-dob">
                <input type="number" value="1990" min="1922" max="2022">
                <input type="number" value="03" min="01" max="12">
                <input type="number" value="14" min="01" max="31">
            </div>
            <div class="info-title"><b>성별</b></div>
            <div class="info-border-top" id="student-gender">
                <input type="radio" id="m" name="gender" checked disabled>
                <label for="m">남</label>
                <input type="radio" id="f" name="gender" disabled>
                <label for="f">여</label>
            </div>
            <div class="info-title" id="student-addr-title"><b>주소</b></div>
            <div class="info-border-top" id="student-addr">
                <input type="text" id="sample4_postcode" value="" placeholder="우편번호">
                <input type="button" id="addr-search-btn" onclick="sample4_execDaumPostcode()" value="우편번호 찾기"><br>
                <input type="text" id="sample4_roadAddress" name="" value="서울시 자양로1번길 3" placeholder="도로명주소">
                <input type="text" id="sample4_jibunAddress" name="" value="자양동 993-1" placeholder="지번주소">
                <input type="text" id="sample4_detailAddress" name="" value="자양빌라 201호" placeholder="상세주소">
                <span id="guide" style="color:#999;display:none"></span>
                <input type="text" id="sample4_extraAddress" placeholder="참고항목">
            </div>
            <div class="info-title"><b>최종학력</b></div>
            <div class="info-border-top" id="student-degree"><input type="text" value="서울대학교"></div>
            <div class="info-title"><b>전공</b></div>
            <div class="info-border-top" id="student-major"><input type="text" value="경영학과"></div>
            <div class="info-title"><b>수강</b></div>
            <div class="info-border-top" id="student-class"><input type="text" value="자바(JAVA)기반 클라우드 융합 개발자 양성과정A"></div>
            <div class="info-title comment-area"><b>코멘트</b></div>
            <div class="comment-area info-border-top"><textarea name="" id="" cols="110" rows="8">네이버 취업 희망</textarea></div>
        </div>

        <div id="edit-btn-area">
            <button><a href="${root}/student/search/detail">뒤로가기</a></button>
            <input type="submit" value="수정하기">
        </div>

    </form>

</div>