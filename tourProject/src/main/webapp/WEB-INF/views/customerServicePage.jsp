<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>   

<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

    
<% request.setCharacterEncoding("UTF-8"); %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>TOURMATE</title>
  
</head>
  <link rel="stylesheet" href="../css/customerServiceList.css">
<body>
 
  <jsp:include page="../common/header.jsp" />
 

        
   
 <jsp:include page="../common/container.jsp">
    <jsp:param name="headerText" value="24시간 상시대기💡" />
    <jsp:param name="subHeaderText1" value="궁금한게 있다면 🤔 무엇이든 물어보세요! " />
    <jsp:param name="subHeaderText2" value="우리 투어메이트 상담원분께서 친절하게 알려드릴거에요💫" />
    <jsp:param name="imgSrc" value="../img/24.png" />
     <jsp:param name="bgColor" value="#F2F9E8" />
</jsp:include>
    

    
   <div class="inquiry-board">
    <table>
        <thead>
            <tr>
                <th>번호</th>
                <th>제목</th>
                <th>작성자</th>
                <th>작성일</th>
            </tr>
        </thead>
        <tbody>
            <c:choose>
                <c:when test="${not empty inquiries}">
                    <c:forEach items="${inquiries}" var="inquiry" varStatus="status">
                        <tr>
                            <td>${status.index + 1}</td>
                            <td><a href="/inquiryDetail?inquiryId=${inquiry.id}">${inquiry.title}</a></td>
                            <td>${inquiry.userId}</td>
                            <td><fmt:formatDate value="${inquiry.createdAt}" pattern="yyyy-MM-dd HH:mm"/></td>
                        </tr>
                    </c:forEach>
                </c:when>
                <c:otherwise>
                    <tr>
                        <td colspan="4">게시글이 없습니다.</td>
                    </tr>
                </c:otherwise>
            </c:choose>
        </tbody>
    </table>
</div>

<c:choose>
    <c:when test="${not empty loggedInUser}">
        <div class="inquiry-create-button">
            <a href="/createInquiryForm" class="btn">문의하기</a>
        </div>
    </c:when>
    <c:otherwise>
        <div class="inquiry-create-button">
            <a href="/login" class="btn">로그인 후 문의하기</a>
        </div>
    </c:otherwise>
</c:choose>
      
     
</body>
</html>