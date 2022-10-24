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
        border: 1px solid black;
        padding: 10px 0px;
		font-family:'AppleSDGothicNeo','Noto Sans KR', sans-serif;
        font-size: 20px;
        display: grid;
        grid-template-columns: 1fr 3fr;
    }
    #tree, #tree-detail{
        border: 1px solid black;
    }

</style>

<div id="myboards-content">
    <div id="tree"></div>
    <div id="tree-detail">
		<div id="head-area">
			<img src="" alt="">
			<div id="head-detail">
 
			</div>
		</div>

		<div class="members-area">
			<img src="" alt="">
			<div class="head-detail">

			</div>
		</div>
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
				$('#tree-detail').html(result)
			},
			error:function(){
				alert('통신에러')
			}
		})
  })
</script>

