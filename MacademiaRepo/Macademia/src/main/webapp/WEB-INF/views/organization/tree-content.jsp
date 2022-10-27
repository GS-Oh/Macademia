<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!-- jQuery -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/1.12.1/jquery.min.js"></script>
<!-- jsTree -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/jstree/3.2.1/jstree.min.js"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jstree/3.2.1/themes/default/style.min.css" />
<style>

    #myboards-content{
        height: 90vh;
        width: 70vw;
        /* border: 1px solid black; */
        padding: 10px 0px;
		font-family:'AppleSDGothicNeo','Noto Sans KR', sans-serif;
        font-size: 20px;
        /* display: grid;
        grid-template-columns: 1fr 3fr; */
    }

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
		/* border: 1px solid black; */
		width: 200px;
		height: 300px;
	}
	.member > img{
		width: 150px;
		height: 150px;
	}
	#head{
		grid-column: 1/6;
		margin: auto;
	}
	#search-area{
		font-weight: 900;
		font-family:'AppleSDGothicNeo','Noto Sans KR', sans-serif;
		display: flex;
		/* border: 1px solid black; */
		justify-content: space-between;
		width: 100%;
		align-items: center;
		margin-top: 20px;
		height: 25px;
		
	}
	h3{
		display: inline-block;
		font-weight: 900;
	}
	h3, #search{
		width: 20vw;
		/* border: 1px solid black; */
	}

	#search-area button{
		background-color: #6666AB !important;
		border: none !important;
	}
	#search-area button:hover{
		background-color: #525285 !important;
	}


</style>
<div id="search-area">
	<h3>교육1팀</h3>
	<div id="search" class="input-group mb-3">
		<input type="text" class="form-control" placeholder="인물검색">
		<button class="btn btn-primary" type="submit">검색</button>
	</div>
</div>
<hr>
<div id="myboards-content">
    <div id="tree-detail">
		<div class="member" id="head">
			<img src="/md/resources/upload/profile/iu12341234.jpg" alt="아이유">
			<div class="detail">
				<ul>
					<li>이름 : 아이유</li>
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
</div>


<script>

// let treeJson = ${tree}
// treeJson[0].parent = "#";
// treeJson[0].state = {'opened' : true};
// treeJson[1].state = {'opened' : true};
// console.log('${tree}');


$(function () { 
    $('#tree').jstree({ 
		'core' : {
			'data' : [{"id":"1","text":"대표이사","parent":"#","state":{'opened' : true}},{"id":"2","parent":"1","text":"부원장","state":{'opened' : true}},{"id":"3","parent":"2","text":"운영기획부"},{"id":"4","parent":"2","text":"교육훈련부"},{"id":"5","parent":"2","text":"취업지원부"},{"id":"6","parent":"2","text":"마케팅부"},{"id":"7","parent":"3","text":"행정팀"},{"id":"8","parent":"3","text":"총무팀"},{"id":"9","parent":"3","text":"시설지원팀"},{"id":"10","parent":"4","text":"교육1팀"},{"id":"11","parent":"4","text":"교육2팀"},{"id":"12","parent":"4","text":"교재지원팀"},{"id":"13","parent":"5","text":"취업팀"},{"id":"14","parent":"5","text":"상담팀"},{"id":"15","parent":"6","text":"홍보팀"},{"id":"16","parent":"6","text":"대외협력팀"}]
		}
   	});
});

$('#tree')
  // listen for event
  .on('select_node.jstree', function (e,node) {
		$.ajax({
			url:"/md/organization/tree/"+node.selected[0],
			type:"post",
			success:function(result){
				
			},
			error:function(){
				alert('통신에러')
			}
		})
  })
</script>

