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
        grid-template-rows: repeat(3, 10%);
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

    #create-detail-form{
        display: grid;
        grid-template-columns: 50% 50%;
        grid-column: span 2;
        border: 1px solid blue;
    }

    .main-table-grid{
        display: grid;
        grid-template-columns: 1fr 1fr;
        grid-template-rows: repeat(12, 0.5fr);
        text-align: center;
        border: 1px solid blue;
        border-radius: 20px;
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


            <form action="" method="post" id="create-detail-form">
                <div class="main-table-grid">
                    <h4 style="grid-column: span 2;">보수</h4>
                    <div>보수계</div>
                    <div><input type="number" name=""></div>
                    <div>본봉</div>
                    <div><input type="number" name="pay"></div>
                    <div>정근수당</div>
                    <div><input type="number" name="attendance"></div>
                    <div>정근가산금</div>
                    <div><input type="number" name="attendancePlus"></div>
                    <div>기술정보수당</div>
                    <div><input type="number" name="technical"></div>
                    <div>특수직무수당</div>
                    <div><input type="number" name="specialduty"></div>
                    <div>비상근무수당</div>
                    <div><input type="number" name="emergency"></div>
                    <div>정액급식비</div>
                    <div><input type="number" name="lunchFee"></div>
                    <div>명절휴가비</div>
                    <div><input type="number" name="holiday"></div>
                    <div>직급보조비</div>
                    <div><input type="number" name="position"></div>
                    <div>대민활동비</div>
                    <div><input type="number" name="publicActivity"></div>
                </div>

                <div class="main-table-grid">
                    <h4 style="grid-column: span 2;">공제</h4>
                    <div>공제계</div>
                    <div><input type="number" name=""></div>
                    <div>기여금</div>
                    <div><input type="number" name="contribution"></div>
                    <div>노인장기요양보험</div>
                    <div><input type="number" name="longtermCare"></div>
                    <div>대한공제회비</div>
                    <div><input type="number" name="mutualFee"></div>
                    <div>직장금고회비</div>
                    <div><input type="number" name="safeDeposit"></div>
                    <div>소득세</div>
                    <div><input type="number" name="incomeTax"></div>
                    <div>지방소득세</div>
                    <div><input type="number" name="localTax"></div>
                </div>
                    
                <div style="grid-column: span 2;">
                    <input type="submit" value="작성하기">
                    <input type="button" value="취소하기">
                </div>
                
            </form>
        </main>


    </div>
</body>
</html>