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
        grid-template-columns: 1fr 1fr;
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
        grid-template-rows: repeat(12, 1fr);

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
        display:grid;
        grid-template-columns : 1fr 1fr;
    }


    .main-table-grid > div{
        border: 1px solid black;
        width: 100%;
        height: 100%;

        display: grid;
        align-items: center;
    }

    .repair-price-area{
        width: 100%;
        height: 100%;
        text-align: center;
    }

    .deduction-price-area{
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

            <div class="main-table-span" style="color:#6667AB"><h1>${prVo.payDate}월 - 작성하기</h1></div>

            <div class="main-table-span">
                <div>
                    <div>
                        <h3>소속 : ${prVo.deptName}</h3>
                        <h3>성명 : ${prVo.name}</h3>
                    </div>
                    <div>
                        <h3>발급번호 : ${prVo.salNo}</h3>
                        <h3>직책 : ${prVo.rankName}</h3>    
                    </div>
                </div>
            </div>

            <div class="main-table-span" id="detail-price"><h3>실 수 령 액 : </h3><h3 id="realPay">${prVo.actualPayment}</h3></div>

            <form action="" method="post" id="detail-form-area">
                <div class="main-table-grid">
                    <h4>보수</h4>
                    <div>보수계</div>
                    <div><input class="" type="text" name="totalRepair" readonly value="${prVo.totalPayment}" style="width:100%; height:100%;"></div>
                    <div>월 급여액</div>
                    <div><input class="repair-price-area" type="text"  value="${prVo.pay}" name="pay" readonly></div>
                    <div>정근수당</div>
                    <div><input class="repair-price-area" type="text"  value="${prVo.attendance}" name="attendance" readonly></div>
                    <div>정근가산금</div>
                    <div><input class="repair-price-area" type="text"  value="${prVo.attendancePlus}" name="attendancePlus" readonly></div>
                    <div>기술정보수당</div>
                    <div><input class="repair-price-area" type="text" value="${prVo.technical}" name="technical" readonly></div>
                    <div>특수직무수당</div>
                    <div><input class="repair-price-area" type="text" value="${prVo.specialduty}" name="specialduty" readonly></div>
                    <div>비상근무수당</div>
                    <div><input class="repair-price-area" type="text" value="${prVo.emergency}" name="emergency" readonly></div>
                    <div>정액급식비</div>
                    <div><input class="repair-price-area" type="text" value="${prVo.lunchFee}" name="lunchFee" readonly></div>
                    <div>명절휴가비</div>
                    <div><input class="repair-price-area" type="text" value="${prVo.holiday}" name="holiday" readonly></div>
                    <div>직급보조비</div>
                    <div><input class="repair-price-area" type="text" value="${prVo.subsidy}" name="subsidy" readonly></div>
                    <div>대민활동비</div>
                    <div><input class="repair-price-area" type="text" value="${prVo.publicActivity}" name="publicActivity" readonly></div>
                </div>

                <div class="main-table-grid">
                    <h4 >공제</h4>
                    <div>공제계</div>
                    <div><input class="" type="text" name="totalDeduction" readonly value="${prVo.totalDeduction + prVo.nationalPension + prVo.healthPremium + prVo.incomeTax + prVo.localTax}" style="width:100%; height:100%;"></div>
                    <div>기여금</div>
                    <div><input class="deduction-price-area" type="text" value="${prVo.contribution}" name="contribution" readonly></div>
                    <div>대한공제회비</div>
                    <div><input class="deduction-price-area" type="text" value="${prVo.mutualFee}" name="mutualFee" readonly></div>
                    <div>직장금고회비</div>
                    <div><input class="deduction-price-area" type="text" value="${prVo.safeDeposit}" name="safeDeposit" readonly></div>
                    <div>기타공제</div>
                    <div><input class="deduction-price-area" type="text" value="${prVo.other}" name="other" readonly></div>
                    <div>국민연금</div>
                    <div><input class="deduction-price-area" type="text" value="${prVo.nationalPension}" name="nationalPension" readonly></div>
                    <div>건강보험료</div>
                    <div><input class="deduction-price-area" type="text" value="${prVo.healthPremium}" name="healthPremium" readonly></div>
                    <div>장기요양보험료</div>
                    <div><input class="deduction-price-area" type="text" value="${prVo.longtermCare}" name="longtermCare" readonly></div>
                    <div>고용보험료</div>
                    <div><input class="deduction-price-area" type="text" value="${prVo.employmentPay}" name="employmentPay" readonly></div>
                    <div>소득세</div>
                    <div><input class="deduction-price-area" type="text" value="${prVo.incomeTax}" name="incomeTax" readonly></div>
                    <div>지방소득세</div>
                    <div><input class="deduction-price-area" type="text" value="${prVo.localTax}" name="localTax" readonly></div>
                    
                   
                    
                </div>

                <div style="grid-column: span 2; align-items: center; width: 100%; height: 100%;">
                    <input type="submit" value="작성하기" class="btn btn-light btn-lg" style="background-color: #1315a6 ; color:white;">
                    <input type="button" value="취소하기" class="btn btn-light btn-lg">
                </div>
            </form>
        </main>


    </div>
</body>

 
<script>
			
       const repairPrice = document.querySelectorAll('.repair-price-area');
       const deductionPrice = document.querySelectorAll('.deduction-price-area');

       const totalRepair = document.querySelector('input[name=totalRepair]');
       const totalDeduction = document.querySelector('input[name=totalDeduction]');
       const realPay = document.querySelector('#realPay');
       
       
        // 보수 콤마
       for(let i=0; i<repairPrice.length; i++){
                let num01;
                let num02;
                num01 = repairPrice[i].value;
                num02 = num01.replace(/\D/g,""); 
                num01 = setComma(num02);
                repairPrice[i].value =  num01;
        } 

        // 공제 콤마
       for(let i=0; i<deductionPrice.length; i++){

                let num01;
                let num02;
                num01 = deductionPrice[i].value;
                num02 = num01.replace(/\D/g,""); 
                num01 = setComma(num02);
                deductionPrice[i].value =  num01;
       } 

       totalRepair.value = setComma((totalRepair.value).replace(/\D/g,""))
       totalDeduction.value = setComma((totalDeduction.value).replace(/\D/g,""))
       realPay.innerText = setComma((realPay.innerText).replace(/\D/g,""))



       //콤마작업함수
       function setComma(n) {
            var reg = /(^[+-]?\d+)(\d{3})/;
            n += '';         
            while (reg.test(n)) {
                n = n.replace(reg, '$1' + ',' + '$2');
            }         
            return n;
        }


</script>




</html>