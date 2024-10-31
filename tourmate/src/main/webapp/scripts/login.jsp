<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("UTF-8"); %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>설문조사</title>
</head>
<link rel="stylesheet" href="../css/style.css">
<style>

.login-container {
    width: 300px;
    margin: 0 auto;
    margin-top: 3vw;
    background-color: #fff;
}

.login-container label {
    display: block;
    margin-bottom: 10px;
}

.login-container input[type="text"],
.login-container input[type="password"]{
    width: 100%; 
    padding: 10px;
    margin-bottom: 15px;
    border: 1px solid #ccc;
    border-radius: 5px;
}

.login-container input[type="submit"] {
    background-color: #5861F9;
    color: #fff;
    font-weight: bold;
    cursor: pointer;
    width:19vw;
    height:3vw;
      border: 1px solid #ccc;
    border-radius: 5px;
    margin-top:1vw;
}

.login-container input[type="submit"]:hover {
    background-color: #0056b3;
}

.signup-link {
    text-align: center;
    margin-top: 0.5vw;
}

.signup-link a {
    text-decoration: none;
    color: #007BFF;
}

.signup-link a:hover {
    text-decoration: underline;
}
  
</style>
<body style="background-color: #fff">
    <jsp:include page="../common/header.jsp" />
    <jsp:include page="../common/container.jsp">
        <jsp:param name="headerText" value="로그인 하고! 더 많은 기능을 즐기세요 🥳" />
        <jsp:param name="subHeaderText1" value="게시판💬을 통해 상대와 대화해보세요!" />
        <jsp:param name="subHeaderText2" value="생각보다 훨씬 괜찮은 분을 만날지도 몰라요😉" />
        <jsp:param name="imgSrc" value="../img/login_earth.svg" />
        <jsp:param name="bgColor" value="#FFF9F2" />
    </jsp:include>

    <div class="login-container">
        <form action="/project/LoginServlet" method="post">
            <label for="username">아이디 </label>
            <input type="text" id="username" name="username" required>
            <label for="password">비밀번호 </label>
            <input type="password" id="password" name="password" required>
            <input type="submit" value="로그인">
        </form>
    </div>

    <div class="signup-link">
        <a href="signup.jsp">아직 회원이 아니신가요?</a>
    </div>

</body>
</html>