<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:set var="root" value="${pageContext.request.contextPath }" />

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
    @import url('https://fonts.googleapis.com/css2?family=Open+Sans:wght@600&display=swap');

	body{
		background-image: url("/md/resources/img/background/login_background11.jpg");
        background-size: cover;
        height: 100vh;
        display: flex;
        align-items: center;
        justify-content: center;
        margin: 0;
	}
    #container{
        width: 20vw;
        height: 25vh;
        font-family: 'Open Sans', sans-serif;
    }
    h1{
        text-align: center;
        color: #3b297d;
        font-weight: bold;
        margin: 0;
    }
    .input-group{
        width: 100%;
        position: relative;
    }
    .input-group > input{
        width: 90%;
        background-color: transparent;
        border: none;
        border-bottom: 2px solid #dddddd;
        color: white;
        font-size: 1.2vw;
        padding: 2vw 1vw 0.2vw 1vw;
        outline: none;

    }
    .input-group > label{
        position: absolute;
        font-size: 1.2vw;
        top: 1.5vw;
        left: 0.5vw;
        color: white;
    }
    .input-group input:focus + label,.input-group input:valid + label{
        position: absolute;
        font-size: 1vw;
        top: 0.5vw;
        left: 0.5vw;
        transition:all 0.3s ease;
        color:rgb(82, 40, 178);
        font-weight: bold;
    }
    #submit-btn{
        display: block;
        width: 100%;
        height: 50px;   
        border-radius: 1.5vw;
        border: none;
        margin-top: 1vw;
        background-color: #634fad;
        color: white;
        font-size: 1.2vw;
        font-family: 'Poppins', sans-serif;
    }
    #submit-btn:hover{
        background-color: rgb(70, 39, 165);
        cursor: pointer;
        transition:all 0.3s ease;
    }
    
</style>
</head>
<body>
<div id="container">
    <h1>MACADAMIA</h1>
	<form action="${root}/member/login" method="post" id="login-form">

	  <div class="input-group">
	    <input id="input-id" type="text" class="form-control" required>
        <label class="input-group-text" for="input-id">ID</label>
	  </div>
	
	  <div class="input-group">
	    <input id="input-pwd" type="password" class="form-control" required>
        <label class="input-group-text" for="input-pwd">PWD</label>
	  </div>
      
	  <button type="submit" id="submit-btn">로그인</button>
	</form>
</div>

</body>
</html>