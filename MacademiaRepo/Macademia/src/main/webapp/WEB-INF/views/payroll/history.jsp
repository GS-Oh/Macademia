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
        grid-template-rows: 10% 10% 10% 65% ;
        overflow-x : scroll;
    }

    /*  */
    .history-title{
        display: grid;
        align-items: center;
    }
    
    .history-title>h3{
        border-left: 5px solid #1315a6 ;
        padding-left: 10px;
    }

    /*  */
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
        font-size: 1.3rem;

        display: grid;
        grid-template-columns: repeat(10, 10%);
        grid-template-rows: repeat(12, 1fr);
        row-gap: 10px;
        align-content : center;
        align-items: center;

        border: 3px solid #6667AB;
    }

    .history-table-header{
        font-size: 1.5rem;

        text-align: center;
        background-color: #6667AB;
        color: white;
        border-right: 1px dashed white;
    }

    .history-table-content{
        
        text-align: center;
        margin-bottom: 10px;
        padding-bottom: 10px;
        border-bottom: 1px solid #6667AB;
    }

    .history-table-content>a{
        text-decoration: none;
        color: #1315a6;
        font-weight: 600;
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


    



    <div id="wrap">

		<header>
				<%@include file="/WEB-INF/views/common/header.jsp" %>
        </header>
		<aside>		
			<%@ include file="/WEB-INF/views/payroll/commonAside.jsp" %>
		</aside>
        
        <main>
            <!-- 0 -->
            <div class="history-title" ><h3>지급내역 조회</h3></div>

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
                        <input class="btn btn-outline-dark btn-lg" type="submit" value="조회">
                    </div>

                </form>
                
            </div>
            
            <!-- 2 -->
            <div class="history-title" style="margin: 40px 0px;">
                <h3>지급내역 목록 [ TOTAL 3 ] </h3>
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


                <div class="history-table-content"><a href="/md/payroll/history/detail">2022-07</a></div>
                <div class="history-table-content">123456789</div>
                <div class="history-table-content">123456789</div>
                <div class="history-table-content">123456789</div>
                <div class="history-table-content">123456789</div>
                <div class="history-table-content">123456789</div>
                <div class="history-table-content">123456789</div>
                <div class="history-table-content">123456789</div>
                <div class="history-table-content">123456789</div>
                <div class="history-table-content">123456789</div>

                <div class="history-table-content"><a href="/md/payroll/history/detail">2022-08</a></div>
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