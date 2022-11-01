<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


    <div id="tree-detail">
		<div class="member" id="head">
			<img src="/md/resources/upload/profile/iu12341234.jpg" alt="아이유">
			<div class="detail">
				<ul>
					<li>이름 : 하라쇼~~~~~~~~~~~~~!!!!</li>
					<li>부서 : 교육1팀</li>
					<li>직급 : 팀장</li>
					<li>직책 : 교육1팀장</li>
					<li>이메일 : kyoyuk@md.com</li>
					<li>전화번호 : 01012341234</li>
				</ul>
			</div>
		</div>
		<c:forEach begin="1" end="20">
		<div class="member">
			<img src="/md/resources/upload/profile/robot12341234.jpg" alt="robot">
			<div class="detail">
				<ul>
					<li>이름 : 김철수</li>
					<li>부서 : 교육1팀</li>
					<li>직급 : 대리</li>
					<li>직책 : 강사</li>
					<li>이메일 : kyoyuk13@md.com</li>
					<li>전화번호 : 01056785678</li>
				</ul>
			</div>
		</div>
		</c:forEach>
	</div>



