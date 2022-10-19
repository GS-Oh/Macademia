<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<style>
    #myboards-content{
        height: 90vh;
        width: 60vw;
        border: 1px solid black;
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
    #upload-btn-area{
        display: flex;
        justify-content: end;
    }
    #upload-btn{
        height: 40px;
        font-size: 20px;
        margin-right: 10px;
        background-color: rgb(114, 98, 167);
        color: white;
        
    }
    #upload-btn:hover{
        background-color: rgb(255, 255, 255);
        color: rgb(114, 89, 168);
        border: 1px solid rgb(114, 89, 168);

    }
    #file-btn{
        height: 40px;
    }

</style>

<div id="myboards-content">
    <table class="table">
        <thead>
            <tr>
            <th>번호</th>
            <th>파일명</th>
            <th>등록일</th>
            <th></th>
            </tr>
        </thead>
        
        <tbody>
            <c:forEach begin="1" end="5">
            <tr>
            <td>5</td>
            <td><a href="">제목제목제목</a></td>
            <td>2022-10-19</td>
            <td><a href=""><span class="badge bg-danger">삭제</span></a></td>
            </tr>
            </c:forEach>
        </tbody>
    </table>
    <div id="upload-btn-area">
        <button id="upload-btn" type="button" class="btn" data-bs-toggle="modal" data-bs-target="#myModal">
            <i class="fa-solid fa-folder-plus"></i> 파일업로드
        </button>
    </div>
    
    <form action="">
        <input type="text" name="search-query">
        <button id="search-btn" type="submit">검색</button>
    </form>
    <div id="pagination-area">
        <a href="" class="btn btn-outline-primary">&lt;&lt;</a>
        <a href="" class="btn btn-outline-primary">&lt;</a>
        <a href="" class="btn btn-outline-primary">1</a>
        <a href="" class="btn btn-outline-primary">2</a>
        <a href="" class="btn btn-outline-primary">3</a>
        <a href="" class="btn btn-outline-primary">4</a>
        <a href="" class="btn btn-outline-primary">5</a>
        <a href="" class="btn btn-outline-primary">&gt;</a>
        <a href="" class="btn btn-outline-primary">&gt;&gt;</a>
    </div>

    <!-- The Modal -->
    <div class="modal" id="myModal">
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
            <button type="button" class="btn btn-danger" data-bs-dismiss="modal">Close</button>
            </div>

        </div>
        </div>
    </div>



</div>