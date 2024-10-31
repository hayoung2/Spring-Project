 <%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
 
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="../css/article.css">
    <link rel="stylesheet" href="../css/style.css">
    <meta charset="UTF-8">
    <title>TOURMATE</title>
</head>
<body>
    
        <jsp:include page="../common/header.jsp" />
        
        <div class="article-container">
    <div class="article-item">
        <div class="article-image">
            <img src="<%= request.getParameter("imgUrl") %>" alt="">
        </div>
        <div class="article-content">
            <h4 class="article-title"><a href="<%= request.getParameter("titleLink") %>" target="_top"><%= request.getParameter("titleText") %></a></h4>
            <p class="article-description">
                <%= request.getParameter("description") %>
            </p>
            <span class="article-date"><%= request.getParameter("date") %></span>
        </div>
    </div>
</div>
        
        
</body>
</html>