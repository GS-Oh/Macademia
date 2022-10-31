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
        grid-template-rows: repeat(11, 1fr);

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

            <div class="main-table-span" id="detail-price"><h3>실 수 령 액 :  500,000,000,000</h3></div>

            <form action="" method="post" id="detail-form-area">
                <div class="main-table-grid">
                    <h4 >보수</h4>
                    <div>보수계</div>
                    <div><input class="" type="text" name="totalRepair" value="0" style="width:100%; height:100%;"></div>
                    <div>정근수당</div>
                    <div><input class="repair-price-area" type="number" name="attendance"></div>
                    <div>정근가산금</div>
                    <div><input class="repair-price-area" type="number" name="attendancePlus"></div>
                    <div>기술정보수당</div>
                    <div><input class="repair-price-area" type="number" name="technical"></div>
                    <div>특수직무수당</div>
                    <div><input class="repair-price-area" type="number" name="specialduty"></div>
                    <div>비상근무수당</div>
                    <div><input class="repair-price-area" type="number" name="emergency"></div>
                    <div>정액급식비</div>
                    <div><input class="repair-price-area" type="number" name="lunchFee"></div>
                    <div>명절휴가비</div>
                    <div><input class="repair-price-area" type="number" name="holiday"></div>
                    <div>직급보조비</div>
                    <div><input class="repair-price-area" type="number" name="subsidy"></div>
                    <div>대민활동비</div>
                    <div><input class="repair-price-area" type="number" name="publicActivity"></div>
                </div>

                <div class="main-table-grid">
                    <h4 >공제</h4>
                    <div>공제계</div>
                    <div><input class="" type="number" name="totalDeduction" value="0" style="width:100%; height:100%;"></div>
                    <div>기여금</div>
                    <div><input class="deduction-price-area" type="number" name="contribution"></div>
                    <div>노인장기요양보험</div>
                    <div><input class="deduction-price-area" type="number" name="longtermCare"></div>
                    <div>대한공제회비</div>
                    <div><input class="deduction-price-area" type="number" name="mutualFee"></div>
                    <div>직장금고회비</div>
                    <div><input class="deduction-price-area" type="number" name="safeDeposit"></div>
                    <div>소득세</div>
                    <div><input class="deduction-price-area" type="number" name="incomeTax"></div>
                    <div>지방소득세</div>
                    <div><input class="deduction-price-area" type="number" name="localTax"></div>
                    <div>7</div>
                    <div><input class="deduction-price-area" type="text" ></div>
                    <div>7</div>
                    <div><input class="deduction-price-area" type="text" ></div>
                    <div>7</div>
                    <div><input class="deduction-price-area" type="text" ></div>
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
       
        // 보수 합
       for(let i=0; i<repairPrice.length; i++){

    	   repairPrice[i].addEventListener('change',function(){
                let totalValue = totalRepair.value;
                let inputValue = repairPrice[i].value;
                totalRepair.value = parseInt(totalValue) +  parseInt(inputValue);
            })
        } 

        // 공제 합
       for(let i=0; i<deductionPrice.length; i++){

    	   deductionPrice[i].addEventListener('change',function(){
                let totalValue = totalDeduction.value;
                let inputValue = deductionPrice[i].value;
                totalDeduction.value = parseInt(totalValue) +  parseInt(inputValue);
            })
       } 

       


</script>




</html>