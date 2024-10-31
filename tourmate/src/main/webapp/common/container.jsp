 <%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

 <link rel="stylesheet" href="../css/container.css">
 <link rel="stylesheet" href="../css/style.css">
 
<div class="box_container" style="background-color: <%=request.getParameter("bgColor")%>;">
    <div class="container_text">
      <h1><%= request.getParameter("headerText") %></h1>
      <br>
        <h4><%= request.getParameter("subHeaderText1") %></h4>
        <h4><%= request.getParameter("subHeaderText2") %></h4>
    </div>
   
    <div class="container_img">
       <img src="<%= request.getParameter("imgSrc") %>" />
    </div>
    <div class="clear"></div>
</div>