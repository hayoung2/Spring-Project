<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<link rel="stylesheet" href="../css/header.css">
<link rel="stylesheet" href="../css/style.css">


<header>
        <a href="${pageContext.request.contextPath}/index"><h2>TOURMATE <img src="../img/earth.svg" /></h2></a>
         <div class="menu">
            <a href="/inquiry/customerServicePage"><img src="../img/edit.svg" /></a>
     <c:choose>
    <c:when test="${not empty loggedInUser}">
        <form action="/profilePage" method="get">
        <input type="hidden" name="userId" value="${loggedInUser.username}" />
        <button type="submit" class="user-icon-btn">
            <img src="../img/user.svg" />
        </button>
    </form>
    </c:when>
    <c:otherwise>
        <a href="/login"><img src="../img/user.svg" /></a>
    </c:otherwise>
</c:choose>    


        
        </div>
       <div class="menu2">
    <ul style="list-style-type: none; padding-left: 20;padding-top:50px; display: flex; gap: 20px;" >
        <li style="flex: 1;"><a href="${pageContext.request.contextPath}/index">홈</a></li>
        <li style="flex: 1;"><a href="${pageContext.request.contextPath}/articlePage"><img src="../img/article.svg" /> 아티클</a></li>
        <li style="flex: 1;"><a href="${pageContext.request.contextPath}/productPage"><img src="../img/tent.svg" /> 여행상품</a></li>
          <li style="flex: 1;"><a href="/noticePage"><img src="../img/message.png" width=16 height=16/> 공지사항</a></li>
         <li style="flex: 1;"><a href="/inquiry/customerServicePage"><img src="../img/customer_service.png" /> 고객센터</a></li>
       
    </ul>
</div>

    </header>
    