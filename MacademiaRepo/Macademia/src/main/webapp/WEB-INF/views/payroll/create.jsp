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

	#management-select-area > form > div > select{
		font-size: 1.3rem;
	}

	#management-select-area > form > div > label{
		font-size: 2rem;
	}


    #management-select-result{
        display: grid;
        grid-template-columns: repeat(8, 1fr) 1.5fr 1.5fr 1.5fr;
        grid-template-rows: repeat(11, 1fr);
        row-gap: 10px;
        align-content : center;
        align-items: center;
    }

	.content-form{
		grid-column: span 11;
		display: grid;
        grid-template-columns: repeat(8, 1fr) 1.5fr 1.5fr 1.5fr;
	}

    .management-table-header{
		margin-top: 15px;

        font-size: 1.5rem;
        text-align: center;
        color: #6667AB;
		font-weight: 900;

		border-right: 1px dashed #6667AB;
    }

    .management-table-content{
		height: 80%;

        font-size: 1.5rem;
        text-align: center;

		border-right: 1px dashed #6667AB;
    }

	.management-table-content > input{
		width: 100%;
		height: 90%;
		text-align: center;
		padding-top: 5px;
		font-weight: 400;
		border: none;
		align-items: center;
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
	            <div id="management-select-area">
	                <form action="" method="post">
	
	                    <div>
	                        <label for="year-select" class="form-label">발급년월</label>
	                        <select name="payDate" id="year-select" class="form-select" >
	                            <option value="2022/03">2022-03</option>
	                            <option value="2022-04">2022-04</option>
	                            <option value="2022-05">2022-05</option>
	                            <option value="2022-06">2022-06</option>
	                            <option value="2022-07">2022-07</option>
	                            <option value="2022-08">2022-08</option>
	                            <option value="2022-09">2022-09</option>
	                            <option value="2022-10">2022-10</option>
	                            <option value="2022-11" selected>2022-11</option>
	                        </select>
	                    </div>
	
	                    <div>
	                        <label for="dept-select" class="form-label">부서명</label>
	                        <select name="deptNo" id="dept-select" class="form-select" onchange="">
	                            <option value="0" selected>선택안함</option>
	                            <option value="3">운영기획부</option>
	                            <option value="4">교육훈련부</option>
	                            <option value="5" >취업지원부</option>
	                            <option value="6" >마케팅부</option>
	                       	   <option value="7">행정팀</option>
	                            <option value="8">재정팀</option>
	                            <option value="9" >시설지원팀</option>
	                            <option value="10" >교육1팀</option>
	                             <option value="11">교육2팀</option>
	                            <option value="12">교육지원팀</option>
	                            <option value="13" >취업팀</option>
	                            <option value="15" >상담팀</option>
	                            <option value="16">홍보팀</option>
	                            <option value="17">대외홍보팀</option>
							
	                        </select>
							
	                    </div>

						<!--  -->
	                  	<div>
	                        <label for="part-select" class="form-label">직급명</label>
	                        <select name="rankNo" id="rank-select" class="form-select">
	                            <option value="0" selected>선택안함</option>
	                            <option value="1">인턴</option>
	                            <option value="2">사원</option>
	                            <option value="3" >대리</option>
	                            <option value="4" >과장</option>
	                            <option value="5" >팀장</option>
	                            <option value="6" >부장</option>
	                        </select>
	                    </div>
	
	                    <div>
	                        <input type="submit" value="검색" style="background-color: #6667AB; color:white; width: 70%; height: 80%;">
	                    </div>
						<h1>${prVoList}</h1>
	                </form>
	            </div>
	


	            <!-- 조회 결과 -->
	            <div id="management-select-result">
	            
					<div class="management-table-header">발급번호</div>
					<div class="management-table-header">발급년월</div>
					<div class="management-table-header">부서명</div>
					<div class="management-table-header">직급명</div>
					<div class="management-table-header">이름</div>
					<div class="management-table-header">본봉</div>
					<div class="management-table-header">수당</div>
					<div class="management-table-header">과세</div>
					<div class="management-table-header">비과세</div>
					<div class="management-table-header">지급총액</div>
					<div class="management-table-header">실수령액</div>

	            
					
	            
	            	<c:forEach items="${prVoList}" var="prVo">
	            	
	            		
						<!-- 급여대장 작성 -->
						<form class="content-form" action="/md/payroll/create/detail" method="get">
							
							<div class="management-table-content"><input type="text" value="${prVo.salNo}" name="salNo" style="width: 100%;" readonly></div>
							<div class="management-table-content"><input type="text" value="${prVo.payDate}" name="payDate" style="width: 100%;" readonly></div>
							<div class="management-table-content"><input type="text" value="${prVo.deptName}" name="deptName" style="width: 100%;" readonly></div>
							<div class="management-table-content"><input type="text" value="${prVo.rankName}" name="rankName" style="width: 100%;" readonly></div>
							<div class="management-table-content"><input type="text" value="${prVo.name}" name="name" style="width: 100%;" readonly></div>
							<div style="grid-column: span 6; color: red; text-align: center; ">
								
									<h2 style="width:100%; height: 90%; padding-top: 5px;"><input class="btn btn-secondary btn-lg" type="submit" value="급여 대장 작성하기" style="width:40%;"></h2>
									
							</div>
						</form>
						
	            	
	            	</c:forEach>
						
	
				
	            </div>
	
	
	        </main>	

		</div>


		<!--  -->
		<script>

			
				const yearSelect = document.querySelector('#year-select');
				const deptSelect = document.querySelector('#dept-select');
				const rankSelect = document.querySelector('#rank-select');

				const yearValue = '${yearValue}';
				const deptValue = '${deptValue}';
				const rankValue = '${rankValue}';

				console.log(yearValue);
				
				for (let i=0; i<yearSelect.options.length; i++){  
					//select box의 option value가 입력 받은 value의 값과 일치할 경우 selected
						if(yearSelect.options[i].value == yearValue){
							yearSelect.options[i].selected = true;
						};
				};
				
				
				for (let i=0; i<deptSelect.options.length; i++){  
				//select box의 option value가 입력 받은 value의 값과 일치할 경우 selected
					if(deptSelect.options[i].value == deptValue){
						deptSelect.options[i].selected = true;
					};
				};


				for (let i=0; i<rankSelect.options.length; i++){  
					//select box의 option value가 입력 받은 value의 값과 일치할 경우 selected
						if(rankSelect.options[i].value == rankValue){
							rankSelect.options[i].selected = true;
						};
					};

				

		</script>





</body>
</html>