<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>


<c:set var="root" value="${pageContext.request.contextPath }" />

<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">
    <title>Insert title here</title>
    <style>
        @import url('https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@700&display=swap');

        body {
            background-image: url("/md/resources/img/background/login_background12.jpg");
            background-size: cover;
            height: 100vh;
            display: flex;
            align-items: center;
            justify-content: center;
            margin: 0;
            font-family: 'Noto Sans KR', sans-serif;
        }

        body::before {
            content: "";
            position: absolute;
            z-index: 1;
            top: 0;
            right: 0;
            bottom: 0;
            left: 0;
            /* background-color: rgba(0, 0, 0, 0.37); */
            background-image: linear-gradient(90deg,rgba(0, 0, 0, 0.1), rgba(0, 0, 0, 0.7),rgba(0, 0, 0, 0.1));
        }

        #container {
            width: 400px;
            z-index: 2;
            position: relative;

        }

        h1 {
            text-align: center;
            color: #7d6faf;
            font-weight: bold;
            font-size: 45px;
            margin: 0;
            display: inline-block;
            position: absolute;
            top: -60px;
            left: 55px;

        }

        #container img {
            position: absolute;
            top: -60px;
            right: 35px;
        }

        .input-group {
            width: 100%;
            position: relative;
        }

        .input-group>input {
            width: 100%;
            background-color: transparent;
            border: none;
            border-bottom: 2px solid white;
            font-size: 25px;
            padding: 38px 10px 5px;
            outline: none;
            box-sizing: border-box;
            color: rgb(255, 255, 255);
            font-family: 'Noto Sans KR', sans-serif;
        }

        .input-group>label {
            position: absolute;
            font-size: 25px;
            top: 30px;
            left: 10px;
            color: white;

        }

        .input-group input:focus+label,
        .input-group input:valid+label {
            position: absolute;
            font-size: 18px;
            top: 9px;
            left: 10px;
            transition: 0.3s ease;
            color: #9484cd;
            font-weight: bold;
        }

        #btn {
            display: block;
            width: 100%;
            height: 50px;
            border-radius: 25px;
            border: none;
            margin-top: 30px;
            background-color: #634fad;
            color: white;
            font-size: 20px;
        }

        #btn:hover {
            background-color: rgb(70, 44, 148);
            cursor: pointer;
            transition: 0.3s ease;
        }

        #find-pwd {
            text-align: center;
            margin-top: 20px;

        }

        a {
            text-decoration: none;
            font-size: 17px;
            color: rgb(114, 92, 181);

        }

        a:active {
            color: rgb(114, 92, 181);
        }

        .warning {
            color: rgb(255, 34, 34) !important;
            animation: warning 0.3s ease;
            animation-iteration-count: 3;
        }

        @keyframes warning {
            0% {
                transform: translateX(-5px);
            }

            25% {
                transform: translateX(5px);
            }

            50% {
                transform: translateX(-5px);
            }

            75% {
                transform: translateX(5px);
            }
        }
    </style>
</head>

<body>
    <div id="container">
        <h1>비밀번호 찾기</h1>
        <img src="/md/resources/img/background/macadamia.png" alt="로고" width="40px" height="40px">
        <form action="${root}/member/findpwd" method="post" id="login-form">

            <div class="input-group">
                <input id="email" type="text" name="email" class="form-control" required>
                <label class="input-group-text" for="email">사내이메일</label>
            </div>

            <div class="input-group">
                <input id="privateEmail" type="text" name="privateEmail" class="form-control" required>
                <label class="input-group-text" for="privateEmail">개인이메일</label>
            </div>
            <button type="submit" id="btn">확인</button>

        </form>
    </div>

    <script>

        const email = $('#email');
        const pwd = $('#privateEmail');
        const btn = $('#btn');

        $(btn).on('click', function () {
            if ($(email).val() == "") {
                $(email).next('label').addClass('warning');
                setTimeout(function () {
                    $('label').removeClass('warning')
                }, 1000);
            } else if ($(privateEmail).val() == "") {
                $(privateEmail).next('label').addClass('warning');
                setTimeout(function () {
                    $('label').removeClass('warning')
                }, 1000);
            }
        });

    </script>

</body>

</html>