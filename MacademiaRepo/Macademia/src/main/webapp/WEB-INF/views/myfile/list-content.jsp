<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
<style>
    
    #myfile-content{
        height: 85vh;
        width: 60vw;
        /* border: 1px solid black; */
        font-family:'AppleSDGothicNeo', 'Noto Sans KR', sans-serif;
    }
    h1{
        font-size: 35px;
    }
    #upload-btn-area{
        display: flex;
        justify-content: space-between;
        margin: 20px 25px 10px;
    }
    #upload-btn{
        height: 40px;
        font-size: 20px;
        background-color: rgb(114, 98, 167);
        color: white;    
    }
    #upload-btn:hover{
        background-color: rgb(255, 255, 255);
        color: rgb(114, 89, 168);
        border: 1px solid rgb(114, 89, 168);
    }
    select{
        width: 100px;
        height: 30px;
    }
    #search-input{
        width: 150px;
        height: 30px;
        font-size: 15px;
        /* font-weight: 700; */
    }
    #search-btn{
        width: 70px;
        height: 30px;
        background-color: #7171b5 ;
		border: none !important;    
        font-size: 15px;  
        font-weight: 700;
    }	
	#search-btn:hover{
		background-color: rgb(71, 71, 125);
	}
    #search-erea, #pagination-area{
        width: 450px;
        margin:20px auto;
        text-align: center;
        
        /* border: 1px solid black; */
    }
    .active{
        background-color: rgb(102, 102, 171) !important;
    }
    #pagination-area a{
        font-size: 20px;
        width: 40px;
        height: 40px;
        border-radius: 10px;
        margin: 0 2px;
        border: none;
        font-weight: 700;
    }
    #pagination-area a:hover{
        background-color: rgb(102, 102, 171);
        transition: 0.3s;
    }
    .page-btn{
        display: inline-block;
        border: 1px solid black;
        width: 30px;
        height: 30px;
    }

    #file-area{
        /* border: 1px solid black; */
        height: 67vh;
        display: grid;
        grid-template-columns: repeat(8,1fr);
        grid-template-rows: repeat(5,1fr);
        justify-items: center;
        align-items: center;
    }
    .file-slot{
        /* border: 1px solid rgb(41, 41, 41); */
        border-radius: 10px;
        width: 100px;
        height: 100px;
        box-shadow: 5px 5px 10px rgb(50, 50, 50);
        transition: 0.3s;
        text-align: center;
        position: relative;
        
    }
    .file-slot:hover{
        width: 120px;
        height: 120px;
        box-shadow: 10px 10px 20px rgb(80, 80, 80);
        transition: 0.3s;
        transform: none;
    }
    .file-slot:active{
        box-shadow: 10px 10px 20px rgb(205, 0, 0);
        
    }
    .file-slot img{
        width: 100%;
        height: 80%;
        font-size: 30px;
        border-top-left-radius: 10px;
        border-top-right-radius: 10px;
    }
    .file-slot span{
        width: 100%;
        display: inline-block;
        color: black;
        font-weight: 700;
    }
    .new-file{
        
        animation : new 1s;
        animation-iteration-count: 3;
    }
    @keyframes new{
        50% {transform: scale(1.1); box-shadow: 10px 10px 20px red;}
    }
    #x-btn{
        font-size: 20px;
        color: rgb(181, 0, 0);
        position: absolute;
        top : -3px;
        right: -3px;
        display: none;
        cursor: pointer;
        width: 20px;
        height: 20px;
        transition: 0.3s;
    }
    .file-slot:hover  #x-btn{
        display: inline-block;
        transition: 0.3s;
    }
    #x-btn:hover{
        color: red;
        text-shadow: 0 0 2px red;
        transform: scale(1.2) rotate(90deg);

    }
    #file-btn{
        width: 300px;
    }
    .modal-body{
        text-align: center;
        font-size: 20px;
    }
</style>

