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
        display: grid;
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

            <div class="main-table-span" id="detail-price"><h3>실 수 령 액 : </h3><h3 id="realAmount"></h3></div>

            <form action="" method="post" id="detail-form-area">
                <div class="main-table-grid">
                    <h4>보수</h4>
                    <div>보수계</div>
                    <div><input class="" type="text" name="totalRepair"  style="width:100%; height:100%;" onfocus="this.oldvalue = this.value;"></div>
                    <div>월 급여액</div>
                    <div><input class="repair-price-area" type="text"  value="${prVo.pay}" name="pay" onfocus="this.oldvalue = this.value;"></div>
                    <div>정근수당</div>
                    <div><input class="repair-price-area" type="text"  value="${prVo.attendance}" name="attendance" onfocus="this.oldvalue = this.value;"></div>
                    <div>정근가산금</div>
                    <div><input class="repair-price-area" type="text"  value="${prVo.attendancePlus}" name="attendancePlus" onfocus="this.oldvalue = this.value;"></div>
                    <div>기술정보수당</div>
                    <div><input class="repair-price-area" type="text" value="${prVo.technical}" name="technical" onfocus="this.oldvalue = this.value;"></div>
                    <div>특수직무수당</div>
                    <div><input class="repair-price-area" type="text" value="${prVo.specialduty}" name="specialduty" onfocus="this.oldvalue = this.value;"></div>
                    <div>비상근무수당</div>
                    <div><input class="repair-price-area" type="text" value="${prVo.emergency}" name="emergency" onfocus="this.oldvalue = this.value;"></div>
                    <div>정액급식비</div>
                    <div><input class="repair-price-area" type="text" value="${prVo.lunchFee}" name="lunchFee" onfocus="this.oldvalue = this.value;"></div>
                    <div>명절휴가비</div>
                    <div><input class="repair-price-area" type="text" value="${prVo.holiday}" name="holiday" onfocus="this.oldvalue = this.value;"></div>
                    <div>직급보조비</div>
                    <div><input class="repair-price-area" type="text" value="${prVo.subsidy}" name="subsidy" onfocus="this.oldvalue = this.value;"></div>
                    <div>대민활동비</div>
                    <div><input class="repair-price-area" type="text" value="${prVo.publicActivity}" name="publicActivity" onfocus="this.oldvalue = this.value;"></div>
                </div>

                <div class="main-table-grid">
                    <h4 >공제</h4>
                    <div>공제계</div>
                    <div><input class="" type="text" name="totalDeduction" value="0" style="width:100%; height:100%;" onfocus="this.oldvalue = this.value;"></div>
                    <div>기여금</div>
                    <div><input class="deduction-price-area" type="text" value="${prVo.contribution}" name="contribution" onfocus="this.oldvalue = this.value;"></div>
                    <div>대한공제회비</div>
                    <div><input class="deduction-price-area" type="text" value="${prVo.mutualFee}" name="mutualFee" onfocus="this.oldvalue = this.value;"></div>
                    <div>직장금고회비</div>
                    <div><input class="deduction-price-area" type="text" value="${prVo.safeDeposit}" name="safeDeposit" onfocus="this.oldvalue = this.value;"></div>
                    <div>기타공제</div>
                    <div><input class="deduction-price-area" type="text" value="${prVo.other}" name="other" onfocus="this.oldvalue = this.value;"></div>
                    <div>국민연금</div>
                    <div><input class="deduction-price-area" type="text" value="${prVo.nationalPension}" name="nationalPension" onfocus="this.oldvalue = this.value;"></div>
                    <div>건강보험료</div>
                    <div><input class="deduction-price-area" type="text" value="${prVo.healthPremium}" name="healthPremium" onfocus="this.oldvalue = this.value;"></div>
                    <div>장기요양보험료</div>
                    <div><input class="deduction-price-area" type="text" value="${prVo.longtermCare}" name="longtermCare" onfocus="this.oldvalue = this.value;"></div>
                    <div>고용보험료</div>
                    <div><input class="deduction-price-area" type="text" value="${prVo.employmentPay}" name="employmentPay" onfocus="this.oldvalue = this.value;"></div>
                    <div>소득세</div>
                    <div><input class="deduction-price-area" type="text" value="${prVo.incomeTax}" name="incomeTax" onfocus="this.oldvalue = this.value;"></div>
                    <div>지방소득세</div>
                    <div><input class="deduction-price-area" type="text" value="${prVo.localTax}" name="localTax" onfocus="this.oldvalue = this.value;"></div>
                    
                   
                    
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
       
       const realPay = document.querySelector('#realAmount');

       

        // 보수 합 + 실수령액 처리
       for(let i=0; i<repairPrice.length; i++){

    	   repairPrice[i].addEventListener('change',function(){
                //보수 합
                let totalValue = (totalRepair.value).replace(/,/g, "");
                let inputValue = (repairPrice[i].value).replace(/,/g, "");
                let oldvalue = (repairPrice[i].oldvalue).replace(/,/g, "");
                totalRepair.value = parseInt(totalValue) +  parseInt(inputValue) - parseInt(oldvalue);

                //실수령액
                let totalRepairValue = totalRepair.value.replace(/,/g, "");;
                let totalDeductionValue = totalDeduction.value.replace(/,/g, "");;
                realPay.innerText = parseInt(totalRepairValue) - parseInt(totalDeductionValue);

                //콤마작업
                let num01;
                let num02;
                num01 = inputValue;
                num02 = num01.replace(/\D/g,""); 
                num01 = setComma(num02);
                repairPrice[i].value =  num01;

                totalRepair.value = setComma((totalRepair.value).replace(/\D/g,""));
                totalDeduction.value = setComma((totalDeduction.value).replace(/\D/g,""));
                realPay.innerText = setComma((realPay.innerText).replace(/\D/g,""));
            })
        } 

        // 공제 합 + 실수령액 처리
        for(let i=0; i<deductionPrice.length; i++){
            deductionPrice[i].addEventListener('change',function(){
               //공제 합
                let totalValue = (totalDeduction.value).replace(/,/g, "");
                let inputValue = (deductionPrice[i].value).replace(/,/g, "");
                let oldvalue = (deductionPrice[i].oldvalue).replace(/,/g, "");
                totalDeduction.value = parseInt(totalValue) +  parseInt(inputValue) - parseInt(oldvalue);

                 //실수령액
                let totalRepairValue = totalRepair.value.replace(/,/g, "");;
                let totalDeductionValue = totalDeduction.value.replace(/,/g, "");;
                realPay.innerText = parseInt(totalRepairValue) - parseInt(totalDeductionValue);

                //콤마작업
                let num01;
                let num02;
                num01 = inputValue;
                num02 = num01.replace(/\D/g,""); 
                num01 = setComma(num02);
                deductionPrice[i].value =  num01;

                totalRepair.value = setComma((totalRepair.value).replace(/\D/g,""));
                totalDeduction.value = setComma((totalDeduction.value).replace(/\D/g,""));
                realPay.innerText = setComma((realPay.innerText).replace(/\D/g,""));
            })


            
        } 


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

