<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<style>

    #edit-content{
        height: 80vh;
        width: 60vw;
        /* border: 1px solid black; */
        text-align: center;
        font-family:'AppleSDGothicNeo', 'Noto Sans KR', sans-serif;
    }
    form{
        height: 75vh;
        width: 40%;
        display: grid;
        grid-template-columns: 1fr 1fr;
        column-gap: 10px;
        /* grid-template-rows: repeat(10, 1fr); */
        margin: auto;
        font-size: 20px;
        box-sizing: border-box;
        align-content: space-around;
    }
    #submit-btn{
        
        grid-column: 1/3;
        background-color: rgb(131, 120, 180);
        width: 50%;
        height: 40px;
        margin: auto;
        border: none;
        border-radius: 20px;
        color: white;
    }
    #submit-btn:hover{
        background-color: rgb(103, 93, 151);
        transition: 0.5s;
    }
    h1{
        margin : 20px;
        color: rgb(61, 61, 61);
    }
    #edit-content  label{
        background-color: rgb(233, 233, 233);
        border-radius: 10px;
    }

</style>

<div id="edit-content">
    <h1>사원생성</h1>
    <form action="" method="post" enctype="multipart/form-data">
        <label for="name">이름</label>
        <input type="text" id="name" name="name"> 
        <label for="email">사내이메일</label>
        <input type="text" id="email" name="email"> 
        <label for="pwd">비밀번호</label>
        <input type="text" id="pwd" name="pwd"> 
        <label for="pwd2">비밀번호확인</label>
        <input type="text" id="pwd2" name="pwd2"> 
        <label for="private-mail">개인이메일</label>
        <input type="text" id="private-mail" name="privateEmail"> 
        <label for="address">주소</label>
        <input type="text" id="address" name="address"> 
        <label for="address2">상세주소</label>
        <input type="text" id="address2" name="address2"> 
        <label for="phone">전화번호</label>
        <input type="text" id="phone" name="phone" placeholder="'-'없이 입력">
        <label for="phone">부서번호</label>
        <select name="bank" id="dept" name="bank">
            <option value="none">===선택===</option>
            <option>대표이사</option>
            <option>부원장</option>
            <option>운영기획부</option>
            <option>교육훈련부</option>
            <option>취업지원부</option>
            <option>마케팅부</option>
            <option>행정팀</option>
            <option>총무팀</option>
            <option>시설지원팀</option>
            <option>교육1팀</option>
            <option>교육2팀</option>
            <option>교재지원팀</option>
            <option>취업팀</option>
            <option>상담팀</option>
            <option>홍보팀</option>
            <option>대외협력팀</option>
        </select>
        <label for="phone">직급</label>
        <select name="bank" id="position" name="bank">
            <option value="none">===선택===</option>
            <option>대표이사</option>
            <option>부원장</option>
            <option>임원</option>
            <option>부장</option>
            <option>팀장</option>
            <option>주임</option>
            <option>대리</option>
            <option>사원</option>
            <option>인턴</option>

        </select>
        <label for="bank">은행</label>
        <select name="bank">
            <option value="none">===선택===</option>
            <option>국민은행</option>
            <option>농협</option>
            <option>기업은행</option>
            <option>신한은행</option>
            <option>하나은행</option>
        </select>
        <label for="email">계좌번호</label>
        <input type="text" id="account" name="account" placeholder="'-'없이 입력"> 
        <label for="email">프로필사진</label>
        <input type="file" id="profile" name="profile"> 
        <input type="submit" id="submit-btn" value="사원생성">
    </form>
    
</div>

<!-- 주소찾기 API -->
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
const width = 500;
const height = 500;
window.onload = function(){
    document.getElementById("address").addEventListener("click", function(){ 
        new daum.Postcode({
            width:width,
            height:height,
            oncomplete: function(data) { 
                document.getElementById("address").value = data.address; 
                document.getElementById("address2").focus(); 
            }
        }).open({
            top:window.screen.height/2-width/2,
            left:window.screen.width/2-height/2
        });
    });
}
</script>
<script>

</script>