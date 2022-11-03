<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- 스위트 알랏 -->
<script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>

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
        font-size: 1.5rem;
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
        width: 800px;

        display: grid;
        grid-template-columns: 10% 15% 15% 15% 23% 18%;
        grid-template-rows: repeat(5, 1fr);
        align-items: center;
        justify-items: center;
	
		overflow-y : scroll;
        border: 2px solid #1315a6;
        border-radius: 30px;
    }

    #aJax-target{
        grid-column: span 6;
        width: 800px;
        display: grid;
        grid-template-columns: 13% 10% 20% 13% 22% 18%;
        align-items: center;
        justify-items: center;
        row-gap : 10px;
        margin-left : 3%;
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

                    <div class="account-table-header">등록번호</div>
                    <div class="account-table-header">구분</div>
                    <div class="account-table-header">예금주명</div>
                    <div class="account-table-header">은행명</div>
                    <div class="account-table-header">계좌번호</div>
                    <div class="account-table-header">계좌상태</div>
                    <div class="account-table-header">신청여부</div>


                    <div class="account-table-content">${soVo.stNo}</div>
                    <div class="account-table-content account-part">월급여</div>
                    <div class="account-table-content">${soVo.name}</div>
                    <div class="account-table-content">${soVo.bankName}</div>
                    <div class="account-table-content">${soVo.account}</div>
                    <div class="account-table-content">계좌등록완료</div>
                    <div class="account-table-content statusOX">${soVo.monthPay}</div>
                    
                    <div class="account-table-content">${soVo.stNo}</div>
                    <div class="account-table-content account-part" >기본상여금</div>
                    <div class="account-table-content">${soVo.name}</div>
                    <div class="account-table-content">${soVo.bankName}</div>
                    <div class="account-table-content">${soVo.account}</div>
                    <div class="account-table-content">계좌등록완료</div>
                    <div class="account-table-content statusOX">${soVo.basicBonus}</div>
                    
                    <div class="account-table-content">${soVo.stNo}</div>
                    <div class="account-table-content account-part" >보너스</div>
                    <div class="account-table-content">${soVo.name}</div>
                    <div class="account-table-content">${soVo.bankName}</div>
                    <div class="account-table-content">${soVo.account}</div>
                    <div class="account-table-content">계좌등록완료</div>
                    <div class="account-table-content statusOX" >${soVo.bonus}</div>


                </div>


            </div>    

            <div >
                <h3 class="account-title-name">자동이체 변경하기</h3>
                <div id="account-info-area" >
                    <div >
                        <h4>급여구분  :   
                        <select name="" id="changeName-select" >
                            <option value="월급여">월급여</option>
                            <option value="기본상여금">기본상여금</option>
                            <option value="보너스">보너스</option>
                        </select>
                        </h4>
                    </div>
                    <div><h4>예금주명  :   ${soVo.name}</h4></div>
                    <div><h4>은 행 명  :   ${soVo.bankName}</h4></div>
                    <div><h4>계좌번호  :   ${soVo.account}</h4></div>
                    <div id="account-direct">
                        <h4>자동이체  :   </h4>
                        <div>
                            <input id="changeSuccess" type="button" value="신청하기" style="background-color: #6667AB; color:white"> 
                            <input id="changeCancle" type="button" value="취소하기">
                        </div>
                    </div>
                </div>
            </div>


            <div >
                <h3 class="account-title-name" >자동이체 변경 이력</h3>
                <div id="account-edit-area">

                    <div class="account-table-header">요청</div>
                    <div class="account-table-header">급여구분</div>
                    <div class="account-table-header">예금주명</div>
                    <div class="account-table-header">은 행 명</div>
                    <div class="account-table-header">계좌번호</div>
                    <div class="account-table-header" >요청일시</div>
					
                    <div id="aJax-target">
                        <c:forEach items="#{soChangeVoList}" var="soChangeVo">
                            
                            <c:if test="${soChangeVo.status eq '취소'}">
                                <div class="badge bg-danger">${soChangeVo.status}</div>
                            </c:if>
                            
                            <c:if test="${soChangeVo.status  eq '신청'}">
                                <div class="badge bg-primary">${soChangeVo.status}</div>
                            </c:if>
                            
                            <div>${soChangeVo.name}</div>
                            <div>${soVo.name}</div>
                            <div>${soVo.bankName}</div>
                            <div>${soVo.account}</div>
                            <div>${soChangeVo.changeDate}</div>
                            
                        </c:forEach>
					
                    </div>
                 

                </div>

            </div>



        </main>


    </div>
    
    	<c:if test="${empty soVo}">
	    	<script>
				Swal.fire({
				title: "${loginMember.name} --- ${loginMember.account}",
				text: "자동이체 계좌등록을 하시겠습니까?",
				icon: "question",
				showConfirmButton: false,
				footer: '<h3><a href="/md/payroll/account/enroll" style="background-color: #6667AB; color:white; text-decoration:none;">계좌 등록하기</a></h3>'
				}).then((result) => {
				  if (result.isConfirmed) {
						  Swal.fire('등록성공!', '', 'success');
					  }
				})
			</script>
    	</c:if>
    
        <script>

            const changeSuccess = document.querySelector('#changeSuccess');
            const changeCancle = document.querySelector('#changeCancle');

            const changeName = document.querySelector('#changeName-select');

            const accountPart = document.querySelectorAll('.account-part');
            const statusOX = document.querySelectorAll('.statusOX');
            
            let today = new Date();
            let year = today.getFullYear();
            let month = ('0' + (today.getMonth() + 1)).slice(-2);
            let day = ('0' + today.getDate()).slice(-2);
            const dateString = year + '-' + month  + '-' + day;
            

            changeSuccess.addEventListener('click',function(){
				
            	for(let i=0; i<accountPart.length; i++){
            		
            		if( changeName.value == accountPart[i].innerText && statusOX[i].innerText == 'X'){
            		
		                $.ajax({
		
		                    url: "${root}/payroll/account/change",
		                    type : "post",
		                    data : {
		                          stNo : '${soVo.stNo}',
		                          no : '${soVo.no}',
		                          name :  changeName.value,
		                          status :  '신청'
		                    },
		                    success : function(result){
		                        if(result == 'success'){
		                            let editArea = document.querySelector('#aJax-target');
									
		                            statusOX[i].innerText = 'O';
		                            
		                            $(editArea).prepend('<div class="badge bg-primary">신청</div>'
		            	                    +'<div>' + changeName.value + '</div>'
		            	                    + '<div>${soVo.name}</div>'
		            	                    + '<div>${soVo.bankName}</div>'
		            	                    + '<div>${soVo.account}</div>'
		            	                    + '<div>'+ dateString + '</div>')
		            	                    
		            	                    Swal.fire(
	          								  '자동이체 [ 신청 ] 요청',
	          								  '변경 요청 성공',
	          								  'success'
	          							     )   
	          							     
		                        }else{
		                        	
		                        	Swal.fire({
		                    		  icon: 'warning',
		                    		  title: '통신실패',
		                    		  text: 'Something went wrong!',
		                    		})
			                    		
		                        }
		                        
		
		                    },
		                    error: function(){
		                    	
		                    	Swal.fire({
	                    		  icon: 'error',
	                    		  title: '통신실패',
	                    		  text: 'Something went wrong!',
	                    		})
	                    		
		                    }
		
		                });
		                
            		}else{
                        Swal.fire('이미 신청 상태입니다.')
                    }
            		
            		
            	}

            });


            changeCancle.addEventListener('click',function(){
				

            	for(let i=0; i<accountPart.length; i++){
            		
            		if( changeName.value == accountPart[i].innerText && statusOX[i].innerText == 'O'){
            		
		                $.ajax({
		
		                    url: "${root}/payroll/account/change",
		                    type : "post",
		                    data : {
		                          stNo : '${soVo.stNo}',
		                          no : '${soVo.no}',
		                          name :  changeName.value,
		                          status :  '취소'
		                    },
		                    success : function(result){
		                        if(result == 'success'){
		                            let editArea = document.querySelector('#aJax-target');
									
		                            statusOX[i].innerText = 'X';
		                            
		                            $(editArea).prepend('<div class="badge bg-danger">취소</div>'
		            	                    +'<div>' + changeName.value + '</div>'
		            	                    + '<div>${soVo.name}</div>'
		            	                    + '<div>${soVo.bankName}</div>'
		            	                    + '<div>${soVo.account}</div>'
		            	                    + '<div>'+ dateString + '</div>')
		            	                    
		            	             Swal.fire(
									  '자동이체 [ 취소 ] 요청',
									  '변경 요청 성공',
									  'success'
								     )       
								     
								     
		                        }else{
		                        	
		                        	Swal.fire({
		                    		  icon: 'warning',
		                    		  title: '통신실패',
		                    		  text: 'Something went wrong!',
		                    		})
		                    		
		                        }
		
		                    },
		                    error: function(){
		                    	
		                    	Swal.fire({
	                    		  icon: 'error',
	                    		  title: '통신실패',
	                    		  text: 'Something went wrong!',
	                    		})
	                    		
	                    		
		                    }
		
		                });
		                
            		}else{
                        Swal.fire('이미 취소 상태입니다.')
                    }
            		
            		
            	}

            });

        </script>


</body>
</html>