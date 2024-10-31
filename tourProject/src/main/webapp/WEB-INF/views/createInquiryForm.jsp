<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>   
    
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>TOURMATE</title>
    <link rel="stylesheet" href="../css/customerServiceForm.css">
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
    
    <br><br><br>
  <form action="/inquiry/submit" method="post" enctype="multipart/form-data" class="inquiry-form">
   <input type="hidden" id="userId" name="userId" value="${loggedInUserId.username}">
        <div class="form-group">
            <div class="label-container">
                <label for="title">제목</label>
            </div>
            <div class="input-container">
                <input type="text" id="title" name="title" required class="form-control">
            </div>
        </div>
        <div class="form-group">
            <div class="label-container">
                <label for="content">내용</label>
            </div>
            <div class="input-container">
                <textarea id="content" name="content" required class="form-control"></textarea>
            </div>
        </div>
        <div class="form-group">
            <div class="label-container">
                <label for="file">첨부 파일</label>
            </div>
            <div class="input-container">
            
                <input type="file" id="file" name="file" class="form-control">
            </div>
        </div>
        <div class="form-group">
    <div class="btn-container left">
        <input type="submit" value="문의하기" class="btn btn-blue">
    </div>
    <div class="btn-container right">
        <input type="button" value="취소하기" class="btn btn-red" onclick="location.href='취소 버튼 클릭시 이동할 URL'">
    </div>
</div>

    </form>
      
</body>
</html>
