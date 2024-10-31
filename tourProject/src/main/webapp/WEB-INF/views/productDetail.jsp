<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Travel Package Detail</title>
</head>
<link rel="stylesheet" href="../css/productDetail.css">
<body>

<jsp:include page="../common/header.jsp" />
 

        
   
 <jsp:include page="../common/container.jsp">
        <jsp:param name="headerText" value="여행 상품을 구하는 가장 쉬운 방법" />
        <jsp:param name="subHeaderText1" value="투어메이트에서 다양한 상품✨을 보고 딱 맞는 여행을 찾아보세요!" />
        <jsp:param name="subHeaderText2" value="분명히 즐거운 여행이 될거에요🥰 " />
        <jsp:param name="imgSrc" value="../img/carrier.svg" />
        <jsp:param name="bgColor" value="#EBFBFF" />
</jsp:include>
    
    
<div class="product-detail-container">
    <div class="product-image">
        <img src="<c:url value='../img/product/product${product.productId}.jpg'/>" alt="${product.productName}" />
    </div>
    <div class="product-details">
        <h1>${product.productName}</h1>
        <p>${product.productContent}</p>
        <span class="price">가격: ${product.price}원</span>
        <span class="quantity">남은 인원 수: ${product.quantity}</span>
        <div class="product-actions">
             <form action="/purchase" method="post" >
                <!-- productId 값을 숨겨진 필드로 설정 -->
                <input type="hidden" name="productId" value="${product.productId}" />

                <input type="hidden" name="quantity" value="1" />

                <input type="hidden" name="userId" value="${loggedInUser.username}" />

                <input type="hidden" name="purchasePrice" value="${product.price}" />
                <!-- 구매하기 버튼 -->
                <div class="tmp">
                <button type="submit" class="btn btn-primary" >구매하기</button>
                </div>
            </form>
            <br>
            <a href="/productPage" class="btn btn-outline-secondary">메뉴이동</a>
        </div>
    </div>
</div>

<jsp:include page="../common/footer.jsp" />


</body>
</html>