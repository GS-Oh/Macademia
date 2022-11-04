<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

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