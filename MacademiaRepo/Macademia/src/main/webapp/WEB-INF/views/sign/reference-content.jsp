<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <style>
    h3{
    margin: 15px 0 0	;
    
    
    }
    #work {
    margin: 0 auto;
  
    width:1000px;
    height:300px;
    border:1px solid #6667AB;
    margin-top:30px;
    }
    
    #my_work{
    	width:100%;
    	
    	
    }
    #my_work2{
    width:100%;
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
    </style>
    
<div id="center_menu">
	<h3>반려된 문서</h3>
	<hr>
	<div id="work">
				<table id="my_work" border="1">
					
						<tr>
							<th>번호</th>
							<th>제목</th>
							
							
							<th>등록날짜</th>
							
						</tr>
					</table>
						<table id="my_work2">
							<c:forEach items="${cList}" var="x">
						    <tr>
							<td>${x.SNo}</td>
						 	<td><a href="/md/sign/signDetail/">${x.STitle}</td>
							<td>${x.SDate}</td>
						</tr>
   						 </c:forEach>
						</table>
						
						
						
						
						
						
					
				
				</table>
				
				<div id="page-area">
					<ul id="page">
						<c:if test="${pv.startPage ne 1}">
		<li><a href="/md/sign/reference/${pv.startPage - 1}" >이전</a></li>
	</c:if>
	
	<c:forEach begin="${ pv.startPage }" end="${ pv.endPage }" var="i">
	  <li> <a href="/md/sign/reference/${i}">${i}</a></li> 
	</c:forEach>
	
	<c:if test="${pv.endPage ne pv.maxPage }">
		<a href="/md/sign/reference/${pv.endPage + 1}">다음</a>
	</c:if>	
					</ul>
				</div>
				
				
			</div>
			</div>