<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!-- jQuery -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/1.12.1/jquery.min.js"></script>
<!-- jsTree -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/jstree/3.2.1/jstree.min.js"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jstree/3.2.1/themes/default/style.min.css" />
<style>
    @import url('https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@500&display=swap');
    #myboards-content{
        height: 90vh;
        width: 60vw;
        border: 1px solid black;
        padding: 10px 0px;
        font-family: 'Noto Sans KR', sans-serif;
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
    <div id="tree-detail"></div>
</div>

<script>

$(function () { 
    
    $('#tree').jstree({ 
		'core' : {
			'data' : [
				{ "id" : "ajson1", "parent" : "#", "text" : "대표이사" ,'state' : {'opened' : true,'selected' : true}},
				{ "id" : "ajson2", "parent" : "ajson1", "text" : "부원장" ,'state' : {'opened' : true,'selected' : true}},
				{ "id" : "ajson3", "parent" : "ajson2", "text" : "운영기획부" },
				{ "id" : "ajson4", "parent" : "ajson2", "text" : "교육훈련부" },
				{ "id" : "ajson5", "parent" : "ajson2", "text" : "취업지원부" },
				{ "id" : "ajson6", "parent" : "ajson2", "text" : "마케팅부" },
				{ "id" : "ajson7", "parent" : "ajson3", "text" : "행정팀" },
				{ "id" : "ajson8", "parent" : "ajson3", "text" : "총무팀" },
				{ "id" : "ajson9", "parent" : "ajson3", "text" : "시설지원팀" },
				{ "id" : "ajson10", "parent" : "ajson4", "text" : "교육1팀" },
				{ "id" : "ajson11", "parent" : "ajson4", "text" : "교육2팀" },
				{ "id" : "ajson12", "parent" : "ajson4", "text" : "교재지원팀" },
				{ "id" : "ajson13", "parent" : "ajson5", "text" : "취업팀" },
				{ "id" : "ajson14", "parent" : "ajson5", "text" : "상담팀" },
				{ "id" : "ajson15", "parent" : "ajson6", "text" : "홍보팀" },
				{ "id" : "ajson16", "parent" : "ajson6", "text" : "대외협력팀" },
			]
		}
   	});
});

</script>

