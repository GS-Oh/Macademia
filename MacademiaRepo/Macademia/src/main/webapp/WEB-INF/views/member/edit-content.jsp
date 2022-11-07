<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<style>

    #edit-content{
        height: 80vh;
        width: 60vw;
        /* border: 1px solid black; */
        font-family:'AppleSDGothicNeo', 'Noto Sans KR', sans-serif;
    }
    h1{
        margin : 20px;
        color: rgb(61, 61, 61);
    }
    #member-form{
        width: 100%;  
    }
    #container{
        /* width: 100%; */
        display: grid;
        /* border: 1px solid grey; */
        /* border-radius: 15px; */
        grid-template-columns: 200px 200px 270px 200px 270px;
        grid-template-rows: repeat(10, 50px);
        margin:0 auto;
        font-size: 20px;
    }
    #container label{
        background-color: rgb(232, 230, 241);
        display: flex;
        /* width: 100%; */
        /* height: 100%; */
        align-items: center;
        justify-content: center;
    }
    #container input, #profile-wrap {
        border: 1px solid #d5d5e1;
    }
    #container input, #container select{
        padding-left: 10px;
    }
    #profile-img-wrap{
        width: 100%;
        height: 100%;
        grid-row: 1/6;
        display: grid;
        grid-template-rows: 4fr 1fr;
        position: relative;
    }
    #profile-img-wrap img{
        width: 100%;
        height: 200px;
    }
    #quitYnBadge{
        position: absolute;
        top: 5px;
        left: 5px;
    }
    .bg-success{background-color: rgb(39, 194, 39) !important;}
    .bg-danger{background-color: rgb(255, 30, 30) !important;}

    #name-wrap{
        /* border: 1px solid red; */
        display: grid;
        grid-template-columns: 1fr 2fr;
        text-align: center;
    }
    #name-wrap *{
        height: 100%;
        display: grid;
        align-items: center;
        justify-content: center;
        background-color: #9393c1;
        color: white;
        font-weight: 700;
    }
    #address, #address2, #email, #private-email{
        grid-column: 2/6;
    }

    #profile-wrap{
        display: flex;
        align-items: center;
        width: 100%;
        grid-column: 2/6;
    }
    #profile{
        border : none !important;
    }


    #btn-wrap{
        /* border: 1px solid black; */
        display: flex;
        justify-content: center;
    }
    #submit-btn{
        background-color: rgb(131, 120, 180);
        width: 20%;
        height: 40px;
        border: none;
        border-radius: 20px;
        color: white;
        font-size: 20px;
        margin: 20px;
    }
    #submit-btn:hover{
        background-color: rgb(103, 93, 151);
        transition: 0.5s;
    }
    #pwd-change-btn{
        background-color: rgb(206, 80, 80);
        width: 20%;
        height: 40px;
        border: none;
        border-radius: 20px;
        color: white;
        font-size: 20px;
        margin: 20px;
    }
    #pwd-change-btn:hover{
        background-color: rgb(197, 49, 49);
        transition: 0.5s;
    }



</style>
<script>
    console.log('${loginMember}')
