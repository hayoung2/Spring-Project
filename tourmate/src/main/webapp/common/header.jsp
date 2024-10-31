<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<link rel="stylesheet" href="../css/header.css">
<link rel="stylesheet" href="../css/style.css">

 <% 
    String username = (String) session.getAttribute("username");
    String link = "login.jsp";
    String userLink="login.jsp";

    if(username != null) {
        link = "../scripts/writePost.jsp";
        userLink="../scripts/userPage.jsp";
    }
%>
<header>
        <a href="home.jsp"><h2>TOURMATE<img src="../img/earth.svg" /></h2></a>
         <div class="menu">
            <a href="<%= link %>"><img src="../img/edit.svg" /></a>
          <a href="<%= userLink %>"><img src="../img/user.svg" /></a>
        
        </div>
       <div class="menu2">
    <ul style="list-style-type: none; padding-left: 20;padding-top:50px; display: flex; gap: 20px;" >
        <li style="flex: 1;"><a href="home.jsp">홈</a></li>
        <li style="flex: 1;"><a href="../scripts/articlePage.jsp"><img src="../img/article.svg" /> 아티클</a></li>
        <li style="flex: 1;"><a href="../scripts/tripmatePage.jsp"><img src="../img/tent.svg" /> 동행모집</a></li>
        <li style="flex: 1;"><a href="profilePage.jsp"><img src="../img/profile.svg" /> 프로필</a></li>
    </ul>
</div>

    </header>
    