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
        grid-template-rows: 1fr 8fr;
    }

    #management-select-area{
        border-bottom: 2px solid #6667AB;
        
    }

	#management-select-area{
		display: grid;
		align-items: center;
	}

	#management-select-area > form{
		display: flex;
		justify-content: space-between;
	}

	#management-select-area > form > div{
		width: 100%;

		display: grid;
		grid-template-columns: 35% auto;
		align-items: center;
		justify-items: center;
	}

	#management-select-area > form > div > label{
		font-size: 1.5rem;
	}

    /* #management-select-area > form{
        display: grid;
        grid-template-columns: 2fr 1.5fr 1.5fr 1fr;
        
    }
    
    #management-select-area > form > div{
        display: flex;
        align-items: center;
    } */

    #management-select-result{
        display: grid;
        grid-template-columns: repeat(7, 1fr) 2fr 2fr;
        grid-template-rows: repeat(11, 1fr);
        row-gap: 10px;
        align-content : center;
        align-items: center;
    }

    .management-table-header{
        font-size: 1.1rem;
        text-align: center;
        color: plum;
    }

    .management-table-content{
        font-size: 1.1rem;
        text-align: center;
    }

</style>

</head>
<body>



		<%@ include file="/WEB-INF/views/common/header.jsp" %>





	    <div id="wrap">

			<%@ include file="/WEB-INF/views/payroll/commonHeaderAside.jsp" %>
        


	        <main>
	
	            <div id="management-select-area">
	                <form action="" method="">
	
	                    <div>
	                        <label for="year-select" class="form-label">발급년월</label>
	                        <select name="" id="year-select" class="form-select">
	                            <option value="">2022-03</option>
	                            <option value="">2022-04</option>
	                            <option value="">2022-05</option>
	                            <option value="">2022-06</option>
	                            <option value="">2022-07</option>
	                            <option value="">2022-08</option>
	                            <option value="" selected>2022-09</option>
	                        </select>
	                    </div>
	
	                    <div>
	                        <label for="depart-select" class="form-label">부서명</label>
	                        <select name="" id="depart-select" class="form-select">
	                            <option value="" selected>개발부</option>
	                            <option value="">인사부</option>
	                            <option value="" >재무부</option>
	                        </select>
	                    </div>
	
	                    <div>
	                        <label for="name-select" class="form-label">사원명</label>
	                        <select name="" id="name-select" class="form-select">
	                            <option value="" selected>오귀석</option>
	                            <option value="">육귀석</option>
	                            <option value="" >칠귀석</option>
	                        </select>
	                    </div>
	
	                    <div>
	                        <input type="submit" value="검색" style="background-color: #6667AB; color:white; width: 70%; height: 80%;">
	                    </div>
	
	                </form>
	            </div>
	
	            <!-- 조회 결과 -->
	            <div id="management-select-result">
	
	                <div class="management-table-header">부서명</div>
	                <div class="management-table-header">사원명</div>
	                <div class="management-table-header">지급년월</div>
	                <div class="management-table-header">본봉</div>
	                <div class="management-table-header">수당</div>
	                <div class="management-table-header">과세</div>
	                <div class="management-table-header">비과세</div>
	                <div class="management-table-header">지급총액</div>
	                <div class="management-table-header">실수령액</div>
	
	
	                <div class="management-table-content">개발부</div>
	                <div class="management-table-content">오귀석</div>
	                <div class="management-table-content">2022-09</div>
	                <div class="management-table-content">3,000,000</div>
	                <div class="management-table-content">3,000,000</div>
	                <div class="management-table-content">3,000,000</div>
	                <div class="management-table-content">150,000</div>
	                <div class="management-table-content">3,000,000</div>
	                <div class="management-table-content">3,000,000</div>
	
	
	                <div class="management-table-content">개발부</div>
	                <div class="management-table-content">오귀석</div>
	                <div style="grid-column: span 6; color: red; text-align: center;">
	                    <a href="/md/payroll/create"> 
	                        <h3>[급여 대장 작성하기]</h3>
	                    </a>    
	                </div>
	
	            </div>
	
	
	        </main>

		</div>





</body>
</html>