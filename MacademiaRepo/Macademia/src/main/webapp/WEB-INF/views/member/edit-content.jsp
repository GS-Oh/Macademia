<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<style>
    @import url('https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@500&display=swap');
    #edit-content{
        height: 80vh;
        width: 60vw;
        /* border: 1px solid black; */
        text-align: center;
        font-family: 'Noto Sans KR', sans-serif;
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
    <h1>사원정보수정</h1>
    <form action="" method="post" enctype="multipart/form-data">
        <label for="name">이름</label>
        <input type="text" id="name" name="name" value="아이유" disabled> 
        <label for="email">사내이메일</label>
        <input type="text" id="email" name="email" value="asdf@md.com" disabled> 
        <label for="email">비밀번호</label>
        <input type="text" id="pwd" name="pwd"> 
        <label for="email">비밀번호확인</label>
        <input type="text" id="pwd2" name="pwd2"> 
        <label for="email">개인이메일</label>
        <input type="text" id="private-mail" name="privateEmail"> 
        <label for="email">주소</label>
        <input type="text" id="address" name="address"> 
        <label for="email">상세주소</label>
        <input type="text" id="address2" name="address2"> 
        <label for="email">전화번호</label>
        <input type="text" id="phone" name="phone"> 
        <label for="email">은행</label>
        <input type="text" id="bank" name="bank"> 
        <label for="email">계좌번호</label>
        <input type="text" id="account" name="account"> 
        <label for="email">프로필사진</label>
        <input type="file" id="profile" name="profile"> 
        <input type="submit" id="submit-btn" value="수정완료">
    </form>
    
</div>

<!-- 주소찾기 API -->
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
const width = 500;
const height = 500;
window.onload = function(){
    document.getElementById("address").addEventListener("click", function(){ //주소입력칸을 클릭하면
        //카카오 지도 발생
        new daum.Postcode({
            width:width,
            height:height,
            oncomplete: function(data) { //선택시 입력값 세팅
                document.getElementById("address").value = data.address; // 주소 넣기
                document.getElementById("address2").focus(); //상세입력 포커싱
            }
        }).open({
            top:window.screen.height/2-width/2,
            left:window.screen.width/2-height/2
        });
    });
}
</script>