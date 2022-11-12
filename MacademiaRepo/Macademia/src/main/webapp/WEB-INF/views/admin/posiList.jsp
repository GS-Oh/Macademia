<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="root" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>직위 목록</title>
<style>
	.modal input{display: inline; width: 150px;}
	.col-form-label{width: 100px;}
	a:hover{cursor: pointer;}
	.guide{margin-left: 110px;}
</style>
</head>
<body>

    <!-- Main wrapper start -->
    <div id="main-wrapper">	

		<c:import url="../common/menubar_admin.jsp"/>
    
        <!--**********************************
            Content body start
        ***********************************-->
        <div class="content-body">
            <div class="container-fluid">
                <div class="row page-titles mx-0">
                    <div class="col-sm-6 p-md-0">
                   	</div>
                    <div class="col-sm-6 p-md-0 justify-content-sm-end mt-2 mt-sm-0 d-flex">
                        <ol class="breadcrumb">
                            <li class="breadcrumb-item">조직 관리</li>
                            <li class="breadcrumb-item active"><a href="posilist.ad">직위 관리</a></li>
                        </ol>
                    </div>
                </div>
                <div class="row">
                    <div class="col-12">
                        <div class="card">
                            <div class="card-header">
                                <h3 class="card-title" style="font-weight: bold;">직위 목록</h3>
                            </div>
                            <div class="card-body">
	                        	<div style="float: right; margin-bottom: 10px;">
		                            <!-- Button trigger modal -->
			                       	<button type="button" class="btn btn-outline-dark" id="insertBtnModal" data-toggle="modal" data-target="#insertPosi">직위 추가</button>
			                        <button type="button" class="btn btn-outline-dark" id="deleteBtn">직위 삭제</button>
	                            </div>
					              
	                            <!-- Insert Modal -->
	                            <div class="modal fade" id="insertPosi">
	                            	<div class="modal-dialog modal-dialog-centered" role="document">
	                                	<div class="modal-content">
	                                    	<div class="modal-header">
	                                        	<h5 class="modal-title">직위 추가</h5>
	                                            <button type="button" class="close" data-dismiss="modal"><span>&times;</span>
	                                            </button>
	                                        </div>
	                                        <div class="modal-body" style="color: black;">
	                                        	<span style="color: red;">*</span><label class="col-form-label">명칭</label> 
	                                            <input id="positionName1" type="text" class="form-control" name="positionName" maxlength="10"><br>
	                                            <span id="positionNameGuide1" class="guide text-danger"></span><br>
	                                            <span class="text-danger">*</span><label class="col-form-label">정렬 순서</label>
	                                            <input id="posiOrder1" type="number" class="form-control" name="posiOrder" step="1" min="1"><br>
	                                            <span id="posiOrderGuide1" class="guide text-danger"></span><br>
	                                        </div>
	                                        <div class="modal-footer">
	                                            <button type="button" class="btn btn-primary" id="insertBtn">저장</button>
	                                            <button type="button" class="btn btn-light" data-dismiss="modal">취소</button>
	                                        </div>
	                                    </div>
	                            	</div>
	                          	</div>
	                          	
	                            <!-- Update Modal -->
	                            <div class="modal fade" id="updatePosi">
	                                <div class="modal-dialog modal-dialog-centered" role="document">
	                                	<div class="modal-content">
	                                    	<div class="modal-header">
	                                        	<h5 class="modal-title">직위 수정</h5>
	                                            <button type="button" class="close" data-dismiss="modal"><span>&times;</span>
	                                            </button>
	                                   		</div>
	                                        <div class="modal-body" style="color: black;">
	                                        	<span class="text-danger">*</span><label class="col-form-label">명칭</label>
	                                            <input id="positionName2" type="text" class="form-control" name="positionName" maxlength="10"><br>
	                                            <span id="positionNameGuide2" class="guide text-danger"></span><br>
	                                            <span class="text-danger">*</span><label class="col-form-label">정렬 순서</label>
	                                            <input id="posiOrder2" type="number" class="form-control" name="posiOrder" step="1" min="1"><br>
	                                            <span id="posiOrderGuide2" class="guide text-danger"></span><br>
	                                        </div>
	                                        <input id="posiNo" type="hidden" name="posiNo">
	                                        <div class="modal-footer">
	                                        	<button type="button" class="btn btn-primary" id="updateBtn">저장</button>
	                                            <button type="button" class="btn btn-light" data-dismiss="modal">취소</button>
	                                        </div>
	                                    </div>
	                                </div>
	                         	</div>
	                            <div class="table-responsive">
	                            	<table id="posiList" class="table table-hover table-responsive-sm" style="color: black; text-align: center;">
	                                	<thead>
	                                    	<tr>
	                                        	<th scope="col" width="30px"><input type="checkbox" id="checkAll"></th>
	                                       		<th scope="col" width="200px">명칭</th>
	                                            <th scope="col" width="100px">정렬 순서</th>
	                                            <th scope="col" width="100px">사용 인원수</th>
	                                       </tr>
	                                  	</thead>
	                                  	<tbody>
	                                    	<c:if test="${ empty pList }">
	                                       		<tr>
			                                		<td colspan="4">등록된 직위가 없습니다.</td>
		                                   		</tr>
	                                        </c:if>
	                                        <c:forEach var="p" items="${ pList }">
		                                    	<tr>
			                                		<td><input type="checkbox" class="checkP" name="positionNo" value="${ p.no }"></td>
			                                        <td><a class="updateBtnModal" data-toggle="modal" data-target="#updatePosi">${ p.name }</a></td>
			                                        <td>${ p.posiOrder }</td>
			                                        <td>${ p.memberCount }</td>
		                                        </tr>
	                                       	</c:forEach>
	                                   	</tbody>
	                                </table>
	                        	</div>
	                        	<script>
	                       			// 체크박스 선택 js
	                       			$('#checkAll').on('change', function(){
	                       				var checkAll = $(this).prop('checked');
	                       				
	                       				if (checkAll) {
	                       					$('.checkP').prop('checked', true);
	                       				} else {
	                       					$('.checkP').prop('checked', false);
	                       				}
	                       			});
	                       			
	                       			$(document).on('change', '.checkP', function(){
	                       				var checkP = document.getElementsByClassName('checkP');
	                       				
	                       				var checkFlag = true;
	                       				for (var i in checkP) {
	                       					if(checkP[i].checked == false) {
	                       						checkFlag = false;
	                       					}
	                       				}
	                       				
	                       				if(checkFlag) {
	                       					$('#checkAll').prop('checked', true);
	                       				} else {
	                       					$('#checkAll').prop('checked', false);
	                       				}
	                       			});	
	                       			
	                       			// 직위 추가시 직위 명칭 중복 검사 및 핖수 입력 안내
	                       			var dupCheck = false;
	                       			
					        		$('#insertBtnModal').on('click', function(){ // 직위 추가 모달창 열시 input 값 초기화
					        			$('#insertPosi').find('input').val('');
					        			$('#insertPosi').find('.guide').text('');
					        			dupCheck = false;
					        		});
	                       			
	                       			$('#positionName1').on('change', function(){
	                       				dupCheck = false;
	                       				var positionName = document.getElementById('positionName1');
	                       				positionName.value = positionName.value.trim();
	                       				var positionNameArr = document.getElementsByClassName('updateBtnModal');
	                       				
	                       				if(positionName.value.trim().length < 1 || positionName.value.trim().length > 10) {									        			
	                       					$('#positionNameGuide1').text('1~10자리까지 입력해주세요.');
	                       					positionName.focus();
	                       				} else {
	                       					for (var i in positionNameArr) {
	                       						if(positionName.value.trim() == positionNameArr[i].text) {
			                       					dupCheck = true;
			                       				}
	                       					}
	                       				
		                       				if (dupCheck) {
		                       					$('#positionNameGuide1').text('이미 사용 중인 직위 명칭입니다.');
		                       					positionName.focus();
		                       				} else {
		                       					$('#positionNameGuide1').text('');
		                       				}
		                       			}
	                       				
	                       			});
	                       			
	                       			$('#posiOrder1').on('change', function(){
	                       				var posiOrder = document.getElementById('posiOrder1');
	                       				
	                       				if (posiOrder.value == "" || posiOrder.value < 1) {
	                       					$('#posiOrderGuide1').text('1 이상의 숫자를 입력해주세요.');
	                       					posiOrder.focus();
	                       				} else {
	                       					$('#posiOrderGuide1').text('');
	                       				}
	                       			});
	                       			
					        		// 직위 추가
					        		$(document).on('click', '#insertBtn', function(){
										var positionName = document.getElementById('positionName1');
										var posiOrder = document.getElementById('posiOrder1');
											
										if(positionName.value.trim().length < 1 || positionName.value.trim().length > 10) {	
											positionName.focus();
	                       				} else if (posiOrder.value == "" || posiOrder.value < 1) {
	                       					posiOrder.focus();
	                       				} else if (dupCheck) {
	                       					positionName.focus();
	                       				} else {
											$.ajax({
												url: 'pinsert.ad',
		                       					dataType: 'json',
		                       					data: {positionName:positionName.value, posiOrder:posiOrder.value},
		                       					type: 'POST',
		                       					success: function(data){
		                       						
		                       						var posiList = $('#posiList tbody');
		                       						posiList.html('');
		                       						
		                       						var html = "";
		                       						if(data.length > 0) {
		                       							for(var i in data) {
		                       								html += '<tr><td><input type="checkbox" class="checkP" name="positionNo" value="' + data[i].positionNo + '"></td>'
		                       									 	+ '<td><a class="updateBtnModal" data-toggle="modal" data-target="#updatePosi">' + data[i].positionName + '</a></td>'
		                       									 	+ '<td>' + data[i].posiOrder + '</td>'
		                       									 	+ '<td>' + data[i].memberCount + '</td></tr>';
		                       								$('#checkAll').prop('checked', false);
		                       							}
		                       						} else {
		                       							html = '<tr><td colspan="4">등록된 직위가 없습니다.</td></tr>';
		                       						}
		                       						
		                       						posiList.append(html);
		                       						$('#insertPosi').modal('hide');
		                       						
		                       						alert('저장되었습니다.');		                       						
		                       					},
		                       					error: function(data){
		                       						console.log(data);
		                       						$('#insertposi').modal('hide');
		                       						alert('알 수 없는 오류가 발생했습니다.', '', 'error');
		                       					}
	                       					});
	                       				}
					        		});
					        		
					        		// 직위 수정
					        		var originPositionName = "";
					        		
					        		// 수정 모달창 열릴시 해당 항목 값으로 초기화
					        		$(document).on('click', '.updateBtnModal', function(){ 
					        			$('#updatePosi').find('input').val('');
					        			$('#updatePosi').find('.guide').text('');
					        			
					        			originPositionName = $(this).text();
					        			$('#positionName2').val($(this).text());
					        			$('#posiOrder2').val($(this).parent().parent().children().eq(2).text());
					        			$('#positionNo').val($(this).parent().parent().children().eq(0).children().val());
					        			dupCheck = false;
					        		});
					        		
	                       			$('#positionName2').on('change', function(){
	                       				dupCheck = false;
	                       				
	                       				var positionName = document.getElementById('positionName2');
	                       				var positionNameArr = document.getElementsByClassName('updateBtnModal');
	                       				
	                       				if(positionName.value.trim().length < 1 || positionName.value.trim().length > 10) {									        			
	                       					$('#positionNameGuide2').text('1~10자리까지 입력해주세요.');
	                       					positionName.focus();
	                       				} else {
	                       					for (var i in positionNameArr) {
	                       						if(positionName.value.trim() == positionNameArr[i].text && positionName.value.trim() != originPositionName) {
			                       					dupCheck = true;
			                       				}
	                       					}
	                       				
		                       				if (dupCheck) {
		                       					$('#positionNameGuide2').text('이미 사용 중인 직위 명칭입니다.');
		                       					positionName.focus();
		                       				} else {
		                       					$('#positionNameGuide2').text('');
		                       				}
		                       			}
	                       				
	                       			});
	                       			
	                       			$('#posiOrder2').on('change', function(){
	                       				var posiOrder = document.getElementById('posiOrder2');
	                       				
	                       				if (posiOrder.value == "" || posiOrder.value < 1) {
	                       					$('#posiOrderGuide2').text('1 이상의 숫자를 입력해주세요.');
	                       					posiOrder.focus();
	                       				} else {
	                       					$('#jobOrderGuide2').text('');
	                       				}
	                       			});
	                       			
					        		$(document).on('click', '#updateBtn', function(){
										var positionName = document.getElementById('positionName2');
										var posiOrder = document.getElementById('posiOrder2');
											
										if(positionName.value.trim().length < 1 || positionName.value.trim().length > 10) {	
											positionName.focus();
	                       				} else if (posiOrder.value == "" || posiOrder.value < 1) {
	                       					posiOrder.focus();
	                       				} else if (dupCheck) {
	                       					positionName.focus();
	                       				} else {
											$.ajax({
												url: 'pupdate.ad',
		                       					dataType: 'json',
		                       					data: {positionNo:$('#positionNo').val(), positionName:positionName.value, posiOrder:posiOrder.value},
		                       					type: 'POST',
		                       					success: function(data){
		                       						
		                       						var posiList = $('#posiList tbody');
		                       						posiList.html('');
		                       						
		                       						var html = "";
		                       						if(data.length > 0) {
		                       							for(var i in data) {
		                       								html += '<tr><td><input type="checkbox" class="checkP" name="positionNo" value="' + data[i].positionNo + '"></td>'
		                       									 	+ '<td><a class="updateBtnModal" data-toggle="modal" data-target="#updatePosi">' + data[i].PositionName + '</a></td>'
		                       									 	+ '<td>' + data[i].posiOrder + '</td>'
		                       									 	+ '<td>' + data[i].memberCount + '</td></tr>';
		                       								$('#checkAll').prop('checked', false);
		                       							}
		                       						} else {
		                       							html = '<tr><td colspan="4">등록된 직위가 없습니다.</td></tr>';
		                       						}
		                       						
		                       						posiList.append(html);
		                       						$('#updatePosi').modal('hide');
		                       						
		                       						alert('변경되었습니다.');	                       						
		                       					},
		                       					error: function(data){
		                       						console.log(data);
		                       						$('#updatePosi').modal('hide');
		                       						alert('알 수 없는 오류가 발생했습니다.', '', 'error');
		                       					}
	                       					});
	                       				}
					        		});
					        		
					        		
					        		// 직위 삭제
					        		$(document).on('click', '#deleteBtn', function(){
					        			var checkP = document.getElementsByClassName('checkP');
					        			
					        			var positionNoArr = [];
					        			var userCheck = false;
					        			for(var i in checkP) {
					        				console.log(checkP[i]);
					        				if(checkP[i].checked) {
					        					positionNoArr.push(checkP[i].value);
												
					        					if($('#posiList').find('input[value=' + checkP[i].value + ']').parent().parent().children().eq(3).text() > 0 ){
					        						userCheck = true;
					        					}
					        				}
					        			}
					        			
					        			if (positionNoArr.length > 0 && !userCheck) {
					        				Swal.fire({
						        				title: positionNoArr.length + '개의 항목을 삭제하시겠습니까?',
				                       			text: '삭제 후 복구할 수 없습니다.',
				                       			// icon: 'warning',
				                       			showCancelButton: true,
				                       			confirmButtonColor: '#CD5C5C',
				                       			cancelButtonColor: 'gray',
				                       			confirmButtonText: '삭제',
				                       		 	cancelButtonText: '취소'	
					        				}).then((result) => {
			                       				if (result.value) {
				                       				$.ajax({
				                       					url: 'pdelete.ad',
				                       					dataType: 'json',
				                       					traditional : true, // 배열 전송 위한 옵션
				                       					data: {positionNoArr:positionNoArr},
				                       					type: 'POST',
				                       					success: function(data){
				                       						
				                       						var posiList = $('#posiList tbody');
				                       						posiList.html('');
				                       						
				                       						var html = "";
				                       						if(data.length > 0) {
				                       							for(var i in data) {
				                       								html += '<tr><td><input type="checkbox" class="checkP" name="positionNo" value="' + data[i].positionNo + '"></td>'
				                       									 	+ '<td><a class="updateBtnModal" data-toggle="modal" data-target="#updatePosi">' + data[i].positionName + '</a></td>'
				                       									 	+ '<td>' + data[i].posiOrder + '</td>'
				                       									 	+ '<td>' + data[i].memberCount + '</td></tr>';
				                       								$('#checkAll').prop('checked', false);
				                       							}
				                       						} else {
				                       							html = '<tr><td colspan="4">등록된 직위가 없습니다.</td></tr>';
				                       						}
				                       						
				                       						posiList.append(html);
				                       						alert("삭제되었습니다.");
				                       						
				                       					},
				                       					error: function(data){
				                       						console.log(data);
				                       						alert('알 수 없는 오류가 발생했습니다.', '', 'error');
				                       					}
				                       				});
				                       			}
			                       			});
					        			} else if (userCheck){
					        				alert('사용 인원이 있는 직위는 삭제할 수 없습니다.');
					        			} else {
							       			alert('삭제할 항목을 선택하세요.');
					        			}
					        			
					        		});
					        		
					        		// sweet alert customize
					        		var alert = function(msg, title, icon) {
					        			Swal.fire({
					        				position: 'top',
					        				background: '#292B30',
						       				color: 'white',
					        				title : title,
					        				text : msg,
					        				icon: icon,
					        				timer : 1500,
					        				customClass : 'sweet-size',
					        				showConfirmButton : false
					        			});
					        		}
	                        	</script>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!--**********************************
            Content body end
        ***********************************-->

        <!--**********************************
            Footer start
        ***********************************-->
        <div class="footer">
            <div class="copyright">
                <p>Copyright © Designed &amp; Developed by <a href="${root}" target="_blank">MacademiA</a> 2022</p>
            </div>
        </div>
        <!--**********************************
            Footer end
        ***********************************-->      
          
    </div>
    <!--**********************************
        Main wrapper end
    ***********************************-->
    
   <!--**********************************
        Scripts
    ***********************************-->
</body>

</html>