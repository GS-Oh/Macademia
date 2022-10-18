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
        display : grid;
        grid-template-columns: 1fr 1.5fr;
        grid-template-rows: 1fr 1.5fr;

        font-size : 1.5rem;
    }


    /*  */
    #account-table-outer{
        display : grid;
        grid-template-columns: 1fr 1fr 1fr 1.5fr 2fr 1.5fr 1fr;
        place-items : center;
    }

    /*  */
    .account-title-name{
        margin: 40px 0px 10px 20px;
        border-left: 10px solid #6667AB;
        padding-left: 10px;
    }

    .account-table-header{
        color: #6667AB;
        font-size: 1.1rem;
        font-weight: 900;
        margin: 20px 0px;
    }

    .account-table-content{
        font-weight: 500;
        margin: 20px 0px;
    }


    /*  */

    #account-info-area{

        height: 400px;

        margin: 20px;
        padding: 10px 10px 10px 30px;

        display: grid;
        grid-template-rows: repeat(5,1fr);
        align-items: center;

        border: 2px solid #1315a6 ;
        border-radius: 30px;
    }

  


    #account-direct{
        display: flex;
        justify-content: space-between;
    }

    #account-edit-area{
        height: 400px;

        margin: 20px;
        padding: 10px;

        display: grid;
        grid-template-columns: 10% 10% 20% 30% 30%;
        grid-template-rows: repeat(5, 1fr);
        align-items: center;
        justify-items: center;


        border: 2px solid #1315a6;
        border-radius: 30px;
    }

    #account-edit-area > div > h5{
        color: #6667AB;
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


            <div style="grid-column: span 2; border-bottom: 3px solid gray;">
                <h1 class="account-title-name">계좌번호정보</h1>
                <div id="account-table-outer">

                    <div class="account-table-header">No.</div>
                    <div class="account-table-header">구분</div>
                    <div class="account-table-header">예금주명</div>
                    <div class="account-table-header">은행명</div>
                    <div class="account-table-header">계좌번호</div>
                    <div class="account-table-header">계좌상태</div>
                    <div class="account-table-header">예외구분</div>


                    <div class="account-table-content">1</div>
                    <div class="account-table-content">월급여</div>
                    <div class="account-table-content">오귀석</div>
                    <div class="account-table-content">농협은행</div>
                    <div class="account-table-content">000-1234-1234-00</div>
                    <div class="account-table-content">계좌등록승인</div>
                    <div class="account-table-content">예외없음</div>

                    <div class="account-table-content">2</div>
                    <div class="account-table-content">기본상여금</div>
                    <div class="account-table-content">오귀석</div>
                    <div class="account-table-content">농협은행</div>
                    <div class="account-table-content">000-1234-1234-00</div>
                    <div class="account-table-content">계좌등록승인</div>
                    <div class="account-table-content">예외없음</div>
                    
                    <div class="account-table-content">3</div>
                    <div class="account-table-content">보너스</div>
                    <div class="account-table-content">오귀석</div>
                    <div class="account-table-content">농협은행</div>
                    <div class="account-table-content">000-1234-1234-00</div>
                    <div class="account-table-content">계좌등록승인</div>
                    <div class="account-table-content">예외없음</div>



                </div>


            </div>    

            <div >
                <h3 class="account-title-name">계좌번호 정보</h3>
                <div id="account-info-area" >
                    <div >
                        <h3>급여구분  :   
                        <select name="" id="" >
                            <option value="월급여">월급여</option>
                            <option value="기본상여금">기본상여금</option>
                            <option value="보너스">보너스</option>
                        </select>
                        </h3>
                    </div>
                    <div><h3>예금주명  :   오귀석</h3></div>
                    <div><h3>은 행 명  :   농협은행</h3></div>
                    <div><h3>계좌번호  :   000-1234-1234-00</h3></div>
                    <div id="account-direct">
                        <h3>자동이체  :   </h3>
                        <div>
                            <input type="button" value="신청하기" style="background-color: #6667AB; color:white"> 
                            <input type="button" value="취소하기">
                        </div>
                    </div>
                </div>
            </div>


            <div >
                <h3 class="account-title-name" >자동이체 변경 이력</h3>
                <div id="account-edit-area">

                    <div><h4>구분</h4></div>
                    <div><h4>예금주명</h4></div>
                    <div><h4>은 행 명</h4></div>
                    <div><h4>계좌번호</h4></div>
                    <div><h4>일시</h4></div>

                    <div class="badge bg-danger">취소</div>
                    <div>오귀석</div>
                    <div>농협은행</div>
                    <div>000-1234-1234-00</div>
                    <div>2022-10-10</div>

                    <div class="badge bg-primary">신청</div>
                    <div>오귀석</div>
                    <div>농협은행</div>
                    <div>000-1234-1234-00</div>
                    <div>2022-10-10</div>


                </div>

            </div>








        </main>


    </div>
</body>
</html>