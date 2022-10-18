<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%@ include file="/resources/css/common/common.css" %>
<style>
	<%@ include file="/resources/css/payroll/commonAside.css" %>


    main{
        display: grid;
        grid-template-columns: 1fr 1fr;
        grid-template-rows: repeat(3, 8%) 10% 66%;
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


    #detail-form-area{
        grid-column: span 2;
        display: grid;
        grid-template-columns: 1fr 1fr;
        grid-template-rows: 90% 10%;
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

    .detail-price-area{
        width: 100%;
        height: 100%;
        text-align: center;
    }

</style>

</head>
<body>




    <div id="wrap">

		<header>
				<%@include file="/WEB-INF/views/common/header.jsp" %>
        </header>
		<aside>		
			<%@ include file="/WEB-INF/views/payroll/commonAside.jsp" %>
		</aside>
        

        

        <main>

            <div class="main-table-span"><h2 style="border-bottom: 3px solid #1315a6; width: 50%;">급여 지급 명세서</h2></div>

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

            <form action="" id="detail-form-area">
                <div class="main-table-grid">
                    <h4 >보수</h4>
                    <div>보수계</div>
                    <div><input class="detail-price-area" type="text" ></div>
                    <div>정근수당</div>
                    <div><input class="detail-price-area" type="text" ></div>
                    <div>정근가산금</div>
                    <div><input class="detail-price-area" type="text" ></div>
                    <div>기술정보수당</div>
                    <div><input class="detail-price-area" type="text" ></div>
                    <div>특수직무수당</div>
                    <div><input class="detail-price-area" type="text" ></div>
                    <div>비상근무수당</div>
                    <div><input class="detail-price-area" type="text" ></div>
                    <div>정액급식비</div>
                    <div><input class="detail-price-area" type="text" ></div>
                    <div>명절휴가비</div>
                    <div><input class="detail-price-area" type="text" ></div>
                    <div>직급보조비</div>
                    <div><input class="detail-price-area" type="text" ></div>
                    <div>대민활동비</div>
                    <div><input class="detail-price-area" type="text" ></div>
                </div>

                <div class="main-table-grid">
                    <h4 >공제</h4>
                    <div>공제계</div>
                    <div><input class="detail-price-area" type="text" ></div>
                    <div>기여금</div>
                    <div><input class="detail-price-area" type="text" ></div>
                    <div>노인장기요양보험</div>
                    <div><input class="detail-price-area" type="text" ></div>
                    <div>대한공제회비</div>
                    <div><input class="detail-price-area" type="text" ></div>
                    <div>직장금고회비</div>
                    <div><input class="detail-price-area" type="text" ></div>
                    <div>소득세</div>
                    <div><input class="detail-price-area" type="text" ></div>
                    <div>지방소득세</div>
                    <div><input class="detail-price-area" type="text" ></div>
                    <div>7</div>
                    <div><input class="detail-price-area" type="text" ></div>
                    <div>7</div>
                    <div><input class="detail-price-area" type="text" ></div>
                    <div>7</div>
                    <div><input class="detail-price-area" type="text" ></div>
                </div>

                <div style="grid-column: span 2; align-items: center; width: 100%; height: 100%;">
                    <input type="submit" value="작성하기" class="btn btn-light" style="background-color: #1315a6 ; color:white;">
                    <input type="button" value="취소하기" class="btn btn-light">
                </div>
            </form>
        </main>


    </div>
</body>
</html>