<div id="myfile-content">
    <div id="upload-btn-area">
        <h1>개인자료실</h1>
        <button id="upload-btn" type="button" class="btn" data-bs-toggle="modal" data-bs-target="#myModal">
            <i class="fa-solid fa-folder-plus"></i> 파일업로드
        </button>
    </div>
    <hr>
    <div id="file-area">
        <c:forEach var="file" items="${fileList }">
            <div class="file-slot">
                <a href="/md/resources/upload/myfile/${file.updateName }" download>
                    <img src="/md/resources/upload/myfile/${file.updateName }" alt="${fn:substringAfter(file.updateName,'.')}" width="100%" height="100%">
                    <span>${file.originName }</span>
                </a>
                <i id="x-btn" class="fa-regular fa-circle-xmark" onclick="deleteFile(${file.no})"></i>
            </div>
        </c:forEach>
    </div>

    <div id="search-erea" class="input-group mb-3">
        <input type="text" id="search-input" class="form-control" name="searchName" value="${searchName}" placeholder="파일명을 입력해주세요">
        <button onclick="page(1)" type="submit" id="search-btn" class="btn btn-primary" >검색</button>
    </div>

    <div id="pagination-area">
    	<c:if test="${pv.startPage > 1 }">
	        <a class="btn btn-outline-secondary" onclick="page(1)">&lt;&lt;</a>
	        <a class="btn btn-outline-secondary" onclick="page('${pv.startPage-1 }')">&lt;</a>
        </c:if>
        <c:forEach begin="${pv.startPage }" end="${pv.endPage}" varStatus="status">
        	<a  class="btn btn-outline-secondary" onclick="page('${status.index }')">${status.index }</a>
        </c:forEach>
        <c:if test="${pv.endPage < pv.maxPage }">
        	<a class="btn btn-outline-secondary" onclick="page('${pv.endPage+1 }')">&gt;</a>
        	<a class="btn btn-outline-secondary" onclick="page('${pv.maxPage}')">&gt;&gt;</a>
        </c:if>
    </div>

    <!-- The Modal -->
    <div class="modal fade" id="myModal">
        <div class="modal-dialog modal-dialog-centered">
        <div class="modal-content">

            <!-- Modal Header -->
            <div class="modal-header">
                <h4 class="modal-title">파일업로드</h4>
                <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
            </div>
            
            <!-- Modal body -->
            <div class="modal-body">
                <input type="file" id="file-input" name="file">
            </div>

            <!-- Modal footer -->
            <div class="modal-footer">
                <button type="button" id="real-upload-btn" class="btn btn-danger" data-bs-dismiss="modal">업로드</button>
            </div>
            
        </div>
        </div>
    </div>
</div>


<!-- 파일 업로드 -->
<script>

    // 동적으로 생성된 태그에 이벤트를 설정하기 위해서는 
    // 1. 태그에 onclick달아줘서 실행
    // 2. jquery를 사용하는 경우 아래와 같이 작성

    $(document).on('click','#real-upload-btn' ,function asdf(){
        console.log('upload진입');
        let form = $('#file-input')[0].files[0];
        let formData = new FormData();
        formData.append('file', form);
        console.log(formData);  
        $.ajax({
            type:'POST',
            enctype:'multipart/form-data',
            url:'/md/myfile/insert',
            data:formData,
            processData:false,
            contentType:false,
            cache:false,
            success:function(result){
                $('#myfile-content').replaceWith(result);
                pageBtnColor(1);
                document.querySelector('#file-area').children[0].classList.add('new-file')

                Swal.fire(
                        '업로드성공',
                        '파일업로드가 완료되었습니다.',
                        'success'
                        )
            },
            error:function(e){
                Swal.fire(
                        '통신에러',
                        '서버와의 통신에 문제가 있네요',
                        'warning'
                        )
            }
        });
    });
</script>   


<!-- 파일 삭제 -->
<script>

    function deleteFile(fileNo){
        let searchName = document.querySelector('#search-input').value
        console.log('delete진입');
        let pno = currentPage;
        console.log("pno : "+ pno);
        Swal.fire({
                title: '정말로 삭제하시겠습니까?',
                text: '삭제된 파일은 복구불가입니다.',
                icon: 'warning',
                confirmButtonText: '삭제',
                confirmButtonColor: 'red',
                showCancelButton: true,
                cancelButtonText: '취소',
                
        }).then((result)=>{
            if (result.isConfirmed) {
                $.ajax({
                    type: "POST",
                    url: "/md/myfile/delete/",
                    data: {
                        'fileNo' : fileNo,
                        'searchName' : searchName,
                        'pno' : pno
                    },
                    success: function(response) {
                        $('#myfile-content').replaceWith(response);
                        pageBtnColor(pno);
                        Swal.fire(
                        '삭제성공',
                        '삭제완료되었습니다~',
                        'success'
                        )
                    },
                    error: function (response) {
                        Swal.fire(
                        '통신에러',
                        '서버와의 통신에 문제가 있네요',
                        'warning'
                        )
                    }
                });
            }
        });
        
    }
</script>

<!-- 현재페이지 번호 -->

<script>
    let currentPage = '${pv.currentPage}';
</script>

<!-- 페이지버튼 클릭시 리스트 보여주기(ajax) -->
<script>
    function page(pno){
        currentPage = pno;
        let searchName = document.querySelector('#search-input').value
        $.ajax({
            type: "post",
            url: "/md/myfile/list/"+pno,
            data:{
                'searchName' : searchName
            },
            success: function(response) {
                $('#myfile-content').replaceWith(response);
                pageBtnColor(pno);
            },
            error: function (response) {
                Swal.fire(
                '통신에러',
                '서버와의 통신에 문제가 있네요',
                'warning'
                )
            }
        });
    };
</script>

<!-- 현재 페이지버튼에 색상추가 -->
<script>
    $(window).ready(pageBtnColor('${pv.currentPage}'));

    function pageBtnColor(pno){
        let pageBtns = $('#pagination-area > a');
        for(let i = 0 ; i<pageBtns.length ; i++){
            if(pageBtns[i].innerText==pno){
                $(pageBtns[i]).addClass('active');
            }
        }
    }
</script>





