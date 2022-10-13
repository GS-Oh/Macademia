<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<style>
	<%@ include file="/resources/css/payroll/commonHeaderAside.css" %>


    main{
        display: grid;
        grid-template-columns: 1fr 1fr;
        grid-template-rows: repeat(4, 10%);
        text-align : center;
    }

    main > div{
        border: 1px solid black;
    }

    .main-table-span{
        grid-column : span 2;
    }

    .main-table-span > div{
        border: 1px solid palegreen;
        width: 100%;
        height: 100%;
        display: flex;
        justify-content: space-between;
    }

    .main-table-span > div > div{
        border: 1px solid darkmagenta;
        width: 40%;
    }

    .main-table-grid{
        display: grid;
        grid-template-columns: 1fr 1fr;
        grid-template-rows: repeat(7, 1fr);
        text-align: center;
    }
</style>

</head>
<body>

	<%@ include file="/WEB-INF/views/common/header.jsp" %>



    <div id="wrap">

		<%@ include file="/WEB-INF/views/payroll/commonHeaderAside.jsp" %>
        

        

        <main>

            <div class="main-table-span"><h4>급여 지급 명세서</h4></div>

            <div class="main-table-span"><h4>2022년 09월분</h4></div>

            <div class="main-table-span">
                <div>
                    <div>
                        <h5>소속 : 개발부</h5>
                        <h5>성명 : 오귀석</h5>
                    </div>
                    <div>
                        <h5>생년월일 : 0000-00-00</h5>
                        <h5>직책 : 사원</h5>    
                    </div>
                </div>
            </div>

            <div class="main-table-span"><h3>실 수 령 액 :  500,000,000,000</h3></div>

            <div class="main-table-grid">
                <h4 style="grid-column: span 2;">보수</h4>
                <div>1</div>
                <div>2</div>
                <div>3</div>
                <div>4</div>
                <div>5</div>
                <div>6</div>
                <div>7</div>
                <div>7</div>
                <div>7</div>
                <div>7</div>
                <div>7</div>
                <div>7</div>
                <div>7</div>
                <div>7</div>
            </div>

            <div class="main-table-grid">
                <h4 style="grid-column: span 2;">공제</h4>
                <div>1</div>
                <div>2</div>
                <div>3</div>
                <div>4</div>
                <div>5</div>
                <div>6</div>
                <div>7</div>
                <div>7</div>
                <div>7</div>
                <div>7</div>
                <div>7</div>
                <div>7</div>
                <div>7</div>
                <div>7</div>
            </div>

        </main>


    </div>
</body>
</html>