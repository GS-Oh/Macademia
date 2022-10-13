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
        border: 1px solid black;
        display: grid;
        grid-template-rows: 1fr 1fr 4fr 1fr;
    }
    
    main div {
        border: 1px solid black;
    }



    /* 발급년도 부분 */
    #history-header-outer{
        width: 100%;
        height: 100%;
        display: flex;
        justify-content: space-between;
    }

        
    #history-selector-outer{
        width: 50%;
        height: 50%;
        display: flex;
        justify-content: space-between;
    }




    /* 지급년월 본봉 ~~ 실수령액 부분 */
    #history-table-outer{
        display: grid;
        grid-template-columns: repeat(10, 1fr);
        grid-template-rows: repeat(11, 1fr);
        row-gap: 10px;
        align-content : center;
        align-items: center;
    }

    .history-table-header{
        font-size: 1.1rem;
        text-align: center;
        color: plum;
    }

    /* 페이징처리 */
    #page-area{
            width: 30%;
            margin: 0 auto;
            display: flex;
            justify-content: space-evenly;
        }


</style>


</head>
<body>


	<%@ include file="/WEB-INF/views/common/header.jsp" %>
    



    <div id="wrap">

		<%@ include file="/WEB-INF/views/payroll/commonHeaderAside.jsp" %>
        

        <main>
            <!-- 1 -->
            <div id="history-header-outer">

                <div><h4>발급년도</h4></div>
                
                <form action="" method="" id="history-selector-outer">
                    
                    <div id="history-header-selector">
                        <select name="" id="">
                            <option value="">2022-03</option>
                            <option value="">2022-04</option>
                            <option value="">2022-05</option>
                            <option value="">2022-06</option>
                            <option value="">2022-07</option>
                            <option value="">2022-08</option>
                            <option value="" selected>2022-09</option>
                        </select>
                        <input type="submit" value="조회">
                    </div>
                </form>
                
            </div>
            
            <!-- 2 -->
            <div>
                <h4>지급내역 목록 [ TOTAL 3 ] </h4>
                <div><input type="button" value="엑셀받기"></div>
            </div>

            <!-- 3 -->
            <div id="history-table-outer">

                <div class="history-table-header">지급년월</div>
                <div class="history-table-header">본봉</div>
                <div class="history-table-header">수당</div>
                <div class="history-table-header">기타공제</div>
                <div class="history-table-header">세금</div>
                <div class="history-table-header">과세</div>
                <div class="history-table-header">비과세</div>
                <div class="history-table-header">건강보험</div>
                <div class="history-table-header">지급총액</div>
                <div class="history-table-header">실수령액</div>


                <div ><a href="/md/payroll/history/detail">2022-09</a></div>
                <div >123456789</div>
                <div >123456789</div>
                <div >123456789</div>
                <div >123456789</div>
                <div >123456789</div>
                <div >123456789</div>
                <div >123456789</div>
                <div >123456789</div>
                <div >123456789</div>
                
            </div>
            
            <!-- 4 -->
            <div id="page-area">
                <a href="" class="">1</a>
                <a href="" class="">2</a>
                <a href="" class="">3</a>
                <a href="" class="">4</a>
                <a href="" class="">5</a>
            </div>
            
        </main>
        

    </div>













</body>
</html>