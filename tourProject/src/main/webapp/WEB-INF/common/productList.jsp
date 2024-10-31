<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>



<link rel="stylesheet" href="../css/product.css">

<div class="product-grid">
   
    <div class="product-row">
        <div class="product-item">
           <a href="/productPage">
                <img src="../img/product/product1.jpg" alt="여행 상품 1" />
                <h3>파리 여행 패키지</h3>
            </a>
            <div class="product-info">
                <div class="product-icons">
                    <!-- 로그인하지 않았을 때의 아이콘 표시 -->
                    <img src="../img/heart_.png" />
                    <img src="../img/cart.png" />
                </div>
                <div class="product-price">
                    <p><span>₩2000</span></p>
                </div>
            </div>
        </div>
        
        <div class="product-item">
            <a href="/productPage">
                <img src="../img/product/product2.jpg" alt="여행 상품 2" />
                <h3>발리 해변 리조트</h3>
            </a>
            <div class="product-info">
                <div class="product-icons">
                    <img src="../img/heart_.png" />
                    <img src="../img/cart.png" />
                </div>
                <div class="product-price">
                    <p><span>₩1500</span></p>
                </div>
            </div>
        </div>
        
        <div class="product-item">
            <a href="/productPage">
                <img src="../img/product/product3.jpg" alt="여행 상품 3" />
                <h3>뉴욕 시티 투어</h3>
            </a>
            <div class="product-info">
                <div class="product-icons">
                    <img src="../img/heart_.png" />
                    <img src="../img/cart.png" />
                </div>
                <div class="product-price">
                    <p><span>₩900</span></p>
                </div>
            </div>
        </div>
    </div> <!-- product-row의 종료 태그 -->
</div>




