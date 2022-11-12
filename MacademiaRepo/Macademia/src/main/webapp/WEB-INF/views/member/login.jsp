<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
<script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>

<c:set var="root" value="${pageContext.request.contextPath }" />

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
    @import url('https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@700&display=swap');
	body{
		background-image: url("/md/resources/img/background/login_background12.jpg");
        background-size: cover;
        height: 100vh;
        display: flex;
        align-items: center;
        justify-content: center;
        margin: 0;
        font-family: 'Noto Sans KR', sans-serif;
	}
    body::before{
        /* content: ""; */
        position: absolute; z-index: 1;
        top:0; right: 0; bottom: 0; left: 0;
        /* background-color: rgba(0, 0, 0, 0.05); */

    }
    #container{
        width: 400px;
        z-index: 2;
        position: relative;
        
    }

    h1{
        text-align: center;
        color: #44347f;
        font-weight: bold;
        font-size: 45px;
        margin: 0;
        display: inline-block;
        position:absolute;
        top: -60px;
        left: 55px;
        
    }
    #container img{
        position:absolute;
        top: -215px;
        right: 35px;
    }
    .input-group{
        width: 100%;
        position: relative;
    }
    .input-group > input{
        width: 100%;
        background-color: transparent;
        border: none;
        border-bottom: 2px solid white;
        font-size: 25px;
        padding: 38px 10px 5px;
        outline: none;
        box-sizing: border-box;
        color: rgb(80, 80, 80);
        font-family: 'Noto Sans KR', sans-serif;
    }
    .input-group > label{
        position: absolute;
        font-size: 25px;
        top: 30px;
        left: 10px;
        color: white;
        
    }
    .input-group input:focus + label,.input-group input:valid + label{
        position: absolute;
        font-size: 18px;
        top: 9px;
        left: 10px;
        transition:0.3s ease;
        color: #483296;
        font-weight: bold;
    }
    #btn{
        display: block;
        width: 100%;
        height: 50px;   
        border-radius: 25px;
        border: none;
        margin: 30px 0;
        background-color: #634fad;
        color: white;
        font-size: 20px;
    }
    #btn:hover{
        background-color: rgb(70, 44, 148);
        cursor: pointer;
        transition:0.3s ease;
    }
    a{
        text-decoration: none;
        font-size: 17px; 
        color:rgb(64, 44, 125);

    }
    a:active{
        color:rgb(88, 67, 152);
    }
    
    .warning{
        color: rgb(255, 34, 34) !important;
        animation: warning 0.3s ease;
        animation-iteration-count: 3;  
    }
    #container{
    margin-top:190px;
    margin-right:40px;
    }
    @keyframes warning{
        0% {transform: translateX(-5px);}
        25% {transform: translateX(5px);}
        50% {transform: translateX(-5px);}
        75% {transform: translateX(5px);}
    }
    #etc{
        display: grid;
        grid-template-columns: 1fr 1fr;
        margin: 20px 0;
    }
    #save-email > input{
        transform : scale(1.5);
    }
    #find-pwd{
        text-align: end;
    }
    #etc label{
        color: #44347f;
    }
    #log{
    width:310px;
    height:180px;
    
    }


    
</style>
</head>
<body>
<div id="container">
   
    <img src="/md/resources/img/logo/logo1.png" alt="로고" width="40px" height="40px" id="log">
	<form action="${root}/member/login" method="post" id="login-form">

	  <div class="input-group">
	    <input id="email" type="text" class="form-control" name="email" value="${cookie.rid.value}" required>
        <label class="input-group-text" for="email">EMAIL</label>
	  </div>
	
	  <div class="input-group">
	    <input id="pwd" type="password" class="form-control" name="pwd" required>
        <label class="input-group-text" for="pwd">PWD</label>
	  </div>    

      <button type="submit" id="btn">로그인</button>

      <div id="etc">
        <div id="save-email">
            <input type="checkbox" name="saveEmail" id="save-email-check">
            <label for="save-id-check">이메일저장</label>
        </div>
        <div id="find-pwd">
            <a href="${root}/member/findpwd">비밀번호를 잊으셨나요?</a>
        </div>
      </div>


      

	</form>
</div>

<script>
    if('${alertMsg}'!= ''){
        Swal.fire({
            // title: '${alertMsg}',
            text: '${alertMsg}',
            icon: 'warning'
        })
    }
</script>
<script>
    if('${successMsg}'!= ''){
        Swal.fire({
            // title: '${alertMsg}',
            text: '${alertMsg}',
            icon: 'success'
        })
    }
</script>

<script>
    
    const id = $('#email');
    const pwd = $('#pwd');
    const btn = $('#btn');

    $(btn).on('click',function(){
        if($(email).val()==""){
            $(email).next('label').addClass('warning');
        }else if($(pwd).val()==""){
            $(pwd).next('label').addClass('warning');
            setTimeout(function(){
                $('label').removeClass('warning')
            },1000);
        }
    });

</script>

</body>
</html>