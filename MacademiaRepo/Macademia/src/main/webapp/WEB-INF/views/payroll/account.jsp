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
        display : grid;
        grid-template-columns: 1fr 1.5fr;
        grid-template-rows: 1fr 1.5fr;
    }

    main > div{
        border: 1px solid black;
    }

    #account-table-outer{
        display : grid;
        grid-template-columns: 1fr 1fr 1fr 1.5fr 2fr 1.5fr 1fr;
    }


    .t3{
        border: 2px solid rgb(148, 148, 236);
        border-radius: 3rem;
        padding-left: 20px;
        height: 70%;
    }


</style>
</head>
<body>

	<%@ include file="/WEB-INF/views/common/header.jsp" %>
	

    <div id="wrap">
		<%@ include file="/WEB-INF/views/payroll/commonHeaderAside.jsp" %>

        
        <main>


            <div style="grid-column: span 2;">
                <h1>계좌번호정보</h1>
                <div id="account-table-outer">

                    <div class="account-table-header">No.</div>
                    <div class="account-table-header">구분</div>
                    <div class="account-table-header">예금주명</div>
                    <div class="account-table-header">은행명</div>
                    <div class="account-table-header">계좌번호</div>
                    <div class="account-table-header">신청진행상태</div>
                    <div class="account-table-header">예외구분</div>


                    <div >1</div>
                    <div >월급여</div>
                    <div >오귀석</div>
                    <div >농협은행</div>
                    <div >000-1234-1234-00</div>
                    <div >계좌등록승인</div>
                    <div >예외구분</div>

                </div>

            </div>    

            <div >
                <h3>계좌번호 정보</h3>
                <div class="t3">
                    <div><h5>급여구분  :   월급여</h5></div>
                    <div><h5>예금주명  :   오귀석</h5></div>
                    <div><h5>은 행 명  :   농협은행</h5></div>
                    <div><h5>계좌번호  :   000-1234-1234-00</h5></div>
                    <div>
                        <h5>자동이체  :   </h5>
                        신청하기 <input type="button"> 
                        취소하기 <input type="button">
                    </div>
                </div>
            </div>


            <div >
                <h3>자동이체 변경 이력</h3>
                <div class="t3">
                    <div><h5>구분  :   월급여</h5></div>
                    <div><h5>예금주명  :   오귀석</h5></div>
                    <div><h5>은 행 명  :   농협은행</h5></div>
                    <div><h5>계좌번호  :   000-1234-1234-00</h5></div>
                    <div><h5>일시  :  2022-10-06 </h5></div>
                </div>

            </div>








        </main>


    </div>
</body>
</html>