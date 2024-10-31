<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <!-- ... 기존의 head 내용 ... -->
</head>
<body style="background-color:#fff">

    <jsp:include page="../common/header.jsp" />

    <div class="form-container">
        <form action="/users/update" method="post">
            <input type="hidden" name="username" value="${loggedInUser.username}"/>

            <!-- 아이디/비밀번호 섹션 -->
            <div class="form-section">
                <!-- ... 기존 섹션 내용 ... -->
                <!-- 사용자의 기존 데이터를 value 속성을 통해 표시 -->
                비밀번호 <input type="password" id="password" name="password" value="${loggedInUser.password}" required><br>
                비밀번호 확인 <input type="password" id="passwordConfirm" name="passwordConfirm" required><br>
                <!-- 나머지 입력 필드도 동일하게 -->
            </div>

            <!-- 기본정보 섹션 -->
            <div class="form-section">
                <!-- ... 기존 섹션 내용 ... -->
                이름 <input type="text" id="name" name="name" value="${loggedInUser.name}" required><br>
                <!-- 나머지 입력 필드도 동일하게 -->
            </div>

            <!-- MBTI 섹션 -->
            <div class="form-section">
                <!-- ... MBTI 섹션 내용 ... -->
            </div>

            <!-- 간단한 소개 섹션 -->
            <div class="form-section">
                <textarea name="introduction" maxlength="50" rows="4" cols="4">${loggedInUser.introduction}</textarea><br><br>
            </div>

            <!-- 제출 버튼 -->
            <div class="form-section">
                <input type="submit" value="수정하기">
            </div>
        </form>
    </div>

    <!-- ... 기존의 스크립트 내용 ... -->

</body>
</html>
