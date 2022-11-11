<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <style>
    h3{
    margin: 15px 0 0	;
    
    
    }
    #work {
    margin: 0 auto;
  
    width:1000px;
    height:500px;
    border:1px solid #6667AB;
    margin-top:30px;
    border-radius: 5px;
    }
     #my_work2{
    	width:100%;
    	
    	
    	
    }
    #my_work{
    	height:40px;	
    	width:100%;
    	
    	
    }
    #myWorkTr{
    border-radius:3px 3px 0 0;
    border-radius:10px;
    }
    
     th{
    background-color:#6667AB;
    color: #fff;
    font-family: 'AppleSDGothicNeo', 'Noto Sans KR', sans-serif;
    text-align: center;
    }
    td{
    font-family: 'AppleSDGothicNeo', 'Noto Sans KR', sans-serif;
    text-align: center;
    border-bottom: solid 1px #0000001a;
    }
    #page-area{
    margin:20px 0 0 350px;
    }
    #page{
    display:flex;
    
    }
    #page li{
    width:25px;
    height:25px;
    text-align:center;
    color:#fff;
    border-radius:5px;
    margin-left:5px;
    
    background-color:#6667AB;
    }
    a{
    color:#000;
    }
    .pageBtn{
    color:#fff;
    
    }
    </style>
    
<div id="center_menu">
	<h3>나의 결재</h3>
	<hr>
	<div id="work">
				<table id="my_work">
					
						<tr id="myWorkTr">
							<th>번호</th>
							<th>제목</th>
							<th>등록날짜</th>
							<!-- <th>결재 여부</th> -->
							
						</tr>
						 <c:forEach items="${slVo}" var="x">
						    <tr>
							<td>${x.S_NO}</td>
						 	<td><a href="/md/sign/signDetail/${x.S_NO}">${x.S_TITLE}</td>
							<td>${x.S_DATE}</td>
							<%-- <td>${x.S_STATUS}</td> --%>
						</tr>
						</c:forEach>
						</table>
						
				
				<div id="page-area">
						<ul id="page">
						<c:if test="${pv.startPage ne 1}">
		<li><a href="/md/sign/list/${pv.startPage - 1}" class="pageBtn" >이전</a></li>
	</c:if>
	
	<c:forEach begin="${ pv.startPage }" end="${ pv.endPage }" var="i">
	  <li> <a href="/md/sign/list/${i}" class="pageBtn">${i}</a></li> 
	</c:forEach>
	
	<c:if test="${pv.endPage ne pv.maxPage }">
		<a href="/md/sign/list/${pv.endPage + 1}" class="pageBtn">다음</a>
	</c:if>	
					</ul>
				</div>
				
				
			</div>
			</div>