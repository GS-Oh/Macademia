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
        grid-template-rows: 10% 10% 10% 65% ;
        overflow-x : scroll;
    }
    
    /* main div {
        border: 1px solid black;
    } */


    #history-header-outer{
        display: grid;
        grid-template-columns: 2fr 8fr;
        align-items: center;
        border: 3px solid #6667AB ;
    }    


    #history-header-selector{
        width: 100%;
        display: flex;
    }

    #month-selector{
        width: 80%;
        margin-right: 5%;
    }


    /* 지급년월 본봉 ~~ 실수령액 부분 */
    #history-table-outer{
        display: grid;
        grid-template-columns: repeat(10, 1fr);
        grid-template-rows: repeat(12, 1fr);
        row-gap: 10px;
        align-content : center;
        align-items: center;

        border: 3px solid #6667AB;
    }

    .history-table-header{
        font-size: 1.1rem;
        text-align: center;
        background-color: #6667AB;
        color: white;
        border-right: 1px dashed white;
    }

    .history-table-content{
        text-align: center;
        margin-bottom: 10px;
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
            <div ><h5>지급내역 조회</h5></div>
            <!-- 1 -->
            <div id="history-header-outer" >

                <div style="text-align: center; padding-top:15px;">
                    <h3><label for="month-selector" class="form-label">발급년도</label></h3>
                </div>
                
                <form action="" method="" id="history-selector-outer">
                    
                    <div id="history-header-selector">
                        <select class="form-select form-select-lg" name="" id="month-selector">
                            <option value="">2019</option>
                            <option value="">2020</option>
                            <option value="">2021</option>
                            <option value="" selected>2022</option>
                        </select>
                        <input class="btn btn-outline-dark" type="submit" value="조회">
                    </div>

                </form>
                
            </div>
            
            <!-- 2 -->
            <div style="margin: 50px 20px 10px 20px;">
                <h4>지급내역 목록 [ TOTAL 3 ] </h4>
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


                <div class="history-table-content"><a href="/md/payroll/history/detail">2022-09</a></div>
                <div class="history-table-content">123456789</div>
                <div class="history-table-content">123456789</div>
                <div class="history-table-content">123456789</div>
                <div class="history-table-content">123456789</div>
                <div class="history-table-content">123456789</div>
                <div class="history-table-content">123456789</div>
                <div class="history-table-content">123456789</div>
                <div class="history-table-content">123456789</div>
                <div class="history-table-content">123456789</div>

                <div class="history-table-content"><a href="/md/payroll/history/detail">2022-09</a></div>
                <div class="history-table-content">123456789</div>
                <div class="history-table-content">123456789</div>
                <div class="history-table-content">123456789</div>
                <div class="history-table-content">123456789</div>
                <div class="history-table-content">123456789</div>
                <div class="history-table-content">123456789</div>
                <div class="history-table-content">123456789</div>
                <div class="history-table-content">123456789</div>
                <div class="history-table-content">123456789</div>

                <div class="history-table-content"><a href="/md/payroll/history/detail">2022-09</a></div>
                <div class="history-table-content">123456789</div>
                <div class="history-table-content">123456789</div>
                <div class="history-table-content">123456789</div>
                <div class="history-table-content">123456789</div>
                <div class="history-table-content">123456789</div>
                <div class="history-table-content">123456789</div>
                <div class="history-table-content">123456789</div>
                <div class="history-table-content">123456789</div>
                <div class="history-table-content">123456789</div>
                
            </div>
            
           
            
        </main>
        

    </div>













</body>
</html>