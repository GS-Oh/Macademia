<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
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