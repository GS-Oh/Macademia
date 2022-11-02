<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
<style>
    
    #myboards-content{
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
    #search-btn{
        width: 50px;
        height: 30px;
    }
    form, #pagination-area{
        width: 300px;
        margin:20px auto;
        display: flex;
        justify-content: center;
    }
    #pagination-area{
        justify-content: space-between;
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


<div id="myboards-content">
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
                <i id="x-btn" class="fa-regular fa-circle-xmark" onclick="deleteFile(${file.no })"></i>
            </div>
        </c:forEach>
    </div>

    <script>
        function deleteFile(fileNo){
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
                        data: { 'fileNo' : fileNo},
                        success: function(response) {
                            // document.location.reload(true);
                            $('#file-area').replaceWith(response);
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


    
    <form action="/md/member/myfiles" method="get">
        <input type="text" name="searchName">
        <button id="search-btn" type="submit">검색</button>
    </form>
    <div id="pagination-area">
        <a href="" class="btn btn-outline-secondary">&lt;&lt;</a>
        <a href="" class="btn btn-outline-secondary">&lt;</a>
        <a href="" class="btn btn-outline-secondary">1</a>
        <a href="" class="btn btn-outline-secondary">2</a>
        <a href="" class="btn btn-outline-secondary">3</a>
        <a href="" class="btn btn-outline-secondary">4</a>
        <a href="" class="btn btn-outline-secondary">5</a>
        <a href="" class="btn btn-outline-secondary">&gt;</a>
        <a href="" class="btn btn-outline-secondary">&gt;&gt;</a>
    </div>

    <form action="/md/member/myfiles/" method="post" enctype="multipart/form-data">
        <!-- The Modal -->
        <div class="modal fade" id="myModal">
            <div class="modal-dialog modal-dialog-centered">
            <div class="modal-content">

                <!-- Modal Header -->
                <div class="modal-header">
                    <h4 class="modal-title">파일업로드</h4>
                    <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
                </div>
                <form id="uploadForm">
                    <!-- Modal body -->
                    <div class="modal-body">
                        <input type="file" id="file-btn" name="file">
                    </div>

                    <!-- Modal footer -->
                    <div class="modal-footer">
                        <button type="button" id="uploadBtn" class="btn btn-danger" data-bs-dismiss="modal">업로드</button>
                    </div>
                </form>


            </div>
            </div>
        </div>
    </form>
</div>

<script>

    $('#uploadBtn').click(function(){
        var form = $('#uploadForm')[0];
        var formData = new FormData(form);
        console.log(form);
        console.log(formData);
        $.ajax({
            type:'POST',
            enctype:'multipart/form-data',
            url:'/md/myfile/insert',
            data:formData,
            dataType:'json',
            processData:false,
            contentType:false,
            cache:false,
            success:function(result){
                console.log("success : ", result);
            },
            error:function(e){
                console.log("error : ", e);
            }
        });
    });

    
</script>