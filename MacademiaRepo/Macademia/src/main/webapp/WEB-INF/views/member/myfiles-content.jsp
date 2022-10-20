<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<style>
    @import url('https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@500&display=swap');
    #myboards-content{
        height: 85vh;
        width: 60vw;
        /* border: 1px solid black; */
        font-family: 'Noto Sans KR', sans-serif;
    }
    h1{
        font-size: 35px;
    }
    #upload-btn-area{
        display: flex;
        justify-content: space-between;
        margin: 20px 30px 10px;
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
        height: 70vh;
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
        
    }
    .file-slot:hover{
        width: 120px;
        height: 120px;
        box-shadow: 10px 10px 20px rgb(80, 80, 80);
        transition: 0.3s;
    }
    .file-slot:active{
        box-shadow: 10px 10px 20px rgb(205, 0, 0);
    }
    .file-slot > img{
        width: 100%;
        height: 80%;
        font-size: 30px;
        border-top-left-radius: 10px;
        border-top-right-radius: 10px;
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
        <a href="" download>
            <div class="file-slot">
                <img src="/md/resources/upload/private-files/netflix.jpg" alt="......." width="100%" height="100%">
                <!-- <img src="/md/resources/img/background/macadamia.png" alt="......." width="100%" height="100%"> -->
                <span>파일명</span>
            </div>
        </a>
        </c:forEach>
        
    </div>

    
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
                <form action="" method="post" enctype="multipart/form-data">
                    <input id="file-btn" type="file" name="file">
                </form>
            </div>

            <!-- Modal footer -->
            <div class="modal-footer">
            <button type="button" class="btn btn-danger" data-bs-dismiss="modal">닫기</button>
            </div>

        </div>
        </div>
    </div>



</div>