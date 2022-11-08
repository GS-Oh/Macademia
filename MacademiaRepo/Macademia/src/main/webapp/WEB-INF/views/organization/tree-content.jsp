<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!-- jQuery -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/1.12.1/jquery.min.js"></script>
<!-- jQuery ui - 자동완성용 -->
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
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
		padding-bottom: 50px;
		height: fit-content;
		
    }
	#search-area{
		font-weight: 900;
		font-family:'AppleSDGothicNeo','Noto Sans KR', sans-serif;
		display: flex;
		justify-content: space-between;
		width: 70vw;
		margin-top: 20px;
		align-items: center;
		height: 30px;
	}
	h3{
		display: inline-block;
		font-weight: 900;
	}
	h3, #search{
		width: 10vw;
		/* border: 1px solid black; */
	}

	#search-area button{
		background-color: rgb(102, 102, 171) !important;
		border: none !important;
		font-size: 15px;
	}
	#search-area button:hover{
		background-color: #525285 !important;
	}
	#search-input{
		font-size: 15px;
	}

	.ui-menu-item div.ui-state-hover,
	.ui-menu-item div.ui-state-active {
		color: #ffffff;
		background-color: #6666AB;
		text-decoration: none;
		border:none;

		border-radius: 0px;
		-webkit-border-radius: 0px;
		-moz-border-radius: 0px;
		background-image: none;
	}

	.email{
		display: inline-block;
	}
	.email > i{
		display: none;
		color: rgb(86, 166, 88);
	}
	.email:hover > i{
		display: inline;
		color: white;
	}
	.email-wrap{
		position: relative;
	}
	.email:hover{
		color: white;
        transform: scale(1.2);
		background-color: rgb(86, 166, 88);
		border-radius: 5px;
		transition: 0.3s;
		padding: 0 5px 0px 5px;
		position: absolute;
		top: 5px;
		width: max-content;
		box-shadow: 5px 5px 5px rgb(149, 149, 149);
	}
	#up{
		position: fixed;
		bottom: 30px;
		right: 50px;
		font-size: 40px;
		color: grey;
		cursor: pointer;
	}




</style>

<div id="search-area">
	<h3>조직 구성</h3>
	<div id="search" class="input-group mb-3">
		<input type="text" id="search-input" class="form-control" placeholder="인물검색" onkeyup="if(window.event.keyCode==13){search()}">
		<button type="submit" id="search-btn" class="btn btn-primary">검색</button>
	</div>
</div>

<hr>

<div id="myboards-content">
    <div id="detail">
		<img src="/md/resources/img/tree.jpg" alt="조직도">
	</div>
</div>


<!-- 조직도 트리구조 구현 -->
<script>

	let treeData = ${tree};
	treeData[0].parent = "#";
	for(let i = 0 ; i<treeData.length ; i++){
		treeData[i].state = {'opened' : true};
	}

	$(function () { 
		$('#tree').jstree({ 
			'core' : {
				'data' : treeData
			}
		});
	});
	</script>

	<!-- 부서 구성 -->
	<script>
	$('#tree').on('select_node.jstree', function (e,node) {
			$.ajax({
				url:"/md/organization/tree/"+node.selected[0],
				type:"get",
				success:function(result){
					$('#detail').replaceWith(result);
				
				},
				error:function(){
					alert('통신에러');
				}
			})
	})
	</script>

	<!-- 사원검색 자동완성기능 -->
	<script>
	$(document).ready(function () {
		$('#search-input').autocomplete({
			source: function (request, response) {
				$.ajax({
					url: "/md/organization/search/auto",
					type: "GET",
					dataType: "json",
					data: { "search" : request.term},
					success: function (data) {
						response(
							$.map(data, function (member) {
								return {
									label: member.name,
									value: member.name,
									idx: member.no,
								}
							})
						)
					}
				})
			},
			focus: function (event, ui) {
			return false;
			},
			select: function (event, ui) {},
			minLength: 1,
			delay: 100,
			autoFocus: false,
		});
	});
</script>

<!-- 사원검색 -->
<script>
	function search() {
		let search = $('#search-input').val();
		$.ajax({
			url:"/md/organization/search/",
			type:"GET",
			data:{"search" : search},
			success:function(result){
				$('#detail').replaceWith(result);
			},
			error:function(){
				alert('통신에러');
			}
		})
	};

	$('#search-btn').click(function() {
		let search = $('#search-input').val();
		$.ajax({
			url:"/md/organization/search/",
			type:"GET",
			data:{"search" : search},
			success:function(result){
				$('#detail').replaceWith(result);
			},
			error:function(){
				alert('통신에러');
			}
		})
	});
</script>