</script>
<div id="edit-content">
    <h1>사원정보수정</h1>
    <hr>
    <form id="member-form" action="" method="post" enctype="multipart/form-data">
        <div id="container">
            <div id="profile-img-wrap">
                <img id="profile-thumbnail" src="/md/resources/upload/profile/${loginMember.profileName}" alt="프로필이미지">
                <div id="name-wrap">
                    <div>성명</div>
                    <div>${loginMember.name}</div>
                </div>
                <c:if test="${loginMember.quitYn == 'N' }">
                	<span id="quitYnBadge" class="badge rounded-pill bg-success">재직</span>
                </c:if>
                <c:if test="${loginMember.quitYn == 'Y' }">
                	<span id="quitYnBadge" class="badge rounded-pill bg-danger">퇴사</span>
                </c:if>
            </div>

            <input type="hidden" id="no" name="no" value="${loginMember.no}">
            <input type="hidden" id="name" name="name" value="${loginMember.name}">
            <input type="hidden" id="profileName" name="profileName" value="${loginMember.profileName}">
            <input type="hidden" id="grade" name="grade" value="${loginMember.grade}">
            <input type="hidden" id="positionNo" name="positionNo" value="${loginMember.positionNo}">

            <label for="enrollDate">입사일</label>
            <input type="date" id="startDate" name="startDate" value="${loginMember.startDate}" readonly> 
            <label for="quitDate">퇴사일</label>
            <input type="date" id="quitDate" name="quitDate" value="${loginMember.quitDate}" readonly> 
            <label for="dept">부서</label>
            <input type="text" id="dept" name="dept" value="${loginMember.deptName}" readonly> 
            <label for="phone">전화번호</label>
            <input type="text" id="phone" name="phone" value="${loginMember.phone}">  
            <label for="position">직책</label>
            <input type="text" id="position" name="position" value="${loginMember.positionName}" readonly >
            <label for="bank">은행</label>
            <select id="bank" name="bankNo">
            	<option value="none">=====선택=====</option>
            </select>
            <label for="rank">직급</label>
            <input type="text" id="rank" name="rank" value="${loginMember.rankName}" readonly> 
            <label for="email">계좌번호</label>
            <input type="text" id="account" name="account" value="${loginMember.account}"> 
            <label for="pwd">비밀번호</label>
            <input type="password" id="pwd" name="pwd"> 
            <label for="pwd2">비밀번호확인</label>
            <input type="password" id="pwd2" name="pwd2"> 


            <label for="email">사내이메일</label>
            <input type="text" id="email" name="email" value="${loginMember.email}" readonly> 
            <label for="private-email">개인이메일</label>
            <input type="text" id="private-email" name="privateEmail" value="${loginMember.privateEmail}" readonly> 
            <label for="address">주소</label>
            <input type="text" id="address" name="address" value="${loginMember.address}"> 
            <label for="address2">상세주소</label>
            <input type="text" id="address2" name="address2" value="${loginMember.address2}" > 

            <label for="email">프로필사진</label>
            <div id="profile-wrap">
                <input type="file" id="profile" name="profile" onchange="readURL(this);"> 
            </div>
            
        </div>
        <div id="btn-wrap">
            <input type="button" id="pwd-change-btn" value="비밀번호변경">
            <input type="button" id="submit-btn" value="수정완료">
        </div>
        
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

<!-- 은행목록 불러오기 -->
<script>
    window.onload = function(){
        $.ajax({
            url : '/md/member/bank/list',
            method : 'get',
            success : function(result){
                console.log(result);
                $('#bank').children('option:not(:first)').remove();
                let myBankNo = '${loginMember.bankNo}'
                $(result).each(function(i){ 
                    if(result[i].no == myBankNo){
                        $('#bank').append("<option value='"+result[i].no+"' selected>"+result[i].name+"</option>");
                    } else {
                        $('#bank').append("<option value='"+result[i].no+"'>"+result[i].name+"</option>");
                    }
                })
            },
            error : function(e){
                console.log("통신이상");
            }
        })
    }
</script>

<!-- 프로필 사진 미리보기 -->
<script type="text/javascript">
    $(function() {
        $("#profile").on('change', function(){
        readURL(this);
        });
    });
    function readURL(input) {
        if (input.files && input.files[0]) {
            var reader = new FileReader();
            reader.onload = function (e) {
            $('#profile-thumbnail').attr('src', e.target.result);
            }
            reader.readAsDataURL(input.files[0]);
        }
    }
</script>

<!-- 비밀번호 체크 -->
<script>
    $('#submit-btn').on('click',function(){
        const pwd = $('#pwd');
        const pwd2 = $('#pwd2');
        if($(pwd).val()=="" || $(pwd2).val()==""){
            Swal.fire({
                title : "비밀번호를 모두 입력하셨나요?",
                icon : 'question'
            })
            return false;
        }
        else if($(pwd).val() != $(pwd2).val()){
            Swal.fire({
                title : "비밀번호가 일치하지 않습니다",
                icon : 'error'
            })
            return false;
        }
        document.getElementById('member-form').submit();
    });

</script>



<template id="my-template">
    <swal-title>
      Save changes to "Untitled 1" before closing?
    </swal-title>
    <swal-icon type="warning" color="red"></swal-icon>
    <swal-button type="confirm">
      Save As
    </swal-button>
    <swal-button type="cancel">
      Cancel
    </swal-button>
    <swal-button type="deny">
      Close without Saving
    </swal-button>
    <swal-param name="allowEscapeKey" value="false" />
    <swal-param
      name="customClass"
      value='{ "popup": "my-popup" }' />
    <swal-function-param
      name="didOpen"
      value="popup => console.log(popup)" />
  </template>

<script>
    // Swal.fire({
    // template: '#my-template'
    // })
</script>
