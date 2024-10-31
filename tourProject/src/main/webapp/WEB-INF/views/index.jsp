<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>   
    
<% request.setCharacterEncoding("UTF-8"); %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>TOURMATE</title>
  
</head>
  
<body>
 
  <jsp:include page="../common/header.jsp" />
 

        
   
 <jsp:include page="../common/container.jsp">
    <jsp:param name="headerText" value="투어메이트에 오신 것을 환영합니다 😍" />
    <jsp:param name="subHeaderText1" value="여행가기 전에 꼭 한 번은 들러야 한다는 투어메이트!" />
    <jsp:param name="subHeaderText2" value="유용한 기능들을 제공하니 둘러보고 가세요⭐" />
    <jsp:param name="imgSrc" value="../img/book.svg" />
     <jsp:param name="bgColor" value="#FAEDEF" />
</jsp:include>
    
   
<jsp:include page="article.jsp" />


 <jsp:include page="../common/font.jsp">
    <jsp:param name="title" value="Hot한 여행상품" />
    <jsp:param name="page" value="/productPage" />
</jsp:include>
<br><br>

<jsp:include page="../common/productList.jsp" />




<jsp:include page="../common/footer.jsp" />
      
     
</body>
</html>