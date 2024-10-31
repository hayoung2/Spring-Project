<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>문의 세부 사항</title>
    <link rel="stylesheet" href="../css/inquiryDetail.css">
   
</head>
<body>

  <jsp:include page="../common/header.jsp" />
 

        
   
 <jsp:include page="../common/container.jsp">
    <jsp:param name="headerText" value="24시간 상시대기💡" />
    <jsp:param name="subHeaderText1" value="궁금한게 있다면 🤔 무엇이든 물어보세요! " />
    <jsp:param name="subHeaderText2" value="우리 투어메이트 상담원분께서 친절하게 알려드릴거에요💫" />
    <jsp:param name="imgSrc" value="../img/24.png" />
     <jsp:param name="bgColor" value="#F2F9E8" />
</jsp:include>
    


    <div class="inquiry-detail">
        <h2>${inquiry.title}</h2>
        <br>
        <p>${inquiry.content}</p>

        
        <br><br>
        <div class="inquiry-actions">
            <c:if test="${isOwner}">
                <a href="/inquiry/editInquiry?inquiryId=${inquiry.id}">수정하기</a>
                <a href="/inquiry/deleteInquiry?inquiryId=${inquiry.id}" class="delete">삭제하기</a>
            </c:if>
        </div>
    </div>

   
    <div class="comment-form">
      <form action="/inquiry/submitComment" method="post">
    <input type="hidden" name="inquiryId" value="${inquiry.id}" />
    <textarea name="commentContent" rows="4" cols="50" placeholder="댓글을 작성하세요"></textarea>
    <input type="submit" value="댓글 작성" />
</form>
    </div>
    
<div class="comment-list">
    <c:choose>
        <c:when test="${not empty comments}">
            <c:forEach var="comment" items="${comments}">
                <div class="comment">
                    <p>${comment.content}</p>
                    <p>작성자: ${comment.userId} | 작성일: ${comment.createdAt}</p>
                </div>
            </c:forEach>
        </c:when>
        <c:otherwise>
            <p>댓글이 없습니다.</p>
        </c:otherwise>
    </c:choose>
</div>

</body>
</html>
