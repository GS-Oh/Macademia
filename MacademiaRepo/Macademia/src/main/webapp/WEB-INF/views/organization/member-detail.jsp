<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<style>
	#tree-detail{
		/* border: 1px solid black; */
		width: 100%;
		/* margin-left: 10%; */
		display: grid;
		grid-template-columns: repeat(5, 1fr);
		font-size: 15px;
		font-weight: bold;
		row-gap: 20px;
		padding-top: 20px;
		justify-items: center;
        align-items: center;
		
	}

	.member{
		/* border: 5px solid rgb(240, 232, 232); */
		width: 200px;
		height: 400px;
		/* border-radius: 5px; */

	}
	.member > img{
		width: 100%;
		height: 200px;
	}
	#head{
		grid-column: 1/6;
		margin: auto;
	}
	table{
		width: 100%;
		color :  black;
	}
	th{
		background-color: rgb(213, 208, 230);
		text-align: center;
		padding: 5px;
		width: 40%;
	}
	td{
		background-color: rgb(240, 238, 245);
		font-weight: 500;
		padding-left: 10px;
		width: 60%;
	}
</style>

<div id="tree-detail">

	<c:forEach var="member" items="${memberList }" varStatus="status">
		<div class="member">
			<img src="/md/resources/upload/profile/${member.profileName }" alt="사진">
			<div class="detail">
				<table>
					<tr>
						<th>이름</th>
						<td>${member.name}</td>
					</tr>
					<tr>
						<th>부서</th>
						<td>${member.deptName}</td>
					</tr>
					<tr>
						<th>직급</th>
						<td>${member.rankName}</td>
					</tr>
					<tr>
						<th>직책</th>
						<td>${member.positionName}</td>
					</tr>
					<tr>
						<th>이메일</th>
						<td>${member.email}</td>
					</tr>
					<tr>
						<th>전화번호</th>
						<td>${member.phone}</td>
					</tr>
				</table>
			</div>
		</div>
	</c:forEach>
</div>



