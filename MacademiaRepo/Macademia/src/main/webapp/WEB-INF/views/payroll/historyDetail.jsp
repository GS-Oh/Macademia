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
        grid-template-rows: repeat(3, 8%) 10%;
        text-align : center;
    }


    .main-table-span{
        grid-column : span 2;
        display: grid;
        align-items: center;
        justify-items: center;

    }

    .main-table-span > div{
        width: 100%;
        height: 100%;
        display: flex;
        justify-content: space-between;
    }

    .main-table-span > div > div{
        width: 40%;
        display: grid;
        align-items: center;
    }

    .main-table-grid{
        display: grid;
        grid-template-columns: 1fr 1fr;
        grid-template-rows: repeat(11, 1fr);

        text-align: center;
        align-items: center;
        justify-items: center;

        border: 3px solid #6667AB;
        border-radius: 10px;

        margin: 5px;
    }

    .main-table-grid > h4{
        grid-column: span 2;
        background-color: #6667AB;
        color: white;
        width: 100%;
        height: 90%;

        display: grid;
        align-items: center;
    }

    #detail-price{
        border: 5px solid #6667AB;
        border-radius: 30px;
        padding : 10px 0px;
    }


    .main-table-grid > div{
        border: 1px solid black;
        width: 100%;
        height: 100%;

        display: grid;
        align-items: center;
    }


</style>

</head>
<body>

	<%@ include file="/WEB-INF/views/common/header.jsp" %>



    <div id="wrap">

		<%@ include file="/WEB-INF/views/payroll/commonHeaderAside.jsp" %>
        

        

        <main>

            <div class="main-table-span"><h4 style="border-bottom: 1px solid black; width: 50%;">급여 지급 명세서</h4></div>

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

            <div class="main-table-span" id="detail-price"><h3>실 수 령 액 :  500,000,000,000</h3></div>

            <div class="main-table-grid">
                <h4 >보수</h4>
                <div>보수계</div>
                <div>2</div>
                <div>정근수당</div>
                <div>4</div>
                <div>정근가산금</div>
                <div>6</div>
                <div>기술정보수당</div>
                <div>7</div>
                <div>특수직무수당</div>
                <div>7</div>
                <div>비상근무수당</div>
                <div>7</div>
                <div>정액급식비</div>
                <div>7</div>
                <div>정액급식비</div>
                <div>7</div>
                <div>정액급식비</div>
                <div>7</div>
                <div>정액급식비</div>
                <div>7</div>
            </div>

            <div class="main-table-grid">
                <h4 >공제</h4>
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