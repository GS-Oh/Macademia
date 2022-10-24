<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
<style>
    
    #myboards-content{
        height: 85vh;
        width: 70vw;
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
        transform: perspective(300px) rotateY(-15deg);
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
    <div id="file-area">
        <c:forEach begin="1" end="40">
            <div class="file-slot">
                <a href="" download>
                    <img src="/md/resources/upload/private-files/netflix.jpg" alt="확장자" width="100%" height="100%">
                    <!-- <img src="/md/resources/img/background/macadamiad.png" alt="......." width="100%" height="100%"> -->
                    <span>파일명</span>
                </a>
                <i id="x-btn" class="fa-regular fa-circle-xmark" onclick="deleteFile()"></i>
                
            </div>
        </c:forEach>
    </div>

    <script>
        function deleteFile(){
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
                        url: "/md",
                        data: { 'asdf': 123},
                        success: function(response) {
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

    
    <form action="">
        <input type="text" name="search-query">
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

    <form action="" method="post" enctype="multipart/form-data">
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
                <input id="file-btn" type="file" name="file">
            </div>

            <!-- Modal footer -->
            <div class="modal-footer">
                <button type="submit" class="btn btn-danger" data-bs-dismiss="modal">업로드</button>
            </div>
            
        </div>
        </div>
    </div>
    </form>



</div>