<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>   
    
    

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>TOURMATE</title>
  
</head>
  <link rel="stylesheet" href="../css/product.css">
<body>
 
  <jsp:include page="../common/header.jsp" />
 

    
   
 <jsp:include page="../common/container.jsp">
        <jsp:param name="headerText" value="여행 상품을 구하는 가장 쉬운 방법" />
        <jsp:param name="subHeaderText1" value="투어메이트에서 다양한 상품✨을 보고 딱 맞는 여행을 찾아보세요!" />
        <jsp:param name="subHeaderText2" value="분명히 즐거운 여행이 될거에요🥰 " />
        <jsp:param name="imgSrc" value="../img/carrier.svg" />
        <jsp:param name="bgColor" value="#EBFBFF" />
</jsp:include>
    
   



<%

    int productCount = 12;
%>




<div class="product-grid">
    <c:forEach var="product" items="${productList}" varStatus="status">
        <c:if test="${status.index % 3 == 0}">
            <div class="product-row">
        </c:if>
        
        <div class="product-item">
            <a href="/productDetail?productId=${product.productId}">
                <img src="../img/product/product${status.index + 1}.jpg" alt="${product.productName}" />
                <h3>${product.productName}</h3>
            </a>
            <div class="product-info">
                <div class="product-icons">
                   <c:choose>
    <c:when test="${not empty loggedInUser}">
                     <form action="/wishlist/add" method="post" style="background-color: #f2f2f2;">
                               <input type="hidden" name="userId" value="${loggedInUser.username}" />
    <input type="hidden" name="productId" value="${product.productId}" />
    <input type="hidden" name="productName" value="${product.productName}" />
     <input type="hidden" name="productPrice" value="${product.price}" />
    <input type="hidden" name="productQuantity" value="1" /> <!-- 예시로 1 설정 -->
   
                            <button type="submit" class="product-button"><img src="../img/heart_.png" /></button>
                        </form>
                        <!-- 카트에 추가 Form -->
                        <form action="/cart/add" method="post" style="background-color: #f2f2f2;">
                          <input type="hidden" name="userId" value="${loggedInUser.username}" />
    <input type="hidden" name="productId" value="${product.productId}" />
    <input type="hidden" name="productName" value="${product.productName}" />
    <input type="hidden" name="productPrice" value="${product.price}" />
    <input type="hidden" name="productQuantity" value="1" /> 
   
                           <button type="submit" class="product-button" style="margin-right:2px;" ><img src="../img/cart.png" 
                            
                            /></button>
                        </form>
</c:when>
<c:otherwise>
<a href="/login">
           <img src="../img/heart_.png"  /></a>
           <a href="/login">
                        <img src="../img/cart.png"  />
                   </a>
    </c:otherwise>
</c:choose>      
                </div>
                <div class="product-price">
                    <p><span>₩${product.price}</span></p>
                </div>
            </div>
        </div>
        
        <c:if test="${status.index % 3 == 2 || status.last}">
            </div> <!-- This is the end tag for product-row -->
        </c:if>
    </c:forEach>
</div>




    

<jsp:include page="../common/footer.jsp" />
      
     
</body>
</html>