  <%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
  <link rel="stylesheet" href="../css/footer.css">
  
  <% 
    String username = (String) session.getAttribute("username");
    String link = "login.jsp";

    if(username != null) {
        link = "../scripts/writePost.jsp";
    }
%>

  <footer>
  <div class="footer">
   <h4><a href="<%= link %>">지금 당장 여행가고 싶다면? 동행글을 작성해보세요!</a></h4>
   <img  src="../img/footer_arrow.svg"> 
  </div>
       
  </footer>