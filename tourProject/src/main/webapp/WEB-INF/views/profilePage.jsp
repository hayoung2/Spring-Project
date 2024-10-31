<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>   
    
<% request.setCharacterEncoding("UTF-8"); %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>설문조사</title>
</head>

<link rel="stylesheet" href="../css/profile.css">
<body style="background-color:#fff">

  <jsp:include page="../common/header.jsp" />
 
 
  <br><br><br>

<div class="form-container">
    <div>
        <h3><a href="/cart?userId=${loggedInUser.username}"><img src="../img/cart.png">나의 장바구니 ></a></h3>
    </div>
    <div>
        <h3><a href="/wishlist?userId=${loggedInUser.username}"><img src="../img/heart_click.png">나의 위시리스트 ></a></h3>
    </div>
    <div>
        <h3><a href="/purchases?userId=${loggedInUser.username}"><img src="../img/buy.png">나의 구매상품 ></a></h3>
    </div>
</div>

<br><br>
  <div class="user-info">
    <h3><img src="../img/pin.svg">나의 기본정보</h3>
    <div>
        <p>닉네임: <span th:text="${user.nickname}">${user.nickname}</span></p>
        <p>이름: <span th:text="${user.name}">${user.name}</span></p>
        <p>생년월일: <span th:text="${user.birthdate}">${user.birthdate}</span></p>
        <p>성별: <span th:text="${user.gender}">${user.gender}</span></p>
        <p>주소: <span th:text="${user.address}">${user.address}</span></p>
        <p>핸드폰 번호: <span th:text="${user.phone}">${user.phone}</span></p>
        <p>SMS 수신 동의: <span th:text="${user.smsConsent}">${user.smsConsent}</span></p>
        <p>이메일: <span th:text="${user.email}">${user.email}</span></p>
        <p>이메일 수신 동의: <span th:text="${user.emailConsent}">${user.emailConsent}</span></p>
        <p>MBTI: <span th:text="${user.mbti}">${user.mbti}</span></p>
        <p>간단한 소개: <span th:text="${user.introduction}">${user.introduction}</span></p>
    </div>
</div>

    <br>

<div class="form-container">
  
  
  <form action="/users/delete" method="post"  >
       <input type="hidden" name="userId" value="${loggedInUser.username}"/>
        <div class="form-section">
            <input type="submit" value="수정하기" class="delete-button">
        </div>
    </form>
    
    <form action="/users/delete" method="post" onsubmit="return confirm('정말 탈퇴하시겠습니까?');" >
       <input type="hidden" name="userId" value="${loggedInUser.username}"/>
        <div class="form-section">
            <input type="submit" value="탈퇴하기" class="delete-button">
        </div>
    </form>
    
    
 
    <form action="/users/logout" method="post">
        <div class="form-section">
            <input type="submit" value="로그아웃" class="logout-button">
        </div>
    </form>
</div>



</body>
</html>