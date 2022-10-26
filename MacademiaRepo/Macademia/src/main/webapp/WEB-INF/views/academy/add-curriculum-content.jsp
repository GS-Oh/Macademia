<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!-- 도로명주소 검색 api -->
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script type="text/javascript" src="${root}/resources/js/search-address/search-address.js"></script>    

<style>
    body{
        font-family: 'AppleSDGothicNeo', 'Noto Sans KR', sans-serif;
        font-size: 12px;
    }
    #add-curriculum-content-wrap{
        width: 60vw;
        /* border: 3px solid black; */
        padding: 2vw;
        display: grid;
        row-gap: 10px;
    }
    #add-curriculum-content-wrap-head{
        display: flex;
        justify-content: flex-start;
        align-items: center;
        height: 10vh;
    }

    

    /* 하단버튼 */
    #create-btn-area{
        height: 4vh;
        display: flex;
        justify-content: center;
        align-items: center;
    }
    #create-btn-area>button, #create-btn-area>input{
        width: 100px;
        height: 30px;
        background-color: #6667AB;
        color: white;
        border: none;
        margin: 0px 5px 0px 5px;
    }
    #create-btn-area>button>a{
        color: white;
        display: grid;
        /* width: 100%; */
        /* height: 100%; */
        align-items: center;
    }
    #create-btn-area>button:hover, #create-btn-area>input:hover{
        font-weight: bolder;
    }
</style>

<form action="">
    <div id="add-curriculum-content-wrap">


        <div id="add-curriculum-content-wrap-head"><h4>커리큘럼 정보입력</h4></div>

        <div id="create-btn-area">
            <button><a href="${root}/academy/curriculum">뒤로가기</a></button>
            <input type="submit" value="입력하기">
        </div>
    </div>
</form>