<!-- 기본 실 수령액 처리 -->
<script>

    const payRankName = '${prVo.rankName}';
    const monthPay = document.querySelector('input[name=pay]');

    switch(payRankName){

        case '인턴' : monthPay.value = 2000000; totalRepair.value = 2000000; realPay.innerText = 2000000; break;
        case '사원' : monthPay.value = 4000000; totalRepair.value = 4000000; realPay.innerText = 4000000; break;
        case '대리' : monthPay.value = 6000000; totalRepair.value = 6000000; realPay.innerText = 6000000; break;
        case '과장' : monthPay.value = 8000000; totalRepair.value = 8000000; realPay.innerText = 8000000; break;
        case '팀장' : monthPay.value = 10000000; totalRepair.value = 10000000; realPay.innerText = 10000000; break;
        case '부장' : monthPay.value = 12000000; totalRepair.value = 12000000; realPay.innerText = 12000000; break;
        default : monthPay.value = 2000000; totalRepair.value = 2000000; realPay.innerText = 2000000;

    }
    
    // let num01;
    // let num02;
    // num01 = monthPay.value;
    // num02 = num01.replace(/\D/g,""); 
    // num01 = setComma(num02);
    // monthPay.value =  num01;
    
    //콤마작업 - 위의 작업 한 줄로 만듬
    monthPay.value = setComma((monthPay.value).replace(/\D/g,""));
    totalRepair.value = setComma((totalRepair.value).replace(/\D/g,""));
    totalDeduction.value = setComma((totalDeduction.value).replace(/\D/g,""));
    realPay.innerText = setComma((realPay.innerText).replace(/\D/g,""));
    

    

</script>





</html>