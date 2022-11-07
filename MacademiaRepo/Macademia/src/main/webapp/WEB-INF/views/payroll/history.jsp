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

    #history-table-outer > form{
        grid-column: span 10;

        display: grid;
        grid-template-columns: repeat(10, 10%);
        align-content : center;
        align-items: center;
        justify-items: center;
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
        border : none;
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
                
                <form action="" method="post" id="history-selector-outer">
                    
                    <div id="history-header-selector">
                        <select class="form-select form-select-lg" name="payDate" id="month-selector">
                            <option value="2019">2019</option>
                            <option value="2020">2020</option>
                            <option value="2021">2021</option>
                            <option value="2022" selected>2022</option>
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
                <div class="history-table-header">월급여액</div>
                <div class="history-table-header">수당</div><!-- taxfree -->
                <div class="history-table-header">공제</div><!-- longtermCare + employmentPay + accidentPay + 나머지 공제-->
                <div class="history-table-header">국민연금</div>
                <div class="history-table-header">건강보험료</div>
                <div class="history-table-header">소득세</div>
                <div class="history-table-header">지방소득세</div>
                <div class="history-table-header">지급총액</div>
                <div class="history-table-header">실수령액</div>


				<c:forEach items="${prVoList}" var="prVo" >
					
                    <form action="/md/payroll/history/detail" method="post" >
                        <input class=" btn btn-primary" type="submit" value="${prVo.payDate}" name="payDate" readonly onclick="deleteComma()"  style="height: 80%; width: 80%; background-color: #6667AB; font-size: 1.4rem; border: 1px solid black; margin-bottom: 10px;">
                        <input class="history-table-content" type="text" value="${prVo.pay}" name="pay" readonly>
                        <input class="history-table-content" type="text" value="${prVo.taxfree}" name="taxfree" readonly>
                        <input class="history-table-content" type="text" value="${prVo.totalDeduction}" name="totalDeduction" readonly>
                        <input class="history-table-content" type="text" value="${prVo.nationalPension}" name="nationalPension" readonly>
                        <input class="history-table-content" type="text" value="${prVo.healthPremium}" name="healthPremium" readonly>
                        <input class="history-table-content" type="text" value="${prVo.incomeTax}" name="incomeTax" readonly>
                        <input class="history-table-content" type="text" value="${prVo.localTax}" name="localTax" readonly>
                        <input class="history-table-content" type="text" value="${prVo.totalPayment}" name="totalPayment" readonly>
                        <input class="history-table-content" type="text" value="${prVo.actualPayment}" name="actualPayment" readonly style="width: 99%;">
                        
                        <!-- 보수쪽 -->
                        <input type="hidden" value="${prVo.attendance}" name="attendance">
                        <input type="hidden" value="${prVo.attendancePlus}" name="attendancePlus">
                        <input type="hidden" value="${prVo.technical}" name="technical">
                        <input type="hidden" value="${prVo.specialduty}" name="specialduty">
                        <input type="hidden" value="${prVo.emergency}" name="emergency">
                        <input type="hidden" value="${prVo.lunchFee}" name="lunchFee">
                        <input type="hidden" value="${prVo.holiday}" name="holiday">
                        <input type="hidden" value="${prVo.subsidy}" name="subsidy">
                        <input type="hidden" value="${prVo.publicActivity}" name="publicActivity">
                        
                        <!-- 공제쪽 -->
                        <input type="hidden" value="${prVo.contribution}" name="contribution">
                        <input type="hidden" value="${prVo.mutualFee}" name="mutualFee">
                        <input type="hidden" value="${prVo.safeDeposit}" name="safeDeposit">
                        <input type="hidden" value="${prVo.other}" name="other">
                        <input type="hidden" value="${prVo.longtermCare}" name="longtermCare">
                        <input type="hidden" value="${prVo.employmentPay}" name="employmentPay">
                        
                        <!-- 인적사항 -->
                        <input type="hidden" value="${prVo.salNo}" name="salNo">
                        <input type="hidden" value="${prVo.name}" name="name">
                        <input type="hidden" value="${prVo.deptName}" name="deptName">
                        <input type="hidden" value="${prVo.rankName}" name="rankName">
                        <input type="hidden" value="${prVo.position}" name="position">
                        <input type="hidden" value="${prVo.baseMonthPay}" name="baseMonthPay">
                    </form>
				</c:forEach>
                
                
            </div>
            
           
            
        </main>
        

    </div>



</body>

<!-- 검색 값 유지 -->
<script>

	const monthSelector = document.querySelector('#month-selector');
	const payValue = '${payDate}';
	
	for (let i=0; i<monthSelector.options.length; i++){  
			if(monthSelector.options[i].value == payValue){
				monthSelector.options[i].selected = true;
			};
	};
	
	
</script>


<script>

	const historyContent = document.querySelectorAll('.history-table-content');
	
    for(let i=0; i<historyContent.length; i++){
        //콤마작업
        let num01;
        let num02;
        num01 = historyContent[i].value;
        num02 = num01.replace(/\D/g,""); 
        num01 = setComma(num02);
        historyContent[i].value =  num01;
    }

	
	//콤마작업함수
    function setComma(n) {
         var reg = /(^[+-]?\d+)(\d{3})/;
         n += '';         
         while (reg.test(n)) {
             n = n.replace(reg, '$1' + ',' + '$2');
         }         
         return n;
     };
</script>


<script>

    // 콤마 제거
    function deleteComma(){

        for(let i=0; i<historyContent.length; i++){

            let number = historyContent[i].value.replace(/,/g, "");
            historyContent[i].value = number;
            
        }

    }

</script>

</html>