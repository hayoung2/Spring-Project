<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<link rel="stylesheet" href="../css/footer.css">

<footer>
    <div class="footer">
        <c:choose>
            <c:when test="${empty loggedInUser}">
                <!-- 사용자가 로그인하지 않았을 때의 링크 -->
                <h4><a href="login">맞춤 여행을 원하신다면? 고객센터에 글을 작성하세요!</a></h4>
            </c:when>
            <c:otherwise>
                <!-- 사용자가 로그인했을 때의 링크 -->
                <h4><a href="/createInquiryForm">맞춤 여행을 원하신다면? 고객센터에 글을 작성하세요!</a></h4>
            </c:otherwise>
        </c:choose>
        <img src="../img/footer_arrow.svg"> 
    </div>
</footer>
